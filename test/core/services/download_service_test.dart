// test/core/services/download_service_test.dart
//
// Kiểm tra kiến trúc mirror của DownloadService bằng HttpServer cục bộ:
// ưu tiên mirror chính, tự chuyển mirror dự phòng, phân loại lỗi chính xác.
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:viplang/core/services/download_service.dart';

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('viplang_download_test');
    DownloadService.instance.debugLocalPath = tempDir.path;
  });

  tearDown(() async {
    DownloadService.instance.debugLocalPath = null;
    DownloadService.instance.debugBaseUrls = null;
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  /// Mở HTTP server cục bộ với handler tuỳ ý, tự đóng khi test xong.
  Future<HttpServer> serve(void Function(HttpRequest request) handler) {
    return HttpServer.bind(InternetAddress.loopbackIPv4, 0).then((server) {
      server.listen(handler);
      addTearDown(() => server.close(force: true));
      return server;
    });
  }

  void reply(HttpRequest req, {int status = 200, List<int>? bytes}) {
    req.response.statusCode = status;
    if (bytes != null) req.response.add(bytes);
    req.response.close();
  }

  void useMirrors(List<HttpServer> servers) {
    DownloadService.instance.debugBaseUrls = [
      for (final s in servers) 'http://127.0.0.1:${s.port}',
    ];
  }

  test('tự chuyển sang mirror dự phòng khi mirror chính lỗi 5xx', () async {
    final primary = await serve((req) => reply(req, status: 500));
    final payload = List<int>.generate(64, (i) => i);
    final fallback = await serve((req) => reply(req, bytes: payload));
    useMirrors([primary, fallback]);

    final result = await DownloadService.instance.downloadAudioDetailed(
      'track.mp3',
      retries: 2,
    );

    expect(result.isSuccess, isTrue);
    expect(await result.file!.readAsBytes(), payload);
  });

  test('báo notFound khi mọi mirror đều trả 404', () async {
    final s1 = await serve((req) => reply(req, status: 404));
    final s2 = await serve((req) => reply(req, status: 404));
    useMirrors([s1, s2]);

    final result = await DownloadService.instance.downloadAudioDetailed(
      'missing.mp3',
      retries: 1,
    );

    expect(result.isSuccess, isFalse);
    expect(result.error, DownloadErrorKind.notFound);
    expect(result.statusCode, 404);
  });

  test('báo network khi không mirror nào kết nối được', () async {
    // Lấy 2 port chắc chắn đang đóng (bind rồi đóng ngay)
    final dead1 = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final port1 = dead1.port;
    await dead1.close();
    final dead2 = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final port2 = dead2.port;
    await dead2.close();

    DownloadService.instance.debugBaseUrls = [
      'http://127.0.0.1:$port1',
      'http://127.0.0.1:$port2',
    ];

    final result = await DownloadService.instance.downloadAudioDetailed(
      'x.mp3',
      retries: 1,
    );

    expect(result.isSuccess, isFalse);
    expect(result.error, DownloadErrorKind.network);
  });

  test('retry trên cùng mirror khi lỗi tạm thời (5xx) rồi thành công', () async {
    var hits = 0;
    final payload = [1, 2, 3];
    final s = await serve((req) {
      hits++;
      if (hits < 3) {
        reply(req, status: 500);
      } else {
        reply(req, bytes: payload);
      }
    });
    useMirrors([s]);

    final result = await DownloadService.instance.downloadAudioDetailed(
      'retry.mp3',
      retries: 3,
    );

    expect(result.isSuccess, isTrue);
    expect(hits, 3);
  });

  test('404 là lỗi vĩnh viễn: không retry, chuyển ngay mirror kế tiếp', () async {
    var hits = 0;
    final s404 = await serve((req) {
      hits++;
      reply(req, status: 404);
    });
    final good = await serve((req) => reply(req, bytes: [9]));
    useMirrors([s404, good]);

    final result = await DownloadService.instance.downloadAudioDetailed(
      'skip.mp3',
      retries: 3,
    );

    expect(result.isSuccess, isTrue);
    expect(hits, 1, reason: 'mirror trả 404 không được retry');
  });

  test('trả về ngay file đã tải sẵn, không cần gọi mạng', () async {
    final cached = File('${tempDir.path}/cached.mp3');
    await cached.writeAsBytes([7, 7, 7]);
    // Không cấu hình mirror nào — nếu code lỡ gọi mạng sẽ thất bại ngay.
    DownloadService.instance.debugBaseUrls = const [];

    final result = await DownloadService.instance.downloadAudioDetailed(
      'cached.mp3',
    );

    expect(result.isSuccess, isTrue);
  });

  test('combineErrors gộp lỗi nhiều mirror đúng quy tắc', () {
    expect(
      DownloadService.combineErrors([
        DownloadErrorKind.network,
        DownloadErrorKind.network,
      ]),
      DownloadErrorKind.network,
      reason: 'mọi mirror đều lỗi socket → thiết bị mất mạng',
    );
    expect(
      DownloadService.combineErrors([
        DownloadErrorKind.network,
        DownloadErrorKind.notFound,
      ]),
      DownloadErrorKind.notFound,
      reason: 'có máy chủ trả lỗi 404 → mạng ổn, file chưa có trên máy chủ',
    );
    expect(
      DownloadService.combineErrors([
        DownloadErrorKind.timeout,
        DownloadErrorKind.serverError,
      ]),
      DownloadErrorKind.serverError,
    );
    expect(
      DownloadService.combineErrors([
        DownloadErrorKind.timeout,
        DownloadErrorKind.timeout,
      ]),
      DownloadErrorKind.timeout,
    );
    expect(DownloadService.combineErrors([]), DownloadErrorKind.unknown);
  });
}

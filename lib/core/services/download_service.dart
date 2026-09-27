import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Phân loại nguyên nhân tải thất bại — để UI báo đúng lỗi thay vì
/// luôn báo "lỗi kết nối mạng" của thiết bị.
enum DownloadErrorKind {
  /// Mọi máy chủ đều không kết nối được (DNS/socket) → rất có thể
  /// thiết bị đang mất mạng thật.
  network,

  /// Kết nối được nhưng phản hồi quá chậm (timeout).
  timeout,

  /// Máy chủ phản hồi 404 — file chưa được upload lên máy chủ.
  notFound,

  /// Máy chủ phản hồi lỗi (5xx, 4xx…) — sự cố phía máy chủ dữ liệu.
  serverError,

  /// Không xác định.
  unknown,
}

/// Kết quả chi tiết của một lần tải audio.
class DownloadResult {
  final File? file;
  final DownloadErrorKind? error;
  final int? statusCode;

  const DownloadResult({this.file, this.error, this.statusCode});

  factory DownloadResult.success(File file) => DownloadResult(file: file);

  factory DownloadResult.failure(DownloadErrorKind error, {int? statusCode}) =>
      DownloadResult(error: error, statusCode: statusCode);

  bool get isSuccess => file != null;
}

/// Dịch vụ quản lý việc tải toàn bộ audio về máy.
///
/// Cải tiến v1.2 — kiến trúc mirror có thứ tự ưu tiên:
/// 1. Supabase Storage (nguồn chính).
/// 2. GitHub Releases của repo (mirror dự phòng, xem `tools/upload_audio.sh`).
///
/// Khi mirror ưu tiên lỗi (server chết, DNS mất, timeout, 404…), dịch vụ
/// TỰ ĐỘNG chuyển sang mirror kế tiếp. Lỗi trả về được phân loại
/// [DownloadErrorKind] để UI hiển thị đúng nguyên nhân.
class DownloadService {
  DownloadService._();
  static final DownloadService instance = DownloadService._();

  static const int maxRetries = 3;
  static const Duration timeout = Duration(seconds: 30);
  static const int maxConcurrency = 4;

  /// Mirror chính: Supabase Storage (bucket public chứa 52 track nghe).
  /// Override lúc build: `--dart-define=AUDIO_PRIMARY_BASE_URL=...`
  static const String primaryBaseUrl = String.fromEnvironment(
    'AUDIO_PRIMARY_BASE_URL',
    defaultValue:
        'https://nlorlkoeygtllnotzrwz.supabase.co/storage/v1/object/public/viplang',
  );

  /// Mirror dự phòng: GitHub Releases của chính repo này.
  /// Upload file bằng `tools/upload_audio.sh` (xem docs/AUDIO_HOSTING.md).
  /// Override lúc build: `--dart-define=AUDIO_FALLBACK_BASE_URL=...`
  static const String fallbackBaseUrl = String.fromEnvironment(
    'AUDIO_FALLBACK_BASE_URL',
    defaultValue:
        'https://github.com/Pabhassaracitto/viplang/releases/download/audio-v1',
  );

  /// Override danh sách mirror khi viết test (không dùng trong production).
  @visibleForTesting
  List<String>? debugBaseUrls;

  /// Override thư mục lưu file khi viết test.
  @visibleForTesting
  String? debugLocalPath;

  /// Danh sách mirror theo thứ tự ưu tiên (đã chuẩn hoá, bỏ phần tử rỗng).
  List<String> get _baseUrls {
    final raw = debugBaseUrls ?? const [primaryBaseUrl, fallbackBaseUrl];
    return raw
        .map((u) => u.trim())
        .where((u) => u.isNotEmpty)
        .map((u) => u.endsWith('/') ? u.substring(0, u.length - 1) : u)
        .toList();
  }

  /// Thư mục chứa file đã tải
  Future<String> get _localPath async {
    final override = debugLocalPath;
    if (override != null) return override;
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// Kiểm tra xem file đã được tải về local chưa
  Future<bool> isDownloaded(String fileName) async {
    final path = await _localPath;
    final file = File('$path/$fileName');
    return await file.exists();
  }

  /// Lấy đường dẫn cục bộ (local path) của một file đã tải
  Future<String> getLocalPathForFile(String fileName) async {
    final path = await _localPath;
    return '$path/$fileName';
  }

  /// Kiểm tra xem tất cả tracks của một theme đã được tải chưa
  Future<bool> isThemeFullyDownloaded(List<String> fileNames) async {
    for (final name in fileNames) {
      if (!await isDownloaded(name)) return false;
    }
    return true;
  }

  /// Tổng số file audio đã tải + tổng dung lượng (bytes)
  Future<({int fileCount, int totalBytes})> getDownloadedStats() async {
    final path = await _localPath;
    final dir = Directory(path);
    var fileCount = 0;
    var totalBytes = 0;
    if (await dir.exists()) {
      await for (final entity in dir.list()) {
        if (entity is File && entity.path.endsWith('.mp3')) {
          fileCount++;
          totalBytes += await entity.length();
        }
      }
    }
    return (fileCount: fileCount, totalBytes: totalBytes);
  }

  /// Xóa toàn bộ audio đã tải (để tải lại từ đầu)
  Future<int> deleteAllAudio() async {
    final path = await _localPath;
    final dir = Directory(path);
    var deleted = 0;
    if (await dir.exists()) {
      await for (final entity in dir.list()) {
        if (entity is File && entity.path.endsWith('.mp3')) {
          await entity.delete();
          deleted++;
        }
      }
    }
    return deleted;
  }

  /// Mô tả lỗi thành thông điệp thân thiện để hiển thị trên UI.
  static String describeError(DownloadErrorKind kind, {int? statusCode}) =>
      switch (kind) {
        DownloadErrorKind.network =>
          'Không kết nối được máy chủ dữ liệu. Vui lòng kiểm tra kết nối mạng của bạn.',
        DownloadErrorKind.timeout =>
          'Kết nối quá chậm hoặc máy chủ đang bận. Vui lòng thử lại sau ít phút.',
        DownloadErrorKind.notFound =>
          'Audio bài này chưa có sẵn trên máy chủ. Vui lòng thử lại sau.',
        DownloadErrorKind.serverError =>
          'Máy chủ dữ liệu đang gặp sự cố${statusCode != null ? ' (mã $statusCode)' : ''}. Vui lòng thử lại sau.',
        DownloadErrorKind.unknown =>
          'Tải file học thất bại. Vui lòng thử lại sau.',
      };

  /// Gộp lỗi của nhiều mirror thành 1 nguyên nhân chính:
  /// - Chỉ khi TẤT CẢ mirror đều lỗi socket/DNS → kết luận mất mạng thiết bị.
  /// - Nếu có ít nhất 1 máy chủ phản hồi HTTP → kết nối mạng ổn, lỗi
  ///   thuộc về phía máy chủ (bảo trì / chưa upload file).
  @visibleForTesting
  static DownloadErrorKind combineErrors(List<DownloadErrorKind> kinds) {
    if (kinds.isEmpty) return DownloadErrorKind.unknown;

    if (kinds.every((k) => k == DownloadErrorKind.network)) {
      return DownloadErrorKind.network;
    }

    final answered = kinds.where(
      (k) =>
          k == DownloadErrorKind.notFound || k == DownloadErrorKind.serverError,
    );
    if (answered.isNotEmpty) {
      if (answered.contains(DownloadErrorKind.serverError)) {
        return DownloadErrorKind.serverError;
      }
      return DownloadErrorKind.notFound;
    }

    if (kinds.contains(DownloadErrorKind.timeout)) {
      return DownloadErrorKind.timeout;
    }
    return DownloadErrorKind.unknown;
  }

  /// Tải một file audio (API cũ, giữ tương thích).
  /// Trả về null nếu thất bại — dùng [downloadAudioDetailed] để biết lý do.
  Future<File?> downloadAudio(String fileName, {int retries = maxRetries}) async {
    final result = await downloadAudioDetailed(fileName, retries: retries);
    return result.file;
  }

  /// Tải một file audio theo thứ tự ưu tiên mirror:
  /// thử hết mirror chính (có retry) rồi mới chuyển sang mirror dự phòng.
  Future<DownloadResult> downloadAudioDetailed(
    String fileName, {
    int retries = maxRetries,
  }) async {
    // File đã có sẵn (và không rỗng) → không cần mạng
    final existing = await _existingFile(fileName);
    if (existing != null) return DownloadResult.success(existing);

    final mirrors = _baseUrls;
    if (mirrors.isEmpty) {
      return DownloadResult.failure(DownloadErrorKind.unknown);
    }

    final failures = <DownloadErrorKind>[];
    int? lastStatus;

    for (var mi = 0; mi < mirrors.length; mi++) {
      final baseUrl = mirrors[mi];
      var lastKind = DownloadErrorKind.unknown;

      for (var attempt = 1; attempt <= retries; attempt++) {
        final r = await _downloadOnce(baseUrl, fileName);
        if (r.file != null) {
          debugPrint('✅ Đã tải: $fileName (mirror ${mi + 1}/${mirrors.length})');
          return DownloadResult.success(r.file!);
        }

        lastKind = r.error ?? DownloadErrorKind.unknown;
        if (r.statusCode != null) lastStatus = r.statusCode;

        // Lỗi vĩnh viễn của mirror này (404, sai quyền…) → sang ngay
        // mirror kế tiếp, retry trên cùng mirror chỉ phí công chờ.
        if (r.permanent) break;

        if (attempt < retries) {
          await Future.delayed(Duration(seconds: attempt));
          debugPrint('🔄 Thử lại ($attempt/$retries): $fileName');
        }
      }

      failures.add(lastKind);
      if (mi < mirrors.length - 1) {
        debugPrint(
          '↪️ Mirror ${mi + 1}/${mirrors.length} lỗi ($lastKind) → '
          'chuyển sang mirror dự phòng cho $fileName',
        );
      }
    }

    final kind = combineErrors(failures);
    debugPrint('❌ Tải thất bại $fileName trên mọi mirror: $kind');
    return DownloadResult.failure(kind, statusCode: lastStatus);
  }

  Future<File?> _existingFile(String fileName) async {
    final path = await _localPath;
    final file = File('$path/$fileName');
    if (await file.exists() && await file.length() > 0) return file;
    return null;
  }

  /// Một lượt GET duy nhất tới [baseUrl]/[fileName].
  Future<({File? file, DownloadErrorKind? error, int? statusCode, bool permanent})>
      _downloadOnce(String baseUrl, String fileName) async {
    HttpClient? client;
    try {
      final path = await _localPath;
      final filePath = '$path/$fileName';
      final file = File(filePath);

      // Tạo thư mục cha nếu chưa có
      if (!await file.parent.exists()) {
        await file.parent.create(recursive: true);
      }

      final url = '$baseUrl/$fileName';
      client = HttpClient()..connectionTimeout = timeout;
      final request = await client.getUrl(Uri.parse(url)).timeout(timeout);
      final response = await request.close().timeout(timeout);

      if (response.statusCode == 200) {
        final bytes = await consolidateHttpClientResponseBytes(
          response,
        ).timeout(timeout);
        if (bytes.isEmpty) {
          debugPrint('❌ File rỗng: $fileName ($baseUrl)');
          return (
            file: null,
            error: DownloadErrorKind.serverError,
            statusCode: 200,
            permanent: true,
          );
        }
        await file.writeAsBytes(bytes, flush: true);
        return (file: file, error: null, statusCode: 200, permanent: false);
      }

      final kind = _kindFromStatus(response.statusCode);
      debugPrint(
        '❌ Lỗi tải $fileName từ $baseUrl — HTTP ${response.statusCode}',
      );
      return (
        file: null,
        error: kind,
        statusCode: response.statusCode,
        permanent: _isPermanentStatus(response.statusCode),
      );
    } on SocketException {
      // DNS không phân giải / không route / connection refused —
      // máy chủ chết hoặc thiết bị mất mạng (phân biệt ở combineErrors).
      debugPrint('❌ Không kết nối được $baseUrl cho $fileName');
      return (
        file: null,
        error: DownloadErrorKind.network,
        statusCode: null,
        permanent: false,
      );
    } on TimeoutException {
      debugPrint('❌ Timeout tải $fileName từ $baseUrl');
      return (
        file: null,
        error: DownloadErrorKind.timeout,
        statusCode: null,
        permanent: false,
      );
    } catch (e) {
      debugPrint('❌ Lỗi tải file $fileName từ $baseUrl: $e');
      return (
        file: null,
        error: DownloadErrorKind.unknown,
        statusCode: null,
        permanent: false,
      );
    } finally {
      client?.close(force: true);
    }
  }

  static DownloadErrorKind _kindFromStatus(int status) {
    if (status == 404) return DownloadErrorKind.notFound;
    return DownloadErrorKind.serverError;
  }

  /// 404 / 4xx (trừ 408, 429) là "chắc chắn không tải được ở mirror này"
  /// → bỏ retry, chuyển mirror ngay. 5xx/429/408 là lỗi tạm → còn retry.
  static bool _isPermanentStatus(int status) {
    if (status == 408 || status == 429) return false;
    return status >= 400 && status < 500;
  }

  /// Tải hàng loạt file (song song giới hạn [maxConcurrency]).
  ///
  /// [onProgress] nhận (current, total) hoặc double 0..1 (tương thích cũ).
  /// Trả về true CHỈ KHI tất cả file tải thành công.
  Future<bool> downloadMultiple(
    List<String> fileNames, {
    dynamic onProgress,
    int concurrency = maxConcurrency,
  }) async {
    final total = fileNames.length;
    if (total == 0) return true;

    int completed = 0;
    int successCount = 0;

    void notifyProgress() {
      if (onProgress == null) return;
      try {
        onProgress(completed, total);
      } catch (_) {
        try {
          onProgress(completed / total);
        } catch (_) {}
      }
    }

    // Hàng đợi work-stealing đơn giản với N worker
    final iterator = fileNames.iterator;
    Future<void> worker() async {
      while (true) {
        String? name;
        // iterator không thread-safe nhưng Dart single-threaded → an toàn
        if (!iterator.moveNext()) break;
        name = iterator.current;

        final file = await downloadAudio(name);
        if (file != null) successCount++;
        completed++;
        notifyProgress();
      }
    }

    final workers = List.generate(
      concurrency.clamp(1, total),
      (_) => worker(),
    );
    await Future.wait(workers);

    final allOk = successCount == total;
    if (!allOk) {
      debugPrint('⚠️ downloadMultiple: $successCount/$total file OK');
    }
    return allOk;
  }
}

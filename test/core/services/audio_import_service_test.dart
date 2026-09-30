// test/core/services/audio_import_service_test.dart
//
// Nhập MP3 có sẵn từ máy (Cài đặt → Dữ liệu âm thanh → Nhập MP3):
// nhận diện tên file theo số track của sách rồi chép vào kho audio của app.
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:viplang/core/services/audio_import_service.dart';
import 'package:viplang/core/services/audio_path_resolver.dart';
import 'package:viplang/core/services/download_service.dart';

void main() {
  late Directory tempDir;
  late Directory sourceDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('viplang_audio_store');
    sourceDir = await Directory.systemTemp.createTemp('viplang_audio_src');
    DownloadService.instance.debugLocalPath = tempDir.path;
  });

  tearDown(() async {
    DownloadService.instance.debugLocalPath = null;
    for (final dir in [tempDir, sourceDir]) {
      if (await dir.exists()) await dir.delete(recursive: true);
    }
  });

  /// MP3 giả: đủ lớn để không bị coi là file rác.
  Future<File> makeMp3(String name, {int size = 4096}) async {
    final file = File('${sourceDir.path}${Platform.pathSeparator}$name');
    await file.writeAsBytes(
      Uint8List.fromList([
        0x49, 0x44, 0x33, // "ID3"
        ...List<int>.filled(size, 7),
      ]),
    );
    return file;
  }

  group('Đánh số track ↔ tên file chuẩn', () {
    test('track 3 là bài đầu của chủ đề 1, track 54 là bài cuối chủ đề 13', () {
      expect(
        AudioPathResolver.fileNameForAbsoluteTrack(3),
        'theme01_track03.mp3',
      );
      expect(
        AudioPathResolver.fileNameForAbsoluteTrack(6),
        'theme01_track06.mp3',
      );
      expect(
        AudioPathResolver.fileNameForAbsoluteTrack(7),
        'theme02_track07.mp3',
      );
      expect(
        AudioPathResolver.fileNameForAbsoluteTrack(54),
        'theme13_track54.mp3',
      );
    });

    test('track ngoài 3–54 là không hợp lệ', () {
      expect(AudioPathResolver.fileNameForAbsoluteTrack(2), isNull);
      expect(AudioPathResolver.fileNameForAbsoluteTrack(55), isNull);
      expect(AudioPathResolver.fileNameForAbsoluteTrack(0), isNull);
    });

    test('đúng 52 file cho 13 chủ đề × 4 bài', () {
      final names = AudioPathResolver.allTrackFileNames;
      expect(names.length, 52);
      expect(names.toSet().length, 52);
      expect(AudioPathResolver.isKnownTrackFileName('theme02_track07.mp3'),
          isTrue);
      expect(AudioPathResolver.isKnownTrackFileName('theme02_track99.mp3'),
          isFalse);
    });
  });

  group('Nhận diện tên file người dùng chọn', () {
    void expectTrack(String fileName, int? track) {
      expect(
        AudioImportService.absoluteTrackFromFileName(fileName),
        track,
        reason: fileName,
      );
    }

    test('tên chuẩn của app', () {
      expectTrack('theme02_track07.mp3', 7);
      expectTrack('/sdcard/Download/THEME13_TRACK54.MP3', 54);
    });

    test('tên kiểu đĩa CD', () {
      expectTrack('Track 07.mp3', 7);
      expectTrack('track_07.mp3', 7);
      expectTrack('TRACK-7.mp3', 7);
      expectTrack('600 Essential Words - Track 03.mp3', 3);
    });

    test('số đứng đầu hoặc cuối tên file', () {
      expectTrack('07.mp3', 7);
      expectTrack('07 - General Business.mp3', 7);
      expectTrack('Unit 12.mp3', 12);
    });

    test('bỏ qua track giới thiệu và tên không đoán được', () {
      expectTrack('01.mp3', null); // track 1–2 là phần giới thiệu
      expectTrack('intro.mp3', null);
      expectTrack('track 99.mp3', null);
      expectTrack('notes.txt', null);
    });

    test('canonicalNameFor trả về tên chuẩn trong app', () {
      expect(
        AudioImportService.canonicalNameFor('Track 07.mp3'),
        'theme02_track07.mp3',
      );
      expect(AudioImportService.canonicalNameFor('intro.mp3'), isNull);
    });

    test('baseName xử lý cả / lẫn \\', () {
      expect(AudioImportService.baseName('/a/b/c.mp3'), 'c.mp3');
      expect(AudioImportService.baseName(r'C:\audio\c.mp3'), 'c.mp3');
      expect(AudioImportService.baseName('c.mp3'), 'c.mp3');
    });
  });

  group('Nhập file vào kho audio', () {
    test('đổi tên về chuẩn của app và chép vào kho', () async {
      final src = await makeMp3('Track 07.mp3');

      final result = await AudioImportService.instance.importFiles([src.path]);

      expect(result.importedCount, 1);
      expect(result.skippedCount, 0);
      expect(result.imported.single.targetName, 'theme02_track07.mp3');
      expect(result.imported.single.replaced, isFalse);

      // File nằm đúng chỗ DownloadService tìm kiếm → app phát MP3 thật ngay.
      final stored = File(
        await DownloadService.instance.getLocalPathForFile(
          'theme02_track07.mp3',
        ),
      );
      expect(await stored.exists(), isTrue);
      expect(await stored.length(), await src.length());
      expect(
        await DownloadService.instance.isDownloaded('theme02_track07.mp3'),
        isTrue,
      );
    });

    test('nhập lại cùng track thì ghi đè và báo replaced', () async {
      await AudioImportService.instance.importFiles([
        (await makeMp3('Track 07.mp3', size: 2048)).path,
      ]);
      final second = await makeMp3('theme02_track07.mp3', size: 8192);

      final result = await AudioImportService.instance.importFiles([
        second.path,
      ]);

      expect(result.importedCount, 1);
      expect(result.imported.single.replaced, isTrue);
      final stored = File(
        await DownloadService.instance.getLocalPathForFile(
          'theme02_track07.mp3',
        ),
      );
      expect(await stored.length(), await second.length());
    });

    test('bỏ qua file không nhận diện được, file rác và file quá nhỏ',
        () async {
      final unknown = await makeMp3('podcast.mp3');
      final tiny = File('${sourceDir.path}${Platform.pathSeparator}08.mp3');
      await tiny.writeAsBytes([1, 2, 3]);
      final html = File('${sourceDir.path}${Platform.pathSeparator}09.mp3');
      await html.writeAsString(
        '<!DOCTYPE html><html><body>404</body></html>'
        '${'x' * 4000}',
      );

      final result = await AudioImportService.instance.importFiles([
        unknown.path,
        tiny.path,
        html.path,
      ]);

      expect(result.importedCount, 0);
      expect(result.skippedCount, 3);
      expect(result.skipped.map((s) => s.sourceName),
          containsAll(['podcast.mp3', '08.mp3', '09.mp3']));
    });

    test('nhập cả thư mục, quét cả thư mục con', () async {
      await makeMp3('Track 03.mp3');
      await makeMp3('Track 04.mp3');
      final sub = Directory('${sourceDir.path}${Platform.pathSeparator}disc2');
      await sub.create();
      await File(
        '${sub.path}${Platform.pathSeparator}05 - Offices.mp3',
      ).writeAsBytes(List<int>.filled(4096, 7));
      await File(
        '${sourceDir.path}${Platform.pathSeparator}readme.txt',
      ).writeAsString('bỏ qua file không phải mp3');

      final result = await AudioImportService.instance.importFolder(
        sourceDir.path,
      );

      expect(result.importedCount, 3);
      expect(
        result.imported.map((t) => t.targetName).toSet(),
        {
          'theme01_track03.mp3',
          'theme01_track04.mp3',
          'theme01_track05.mp3',
        },
      );
      final stats = await DownloadService.instance.getDownloadedStats();
      expect(stats.fileCount, 3);
    });

    test('thư mục không tồn tại → kết quả rỗng, không ném lỗi', () async {
      final result = await AudioImportService.instance.importFolder(
        '${sourceDir.path}${Platform.pathSeparator}khong_co_that',
      );
      expect(result.isEmpty, isTrue);
      expect(result.summary, contains('Không có file MP3'));
    });

    test('nhập từ bytes khi bộ chọn file không trả về đường dẫn', () async {
      final bytes = Uint8List.fromList(List<int>.filled(4096, 7));

      final result = await AudioImportService.instance.importSources([
        ImportSource(name: 'Track 10.mp3', readBytes: () async => bytes),
      ]);

      expect(result.importedCount, 1);
      expect(result.imported.single.targetName, 'theme02_track10.mp3');
      expect(
        await DownloadService.instance.isDownloaded('theme02_track10.mp3'),
        isTrue,
      );
    });
  });
}

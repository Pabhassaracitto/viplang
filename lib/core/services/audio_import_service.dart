import 'dart:io';

import 'package:flutter/foundation.dart';

import 'audio_path_resolver.dart';
import 'download_service.dart';

/// Một nguồn MP3 người dùng chọn.
///
/// Có thể là file trên đĩa ([path]) hoặc chỉ là dữ liệu bytes ([readBytes]) —
/// trên Android bộ chọn file đôi khi chỉ trả về nội dung chứ không có đường dẫn.
class ImportSource {
  final String name;
  final String? path;
  final Future<Uint8List> Function()? readBytes;

  const ImportSource({required this.name, this.path, this.readBytes});

  factory ImportSource.fromPath(String path) =>
      ImportSource(name: AudioImportService.baseName(path), path: path);
}

/// Một file MP3 đã được chép vào kho audio của app.
class ImportedTrack {
  /// Tên file gốc người dùng chọn (vd. `Track 07.mp3`).
  final String sourceName;

  /// Tên chuẩn trong app (vd. `theme02_track07.mp3`).
  final String targetName;

  final int bytes;

  /// Ghi đè lên file cùng tên đã có sẵn.
  final bool replaced;

  const ImportedTrack({
    required this.sourceName,
    required this.targetName,
    required this.bytes,
    required this.replaced,
  });
}

/// Một file bị bỏ qua khi import, kèm lý do để hiển thị cho người dùng.
class SkippedFile {
  final String sourceName;
  final String reason;

  const SkippedFile(this.sourceName, this.reason);
}

/// Kết quả của một lần import.
class AudioImportResult {
  final List<ImportedTrack> imported;
  final List<SkippedFile> skipped;

  const AudioImportResult({this.imported = const [], this.skipped = const []});

  int get importedCount => imported.length;
  int get skippedCount => skipped.length;
  int get totalBytes => imported.fold(0, (sum, t) => sum + t.bytes);
  bool get isEmpty => imported.isEmpty && skipped.isEmpty;

  /// Câu tóm tắt ngắn để hiện trên SnackBar / Settings.
  String get summary {
    if (isEmpty) return 'Không có file MP3 nào được chọn.';
    if (imported.isEmpty) {
      return 'Không nhận diện được file nào ($skippedCount file bị bỏ qua).';
    }
    final base = 'Đã nhập $importedCount file MP3';
    return skipped.isEmpty ? '$base.' : '$base · bỏ qua $skippedCount file.';
  }
}

/// Nhập MP3 có sẵn trên máy vào kho audio của app.
///
/// Vì sao cần: 52 track nghe không được đóng gói trong app (dung lượng store)
/// và máy chủ có thể chết/chậm. Ai đã có sẵn đĩa CD/thư mục MP3 của sách thì
/// import thẳng vào máy — app **ưu tiên phát MP3 thật này** trước mọi thứ
/// khác, không cần mạng và không phải nghe giọng máy (TTS).
///
/// Quy ước tên file nhận diện được (không phân biệt hoa thường):
/// * `theme02_track07.mp3` — tên chuẩn của app
/// * `Track 07.mp3`, `track_07.mp3`, `TRACK-7.mp3`
/// * `07.mp3`, `07 - General Business.mp3`, `Unit 07.mp3`
///
/// Track hợp lệ là **3–54** (track 01–02 của đĩa gốc là phần giới thiệu).
class AudioImportService {
  AudioImportService._();
  static final AudioImportService instance = AudioImportService._();

  /// Chỉ chấp nhận .mp3 — app đặt tên & đếm dung lượng theo đuôi này.
  static const String supportedExtension = '.mp3';

  /// Bỏ qua file rác/quá nhỏ (không thể là bài nghe thật).
  static const int minValidBytes = 1024;

  // ─── Nhận diện tên file ────────────────────────────────────────────────

  /// Lấy tên file từ đường dẫn (xử lý cả `/` lẫn `\` để test được trên mọi OS).
  static String baseName(String path) {
    final normalized = path.replaceAll('\\', '/');
    final parts = normalized.split('/');
    return parts.isEmpty ? path : parts.last;
  }

  /// Suy ra số track (3–54) từ tên file. `null` nếu không đoán được.
  static int? absoluteTrackFromFileName(String path) {
    final name = baseName(path).toLowerCase().trim();
    if (!name.endsWith(supportedExtension)) return null;

    final stem = name.substring(0, name.length - supportedExtension.length);

    // 1. Tên chuẩn của app: theme02_track07
    final themeTrack = RegExp(
      r'theme\s*[_\-.]?\s*(\d{1,2})\s*[_\-.]?\s*track\s*[_\-.]?\s*(\d{1,3})',
    ).firstMatch(stem);
    if (themeTrack != null) {
      return _inRange(int.tryParse(themeTrack.group(2)!));
    }

    // 2. "track 07", "track_7", "track-07"
    final track = RegExp(
      r'track\s*[_\-.#]?\s*(\d{1,3})',
    ).firstMatch(stem);
    if (track != null) return _inRange(int.tryParse(track.group(1)!));

    // 3. Số đứng đầu tên file: "07", "07 - Offices", "07.general business"
    final leading = RegExp(r'^\s*(\d{1,3})(?:\D|$)').firstMatch(stem);
    if (leading != null) return _inRange(int.tryParse(leading.group(1)!));

    // 4. Số đứng cuối tên file: "unit 07", "bai nghe 07"
    final trailing = RegExp(r'(\d{1,3})\s*$').firstMatch(stem);
    if (trailing != null) return _inRange(int.tryParse(trailing.group(1)!));

    return null;
  }

  static int? _inRange(int? value) {
    if (value == null) return null;
    if (value < AudioPathResolver.firstAbsoluteTrack ||
        value > AudioPathResolver.lastAbsoluteTrack) {
      return null;
    }
    return value;
  }

  /// Tên file chuẩn trong app cho file nguồn này (`null` nếu không nhận diện).
  static String? canonicalNameFor(String path) {
    final track = absoluteTrackFromFileName(path);
    if (track == null) return null;
    return AudioPathResolver.fileNameForAbsoluteTrack(track);
  }

  // ─── Quét thư mục ──────────────────────────────────────────────────────

  /// Liệt kê mọi file `.mp3` trong thư mục (mặc định quét cả thư mục con).
  Future<List<String>> findMp3Files(
    String directoryPath, {
    bool recursive = true,
  }) async {
    final dir = Directory(directoryPath);
    if (!await dir.exists()) return const [];

    final files = <String>[];
    try {
      await for (final entity in dir.list(
        recursive: recursive,
        followLinks: false,
      )) {
        if (entity is! File) continue;
        if (!entity.path.toLowerCase().endsWith(supportedExtension)) continue;
        files.add(entity.path);
      }
    } on FileSystemException catch (e) {
      // Android SAF / thiếu quyền đọc → báo rỗng để UI hướng dẫn chọn file.
      debugPrint('❌ Không đọc được thư mục $directoryPath: $e');
      return const [];
    }

    files.sort();
    return files;
  }

  // ─── Import ────────────────────────────────────────────────────────────

  /// Chép danh sách file MP3 (theo đường dẫn) vào kho audio của app.
  Future<AudioImportResult> importFiles(Iterable<String> paths) =>
      importSources(paths.map(ImportSource.fromPath).toList());

  /// Quét một thư mục rồi import toàn bộ MP3 tìm được.
  Future<AudioImportResult> importFolder(
    String directoryPath, {
    bool recursive = true,
  }) async {
    final files = await findMp3Files(directoryPath, recursive: recursive);
    if (files.isEmpty) return const AudioImportResult();
    return importFiles(files);
  }

  /// Nhập từ danh sách nguồn (đường dẫn hoặc bytes).
  Future<AudioImportResult> importSources(List<ImportSource> sources) async {
    final imported = <ImportedTrack>[];
    final skipped = <SkippedFile>[];
    final targetDir = await DownloadService.instance.audioDirectoryPath;

    await Directory(targetDir).create(recursive: true);

    for (final source in sources) {
      final name = source.name;

      if (!name.toLowerCase().endsWith(supportedExtension)) {
        skipped.add(SkippedFile(name, 'Không phải file .mp3'));
        continue;
      }

      final canonical = canonicalNameFor(name);
      if (canonical == null) {
        skipped.add(
          SkippedFile(
            name,
            'Không đoán được là track nào — đổi tên dạng "track 07.mp3" '
            '(số track 3–54) rồi nhập lại',
          ),
        );
        continue;
      }

      final targetPath = '$targetDir${Platform.pathSeparator}$canonical';

      try {
        final replaced = await File(targetPath).exists();
        final int length;

        final path = source.path;
        if (path != null && await File(path).exists()) {
          final file = File(path);
          length = await file.length();
          if (length < minValidBytes) {
            skipped.add(SkippedFile(name, 'File rỗng hoặc quá nhỏ'));
            continue;
          }
          if (!await _looksLikeAudio(file)) {
            skipped.add(SkippedFile(name, 'Nội dung không phải audio hợp lệ'));
            continue;
          }
          // Import lại chính file đang nằm trong kho → không cần chép.
          if (file.absolute.path != File(targetPath).absolute.path) {
            await file.copy(targetPath);
          }
        } else if (source.readBytes != null) {
          final bytes = await source.readBytes!();
          length = bytes.length;
          if (length < minValidBytes) {
            skipped.add(SkippedFile(name, 'File rỗng hoặc quá nhỏ'));
            continue;
          }
          if (_looksLikeHtml(bytes)) {
            skipped.add(SkippedFile(name, 'Nội dung không phải audio hợp lệ'));
            continue;
          }
          await File(targetPath).writeAsBytes(bytes, flush: true);
        } else {
          skipped.add(SkippedFile(name, 'Không mở được file'));
          continue;
        }

        imported.add(
          ImportedTrack(
            sourceName: name,
            targetName: canonical,
            bytes: length,
            replaced: replaced,
          ),
        );
      } catch (e) {
        debugPrint('❌ Import $name lỗi: $e');
        skipped.add(SkippedFile(name, 'Lỗi sao chép: $e'));
      }
    }

    debugPrint(
      '📥 Import audio: ${imported.length} file OK, ${skipped.length} bỏ qua',
    );
    return AudioImportResult(imported: imported, skipped: skipped);
  }

  /// Chặn file HTML/rác được đổi đuôi thành .mp3 (hay gặp khi tải lỗi).
  Future<bool> _looksLikeAudio(File file) async {
    try {
      final raf = await file.open();
      try {
        final head = await raf.read(64);
        return !_looksLikeHtml(head);
      } finally {
        await raf.close();
      }
    } catch (_) {
      return true; // Không đọc được phần đầu thì cứ cho qua, copy sẽ báo lỗi.
    }
  }

  static bool _looksLikeHtml(List<int> head) {
    final text = String.fromCharCodes(
      head.take(64),
    ).toLowerCase();
    return text.contains('<!doctype') || text.contains('<html');
  }
}

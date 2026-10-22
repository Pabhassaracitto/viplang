// lib/core/services/local_file_store_io.dart
//
// Bản native (Android / iOS / macOS / Windows / Linux) của LocalFileStore.
// Chỉ được biên dịch khi có dart:io — xem local_file_store.dart.

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart'
    show consolidateHttpClientResponseBytes, debugPrint;
import 'package:path_provider/path_provider.dart';

import 'local_file_types.dart';

class LocalFileStore {
  LocalFileStore._();

  /// Native luôn có hệ thống file.
  static bool get isSupported => true;

  /// Thư mục dữ liệu của app (nơi lưu MP3 đã tải / đã nhập).
  static Future<String?> documentsPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static String absolutePath(String path) => File(path).absolute.path;

  static Future<bool> exists(String path) => File(path).exists();

  static Future<int> length(String path) async {
    final file = File(path);
    if (!await file.exists()) return 0;
    return file.length();
  }

  static Future<void> ensureDirectory(String path) async {
    await Directory(path).create(recursive: true);
  }

  /// Ghi bytes vào [path] (tạo thư mục cha nếu cần).
  static Future<void> write(String path, List<int> bytes) async {
    final file = File(path);
    if (!await file.parent.exists()) {
      await file.parent.create(recursive: true);
    }
    await file.writeAsBytes(bytes, flush: true);
  }

  static Future<void> copy(String from, String to) async {
    await File(from).copy(to);
  }

  /// Đọc tối đa [count] byte đầu của file.
  static Future<List<int>> readHead(String path, int count) async {
    final raf = await File(path).open();
    try {
      return await raf.read(count);
    } finally {
      await raf.close();
    }
  }

  static Future<void> delete(String path) async {
    await File(path).delete();
  }

  /// Đường dẫn các FILE (không phải thư mục) trong [dirPath].
  /// Trả về rỗng nếu thư mục không tồn tại hoặc không đọc được.
  static Future<List<String>> listFilePaths(
    String dirPath, {
    bool recursive = false,
  }) async {
    final dir = Directory(dirPath);
    if (!await dir.exists()) return const [];

    final paths = <String>[];
    try {
      await for (final entity in dir.list(
        recursive: recursive,
        followLinks: false,
      )) {
        if (entity is File) paths.add(entity.path);
      }
    } on FileSystemException catch (e) {
      // Android SAF / thiếu quyền đọc → báo rỗng để UI hướng dẫn chọn file.
      debugPrint('❌ Không đọc được thư mục $dirPath: $e');
      return const [];
    }
    return paths;
  }

  /// GET [url] một lần, không ghi đĩa. Phân loại lỗi mạng/timeout/khác.
  static Future<FetchResult> httpGet(
    String url, {
    required Duration timeout,
  }) async {
    HttpClient? client;
    try {
      client = HttpClient()..connectionTimeout = timeout;
      final request = await client.getUrl(Uri.parse(url)).timeout(timeout);
      final response = await request.close().timeout(timeout);

      if (response.statusCode == 200) {
        final bytes = await consolidateHttpClientResponseBytes(
          response,
        ).timeout(timeout);
        return FetchResult(statusCode: 200, bytes: bytes);
      }
      return FetchResult(statusCode: response.statusCode);
    } on SocketException {
      return const FetchResult(failure: FetchFailure.network);
    } on TimeoutException {
      return const FetchResult(failure: FetchFailure.timeout);
    } catch (e) {
      debugPrint('❌ Lỗi HTTP $url: $e');
      return const FetchResult(failure: FetchFailure.other);
    } finally {
      client?.close(force: true);
    }
  }
}

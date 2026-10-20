// lib/core/services/local_file_store_stub.dart
//
// Bản Web của LocalFileStore. Trình duyệt không có hệ thống file, nên:
// • không tải / không nhập / không xóa MP3 trên máy;
// • audio được phát TRỰC TIẾP từ máy chủ (xem SafeAudioService).
// Mọi API đều an toàn để gọi (không ném lỗi), trừ ghi file — không nên gọi.
//
// KHÔNG import dart:io ở file này.

import 'local_file_types.dart';

class LocalFileStore {
  LocalFileStore._();

  /// Web không có hệ thống file.
  static bool get isSupported => false;

  static Future<String?> documentsPath() async => null;

  static String absolutePath(String path) => path;

  static Future<bool> exists(String path) async => false;

  static Future<int> length(String path) async => 0;

  static Future<void> ensureDirectory(String path) async {}

  static Future<void> write(String path, List<int> bytes) {
    throw UnsupportedError('Web không ghi được file vào máy: $path');
  }

  static Future<void> copy(String from, String to) {
    throw UnsupportedError('Web không sao chép được file: $from');
  }

  static Future<List<int>> readHead(String path, int count) async => const [];

  static Future<void> delete(String path) async {}

  static Future<List<String>> listFilePaths(
    String dirPath, {
    bool recursive = false,
  }) async => const [];

  /// Web không tải file qua đường này (dùng phát trực tiếp thay thế).
  static Future<FetchResult> httpGet(
    String url, {
    required Duration timeout,
  }) async => const FetchResult(failure: FetchFailure.other);
}

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Dịch vụ quản lý việc tải toàn bộ audio từ Cloud về máy.
///
/// Cải tiến v1.1:
/// - Retry 3 lần/file + timeout 30s
/// - Tải song song giới hạn 4 luồng
/// - Chỉ báo thành công khi TẤT CẢ file OK
class DownloadService {
  DownloadService._();
  static final DownloadService instance = DownloadService._();

  static const int maxRetries = 3;
  static const Duration timeout = Duration(seconds: 30);
  static const int maxConcurrency = 4;

  /// Thư mục chứa file đã tải
  Future<String> get _localPath async {
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

  /// Tải một file từ Supabase Storage (có retry + timeout).
  /// Supabase Storage URL: https://nlorlkoeygtllnotzrwz.supabase.co/storage/v1/object/public/viplang/fileName
  Future<File?> downloadAudio(String fileName, {int retries = maxRetries}) async {
    for (int attempt = 1; attempt <= retries; attempt++) {
      final file = await _downloadOnce(fileName);
      if (file != null) return file;
      if (attempt < retries) {
        // Exponential backoff nhẹ: 1s, 2s
        await Future.delayed(Duration(seconds: attempt));
        debugPrint('🔄 Thử lại ($attempt/$retries): $fileName');
      }
    }
    debugPrint('❌ Tải thất bại sau $retries lần: $fileName');
    return null;
  }

  Future<File?> _downloadOnce(String fileName) async {
    HttpClient? client;
    try {
      final path = await _localPath;
      final filePath = '$path/$fileName';
      final file = File(filePath);

      // Nếu file đã tồn tại (và không rỗng) thì không tải lại
      if (await file.exists() && await file.length() > 0) return file;

      // Tạo thư mục cha nếu chưa có
      if (!await file.parent.exists()) {
        await file.parent.create(recursive: true);
      }

      // 📥 Tải từ Supabase Storage
      final url =
          'https://nlorlkoeygtllnotzrwz.supabase.co/storage/v1/object/public/viplang/$fileName';
      client = HttpClient()..connectionTimeout = timeout;
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close().timeout(timeout);

      if (response.statusCode == 200) {
        final bytes = await consolidateHttpClientResponseBytes(
          response,
        ).timeout(timeout);
        if (bytes.isEmpty) {
          debugPrint('❌ File rỗng: $fileName');
          return null;
        }
        await file.writeAsBytes(bytes, flush: true);
        debugPrint('✅ Đã tải: $fileName');
        return file;
      } else {
        debugPrint('❌ Lỗi tải file $fileName - Status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('❌ Lỗi tải file $fileName: $e');
      return null;
    } finally {
      client?.close(force: true);
    }
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

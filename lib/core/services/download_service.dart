import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

/// Dịch vụ quản lý việc tải toàn bộ audio từ Cloud về máy.
class DownloadService {
  DownloadService._();
  static final DownloadService instance = DownloadService._();

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

  /// Tải một file từ Supabase Storage
  /// Supabase Storage URL: https://nlorlkoeygtllnotzrwz.supabase.co/storage/v1/object/public/viplang/fileName
  Future<File?> downloadAudio(String fileName) async {
    try {
      final path = await _localPath;
      final filePath = '$path/$fileName';
      final file = File(filePath);

      // Nếu file đã tồn tại thì không tải lại
      if (await file.exists()) return file;

      // Tạo thư mục cha nếu chưa có
      if (!await file.parent.exists()) {
        await file.parent.create(recursive: true);
      }

      // 📥 Tải từ Supabase Storage
      final url =
          'https://nlorlkoeygtllnotzrwz.supabase.co/storage/v1/object/public/viplang/$fileName';
      final client = HttpClient();
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close();

      if (response.statusCode == 200) {
        final bytes = await consolidateHttpClientResponseBytes(response);
        await file.writeAsBytes(bytes);
        debugPrint('✅ Đã tải: $fileName');
        return file;
      } else {
        debugPrint('❌ Lỗi tải file $fileName - Status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('❌ Lỗi tải file $fileName: $e');
      return null;
    }
  }

  /// Tải hàng loạt file (cho 1 theme hoặc bài học)
  /// Hỗ trợ cả 2 signature progress (current, total hoặc double)
  Future<bool> downloadMultiple(
    List<String> fileNames, {
    dynamic onProgress,
  }) async {
    int successCount = 0;
    int total = fileNames.length;

    for (int i = 0; i < total; i++) {
      final file = await downloadAudio(fileNames[i]);
      if (file != null) successCount++;

      if (onProgress != null) {
        try {
          onProgress(i + 1, total);
        } catch (_) {
          try {
            onProgress((i + 1) / total);
          } catch (_) {}
        }
      }
    }

    return successCount == total;
  }
}

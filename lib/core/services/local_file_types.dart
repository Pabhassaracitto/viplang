// lib/core/services/local_file_types.dart
//
// Kiểu dữ liệu & hàm thuần dùng chung cho lớp lưu trữ file cục bộ
// (xem local_file_store.dart). File này KHÔNG import dart:io để build được cho Web.

/// Nguyên nhân một lần GET không nhận được phản hồi HTTP.
enum FetchFailure {
  /// Không kết nối được máy chủ (DNS / socket).
  network,

  /// Kết nối hoặc đọc phản hồi quá lâu.
  timeout,

  /// Lỗi khác (ví dụ: CORS / dữ liệu hỏng).
  other,
}

/// Kết quả một lần GET file.
class FetchResult {
  const FetchResult({this.statusCode, this.bytes, this.failure});

  /// Mã HTTP nếu đã nhận được phản hồi.
  final int? statusCode;

  /// Nội dung khi phản hồi 200.
  final List<int>? bytes;

  /// Có giá trị khi KHÔNG nhận được phản hồi HTTP nào.
  final FetchFailure? failure;
}

/// Ghép đường dẫn thư mục và tên file (dùng `/` trên mọi nền tảng).
String joinLocalPath(String dir, String fileName) => '$dir/$fileName';

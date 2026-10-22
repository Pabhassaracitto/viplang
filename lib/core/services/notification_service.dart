// lib/core/services/notification_service.dart
//
// Nhắc học hằng ngày bằng local notification (không cần server).
//
// • Android / iOS / macOS → notification_service_io.dart (plugin thông báo native)
// • Web / nền tảng khác   → notification_service_stub.dart (no-op, không lỗi)
//
// Giữ nguyên API ở cả hai file; màn Cài đặt dùng `isSupportedPlatform`
// để ẩn công tắc khi nền tảng không hỗ trợ.

export 'notification_service_stub.dart'
    if (dart.library.io) 'notification_service_io.dart';

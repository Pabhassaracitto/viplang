// lib/core/services/notification_service.dart
//
// Nhắc học hằng ngày bằng **local notification** — không cần server/Firebase.
//
// • Android: cần quyền POST_NOTIFICATIONS (Android 13+) → xin runtime.
// • iOS: xin quyền alert/badge/sound ở lần bật đầu tiên.
// • Desktop (Windows/Linux/macOS) hoặc khi plugin không khả dụng: tự bỏ qua,
//   app vẫn chạy bình thường (mọi lệnh đều được bọc try/catch).
//
// Giờ nhắc được lưu trong Hive `settings_box` (xem [AppSettings]).

import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show TimeOfDay;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  static const int dailyReminderId = 1001;

  static const String channelId = 'viplang_daily_reminder';
  static const String channelName = 'Nhắc học hằng ngày';
  static const String channelDescription =
      'Nhắc bạn học tiếng Anh mỗi ngày để giữ streak.';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  bool _tzConfigured = false;

  bool get isInitialized => _initialized;

  /// Nền tảng có hỗ trợ lên lịch nhắc học không (Android/iOS/macOS).
  static bool get isSupportedPlatform {
    if (kIsWeb) return false;
    return Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
  }

  /// Tính **lần nhắc kế tiếp** từ [now] với giờ [hour]:[minute].
  ///
  /// Hàm thuần (không phụ thuộc plugin) nên có unit test.
  /// Nếu giờ hôm nay đã qua → hẹn sang ngày mai.
  static DateTime nextOccurrence(DateTime now, int hour, int minute) {
    final today = DateTime(now.year, now.month, now.day, hour, minute);
    return today.isAfter(now) ? today : today.add(const Duration(days: 1));
  }

  /// Khởi tạo plugin + dữ liệu timezone. Gọi 1 lần trong `main()`.
  Future<void> init() async {
    if (_initialized) return;

    tz_data.initializeTimeZones();
    await _configureLocalTimeZone();

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/launcher_icon',
    );
    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: darwinSettings,
        macOS: darwinSettings,
      ),
    );

    _initialized = true;
  }

  /// Lấy timezone của thiết bị để giờ nhắc luôn đúng giờ địa phương.
  Future<void> _configureLocalTimeZone() async {
    if (_tzConfigured) return;
    try {
      // API của flutter_timezone đổi giữa các bản (String ↔ TimezoneInfo)
      // nên đọc động để không phụ thuộc phiên bản.
      final dynamic info = await FlutterTimezone.getLocalTimezone();
      final String? name = info is String ? info : info?.identifier as String?;

      if (name != null && name.isNotEmpty) {
        tz.setLocalLocation(tz.getLocation(name));
        _tzConfigured = true;
      }
    } catch (e) {
      debugPrint('⚠️ Không lấy được timezone: $e');
    }

    if (_tzConfigured) return;

    // Dự phòng: dùng offset hiện tại của thiết bị (Etc/GMT±N).
    try {
      final offsetHours = DateTime.now().timeZoneOffset.inHours;
      // Quy ước tz: Etc/GMT+5 = UTC-5 (ngược dấu với UTC offset)
      final sign = offsetHours <= 0 ? '+' : '-';
      tz.setLocalLocation(
        tz.getLocation('Etc/GMT$sign${offsetHours.abs()}'),
      );
      _tzConfigured = true;
    } catch (e) {
      debugPrint('⚠️ Không cấu hình được timezone, dùng UTC: $e');
    }
  }

  /// Xin quyền thông báo. Trả về true nếu được cho phép.
  Future<bool> requestPermission() async {
    if (!isSupportedPlatform) return false;

    try {
      await init();

      if (Platform.isAndroid) {
        final android = _plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
        final granted = await android?.requestNotificationsPermission();
        return granted ?? false;
      }

      final ios = _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      final granted = await ios?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    } catch (e) {
      debugPrint('⚠️ Không xin được quyền thông báo: $e');
      return false;
    }
  }

  /// Đặt nhắc học hằng ngày vào lúc [hour]:[minute] (giờ địa phương).
  /// Trả về true nếu lên lịch thành công.
  Future<bool> scheduleDailyReminder({
    required int hour,
    required int minute,
  }) async {
    if (!isSupportedPlatform) return false;

    try {
      await init();

      final next = nextOccurrence(DateTime.now(), hour, minute);
      final scheduled = tz.TZDateTime.from(next, tz.local);

      await _plugin.zonedSchedule(
        dailyReminderId,
        'Đến giờ học tiếng Anh rồi! 🔥',
        'Học 15 phút hôm nay để giữ streak và nhớ từ lâu hơn nhé.',
        scheduled,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            channelId,
            channelName,
            channelDescription: channelDescription,
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
          macOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );

      debugPrint(
        '🔔 Đã hẹn nhắc học hằng ngày lúc '
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}',
      );
      return true;
    } catch (e) {
      debugPrint('⚠️ Không hẹn được nhắc học: $e');
      return false;
    }
  }

  /// Huỷ nhắc học.
  Future<void> cancelDailyReminder() async {
    try {
      await _plugin.cancel(dailyReminderId);
    } catch (e) {
      debugPrint('⚠️ Không huỷ được nhắc học: $e');
    }
  }

  /// Tiện ích cho UI: đặt nhắc theo [TimeOfDay].
  Future<bool> scheduleDailyReminderAt(TimeOfDay time) =>
      scheduleDailyReminder(hour: time.hour, minute: time.minute);

  /// Kiểm tra nhanh xem nhắc học có đang được hẹn không (dùng cho Settings).
  Future<bool> isReminderScheduled() async {
    try {
      final pending = await _plugin.pendingNotificationRequests();
      return pending.any((n) => n.id == dailyReminderId);
    } catch (_) {
      return false;
    }
  }
}

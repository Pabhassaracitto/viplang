// lib/core/services/notification_service_stub.dart
//
// Bản no-op của NotificationService cho Web (không import plugin thông báo,
// không import dart:io). API phải khớp với notification_service_io.dart.

import 'package:flutter/material.dart' show TimeOfDay;

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  static const int dailyReminderId = 1001;

  bool get isInitialized => false;

  /// Web không hỗ trợ nhắc học bằng thông báo hệ thống.
  static bool get isSupportedPlatform => false;

  /// Tính **lần nhắc kế tiếp** từ [now] với giờ [hour]:[minute].
  static DateTime nextOccurrence(DateTime now, int hour, int minute) {
    final today = DateTime(now.year, now.month, now.day, hour, minute);
    return today.isAfter(now) ? today : today.add(const Duration(days: 1));
  }

  Future<void> init() async {}

  Future<bool> requestPermission() async => false;

  Future<bool> scheduleDailyReminder({
    required int hour,
    required int minute,
  }) async => false;

  Future<void> cancelDailyReminder() async {}

  Future<bool> scheduleDailyReminderAt(TimeOfDay time) async => false;

  Future<bool> isReminderScheduled() async => false;
}

// lib/core/services/app_settings.dart
//
// Bộ điều khiển cài đặt giao diện & nhắc học (Giai đoạn 3).
//
// Là [ChangeNotifier] duy nhất cho toàn app: khi đổi giao diện hoặc giờ nhắc học,
// gọi notifyListeners() → `main.dart` (ListenableBuilder) rebuild MaterialApp.
//
// Vì `AppColors` được đọc tĩnh nên khi đổi giao diện ta **remount** lại cây widget
// (đổi `key` của MaterialApp) để mọi màu được đọc lại đúng sáng/tối.
//
// Dữ liệu lưu trong Hive `settings_box` → không mất khi tắt app.

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_service.dart';

/// Chế độ giao diện người dùng chọn.
enum AppThemeMode {
  system('Theo hệ thống', Icons.brightness_auto_rounded),
  light('Sáng', Icons.light_mode_rounded),
  dark('Tối', Icons.dark_mode_rounded);

  const AppThemeMode(this.label, this.icon);

  final String label;
  final IconData icon;

  static AppThemeMode fromKey(Object? raw) => switch (raw) {
    'light' => AppThemeMode.light,
    'dark' => AppThemeMode.dark,
    _ => AppThemeMode.system,
  };

  String get key => name;

  ThemeMode get flutterThemeMode => switch (this) {
    AppThemeMode.light => ThemeMode.light,
    AppThemeMode.dark => ThemeMode.dark,
    AppThemeMode.system => ThemeMode.system,
  };
}

class AppSettings extends ChangeNotifier {
  AppSettings._();

  static final AppSettings instance = AppSettings._();

  // ─── Khoá lưu trong Hive ───────────────────────────────────────────────────
  static const String kThemeMode = 'theme_mode';
  static const String kReminderEnabled = 'reminder_enabled';
  static const String kReminderHour = 'reminder_hour';
  static const String kReminderMinute = 'reminder_minute';

  /// Giờ nhắc học mặc định: 20:00 tối.
  static const int defaultReminderHour = 20;
  static const int defaultReminderMinute = 0;

  Box get _box => HiveService.settingsBox;

  AppThemeMode _themeMode = AppThemeMode.system;
  bool _reminderEnabled = false;
  int _reminderHour = defaultReminderHour;
  int _reminderMinute = defaultReminderMinute;
  bool _loaded = false;

  AppThemeMode get themeMode => _themeMode;
  bool get reminderEnabled => _reminderEnabled;
  int get reminderHour => _reminderHour;
  int get reminderMinute => _reminderMinute;
  bool get isLoaded => _loaded;

  /// Giờ nhắc học dưới dạng [TimeOfDay] (tiện cho TimePicker).
  TimeOfDay get reminderTime =>
      TimeOfDay(hour: _reminderHour, minute: _reminderMinute);

  /// Chuỗi `HH:mm` để hiển thị.
  String get reminderTimeLabel => formatTime(_reminderHour, _reminderMinute);

  /// `HH:mm` — hàm thuần, có unit test.
  static String formatTime(int hour, int minute) =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  /// Đọc lại cài đặt từ Hive (gọi 1 lần trong `main()`).
  Future<void> load() async {
    _themeMode = AppThemeMode.fromKey(_box.get(kThemeMode));
    _reminderEnabled = _box.get(kReminderEnabled, defaultValue: false) == true;
    _reminderHour =
        (_box.get(kReminderHour, defaultValue: defaultReminderHour) as num?)
            ?.toInt() ??
        defaultReminderHour;
    _reminderMinute =
        (_box.get(kReminderMinute, defaultValue: defaultReminderMinute) as num?)
            ?.toInt() ??
        defaultReminderMinute;

    _reminderHour = _reminderHour.clamp(0, 23);
    _reminderMinute = _reminderMinute.clamp(0, 59);
    _loaded = true;
    notifyListeners();
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    await _box.put(kThemeMode, mode.key);
    notifyListeners();
  }

  Future<void> setReminderEnabled(bool enabled) async {
    _reminderEnabled = enabled;
    await _box.put(kReminderEnabled, enabled);
    notifyListeners();
  }

  Future<void> setReminderTime(int hour, int minute) async {
    _reminderHour = hour.clamp(0, 23);
    _reminderMinute = minute.clamp(0, 59);
    await _box.put(kReminderHour, _reminderHour);
    await _box.put(kReminderMinute, _reminderMinute);
    notifyListeners();
  }

  /// Sáng/tối thực tế đang áp dụng (đã tính cả chế độ "theo hệ thống").
  Brightness resolveBrightness(Brightness platformBrightness) =>
      switch (_themeMode) {
        AppThemeMode.light => Brightness.light,
        AppThemeMode.dark => Brightness.dark,
        AppThemeMode.system => platformBrightness,
      };

  /// Dùng cho widget test / test không có Hive.
  @visibleForTesting
  void debugSet({
    AppThemeMode? themeMode,
    bool? reminderEnabled,
    int? hour,
    int? minute,
  }) {
    _themeMode = themeMode ?? _themeMode;
    _reminderEnabled = reminderEnabled ?? _reminderEnabled;
    _reminderHour = hour ?? _reminderHour;
    _reminderMinute = minute ?? _reminderMinute;
    _loaded = true;
    notifyListeners();
  }
}

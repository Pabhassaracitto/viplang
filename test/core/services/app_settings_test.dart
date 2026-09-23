// Unit test cho cài đặt giao diện & nhắc học (Giai đoạn 3).
//
// Chỉ test phần logic thuần (không gọi plugin thông báo / Hive).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:viplang/core/constants/app_colors.dart';
import 'package:viplang/core/services/app_settings.dart';
import 'package:viplang/core/services/notification_service.dart';

void main() {
  group('AppThemeMode', () {
    test('fromKey đọc đúng giá trị đã lưu', () {
      expect(AppThemeMode.fromKey('light'), AppThemeMode.light);
      expect(AppThemeMode.fromKey('dark'), AppThemeMode.dark);
      expect(AppThemeMode.fromKey('system'), AppThemeMode.system);
    });

    test('giá trị lạ / null → theo hệ thống', () {
      expect(AppThemeMode.fromKey(null), AppThemeMode.system);
      expect(AppThemeMode.fromKey('neon'), AppThemeMode.system);
      expect(AppThemeMode.fromKey(42), AppThemeMode.system);
    });

    test('ánh xạ sang ThemeMode của Flutter', () {
      expect(AppThemeMode.light.flutterThemeMode, ThemeMode.light);
      expect(AppThemeMode.dark.flutterThemeMode, ThemeMode.dark);
      expect(AppThemeMode.system.flutterThemeMode, ThemeMode.system);
    });

    test('có nhãn tiếng Việt cho UI', () {
      expect(AppThemeMode.light.label, 'Sáng');
      expect(AppThemeMode.dark.label, 'Tối');
      expect(AppThemeMode.system.label, 'Theo hệ thống');
    });
  });

  group('AppSettings.formatTime', () {
    test('thêm 0 ở đầu cho giờ/phút < 10', () {
      expect(AppSettings.formatTime(8, 5), '08:05');
      expect(AppSettings.formatTime(0, 0), '00:00');
    });

    test('giữ nguyên khi đã đủ 2 chữ số', () {
      expect(AppSettings.formatTime(20, 30), '20:30');
      expect(AppSettings.formatTime(23, 59), '23:59');
    });
  });

  group('AppSettings.resolveBrightness', () {
    test('chế độ sáng/tối bỏ qua cài đặt hệ thống', () {
      AppSettings.instance.debugSet(themeMode: AppThemeMode.light);
      expect(
        AppSettings.instance.resolveBrightness(Brightness.dark),
        Brightness.light,
      );

      AppSettings.instance.debugSet(themeMode: AppThemeMode.dark);
      expect(
        AppSettings.instance.resolveBrightness(Brightness.light),
        Brightness.dark,
      );
    });

    test('chế độ theo hệ thống lấy đúng độ sáng thiết bị', () {
      AppSettings.instance.debugSet(themeMode: AppThemeMode.system);
      expect(
        AppSettings.instance.resolveBrightness(Brightness.dark),
        Brightness.dark,
      );
      expect(
        AppSettings.instance.resolveBrightness(Brightness.light),
        Brightness.light,
      );
    });
  });

  group('AppSettings giờ nhắc học', () {
    test('reminderTime + label lấy từ giờ đã đặt', () {
      AppSettings.instance.debugSet(hour: 6, minute: 45);
      expect(AppSettings.instance.reminderTime, const TimeOfDay(hour: 6, minute: 45));
      expect(AppSettings.instance.reminderTimeLabel, '06:45');
    });
  });

  group('NotificationService.nextOccurrence', () {
    test('giờ chưa qua → hẹn ngay hôm nay', () {
      final now = DateTime(2026, 9, 24, 8);
      expect(
        NotificationService.nextOccurrence(now, 20, 0),
        DateTime(2026, 9, 24, 20, 0),
      );
    });

    test('giờ đã qua → hẹn ngày mai', () {
      final now = DateTime(2026, 9, 24, 21, 30);
      expect(
        NotificationService.nextOccurrence(now, 20, 0),
        DateTime(2026, 9, 25, 20, 0),
      );
    });

    test('đúng thời điểm hiện tại → chuyển sang ngày mai', () {
      final now = DateTime(2026, 9, 24, 20, 0);
      expect(
        NotificationService.nextOccurrence(now, 20, 0),
        DateTime(2026, 9, 25, 20, 0),
      );
    });
  });

  group('AppColors đổi theo độ sáng', () {
    test('nền/chữ khác nhau giữa sáng và tối', () {
      AppColors.setBrightness(Brightness.light);
      final lightBg = AppColors.background;
      final lightText = AppColors.textPrimary;
      expect(AppColors.isDark, isFalse);

      AppColors.setBrightness(Brightness.dark);
      final darkBg = AppColors.background;
      final darkText = AppColors.textPrimary;
      expect(AppColors.isDark, isTrue);

      expect(darkBg, isNot(lightBg));
      expect(darkText, isNot(lightText));

      // Đưa về mặc định để không ảnh hưởng test khác
      AppColors.setBrightness(Brightness.light);
    });

    test('màu thương hiệu giữ nguyên ở cả 2 chế độ', () {
      const primary = AppColors.primary;
      AppColors.setBrightness(Brightness.dark);
      expect(AppColors.primary, primary);
      AppColors.setBrightness(Brightness.light);
      expect(AppColors.primary, primary);
    });
  });
}

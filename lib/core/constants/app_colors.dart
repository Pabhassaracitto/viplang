import 'package:flutter/material.dart';

/// Bảng màu VipLang.
///
/// **Cách dùng:** mọi nơi vẫn viết `AppColors.background`, `AppColors.textPrimary`
/// như trước — app chỉ cần gọi [AppColors.setBrightness] ở gốc widget tree mỗi khi
/// theme đổi (xem `main.dart`), toàn bộ màu trung tính sẽ tự đổi theo.
///
/// - **Màu thương hiệu** (primary, secondary, success, warning, error, 13 màu theme,
///   gradient) là hằng số dùng chung cho cả giao diện sáng và tối.
/// - **Màu trung tính** (nền, mặt, viền, chữ…) là *getter* trả về sắc thái phù hợp
///   với [brightness] hiện tại.
class AppColors {
  AppColors._();

  // ─── Chế độ màu hiện tại ───────────────────────────────────────────────────
  static Brightness _brightness = Brightness.light;

  static Brightness get brightness => _brightness;
  static bool get isDark => _brightness == Brightness.dark;

  /// Được gọi ở gốc widget tree trước khi build MaterialApp.
  static void setBrightness(Brightness value) => _brightness = value;

  // ═════════════════════════════ MÀU THƯƠNG HIỆU ═════════════════════════════
  // Không đổi giữa 2 chế độ.

  static const Color primary = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF1E88E5);
  static const Color primaryDark = Color(0xFF0D47A1);

  static const Color secondary = Color(0xFFFF6F00);
  static const Color secondaryLight = Color(0xFFFF9800);

  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFF4CAF50);

  static const Color warning = Color(0xFFF57F17);

  static const Color error = Color(0xFFC62828);
  static const Color errorLight = Color(0xFFEF5350);

  // ═══════════════════════════ MÀU THEO CHẾ ĐỘ ═══════════════════════════════

  // ─── Nền / mặt ─────────────────────────────────────────────────────────────
  static Color get background =>
      isDark ? const Color(0xFF0B1220) : const Color(0xFFF8FAFC);

  static Color get surface =>
      isDark ? const Color(0xFF141D2E) : const Color(0xFFFFFFFF);

  static Color get surfaceVariant =>
      isDark ? const Color(0xFF1D2942) : const Color(0xFFF1F5F9);

  static Color get border =>
      isDark ? const Color(0xFF2B3853) : const Color(0xFFE2E8F0);

  static Color get divider =>
      isDark ? const Color(0xFF223050) : const Color(0xFFEEF2F7);

  // ─── Màu nhấn nhạt (nền chip/thẻ) ──────────────────────────────────────────
  static Color get primarySurface =>
      isDark ? const Color(0xFF16253F) : const Color(0xFFE3F2FD);

  static Color get secondarySurface =>
      isDark ? const Color(0xFF2E2312) : const Color(0xFFFFF3E0);

  static Color get successSurface =>
      isDark ? const Color(0xFF14281A) : const Color(0xFFE8F5E9);

  static Color get warningSurface =>
      isDark ? const Color(0xFF2C2510) : const Color(0xFFFFFDE7);

  static Color get errorSurface =>
      isDark ? const Color(0xFF2B1618) : const Color(0xFFFFEBEE);

  // ─── Chữ ───────────────────────────────────────────────────────────────────
  static Color get textPrimary =>
      isDark ? const Color(0xFFF1F5F9) : const Color(0xFF0F172A);

  static Color get textSecondary =>
      isDark ? const Color(0xFFAEBACE) : const Color(0xFF475569);

  static Color get textTertiary =>
      isDark ? const Color(0xFF8A99B4) : const Color(0xFF94A3B8);

  static Color get textHint =>
      isDark ? const Color(0xFF6E7D99) : const Color(0xFF9E9E9E);

  static Color get textDisabled =>
      isDark ? const Color(0xFF4B5A78) : const Color(0xFFCBD5E1);

  static const Color textInverse = Color(0xFFFFFFFF);

  // ─── Mixed Language (tính năng lõi: chip tiếng Việt / lộ đáp án EN) ────────
  static Color get viChip =>
      isDark ? const Color(0xFF4A3C14) : const Color(0xFFFFF59D);

  static Color get viChipBorder =>
      isDark ? const Color(0xFF8A6D1F) : const Color(0xFFF9A825);

  static Color get viChipText =>
      isDark ? const Color(0xFFF2DFA8) : const Color(0xFF5D4037);

  static Color get enReveal =>
      isDark ? const Color(0xFF15301F) : const Color(0xFFE8F5E9);

  static Color get enRevealBorder =>
      isDark ? const Color(0xFF3E7A48) : const Color(0xFF43A047);

  static Color get enRevealText =>
      isDark ? const Color(0xFFA5E0AE) : const Color(0xFF1B5E20);

  // ─── Khác ──────────────────────────────────────────────────────────────────
  /// Màu bóng đổ — đậm hơn ở chế độ tối để thẻ vẫn tách khỏi nền.
  static Color get shadow =>
      isDark ? const Color(0x66000000) : const Color(0x14000000);

  // ═════════════════════════════ 13 CHỦ ĐỀ & GRADIENT ════════════════════════

  static const List<Color> themeColors = [
    Color(0xFF1565C0), // 01 Offices - Xanh dương
    Color(0xFF2E7D32), // 02 General Business - Xanh lá
    Color(0xFF6A1B9A), // 03 Technical - Tím
    Color(0xFFE65100), // 04 Travel - Cam đậm
    Color(0xFFC62828), // 05 Entertainment - Đỏ
    Color(0xFF00695C), // 06 Purchasing - Xanh ngọc
    Color(0xFF558B2F), // 07 Dining - Xanh olive
    Color(0xFF283593), // 08 Personnel - Chàm
    Color(0xFF37474F), // 09 Finance - Xám xanh
    Color(0xFF4527A0), // 10 Corporate - Tím đậm
    Color(0xFF4E342E), // 11 Manufacturing - Nâu
    Color(0xFF00838F), // 12 Housing - Cyan
    Color(0xFFAD1457), // 13 Health - Hồng đậm
  ];

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1565C0), Color(0xFF1E88E5)],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2E7D32), Color(0xFF43A047)],
  );
}

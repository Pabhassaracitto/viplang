import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color textHint = Color(0xFF9E9E9E); // Màu xám nhạt
  // Primary Palette
  static const Color primary = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF1E88E5);
  static const Color primaryDark = Color(0xFF0D47A1);
  static const Color primarySurface = Color(0xFFE3F2FD);

  // Secondary - Energy/Action
  static const Color secondary = Color(0xFFFF6F00);
  static const Color secondaryLight = Color(0xFFFF9800);
  static const Color secondarySurface = Color(0xFFFFF3E0);

  // Semantic Colors
  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFF4CAF50);
  static const Color successSurface = Color(0xFFE8F5E9);

  static const Color warning = Color(0xFFF57F17);
  static const Color warningSurface = Color(0xFFFFFDE7);

  static const Color error = Color(0xFFC62828);
  static const Color errorLight = Color(0xFFEF5350);
  static const Color errorSurface = Color(0xFFFFEBEE);

  // Mixed Language Colors (CORE FEATURE)
  static const Color viChip = Color(0xFFFFF59D); // Vàng nhạt - từ tiếng Việt
  static const Color viChipBorder = Color(0xFFF9A825); // Viền vàng
  static const Color viChipText = Color(0xFF5D4037); // Text nâu
  static const Color enReveal = Color(0xFFE8F5E9); // Xanh nhạt - đáp án EN
  static const Color enRevealBorder = Color(0xFF43A047);
  static const Color enRevealText = Color(0xFF1B5E20);

  // Neutral
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF1F5F9);
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFEEF2F7);

  // Text
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textDisabled = Color(0xFFCBD5E1);
  static const Color textInverse = Color(0xFFFFFFFF);

  // Theme Colors (13 chủ đề)
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

  // Gradient
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

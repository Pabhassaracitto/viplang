// lib/core/router/app_router.dart
//
// Điều hướng tập trung bằng go_router (Giai đoạn 3).
//
// Vì sao cần: (1) deep link `viplang://theme/05/day/2` mở thẳng bài học,
// (2) giữ nguyên vị trí khi app remount (đổi giao diện sáng/tối).
//
// Quy ước: các màn hình mới nên dùng `context.push(AppRoutes.x)`;
// một số màn hình cũ vẫn dùng `Navigator.push` và vẫn chạy bình thường.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/content/all_themes_registry.dart';
import '../../data/models/theme_model.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/lesson/lesson_day_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/progress/progress_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/themes/theme_list_screen.dart';
import '../../presentation/screens/vocab/srs_review_screen.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_text_styles.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String themes = '/themes';
  static const String srs = '/srs';
  static const String progress = '/progress';
  static const String settings = '/settings';

  static String lesson(int themeNumber, int dayNumber) =>
      '/theme/$themeNumber/day/$dayNumber';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,

  // Hỗ trợ cả 2 dạng deep link:
  //   viplang://theme/05/day/2   (host = "theme")  → /theme/05/day/2
  //   viplang:///theme/05/day/2  (host rỗng)       → /theme/05/day/2
  redirect: (context, state) {
    final uri = state.uri;
    if (uri.host == 'theme' && uri.path.isNotEmpty) {
      return '/theme${uri.path}';
    }
    return null;
  },

  routes: [
    GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashScreen()),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (_, __) => const OnboardingScreen(),
    ),
    GoRoute(path: AppRoutes.home, builder: (_, __) => const HomeScreen()),
    GoRoute(path: AppRoutes.themes, builder: (_, __) => const ThemeListScreen()),
    GoRoute(path: AppRoutes.srs, builder: (_, __) => const SrsReviewScreen()),
    GoRoute(path: AppRoutes.progress, builder: (_, __) => const ProgressScreen()),
    GoRoute(path: AppRoutes.settings, builder: (_, __) => const SettingsScreen()),

    // Deep link bài học: viplang://theme/05/day/2
    GoRoute(
      path: '/theme/:themeNumber/day/:dayNumber',
      builder: (context, state) {
        final themeNumber = int.tryParse(state.pathParameters['themeNumber'] ?? '');
        final dayNumber = int.tryParse(state.pathParameters['dayNumber'] ?? '');

        final theme = themeNumber == null
            ? null
            : _themeByNumber(themeNumber);

        if (theme == null || dayNumber == null || dayNumber < 1) {
          return _DeepLinkError(
            message: themeNumber == null
                ? 'Link không hợp lệ.'
                : 'Không tìm thấy chủ đề số $themeNumber.',
          );
        }

        return LessonDayScreen(
          dayNumber: dayNumber,
          themeId: theme.id,
          themeTitle: '${theme.titleEn} - ${theme.titleVi}',
        );
      },
    ),
  ],

  errorBuilder: (context, state) => _DeepLinkError(
    message: 'Không tìm thấy đường dẫn:\n${state.uri}',
  ),
);

ThemeModel? _themeByNumber(int themeNumber) {
  for (final theme in AllThemesRegistry.getAllThemes()) {
    if (theme.themeNumber == themeNumber) return theme;
  }
  return null;
}

/// Màn hình hiển thị khi deep link sai — luôn có đường về Home.
class _DeepLinkError extends StatelessWidget {
  final String message;

  const _DeepLinkError({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('VipLang', style: AppTextStyles.h2),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🧭', style: TextStyle(fontSize: 44)),
              const SizedBox(height: AppConstants.paddingM),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: AppConstants.paddingL),
              ElevatedButton.icon(
                onPressed: () => context.go(AppRoutes.home),
                icon: const Icon(Icons.home_rounded, size: 18),
                label: const Text('Về trang chủ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

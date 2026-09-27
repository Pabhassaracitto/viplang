// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_colors.dart';
import 'core/router/app_router.dart';
import 'core/services/app_settings.dart';
import 'core/services/hive_service.dart';
import 'core/services/notification_service.dart';
import 'data/content/all_themes_registry.dart';
import 'presentation/blocs/lesson_bloc/lesson_bloc.dart';
import 'presentation/blocs/mind_game_bloc/mind_game_bloc.dart';
import 'presentation/blocs/progress/progress_bloc.dart';
import 'presentation/blocs/progress/progress_event.dart';
import 'presentation/blocs/theme_bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  try {
    await HiveService.init();
    await AppSettings.instance.load();
    debugPrint('✅ Hive initialized');

    // Nhắc học: khởi tạo plugin + hẹn lại nếu người dùng đã bật
    // (hẹn lại mỗi lần mở app để đúng giờ sau khi đổi múi giờ / cập nhật app).
    await _setupDailyReminder();

    // ✅ Seed vocab nếu chưa có
    await _seedVocabIfNeeded();

    runApp(const VipLangApp());
  } catch (e, stackTrace) {
    debugPrint("❌ LỖI KHỞI TẠO: $e");
    debugPrint(stackTrace.toString());
  }
}

// ─── Nhắc học hằng ngày ─────────────────────────────────────────────────────
Future<void> _setupDailyReminder() async {
  try {
    await NotificationService.instance.init();

    final settings = AppSettings.instance;
    if (!settings.reminderEnabled) return;

    await NotificationService.instance.scheduleDailyReminder(
      hour: settings.reminderHour,
      minute: settings.reminderMinute,
    );
  } catch (e) {
    // Không chặn app khởi động nếu thiết bị không hỗ trợ thông báo
    debugPrint('⚠️ Bỏ qua thiết lập nhắc học: $e');
  }
}

// ─── Seed Vocab ─────────────────────────────────────────────────────────────
Future<void> _seedVocabIfNeeded() async {
  final box = HiveService.vocabBox;

  // Nếu box đã có data thì bỏ qua
  if (box.isNotEmpty) {
    debugPrint('✅ Vocab box đã có ${box.length} items, bỏ qua seed');
    return;
  }

  debugPrint('🌱 Seeding vocab từ AllThemesRegistry...');
  try {
    final allThemes = AllThemesRegistry.getAllThemes();
    int totalCount = 0;

    for (final theme in allThemes) {
      final vocabs = AllThemesRegistry.getVocabulary(theme.id);

      for (final vocab in vocabs) {
        // Đảm bảo vocab object được copy vào Hive
        // (không dùng reference từ Registry)
        await box.put(vocab.id, vocab);
        totalCount++;
      }

      debugPrint('  ✅ ${theme.id}: ${vocabs.length} vocabs');
    }

    debugPrint('🌱 Seed hoàn thành: $totalCount vocabs');
  } catch (e, stackTrace) {
    debugPrint('❌ Seed error: $e');
    debugPrint(stackTrace.toString());
  }
}

// ─── App ────────────────────────────────────────────────────────────────────
class VipLangApp extends StatelessWidget {
  const VipLangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
        BlocProvider<MindGameBloc>(create: (_) => MindGameBloc()),
        BlocProvider<LessonBloc>(create: (_) => LessonBloc()),
        BlocProvider<ProgressBloc>(
          create: (_) => ProgressBloc()..add(LoadTodayVocabEvent()),
        ),
      ],
      // Lắng nghe thay đổi giao diện (sáng/tối/theo hệ thống)
      child: ListenableBuilder(
        listenable: AppSettings.instance,
        builder: (context, _) {
          final platform =
              WidgetsBinding.instance.platformDispatcher.platformBrightness;
          final settings = AppSettings.instance;
          final brightness = settings.resolveBrightness(platform);

          // AppColors đọc tĩnh → cập nhật trước khi build cây widget
          AppColors.setBrightness(brightness);

          return MaterialApp.router(
            // Đổi key ⇒ remount cây widget để MỌI màu tĩnh được đọc lại.
            // GoRouter giữ nguyên vị trí hiện tại nên người dùng không bị nhảy màn hình.
            key: ValueKey('viplang-${brightness.name}'),
            title: 'VipLang',
            debugShowCheckedModeBanner: false,
            themeMode: settings.themeMode.flutterThemeMode,
            theme: _buildTheme(Brightness.light),
            darkTheme: _buildTheme(Brightness.dark),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
    );

    // Ghi đè các vai trò quan trọng bằng bảng màu của app để widget Material
    // (AppBar, Card, Dialog, SnackBar…) khớp với phần UI tự vẽ.
    final appScheme = scheme.copyWith(
      surface: isDark ? const Color(0xFF141D2E) : const Color(0xFFFFFFFF),
      onSurface: isDark ? const Color(0xFFF1F5F9) : const Color(0xFF0F172A),
      onSurfaceVariant: isDark
          ? const Color(0xFFAEBACE)
          : const Color(0xFF475569),
      outlineVariant: isDark ? const Color(0xFF2B3853) : const Color(0xFFE2E8F0),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: appScheme,
      scaffoldBackgroundColor: isDark
          ? const Color(0xFF0B1220)
          : const Color(0xFFF8FAFC),
      fontFamily: 'Inter',
      appBarTheme: AppBarTheme(
        backgroundColor: isDark
            ? const Color(0xFF141D2E)
            : const Color(0xFFFFFFFF),
        foregroundColor: isDark
            ? const Color(0xFFF1F5F9)
            : const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: false,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: isDark
            ? const Color(0xFF141D2E)
            : const Color(0xFFFFFFFF),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

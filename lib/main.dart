// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_colors.dart';
import 'core/services/hive_service.dart';
import 'data/content/all_themes_registry.dart';
import 'presentation/blocs/lesson_bloc/lesson_bloc.dart';
import 'presentation/blocs/mind_game_bloc/mind_game_bloc.dart';
import 'presentation/blocs/progress/progress_bloc.dart';
import 'presentation/blocs/progress/progress_event.dart';
import 'presentation/blocs/theme_bloc/theme_bloc.dart';
import 'presentation/screens/splash_screen.dart';

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
    debugPrint('✅ Hive initialized');

    // ✅ Seed vocab nếu chưa có
    await _seedVocabIfNeeded();

    runApp(const VipLangApp());
  } catch (e, stackTrace) {
    debugPrint("❌ LỖI KHỞI TẠO: $e");
    debugPrint(stackTrace.toString());
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
      child: MaterialApp(
        title: 'VipLang',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.light,
          ),
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.surface,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
            centerTitle: false,
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
        ),
        home: const SplashScreen(), // Hiển thị SplashScreen đầu tiên
      ),
    );
  }
}

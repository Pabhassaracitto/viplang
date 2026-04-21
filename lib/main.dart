import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_colors.dart';
import 'core/services/hive_service.dart';
import 'presentation/blocs/lesson_bloc/lesson_bloc.dart';
import 'presentation/blocs/mind_game_bloc/mind_game_bloc.dart';
import 'presentation/blocs/progress/progress_bloc.dart';
import 'presentation/blocs/progress/progress_event.dart';
import 'presentation/blocs/theme_bloc/theme_bloc.dart';
import 'presentation/screens/home/home_screen.dart';

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
    runApp(const VipLangApp());
  } catch (e, stackTrace) {
    debugPrint("LỖI KHỞI TẠO: $e");
    debugPrint(stackTrace.toString());
  }
}

class VipLangApp extends StatelessWidget {
  const VipLangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => MindGameBloc()),
        BlocProvider(create: (_) => LessonBloc()),
        BlocProvider(create: (_) => ProgressBloc()..add(LoadTodayVocabEvent())),
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
        home: const HomeScreen(),
      ),
    );
  }
}

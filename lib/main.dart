import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/app_colors.dart';
import 'presentation/blocs/mind_game_bloc/mind_game_bloc.dart';
// Import các Bloc/Provider của dự án viplang
import 'presentation/blocs/theme_bloc/theme_bloc.dart';
import 'presentation/screens/home/home_screen.dart';
// import 'firebase_options.dart'; // Bỏ comment nếu bạn đã chạy flutterfire configure

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Cấu hình hướng màn hình và thanh trạng thái
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // Khởi tạo Hive
  await Hive.initFlutter();
  // Mở các box cần thiết ở đây (ví dụ: VocabBox)

  runApp(const VipLangApp());
}

class VipLangApp extends StatelessWidget {
  const VipLangApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Khai báo các Bloc bạn đang dùng trong dự án
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => MindGameBloc()),
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

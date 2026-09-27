// Widget smoke test — VipLang v1.1
// Không phụ thuộc path_provider/network: chỉ pump UI thuần + Hive in-memory dir.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:viplang/core/constants/app_colors.dart';
import 'package:viplang/core/constants/app_text_styles.dart';
import 'package:viplang/data/models/theme_model.dart';
import 'package:viplang/data/models/user_progress_model.dart';
import 'package:viplang/data/models/vocab_model.dart';
import 'package:viplang/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:viplang/presentation/screens/themes/theme_list_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final dir = Directory.systemTemp.createTempSync('viplang_widget_test');
    Hive.init(dir.path);
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(ThemeModelAdapter());
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(VocabModelAdapter());
    if (!Hive.isAdapterRegistered(6)) Hive.registerAdapter(UserGoalAdapter());
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(UserProgressModelAdapter());
    }
    await Hive.openBox<ThemeModel>('themes_box');
    await Hive.openBox<VocabModel>('vocab_box');
    await Hive.openBox<UserProgressModel>('progress_box');
    await Hive.openBox('settings_box');
  });

  testWidgets('ThemeListScreen hiển thị tiêu đề 13 Chủ đề TOEIC', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc()..add(LoadThemesEvent()),
          child: const ThemeListScreen(),
        ),
      ),
    );

    // Để ThemeBloc load xong (seed + emit)
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('13 Chủ đề TOEIC'), findsOneWidget);

    // Theme 1 (Offices) phải xuất hiện
    expect(find.textContaining('Offices'), findsWidgets);
  });

  test('App palette + text styles khởi tạo ổn định', () {
    expect(AppColors.primary, isNotNull);
    expect(AppColors.themeColors.length, 13);
    expect(AppTextStyles.h1.fontSize, 22);
  });
}

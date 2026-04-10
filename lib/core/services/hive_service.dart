import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/theme_model.dart';
import '../../data/models/vocab_model.dart';
import '../../data/models/user_progress_model.dart';
import '../constants/app_constants.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    // ✅ Fix: Đăng ký adapters (kiểm tra chưa đăng ký để tránh duplicate)
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ThemeModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(VocabModelAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(UserGoalAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(UserProgressModelAdapter());
    }

    // ✅ Fix: Kiểm tra box đã mở chưa trước khi mở
    if (!Hive.isBoxOpen(AppConstants.themeBox)) {
      await Hive.openBox<ThemeModel>(AppConstants.themeBox);
    }
    if (!Hive.isBoxOpen(AppConstants.vocabBox)) {
      await Hive.openBox<VocabModel>(AppConstants.vocabBox);
    }
    if (!Hive.isBoxOpen(AppConstants.progressBox)) {
      await Hive.openBox<UserProgressModel>(AppConstants.progressBox);
    }
    if (!Hive.isBoxOpen(AppConstants.settingsBox)) {
      await Hive.openBox(AppConstants.settingsBox);
    }
  }

  static Box<ThemeModel> get themeBox =>
      Hive.box<ThemeModel>(AppConstants.themeBox);

  static Box<VocabModel> get vocabBox =>
      Hive.box<VocabModel>(AppConstants.vocabBox);

  static Box<UserProgressModel> get progressBox =>
      Hive.box<UserProgressModel>(AppConstants.progressBox);

  static Box get settingsBox => Hive.box(AppConstants.settingsBox);
}

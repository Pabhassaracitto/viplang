import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/theme_model.dart';
import '../../data/models/vocab_model.dart';
import '../../data/models/user_progress_model.dart';
import '../constants/app_constants.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register Adapters
    Hive.registerAdapter(ThemeModelAdapter());
    Hive.registerAdapter(VocabModelAdapter());
    Hive.registerAdapter(UserProgressModelAdapter());
    Hive.registerAdapter(UserGoalAdapter());

    // Open Boxes
    await Hive.openBox<ThemeModel>(AppConstants.themeBox);
    await Hive.openBox<VocabModel>(AppConstants.vocabBox);
    await Hive.openBox<UserProgressModel>(AppConstants.progressBox);
    await Hive.openBox(AppConstants.settingsBox);
  }

  static Box<ThemeModel> get themeBox =>
      Hive.box<ThemeModel>(AppConstants.themeBox);

  static Box<VocabModel> get vocabBox =>
      Hive.box<VocabModel>(AppConstants.vocabBox);

  static Box<UserProgressModel> get progressBox =>
      Hive.box<UserProgressModel>(AppConstants.progressBox);

  static Box get settingsBox => Hive.box(AppConstants.settingsBox);
}

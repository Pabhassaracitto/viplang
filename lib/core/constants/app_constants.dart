class AppConstants {
  AppConstants._();

  static const String appName = 'VipLang';
  static const String appVersion = '1.0.0';

  // Hive Box Names
  static const String themeBox = 'themes_box';
  static const String vocabBox = 'vocab_box';
  static const String progressBox = 'progress_box';
  static const String reviewQueueBox = 'review_queue_box';
  static const String settingsBox = 'settings_box';
  static const String userBox = 'user_box';

  // SRS Constants (SM-2)
  static const double defaultEaseFactor = 2.5;
  static const double minEaseFactor = 1.3;
  static const int firstInterval = 1;
  static const int secondInterval = 6;

  // Streak
  static const int streakFreezeMaxPerWeek = 1;

  // Theme Count
  static const int totalThemes = 13;

  // Audio
  static const double defaultPlaybackSpeed = 1.0;
  static const double slowPlaybackSpeed = 0.75;

  // Animation Durations
  static const int shortAnim = 200;
  static const int mediumAnim = 350;
  static const int longAnim = 600;

  // Padding/Spacing
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;

  // Border Radius
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusCircle = 999.0;
}

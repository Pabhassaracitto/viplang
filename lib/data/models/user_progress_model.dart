import 'package:hive/hive.dart';

part 'user_progress_model.g.dart';

@HiveType(typeId: 6)
class UserGoal extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  int targetScore;

  @HiveField(2)
  DateTime targetDate;

  @HiveField(3)
  int dailyMinutes;

  UserGoal({
    required this.description,
    required this.targetScore,
    required this.targetDate,
    required this.dailyMinutes,
  });
}

@HiveType(typeId: 7)
class UserProgressModel extends HiveObject {
  @HiveField(0)
  String userId;

  @HiveField(1)
  int currentStreak;

  @HiveField(2)
  int longestStreak;

  @HiveField(3)
  DateTime? lastStudyDate;

  @HiveField(4)
  Map<String, double> themeProgress; // themeId -> percent

  @HiveField(5)
  List<String> completedLessons; // lessonDay ids

  @HiveField(6)
  int totalWordsLearned;

  @HiveField(7)
  int totalStudyMinutes;

  @HiveField(8)
  int streakFreezesUsedThisWeek;

  @HiveField(9)
  List<String> earnedBadges;

  @HiveField(10)
  int totalXP;

  @HiveField(11)
  UserGoal? goal;

  UserProgressModel({
    required this.userId,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.lastStudyDate,
    Map<String, double>? themeProgress,
    List<String>? completedLessons,
    this.totalWordsLearned = 0,
    this.totalStudyMinutes = 0,
    this.streakFreezesUsedThisWeek = 0,
    List<String>? earnedBadges,
    this.totalXP = 0,
    this.goal,
  })  : themeProgress = themeProgress ?? {},
        completedLessons = completedLessons ?? [],
        earnedBadges = earnedBadges ?? [];

  bool get hasStudiedToday {
    if (lastStudyDate == null) return false;
    final now = DateTime.now();
    final last = lastStudyDate!;
    return last.year == now.year &&
        last.month == now.month &&
        last.day == now.day;
  }
}

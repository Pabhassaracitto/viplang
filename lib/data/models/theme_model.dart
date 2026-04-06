import 'package:hive/hive.dart';

part 'theme_model.g.dart';

@HiveType(typeId: 0)
class ThemeModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int themeNumber;

  @HiveField(2)
  final String titleEn;

  @HiveField(3)
  final String titleVi;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String iconEmoji;

  @HiveField(6)
  bool isUnlocked;

  @HiveField(7)
  double progressPercent;

  @HiveField(8)
  int completedDays;

  @HiveField(9)
  int totalDays;

  @HiveField(10)
  DateTime? lastStudiedAt;

  ThemeModel({
    required this.id,
    required this.themeNumber,
    required this.titleEn,
    required this.titleVi,
    required this.description,
    required this.iconEmoji,
    this.isUnlocked = false,
    this.progressPercent = 0.0,
    this.completedDays = 0,
    this.totalDays = 2,
    this.lastStudiedAt,
  });

  ThemeModel copyWith({
    bool? isUnlocked,
    double? progressPercent,
    int? completedDays,
    DateTime? lastStudiedAt,
  }) {
    return ThemeModel(
      id: id,
      themeNumber: themeNumber,
      titleEn: titleEn,
      titleVi: titleVi,
      description: description,
      iconEmoji: iconEmoji,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      progressPercent: progressPercent ?? this.progressPercent,
      completedDays: completedDays ?? this.completedDays,
      totalDays: totalDays,
      lastStudiedAt: lastStudiedAt ?? this.lastStudiedAt,
    );
  }
}

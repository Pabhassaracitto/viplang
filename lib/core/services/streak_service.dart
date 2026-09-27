// lib/core/services/streak_service.dart
//
// Logic "streak" (chuỗi ngày học liên tiếp) + "đóng băng streak" (streak freeze)
// được tách thành **hàm thuần** (pure function) để:
//   - unit test không cần Hive/Flutter
//   - dùng chung cho LessonDayScreen và SrsReviewScreen (trước đây mỗi nơi
//     copy-paste một đoạn logic, dễ lệch nhau).

import '../constants/app_constants.dart';
import '../../data/models/user_progress_model.dart';

/// Kết quả sau khi ghi nhận một ngày học.
class StreakOutcome {
  /// Chuỗi ngày học sau khi cập nhật.
  final int currentStreak;

  /// Kỷ lục (đã tính cả ngày hôm nay).
  final int longestStreak;

  /// Số lượt đóng băng đã dùng trong tuần này (sau khi cập nhật).
  final int freezesUsedThisWeek;

  /// Số lượt đóng băng còn lại trong tuần.
  final int freezesRemaining;

  /// Có vừa dùng 1 lượt đóng băng để cứu streak không.
  final bool freezeApplied;

  /// Streak có bị reset (mất chuỗi) không.
  final bool streakReset;

  /// Số ngày đã bỏ lỡ (không học) trước hôm nay.
  final int missedDays;

  /// Hôm nay học lại nhưng đã học rồi (không tăng streak).
  final bool alreadyStudiedToday;

  const StreakOutcome({
    required this.currentStreak,
    required this.longestStreak,
    required this.freezesUsedThisWeek,
    required this.freezesRemaining,
    this.freezeApplied = false,
    this.streakReset = false,
    this.missedDays = 0,
    this.alreadyStudiedToday = false,
  });

  @override
  String toString() =>
      'StreakOutcome(streak: $currentStreak, longest: $longestStreak, '
      'freezesUsed: $freezesUsedThisWeek, freezesLeft: $freezesRemaining, '
      'freezeApplied: $freezeApplied, reset: $streakReset, '
      'missedDays: $missedDays, alreadyToday: $alreadyStudiedToday)';
}

class StreakService {
  StreakService._();

  static const int maxFreezesPerWeek = AppConstants.streakFreezeMaxPerWeek;

  /// Thứ Hai 00:00 của tuần chứa [date] — mốc để reset lượt đóng băng.
  static DateTime weekStartOf(DateTime date) {
    final day = DateTime(date.year, date.month, date.day);
    return day.subtract(Duration(days: day.weekday - DateTime.monday));
  }

  /// [a] và [b] có cùng tuần (tính từ thứ Hai) không.
  static bool isSameWeek(DateTime? a, DateTime b) {
    if (a == null) return false;
    return weekStartOf(a) == weekStartOf(b);
  }

  /// Số lượt đóng băng còn lại, tự reset khi sang tuần mới.
  static int freezesRemaining({
    required DateTime now,
    int freezesUsedThisWeek = 0,
    DateTime? freezeWeekStart,
    int maxFreezes = maxFreezesPerWeek,
  }) {
    final used = isSameWeek(freezeWeekStart, now) ? freezesUsedThisWeek : 0;
    final left = maxFreezes - used;
    return left < 0 ? 0 : left;
  }

  /// Người dùng có đang bị "đứt" streak (bỏ lỡ ≥ 1 ngày) không —
  /// dùng để quyết định hiện gợi ý "Đóng băng streak".
  static bool hasBrokenStreak({
    required DateTime now,
    DateTime? lastStudyDate,
    required int currentStreak,
  }) {
    if (currentStreak <= 0 || lastStudyDate == null) return false;
    final today = DateTime(now.year, now.month, now.day);
    final last = DateTime(
      lastStudyDate.year,
      lastStudyDate.month,
      lastStudyDate.day,
    );
    return today.difference(last).inDays >= 2;
  }

  /// Ghi nhận việc học trong ngày [now] và trả về trạng thái streak mới.
  ///
  /// Quy tắc:
  /// - Chưa học bao giờ → streak = 1
  /// - Học hôm qua → streak + 1
  /// - Đã học hôm nay → giữ nguyên (không cộng dồn nhiều lần)
  /// - Bỏ lỡ 1 ngày **và** còn lượt đóng băng → tiêu 1 lượt, giữ streak, +1
  /// - Bỏ lỡ nhiều hơn số lượt còn lại → reset về 1
  static StreakOutcome registerStudyDay({
    required DateTime now,
    required int currentStreak,
    required int longestStreak,
    DateTime? lastStudyDate,
    int freezesUsedThisWeek = 0,
    DateTime? freezeWeekStart,
    int maxFreezes = maxFreezesPerWeek,
  }) {
    final today = DateTime(now.year, now.month, now.day);

    // Reset lượt đóng băng nếu đã sang tuần mới
    var used = isSameWeek(freezeWeekStart, now) ? freezesUsedThisWeek : 0;

    var freezeApplied = false;
    var streakReset = false;
    var alreadyStudiedToday = false;
    var missedDays = 0;
    var streak = currentStreak;

    if (lastStudyDate == null) {
      streak = 1;
    } else {
      final last = DateTime(
        lastStudyDate.year,
        lastStudyDate.month,
        lastStudyDate.day,
      );
      final diff = today.difference(last).inDays;

      if (diff <= 0) {
        // Đã học hôm nay (hoặc lệch đồng hồ) → không cộng thêm
        alreadyStudiedToday = true;
        streak = currentStreak > 0 ? currentStreak : 1;
      } else if (diff == 1) {
        streak = currentStreak + 1;
      } else {
        missedDays = diff - 1;
        final available = maxFreezes - used;
        if (currentStreak > 0 && missedDays <= available) {
          used += missedDays;
          freezeApplied = true;
          streak = currentStreak + 1;
        } else {
          streakReset = currentStreak > 0;
          streak = 1;
        }
      }
    }

    if (streak < 1) streak = 1;

    final longest = streak > longestStreak ? streak : longestStreak;
    final remaining = freezesRemaining(
      now: now,
      freezesUsedThisWeek: used,
      freezeWeekStart: now, // `used` đã được chuẩn hoá theo tuần hiện tại
      maxFreezes: maxFreezes,
    );

    return StreakOutcome(
      currentStreak: streak,
      longestStreak: longest,
      freezesUsedThisWeek: used,
      freezesRemaining: remaining,
      freezeApplied: freezeApplied,
      streakReset: streakReset,
      missedDays: missedDays,
      alreadyStudiedToday: alreadyStudiedToday,
    );
  }
}

/// Ghi nhận hoạt động học theo ngày (XP) để vẽ biểu đồ tiến độ.
///
/// Lưu dạng `Map<String, int>` với key `yyyy-MM-dd` vào
/// `UserProgressModel.dailyXP` (Hive field 12).
class StudyLog {
  StudyLog._();

  static String dayKey(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '${date.year}-$m-$d';
  }

  /// Cộng [xp] vào tổng XP và vào XP của ngày [at] (mặc định hôm nay).
  static void addXp(UserProgressModel progress, int xp, {DateTime? at}) {
    if (xp <= 0) return;
    final key = dayKey(at ?? DateTime.now());
    progress.dailyXP[key] = (progress.dailyXP[key] ?? 0) + xp;
    progress.totalXP += xp;
  }

  /// XP kiếm được trong một ngày.
  static int xpOn(UserProgressModel progress, DateTime day) =>
      progress.dailyXP[dayKey(day)] ?? 0;

  /// XP của [n] ngày gần nhất, cũ → mới (phần tử cuối cùng là hôm nay).
  static List<int> lastNDaysXp(
    UserProgressModel progress,
    int n, {
    DateTime? now,
  }) {
    final base = now ?? DateTime.now();
    final today = DateTime(base.year, base.month, base.day);
    return List<int>.generate(n, (i) {
      final day = today.subtract(Duration(days: n - 1 - i));
      return xpOn(progress, day);
    });
  }

  /// Tổng của danh sách (helper cho chart/label).
  static int sum(Iterable<int> values) {
    var total = 0;
    for (final v in values) {
      total += v;
    }
    return total;
  }

  /// Nhãn thứ ngắn gọn cho biểu đồ: T2, T3, ... CN.
  static String shortWeekdayLabel(DateTime date) {
    const labels = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    final index = date.weekday - DateTime.monday;
    return labels[index < 0 || index > 6 ? 0 : index];
  }
}

// Unit test cho StreakService (streak + đóng băng) và StudyLog (XP theo ngày).
import 'package:flutter_test/flutter_test.dart';
import 'package:viplang/core/services/streak_service.dart';
import 'package:viplang/data/models/user_progress_model.dart';

void main() {
  group('StreakService.weekStartOf', () {
    test('trả về thứ Hai của tuần', () {
      // 2026-09-24 là thứ Năm
      final thursday = DateTime(2026, 9, 24);
      expect(thursday.weekday, DateTime.thursday);
      expect(StreakService.weekStartOf(thursday), DateTime(2026, 9, 21));

      // Chủ nhật thuộc tuần bắt đầu từ thứ Hai trước đó
      final sunday = DateTime(2026, 9, 27);
      expect(sunday.weekday, DateTime.sunday);
      expect(StreakService.weekStartOf(sunday), DateTime(2026, 9, 21));

      // Thứ Hai giữ nguyên
      expect(
        StreakService.weekStartOf(DateTime(2026, 9, 21)),
        DateTime(2026, 9, 21),
      );
    });
  });

  group('StreakService.registerStudyDay', () {
    final today = DateTime(2026, 9, 24, 10);

    test('chưa học bao giờ → streak = 1', () {
      final r = StreakService.registerStudyDay(
        now: today,
        currentStreak: 0,
        longestStreak: 0,
      );
      expect(r.currentStreak, 1);
      expect(r.longestStreak, 1);
      expect(r.freezeApplied, isFalse);
      expect(r.streakReset, isFalse);
    });

    test('học hôm qua → streak + 1', () {
      final r = StreakService.registerStudyDay(
        now: today,
        currentStreak: 4,
        longestStreak: 9,
        lastStudyDate: DateTime(2026, 9, 23, 20),
      );
      expect(r.currentStreak, 5);
      expect(r.longestStreak, 9, reason: 'kỷ lục cũ cao hơn thì giữ nguyên');
      expect(r.freezeApplied, isFalse);
    });

    test('học 2 lần trong cùng ngày → không cộng dồn', () {
      final r = StreakService.registerStudyDay(
        now: today,
        currentStreak: 5,
        longestStreak: 5,
        lastStudyDate: DateTime(2026, 9, 24, 8),
      );
      expect(r.currentStreak, 5);
      expect(r.alreadyStudiedToday, isTrue);
      expect(r.streakReset, isFalse);
    });

    test('bỏ lỡ 1 ngày nhưng còn lượt đóng băng → cứu streak', () {
      final r = StreakService.registerStudyDay(
        now: today,
        currentStreak: 7,
        longestStreak: 7,
        lastStudyDate: DateTime(2026, 9, 22), // 23/09 bị bỏ lỡ
        freezesUsedThisWeek: 0,
        freezeWeekStart: DateTime(2026, 9, 21),
      );
      expect(r.freezeApplied, isTrue);
      expect(r.missedDays, 1);
      expect(r.currentStreak, 8, reason: 'giữ chuỗi + hôm nay');
      expect(r.freezesUsedThisWeek, 1);
      expect(r.freezesRemaining, 0, reason: 'tối đa 1/tuần');
      expect(r.streakReset, isFalse);
    });

    test('bỏ lỡ 1 ngày mà đã dùng hết lượt tuần này → reset về 1', () {
      final r = StreakService.registerStudyDay(
        now: today,
        currentStreak: 7,
        longestStreak: 7,
        lastStudyDate: DateTime(2026, 9, 22),
        freezesUsedThisWeek: 1,
        freezeWeekStart: DateTime(2026, 9, 21),
      );
      expect(r.freezeApplied, isFalse);
      expect(r.streakReset, isTrue);
      expect(r.currentStreak, 1);
      expect(r.longestStreak, 7);
    });

    test('lượt đóng băng được nạp lại khi sang tuần mới', () {
      final r = StreakService.registerStudyDay(
        now: DateTime(2026, 9, 28), // thứ Hai tuần sau
        currentStreak: 3,
        longestStreak: 3,
        lastStudyDate: DateTime(2026, 9, 26), // bỏ lỡ 27/09
        freezesUsedThisWeek: 1,
        freezeWeekStart: DateTime(2026, 9, 21), // tuần cũ
      );
      expect(r.freezeApplied, isTrue, reason: 'tuần mới → còn 1 lượt');
      expect(r.freezesUsedThisWeek, 1);
      expect(r.freezesRemaining, 0);
      expect(r.currentStreak, 4);
    });

    test('bỏ lỡ 2 ngày (vượt số lượt) → reset về 1', () {
      final r = StreakService.registerStudyDay(
        now: today,
        currentStreak: 10,
        longestStreak: 10,
        lastStudyDate: DateTime(2026, 9, 21),
        freezesUsedThisWeek: 0,
        freezeWeekStart: DateTime(2026, 9, 21),
      );
      expect(r.missedDays, 2);
      expect(r.freezeApplied, isFalse);
      expect(r.currentStreak, 1);
      expect(r.streakReset, isTrue);
    });
  });

  group('StreakService.hasBrokenStreak', () {
    test('đúng khi bỏ lỡ ≥ 1 ngày và đang có streak', () {
      expect(
        StreakService.hasBrokenStreak(
          now: DateTime(2026, 9, 24),
          lastStudyDate: DateTime(2026, 9, 22),
          currentStreak: 5,
        ),
        isTrue,
      );
    });

    test('sai khi mới học hôm qua hoặc chưa có streak', () {
      expect(
        StreakService.hasBrokenStreak(
          now: DateTime(2026, 9, 24),
          lastStudyDate: DateTime(2026, 9, 23),
          currentStreak: 5,
        ),
        isFalse,
      );
      expect(
        StreakService.hasBrokenStreak(
          now: DateTime(2026, 9, 24),
          lastStudyDate: null,
          currentStreak: 0,
        ),
        isFalse,
      );
    });
  });

  group('StudyLog', () {
    test('dayKey đúng định dạng yyyy-MM-dd', () {
      expect(StudyLog.dayKey(DateTime(2026, 9, 4)), '2026-09-04');
      expect(StudyLog.dayKey(DateTime(2026, 12, 31)), '2026-12-31');
    });

    test('addXp cộng dồn cả totalXP và XP theo ngày', () {
      final p = UserProgressModel(userId: 'u');
      StudyLog.addXp(p, 30, at: DateTime(2026, 9, 24, 9));
      StudyLog.addXp(p, 20, at: DateTime(2026, 9, 24, 21));
      expect(p.totalXP, 50);
      expect(StudyLog.xpOn(p, DateTime(2026, 9, 24)), 50);
      // XP 0/âm không được ghi
      StudyLog.addXp(p, 0, at: DateTime(2026, 9, 24));
      expect(p.totalXP, 50);
    });

    test('lastNDaysXp trả về đúng thứ tự cũ → mới', () {
      final p = UserProgressModel(userId: 'u');
      StudyLog.addXp(p, 10, at: DateTime(2026, 9, 22));
      StudyLog.addXp(p, 30, at: DateTime(2026, 9, 24));

      final week = StudyLog.lastNDaysXp(p, 4, now: DateTime(2026, 9, 24));
      expect(week, [0, 10, 0, 30]);
      expect(StudyLog.sum(week), 40);
    });

    test('shortWeekdayLabel đúng cho cả tuần', () {
      expect(StudyLog.shortWeekdayLabel(DateTime(2026, 9, 21)), 'T2');
      expect(StudyLog.shortWeekdayLabel(DateTime(2026, 9, 26)), 'T7');
      expect(StudyLog.shortWeekdayLabel(DateTime(2026, 9, 27)), 'CN');
    });
  });
}

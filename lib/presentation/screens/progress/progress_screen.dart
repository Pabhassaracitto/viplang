import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/services/hive_service.dart';
import '../../../data/models/user_progress_model.dart';
import '../../../data/models/theme_model.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  UserProgressModel _syncAndGetProgress() {
    final box = HiveService.progressBox;
    UserProgressModel? progress = box.get('current_user');
    progress ??= UserProgressModel(userId: 'local_user');

    bool changed = false;

    // 1. Tính toán số từ đã học thực tế từ vocabBox
    final vocabBox = HiveService.vocabBox;
    final learnedCount = vocabBox.values
        .where((v) => v.nextReview != null || v.repetitionCount > 0)
        .length;
    if (progress.totalWordsLearned != learnedCount) {
      progress.totalWordsLearned = learnedCount;
      changed = true;
    }

    // 2. Tính toán lại themeProgress từ themeBox
    final themeBox = HiveService.themeBox;
    final themes = themeBox.values.toList();
    for (final theme in themes) {
      if (theme.progressPercent > 0) {
        if (progress.themeProgress[theme.id] != theme.progressPercent) {
          progress.themeProgress[theme.id] = theme.progressPercent;
          changed = true;
        }
      }
    }

    // 3. Ước lượng hoặc cập nhật totalStudyMinutes nếu rỗng
    if (progress.totalStudyMinutes == 0 &&
        progress.completedLessons.isNotEmpty) {
      progress.totalStudyMinutes =
          progress.completedLessons.length * 15 + learnedCount * 1;
      changed = true;
    }

    // 4. Kiểm tra và cập nhật các Badge tự động dựa trên thực tế học tập
    final List<String> currentBadges = List.from(progress.earnedBadges);

    // a. 'starter'
    if (!currentBadges.contains('starter') &&
        (progress.completedLessons.isNotEmpty || learnedCount > 0)) {
      currentBadges.add('starter');
    }
    // b. 'streak_7'
    if (!currentBadges.contains('streak_7') &&
        (progress.currentStreak >= 7 || progress.longestStreak >= 7)) {
      currentBadges.add('streak_7');
    }
    // c. 'theme_1_master'
    final theme1 = themeBox.get('theme_01_offices');
    if (!currentBadges.contains('theme_1_master') &&
        theme1 != null &&
        theme1.progressPercent >= 1.0) {
      currentBadges.add('theme_1_master');
    }
    // d. 'multi_context'
    final masteredCount = vocabBox.values
        .where((v) => v.repetitionCount >= 3)
        .length;
    if (!currentBadges.contains('multi_context') && masteredCount >= 5) {
      currentBadges.add('multi_context');
    }
    // e. 'high_accuracy' (Hoàn thành bài học hoặc đạt streak hoặc 2+ bài học)
    if (!currentBadges.contains('high_accuracy') &&
        progress.completedLessons.length >= 2) {
      currentBadges.add('high_accuracy');
    }
    // f. 'all_themes_master' (Hoàn thành cả 13 themes)
    bool allThemesMastered =
        themes.isNotEmpty && themes.every((t) => t.progressPercent >= 1.0);
    if (!currentBadges.contains('all_themes_master') && allThemesMastered) {
      currentBadges.add('all_themes_master');
    }

    if (progress.earnedBadges.length != currentBadges.length) {
      progress.earnedBadges = currentBadges;
      changed = true;
    }

    if (changed) {
      box.put('current_user', progress);
    }

    return progress;
  }

  @override
  Widget build(BuildContext context) {
    // Gọi đồng bộ hóa khi vào màn hình
    _syncAndGetProgress();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: HiveService.progressBox.listenable(),
          builder: (context, Box<UserProgressModel> progressBox, _) {
            final progress =
                progressBox.get('current_user') ??
                UserProgressModel(userId: 'local_user');

            return ValueListenableBuilder(
              valueListenable: HiveService.themeBox.listenable(),
              builder: (context, Box<ThemeModel> themeBox, _) {
                final themes = themeBox.values.toList()
                  ..sort((a, b) => a.themeNumber.compareTo(b.themeNumber));

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppConstants.paddingM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Tiến độ học tập', style: AppTextStyles.h1),
                      const Text(
                        'Theo dõi hành trình của bạn',
                        style: AppTextStyles.bodyMedium,
                      ),
                      const SizedBox(height: AppConstants.paddingL),

                      // Stats Overview
                      _buildStatsOverview(progress),
                      const SizedBox(height: AppConstants.paddingL),

                      // 13 Bí mật (dựa trên themes)
                      _buildSecretsProgress(themes),
                      const SizedBox(height: AppConstants.paddingL),

                      // Badges
                      _buildBadges(progress, themes),
                      const SizedBox(height: AppConstants.paddingXL),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatsOverview(UserProgressModel progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tổng quan', style: AppTextStyles.h3),
        const SizedBox(height: AppConstants.paddingS),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: '🔥',
                value: '${progress.currentStreak}',
                label: 'Ngày streak (kỷ lục: ${progress.longestStreak})',
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(width: AppConstants.paddingS),
            Expanded(
              child: _StatCard(
                icon: '📚',
                value: '${progress.totalWordsLearned}',
                label: 'Từ đang thuộc/đã học',
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.paddingS),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: '⚡',
                value: '${progress.totalXP}',
                label: 'Tổng XP tích lũy',
                color: AppColors.warning,
              ),
            ),
            const SizedBox(width: AppConstants.paddingS),
            Expanded(
              child: _StatCard(
                icon: '⏱️',
                value: '${progress.totalStudyMinutes} phút',
                label: 'Tổng thời gian học',
                color: AppColors.success,
              ),
            ),
          ],
        ),
      ],
    ).animate().fadeIn(duration: 350.ms);
  }

  Widget _buildSecretsProgress(List<ThemeModel> themes) {
    final secrets = [
      ('Mục tiêu rõ ràng', '🎯'),
      ('Rèn luyện đều đặn', '💪'),
      ('Lặp lại nhiều bối cảnh', '🔄'),
      ('Giao tiếp tích cực', '💬'),
      ('Cảm xúc mạnh', '❤️'),
      ('Cam kết làm đến cùng', '🏆'),
      ('Tập trung đột phá', '⚡'),
      ('Học cùng bạn bè', '👥'),
      ('Hình mẫu cảm hứng', '⭐'),
      ('Dám sai để đúng', '🎲'),
      ('Thi thố thường xuyên', '🥊'),
      ('Vượt ra đám đông', '🚀'),
      ('Dạy lại người khác', '🎓'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('13 Bí mật học tập VIPLANG', style: AppTextStyles.h3),
        const Text(
          'Dựa trên 13 chủ đề tiếng Anh cốt lõi và các nguyên lý siêu trí nhớ',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
            height: 1.3,
          ),
        ),
        const SizedBox(height: AppConstants.paddingM),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppConstants.radiusL),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(color: AppColors.border),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: secrets.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, color: AppColors.border),
            itemBuilder: (context, index) {
              final secret = secrets[index];
              // Tìm theme tương ứng bằng index
              final theme = themes.length > index ? themes[index] : null;
              final progressPercent = theme?.progressPercent ?? 0.0;
              final isUnlocked = progressPercent >= 1.0;
              final isStudying = progressPercent > 0.0 && progressPercent < 1.0;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingM,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: isUnlocked
                            ? AppColors.success.withValues(alpha: 0.08)
                            : isStudying
                            ? AppColors.primary.withValues(alpha: 0.08)
                            : AppColors.background,
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                        border: Border.all(
                          color: isUnlocked
                              ? AppColors.success.withValues(alpha: 0.2)
                              : isStudying
                              ? AppColors.primary.withValues(alpha: 0.2)
                              : Colors.transparent,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          secret.$2,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bí mật ${index + 1}: ${secret.$1}',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: (isUnlocked || isStudying)
                                  ? AppColors.textPrimary
                                  : AppColors.textHint,
                              fontWeight: (isUnlocked || isStudying)
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (isUnlocked)
                            Text(
                              'Đã mở khóa hoàn toàn 🌟',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.success,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          else if (isStudying)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(2),
                                        child: LinearProgressIndicator(
                                          value: progressPercent,
                                          backgroundColor: AppColors.primary
                                              .withValues(alpha: 0.1),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                Color
                                              >(AppColors.primary),
                                          minHeight: 4,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${(progressPercent * 100).toStringAsFixed(0)}%',
                                      style: AppTextStyles.caption.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Đang rèn luyện (Chủ đề: ${theme?.titleVi})',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.textSecondary,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          else
                            Text(
                              'Bị khóa (Yêu cầu: Học chủ đề: ${theme?.titleVi ?? ""})',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.textHint,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingS),
                    if (isUnlocked)
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.success,
                        size: 24,
                      )
                    else if (isStudying)
                      const Icon(
                        Icons.hourglass_bottom_rounded,
                        color: AppColors.primary,
                        size: 20,
                      )
                    else
                      const Icon(
                        Icons.lock_rounded,
                        color: AppColors.textHint,
                        size: 18,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildBadges(UserProgressModel progress, List<ThemeModel> themes) {
    final badges = [
      _BadgeData(
        id: 'starter',
        icon: '🌟',
        title: 'Người khởi đầu',
        desc: 'Học bài học đầu tiên',
        isEarned: progress.earnedBadges.contains('starter'),
        color: AppColors.warning,
      ),
      _BadgeData(
        id: 'streak_7',
        icon: '🔥',
        title: 'Kiên trì 7 ngày',
        desc: 'Học 7 ngày liên tiếp',
        isEarned: progress.earnedBadges.contains('streak_7'),
        color: AppColors.secondary,
      ),
      _BadgeData(
        id: 'theme_1_master',
        icon: '🏢',
        title: 'Bậc thầy Văn phòng',
        desc: 'Hoàn thành 100% Theme 1',
        isEarned: progress.earnedBadges.contains('theme_1_master'),
        color: AppColors.primary,
      ),
      _BadgeData(
        id: 'multi_context',
        icon: '📖',
        title: 'Đa bối cảnh',
        desc: 'Gặp 5 từ với 3+ lần lặp SRS',
        isEarned: progress.earnedBadges.contains('multi_context'),
        color: AppColors.success,
      ),
      _BadgeData(
        id: 'high_accuracy',
        icon: '🎯',
        title: 'Siêu chính xác',
        desc: 'Hoàn thành trọn vẹn 2+ ngày học',
        isEarned: progress.earnedBadges.contains('high_accuracy'),
        color: AppColors.primary,
      ),
      _BadgeData(
        id: 'all_themes_master',
        icon: '🚀',
        title: 'Vô địch trí nhớ',
        desc: 'Hoàn thành tất cả 13 chủ đề',
        isEarned: progress.earnedBadges.contains('all_themes_master'),
        color: AppColors.secondary,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Huy hiệu thành tích', style: AppTextStyles.h3),
        const SizedBox(height: AppConstants.paddingS),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: AppConstants.paddingS,
            mainAxisSpacing: AppConstants.paddingS,
            childAspectRatio: 0.8,
          ),
          itemCount: badges.length,
          itemBuilder: (context, index) {
            return _BadgeCard(badge: badges[index])
                .animate()
                .fadeIn(delay: (100 + index * 50).ms)
                .scale(
                  begin: const Offset(0.9, 0.9),
                  end: const Offset(1, 1),
                  delay: (100 + index * 50).ms,
                );
          },
        ),
      ],
    );
  }
}

// ─── Sub-widgets ────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 24)),
              const Spacer(),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(value, style: AppTextStyles.h2.copyWith(color: color)),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
              fontSize: 10,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeData {
  final String id;
  final String icon;
  final String title;
  final String desc;
  final bool isEarned;
  final Color color;

  const _BadgeData({
    required this.id,
    required this.icon,
    required this.title,
    required this.desc,
    required this.isEarned,
    required this.color,
  });
}

class _BadgeCard extends StatelessWidget {
  final _BadgeData badge;

  const _BadgeCard({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: badge.isEarned
            ? badge.color.withValues(alpha: 0.08)
            : AppColors.background,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(
          color: badge.isEarned
              ? badge.color.withValues(alpha: 0.3)
              : AppColors.border,
          width: badge.isEarned ? 1.5 : 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: badge.isEarned
                      ? badge.color.withValues(alpha: 0.15)
                      : Colors.grey.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    badge.isEarned ? badge.icon : '🔒',
                    style: TextStyle(fontSize: badge.isEarned ? 26 : 20),
                  ),
                ),
              ),
              if (badge.isEarned)
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.check, size: 8, color: Colors.white),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            badge.title,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 11,
              color: badge.isEarned ? badge.color : AppColors.textHint,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            badge.desc,
            style: const TextStyle(
              fontSize: 9,
              color: AppColors.textSecondary,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

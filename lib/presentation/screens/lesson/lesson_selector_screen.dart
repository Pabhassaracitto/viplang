import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/content/all_themes_registry.dart';
import '../../../data/models/lesson_model.dart';
import '../../../data/models/theme_model.dart';
import 'lesson_day_screen.dart';

class LessonSelectorScreen extends StatelessWidget {
  final ThemeModel theme;

  const LessonSelectorScreen({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(theme.titleEn, style: AppTextStyles.h3),
            Text(
              theme.titleVi,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Theme Progress Summary ──────────────────────────────
            _buildProgressSummary(),

            const SizedBox(height: AppConstants.paddingL),

            // ── Quick Actions ───────────────────────────────────────
            _buildQuickActions(context),

            const SizedBox(height: AppConstants.paddingL),

            // ── Days List ───────────────────────────────────────────
            const Text('📅 Các ngày học', style: AppTextStyles.h3),
            const SizedBox(height: AppConstants.paddingS),

            ...List.generate(theme.totalDays, (index) {
              final dayNumber = index + 1;
              final isCompleted = dayNumber <= theme.completedDays;
              final isCurrent = dayNumber == theme.completedDays + 1;
              final isLocked = dayNumber > theme.completedDays + 1;

              return _DayCard(
                dayNumber: dayNumber,
                themeId: theme.id,
                themeTitle: theme.titleEn,
                isCompleted: isCompleted,
                isCurrent: isCurrent,
                isLocked: isLocked,
              ).animate(delay: (index * 100).ms).fadeIn().slideX(begin: 0.1);
            }),

            const SizedBox(height: AppConstants.paddingXL),

            // ── Vocabulary Section ──────────────────────────────────
            _buildVocabularySection(context),

            const SizedBox(height: AppConstants.paddingXL),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSummary() {
    final progressPercent = (theme.progressPercent * 100).round();

    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.primary.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    theme.iconEmoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.paddingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiến độ: $progressPercent%',
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      '${theme.completedDays}/${theme.totalDays} ngày hoàn thành',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingM),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.radiusS),
            child: LinearProgressIndicator(
              value: theme.progressPercent,
              backgroundColor: AppColors.border,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
              minHeight: 8,
            ),
          ),
        ],
      ),
    ).animate().fadeIn();
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionButton(
            icon: '▶️',
            label: theme.completedDays == 0
                ? 'Bắt đầu học'
                : theme.completedDays >= theme.totalDays
                ? 'Học lại từ đầu'
                : 'Tiếp tục học',
            color: AppColors.primary,
            onTap: () {
              final dayNumber = theme.completedDays >= theme.totalDays
                  ? 1
                  : theme.completedDays + 1;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LessonDayScreen(
                    dayNumber: dayNumber,
                    themeId: theme.id,
                    themeTitle: theme.titleEn,
                    isReviewMode: false,
                  ),
                ),
              );
            },
          ),
        ),
        if (theme.completedDays > 0) ...[
          const SizedBox(width: AppConstants.paddingS),
          Expanded(
            child: _QuickActionButton(
              icon: '🔄',
              label: 'Ôn tập nhanh',
              color: AppColors.success,
              onTap: () {
                // Mở Day 1 ở chế độ review
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LessonDayScreen(
                      dayNumber: 1,
                      themeId: theme.id,
                      themeTitle: theme.titleEn,
                      isReviewMode: true,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    ).animate(delay: 100.ms).fadeIn();
  }

  Widget _buildVocabularySection(BuildContext context) {
    final vocabs = AllThemesRegistry.getVocabulary(theme.id);
    final previewVocabs = vocabs.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('📚 Từ vựng chủ đề', style: AppTextStyles.h3),
            const Spacer(),
            TextButton(
              onPressed: () {
                // TODO: Navigate to full vocabulary list
                // Navigate to full vocabulary list
              },
              child: Text(
                'Xem tất cả (${vocabs.length})',
                style: AppTextStyles.caption.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.paddingS),
        Container(
          padding: const EdgeInsets.all(AppConstants.paddingM),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppConstants.radiusL),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: previewVocabs.map((vocab) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        vocab.wordEn,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      vocab.partOfSpeech,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingS),
                    Expanded(
                      flex: 2,
                      child: Text(
                        vocab.wordVi,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ).animate(delay: 200.ms).fadeIn();
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// SUB-WIDGETS
// ══════════════════════════════════════════════════════════════════════════════

class _DayCard extends StatelessWidget {
  final int dayNumber;
  final String themeId;
  final String themeTitle;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLocked;

  const _DayCard({
    required this.dayNumber,
    required this.themeId,
    required this.themeTitle,
    required this.isCompleted,
    required this.isCurrent,
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    final lesson = AllThemesRegistry.getLesson(themeId, dayNumber);

    return GestureDetector(
      onTap: isLocked
          ? () => _showLockedMessage(context)
          : () => _showDayOptions(context, lesson),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppConstants.paddingS),
        padding: const EdgeInsets.all(AppConstants.paddingM),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
          border: Border.all(
            color: isCurrent
                ? AppColors.primary
                : isCompleted
                ? AppColors.success.withValues(alpha: 0.3)
                : AppColors.border,
            width: isCurrent ? 2 : 1,
          ),
          boxShadow: isCurrent
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // Day number badge
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isLocked
                    ? AppColors.surfaceVariant
                    : isCurrent
                    ? AppColors.primary
                    : isCompleted
                    ? AppColors.success.withValues(alpha: 0.15)
                    : AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Center(
                child: isLocked
                    ? const Icon(
                        Icons.lock,
                        color: AppColors.textTertiary,
                        size: 18,
                      )
                    : isCompleted
                    ? const Icon(
                        Icons.check,
                        color: AppColors.success,
                        size: 20,
                      )
                    : Text(
                        '$dayNumber',
                        style: AppTextStyles.h3.copyWith(
                          color: isCurrent ? Colors.white : AppColors.primary,
                        ),
                      ),
              ),
            ),

            const SizedBox(width: AppConstants.paddingM),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ngày $dayNumber',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isLocked
                          ? AppColors.textTertiary
                          : AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    lesson?.titleVi ?? 'Đang phát triển',
                    style: AppTextStyles.caption.copyWith(
                      color: isLocked
                          ? AppColors.textDisabled
                          : AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (lesson != null && !isLocked) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${lesson.phases.length} phần học',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Action indicator
            if (!isLocked)
              Icon(
                isCurrent ? Icons.play_arrow : Icons.chevron_right,
                color: isCurrent ? AppColors.primary : AppColors.textSecondary,
              ),
          ],
        ),
      ),
    );
  }

  void _showLockedMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hoàn thành ngày trước để mở khóa!'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.warning,
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  void _showDayOptions(BuildContext context, LessonDay? lesson) {
    if (lesson == null) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppConstants.radiusXL),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              child: Row(
                children: [
                  Text('📅 Ngày $dayNumber', style: AppTextStyles.h3),
                  const Spacer(),
                  if (isCompleted)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '✅ Hoàn thành',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Options
            ListTile(
              leading: const Icon(Icons.play_arrow, color: AppColors.primary),
              title: const Text('Học từ đầu'),
              subtitle: const Text('Bắt đầu bài học mới'),
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LessonDayScreen(
                      dayNumber: dayNumber,
                      themeId: themeId,
                      themeTitle: themeTitle,
                      isReviewMode: false,
                    ),
                  ),
                );
              },
            ),

            if (isCompleted) ...[
              ListTile(
                leading: const Icon(Icons.refresh, color: AppColors.success),
                title: const Text('Ôn tập tự do'),
                subtitle: const Text('Xem lại bất kỳ phần nào'),
                onTap: () {
                  Navigator.pop(ctx);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LessonDayScreen(
                        dayNumber: dayNumber,
                        themeId: themeId,
                        themeTitle: themeTitle,
                        isReviewMode: true,
                      ),
                    ),
                  );
                },
              ),

              // ✅ NEW: Chọn phase cụ thể
              ListTile(
                leading: const Icon(Icons.list, color: AppColors.warning),
                title: const Text('Chọn phần cụ thể'),
                subtitle: Text('${lesson.phases.length} phần học'),
                onTap: () {
                  Navigator.pop(ctx);
                  _showPhaseSelector(context, lesson);
                },
              ),
            ],

            const SizedBox(height: AppConstants.paddingM),
          ],
        ),
      ),
    );
  }

  void _showPhaseSelector(BuildContext context, LessonDay lesson) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppConstants.radiusXL),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.all(AppConstants.paddingM),
              child: Text('📋 Chọn phần để ôn tập', style: AppTextStyles.h3),
            ),

            const Divider(height: 1),

            // Phase list
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(AppConstants.paddingS),
                itemCount: lesson.phases.length,
                itemBuilder: (_, index) {
                  final phase = lesson.phases[index];

                  return ListTile(
                    leading: _getPhaseIcon(phase.phaseType),
                    title: Text(
                      phase.titleVi ?? phase.titleEn ?? 'Phase ${index + 1}',
                      style: AppTextStyles.bodyMedium,
                    ),
                    subtitle: Text(
                      _getPhaseDescription(phase.phaseType),
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: AppColors.textSecondary,
                    ),
                    onTap: () {
                      Navigator.pop(ctx);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LessonDayScreen(
                            dayNumber: dayNumber,
                            themeId: themeId,
                            themeTitle: themeTitle,
                            isReviewMode: true,
                            startPhaseIndex: index,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: AppConstants.paddingM),
          ],
        ),
      ),
    );
  }

  Widget _getPhaseIcon(PhaseType type) {
    IconData icon;
    Color color;

    switch (type) {
      case PhaseType.readListen:
        icon = Icons.headphones;
        color = AppColors.primary;
        break;
      case PhaseType.translate:
        icon = Icons.translate;
        color = AppColors.secondary;
        break;
      case PhaseType.mindGame:
        icon = Icons.psychology;
        color = AppColors.warning;
        break;
      case PhaseType.vocabulary:
        icon = Icons.book;
        color = AppColors.success;
        break;
      case PhaseType.listeningQuiz:
        icon = Icons.quiz;
        color = AppColors.error;
        break;
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstants.radiusS),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }

  String _getPhaseDescription(PhaseType type) {
    switch (type) {
      case PhaseType.readListen:
        return 'Đọc và nghe audio';
      case PhaseType.translate:
        return 'Nghe và tự dịch';
      case PhaseType.mindGame:
        return 'Trò chơi tư duy';
      case PhaseType.vocabulary:
        return 'Ôn tập từ vựng';
      case PhaseType.listeningQuiz:
        return 'Bài quiz nghe';
    }
  }
}

class _QuickActionButton extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingM,
          vertical: AppConstants.paddingM,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: AppConstants.paddingS),
            Flexible(
              child: Text(
                label,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

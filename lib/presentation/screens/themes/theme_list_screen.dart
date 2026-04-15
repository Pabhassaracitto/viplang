import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/theme_model.dart';
import '../../blocs/theme_bloc/theme_bloc.dart';
import '../lesson/lesson_selector_screen.dart';

class ThemeListScreen extends StatefulWidget {
  const ThemeListScreen({super.key});

  @override
  State<ThemeListScreen> createState() => _ThemeListScreenState();
}

class _ThemeListScreenState extends State<ThemeListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeBloc>().add(LoadThemesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  if (state is ThemeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }
                  if (state is ThemeLoaded) {
                    return _buildThemeList(state.themes);
                  }
                  if (state is ThemeError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('13 Chủ đề TOEIC', style: AppTextStyles.h2),
                Text(
                  'Học theo phương pháp Do Thái',
                  style: AppTextStyles.bodyMedium,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
              vertical: AppConstants.paddingS,
            ),
            decoration: BoxDecoration(
              color: AppColors.primarySurface,
              borderRadius: BorderRadius.circular(AppConstants.radiusCircle),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.emoji_events_rounded,
                  color: AppColors.primary,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '0 XP',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeList(List<ThemeModel> themes) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      itemCount: themes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppConstants.paddingM),
          child: index < 5
              ? _ThemeCard(theme: themes[index], index: index).animate().fadeIn(
                  delay: Duration(milliseconds: index * 60),
                  duration: 250.ms,
                )
              : _ThemeCard(theme: themes[index], index: index),
        );
      },
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final ThemeModel theme;
  final int index;

  const _ThemeCard({required this.theme, required this.index});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.themeColors[index % AppColors.themeColors.length];
    final isLocked = !theme.isUnlocked;

    return GestureDetector(
      onTap: isLocked
          ? () => _showLockedDialog(context)
          : () => _navigateToLesson(context),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
          border: Border.all(
            color: isLocked ? AppColors.border : color.withValues(alpha: 0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: isLocked
                  ? Colors.black.withValues(alpha: 0.04)
                  : color.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingM),
          child: Row(
            children: [
              // Theme Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isLocked
                      ? AppColors.surfaceVariant
                      : color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                ),
                child: Center(
                  child: isLocked
                      ? Icon(
                          Icons.lock_rounded,
                          color: AppColors.textTertiary,
                          size: 28,
                        )
                      : Text(
                          theme.iconEmoji,
                          style: const TextStyle(fontSize: 30),
                        ),
                ),
              ),
              const SizedBox(width: AppConstants.paddingM),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: isLocked
                                ? AppColors.surfaceVariant
                                : color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Chủ đề ${theme.themeNumber.toString().padLeft(2, '0')}',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: isLocked ? AppColors.textTertiary : color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (!isLocked && theme.progressPercent > 0) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.successSurface,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${(theme.progressPercent * 100).round()}%',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.success,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      theme.titleEn,
                      style: AppTextStyles.h3.copyWith(
                        color: isLocked
                            ? AppColors.textTertiary
                            : AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      theme.titleVi,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: isLocked ? AppColors.textDisabled : color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Progress bar
                    if (!isLocked)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: theme.progressPercent,
                          backgroundColor: color.withValues(alpha: 0.1),
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                          minHeight: 4,
                        ),
                      ),

                    const SizedBox(height: 4),
                    Text(
                      isLocked
                          ? 'Hoàn thành chủ đề trước để mở khóa'
                          : '${theme.completedDays}/${theme.totalDays} ngày học',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),

              // Arrow
              if (!isLocked)
                Icon(Icons.arrow_forward_ios_rounded, color: color, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToLesson(BuildContext context) {
    // ✅ THAY ĐỔI: Mở LessonSelectorScreen thay vì LessonDayScreen trực tiếp
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LessonSelectorScreen(theme: theme)),
    );
  }

  void _showLockedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
        ),
        title: const Row(
          children: [
            Icon(Icons.lock_rounded, color: AppColors.secondary),
            SizedBox(width: 8),
            Text('Chưa mở khóa'),
          ],
        ),
        content: const Text(
          'Hãy hoàn thành chủ đề trước để mở khóa chủ đề này!\n\nKiên trì là chìa khóa thành công.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hiểu rồi'),
          ),
        ],
      ),
    );
  }
}

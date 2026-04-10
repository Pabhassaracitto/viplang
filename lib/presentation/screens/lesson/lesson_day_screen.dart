// lib/presentation/screens/lesson/lesson_day_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/services/hive_service.dart';
import '../../../data/content/all_themes_registry.dart';
import '../../../data/models/lesson_model.dart';
import '../../../data/models/user_progress_model.dart';
import '../../blocs/lesson_bloc/lesson_bloc.dart';
import '../../blocs/mind_game_bloc/mind_game_bloc.dart';
import '../../blocs/theme_bloc/theme_bloc.dart';
import 'lesson_complete_screen.dart';
import 'phases/phase_mind_game_screen.dart';
import 'phases/phase_quiz_screen.dart';
import 'phases/phase_read_listen_screen.dart';
import 'phases/phase_translate_screen.dart';
import 'phases/phase_vocabulary_screen.dart';

class LessonDayScreen extends StatefulWidget {
  final int dayNumber;
  final String themeId;
  final String themeTitle;

  const LessonDayScreen({
    super.key,
    required this.dayNumber,
    required this.themeId,
    required this.themeTitle,
  });

  @override
  State<LessonDayScreen> createState() => _LessonDayScreenState();
}

class _LessonDayScreenState extends State<LessonDayScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LessonBloc>().add(
      LoadLessonEvent(widget.themeId, widget.dayNumber),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonBloc, LessonState>(
      listener: (context, state) {
        if (state is LessonCompleted) {
          // ✅ Cập nhật tiến độ theme
          final totalDays = AllThemesRegistry.getTotalDays(widget.themeId);
          final completedDays = widget.dayNumber; // Day hiện tại đã xong
          final progress = totalDays > 0 ? completedDays / totalDays : 0.0;

          // Cập nhật ThemeBloc để lưu vào Hive
          if (context.mounted) {
            context.read<ThemeBloc>().add(
              UpdateThemeProgressEvent(
                widget.themeId,
                progress,
                completedDays: completedDays,
              ),
            );

            // ✅ Cập nhật UserProgress (Streak & XP)
            _updateUserProgress(context, state.xpEarned);
          }

          final nextDay = widget.dayNumber < totalDays
              ? widget.dayNumber + 1
              : null;

          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => LessonCompleteScreen(
                  dayNumber: widget.dayNumber,
                  themeId: widget.themeId,
                  themeTitle: widget.themeTitle,
                  totalWords: 15,
                  correctAnswers: 0,
                  totalQuestions: state.lessonDay.phases
                      .where((p) => p.phaseType == PhaseType.listeningQuiz)
                      .fold(0, (sum, p) => sum + (p.questions?.length ?? 0)),
                  xpEarned: state.xpEarned,
                  nextDayNumber: nextDay,
                ),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        // ── Loading ──────────────────────────────────────────────
        if (state is LessonLoading || state is LessonInitial) {
          return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        // ── Error ────────────────────────────────────────────────
        if (state is LessonError) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 48,
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  Text(
                    state.message,
                    style: AppTextStyles.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Quay lại'),
                  ),
                ],
              ),
            ),
          );
        }

        // ── Loaded ───────────────────────────────────────────────
        if (state is LessonLoaded) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: _buildAppBar(context, state),
            body: _buildPhase(context, state),
          );
        }

        // LessonCompleted → handled in listener
        return const Scaffold(
          backgroundColor: AppColors.background,
          body: Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
        );
      },
    );
  }

  // ── AppBar ─────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar(BuildContext context, LessonLoaded state) {
    final phase = state.currentPhase;
    final total = state.lessonDay.phases.length;
    final current = state.currentPhaseIndex + 1;
    final progress = current / total;
    final phaseName = phase.titleVi ?? phase.titleEn ?? 'Bài học';

    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close, color: AppColors.textPrimary),
        onPressed: () => _showExitDialog(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Day ${widget.dayNumber}',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            phaseName,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: AppConstants.paddingM),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingS,
                vertical: AppConstants.paddingXS,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusS),
              ),
              child: Text(
                '$current/$total',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: AppColors.border,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          minHeight: 4,
        ),
      ),
    );
  }

  // ── Phase Builder ──────────────────────────────────────────────

  Widget _buildPhase(BuildContext context, LessonLoaded state) {
    final phase = state.currentPhase;

    void onComplete() {
      context.read<LessonBloc>().add(CompletePhaseEvent(phase.id));
      context.read<LessonBloc>().add(NextPhaseEvent());
    }

    switch (phase.phaseType) {
      case PhaseType.readListen:
        return PhaseReadListenScreen(phase: phase, onComplete: onComplete);

      case PhaseType.translate:
        // ✅ Dùng signature cũ tạm thời cho đến khi fix screen này
        return PhaseTranslateScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: onComplete,
        );

      case PhaseType.mindGame:
        if (phase.mixedSegments != null && phase.mixedSegments!.isNotEmpty) {
          context.read<MindGameBloc>().add(
            LoadMindGameEvent(phase.mixedSegments!),
          );
        }
        // ✅ Dùng signature cũ tạm thời cho đến khi fix screen này
        return PhaseMindGameScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: onComplete,
        );

      case PhaseType.vocabulary:
        // ✅ Dùng signature cũ tạm thời cho đến khi fix screen này
        return PhaseVocabularyScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: onComplete,
        );

      case PhaseType.listeningQuiz:
        // ✅ PhaseQuizScreen đã được fix với signature mới
        return PhaseQuizScreen(phase: phase, onComplete: onComplete);
    }
  }

  // ── Exit Dialog ────────────────────────────────────────────────

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
        ),
        title: const Text('Thoát bài học?'),
        content: const Text(
          'Tiến độ của bạn trong bài học này sẽ không được lưu.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Tiếp tục học',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // đóng dialog
              Navigator.pop(context); // về màn trước
            },
            child: const Text(
              'Thoát',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _updateUserProgress(BuildContext context, int xpEarned) {
    final box = HiveService.progressBox;
    UserProgressModel? progress = box.get('current_user');

    if (progress == null) {
      progress = UserProgressModel(userId: 'local_user');
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastStudyDate = progress.lastStudyDate;

    // Cập nhật streak
    if (lastStudyDate != null) {
      final lastStudy = DateTime(
        lastStudyDate.year,
        lastStudyDate.month,
        lastStudyDate.day,
      );
      final diff = today.difference(lastStudy).inDays;

      if (diff == 1) {
        progress.currentStreak++;
      } else if (diff > 1) {
        progress.currentStreak = 1; // Reset nếu bỏ lỡ ngày học
      }
      // Nếu diff == 0 (đã học hôm nay), giữ nguyên streak
    } else {
      progress.currentStreak = 1;
    }

    if (progress.currentStreak > progress.longestStreak) {
      progress.longestStreak = progress.currentStreak;
    }

    // Cập nhật XP và ngày học
    progress.totalXP += xpEarned;
    progress.lastStudyDate = now;

    box.put('current_user', progress);
  }
}

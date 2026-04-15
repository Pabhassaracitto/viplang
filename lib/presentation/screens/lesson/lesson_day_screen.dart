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
import '../../../data/models/vocab_model.dart';
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
  final bool isReviewMode; // ✅ NEW
  final int? startPhaseIndex; // ✅ NEW

  const LessonDayScreen({
    super.key,
    required this.dayNumber,
    required this.themeId,
    required this.themeTitle,
    this.isReviewMode = false, // ✅ NEW
    this.startPhaseIndex, // ✅ NEW
  });

  @override
  State<LessonDayScreen> createState() => _LessonDayScreenState();
}

class _LessonDayScreenState extends State<LessonDayScreen> {
  @override
  void initState() {
    super.initState();

    // ✅ FIX: Chọn event phù hợp
    if (widget.isReviewMode) {
      context.read<LessonBloc>().add(
        LoadLessonForReviewEvent(
          widget.themeId,
          widget.dayNumber,
          startPhaseIndex: widget.startPhaseIndex,
        ),
      );
    } else {
      context.read<LessonBloc>().add(
        LoadLessonEvent(widget.themeId, widget.dayNumber),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonBloc, LessonState>(
      buildWhen: (previous, current) {
        if (previous is LessonLoaded && current is LessonLoaded) {
          return previous.currentPhaseIndex != current.currentPhaseIndex ||
              previous.isReviewMode != current.isReviewMode;
        }
        return true;
      },
      listenWhen: (previous, current) {
        return current is LessonCompleted || current is LessonError;
      },
      listener: (context, state) {
        if (state is LessonCompleted) {
          // Cập nhật tiến độ theme
          final totalDays = AllThemesRegistry.getTotalDays(widget.themeId);
          final completedDays = widget.dayNumber;
          final progress = totalDays > 0 ? completedDays / totalDays : 0.0;

          if (context.mounted) {
            context.read<ThemeBloc>().add(
              UpdateThemeProgressEvent(
                widget.themeId,
                progress,
                completedDays: completedDays,
              ),
            );

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
        if (state is LessonLoading || state is LessonInitial) {
          return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

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

        if (state is LessonLoaded) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: _buildAppBar(context, state),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showFabSheet(context, state),
              backgroundColor: AppColors.primary,
              mini: true,
              child: const Text('📚', style: TextStyle(fontSize: 20)),
            ),
            body: _buildPhase(context, state),
          );
        }

        return const Scaffold(
          backgroundColor: AppColors.background,
          body: Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
        );
      },
    );
  }

  void _showFabSheet(BuildContext context, LessonLoaded state) {
    final phase = state.currentPhase;
    final allVocabs = AllThemesRegistry.getVocabulary(widget.themeId);

    // Lấy dữ liệu FAB từ phase hiện tại
    final fabVocab = phase.fabVocab?.cast<FabVocabItem>() ?? [];
    final fabPhrases = phase.fabPhrases?.cast<FabPhraseItem>() ?? [];
    final fabAnswers = phase.fabAnswers?.cast<FabAnswerItem>() ?? [];

    // ✅ FIX: Sắp xếp lại thứ tự Tab theo yêu cầu: Từ vựng -> Từ khóa -> Cấu trúc -> Đáp án
    final List<Tab> tabs = [const Tab(text: ' Từ vựng')];
    if (fabVocab.isNotEmpty) tabs.add(const Tab(text: '🔑 Từ khóa'));
    if (fabPhrases.isNotEmpty) tabs.add(const Tab(text: '💬 Cấu trúc & Cụm'));
    if (fabAnswers.isNotEmpty) tabs.add(const Tab(text: '✅ Đáp án'));

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.92,
        builder: (_, scrollController) => Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppConstants.radiusXL),
            ),
          ),
          child: Column(
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

              // Tab Bar Content
              DefaultTabController(
                length: tabs.length,
                child: Expanded(
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.textSecondary,
                        indicatorColor: AppColors.primary,
                        tabs: tabs,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Tab 1: Toàn bộ từ vựng chủ đề
                            _buildAllVocabList(allVocabs, scrollController),

                            // Tab 2: Từ khóa chi tiết (nếu có)
                            if (fabVocab.isNotEmpty)
                              _buildFabVocabList(fabVocab, scrollController),

                            // Tab 3: Cấu trúc & Cụm từ (nếu có)
                            if (fabPhrases.isNotEmpty)
                              _buildFabPhraseList(fabPhrases, scrollController),

                            // Tab 4: Đáp án tham khảo (nếu có)
                            if (fabAnswers.isNotEmpty)
                              _buildFabAnswerList(fabAnswers, scrollController),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentPhaseVocab(
    List<VocabModel> vocabs,
    ScrollController controller,
  ) {
    // Lấy 10 từ đầu tiên làm đại diện cho bài học hiện tại
    final limited = vocabs.take(10).toList();
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.all(AppConstants.paddingS),
      itemCount: limited.length,
      itemBuilder: (_, i) => _VocabListTile(vocab: limited[i]),
    );
  }

  Widget _buildAllVocabList(
    List<VocabModel> vocabs,
    ScrollController controller,
  ) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.all(AppConstants.paddingS),
      itemCount: vocabs.length,
      itemBuilder: (_, i) => _VocabListTile(vocab: vocabs[i]),
    );
  }

  Widget _buildFabVocabList(
    List<FabVocabItem> items,
    ScrollController controller,
  ) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.all(AppConstants.paddingM),
      itemCount: items.length,
      itemBuilder: (_, i) {
        final item = items[i];
        return Container(
          margin: const EdgeInsets.only(bottom: AppConstants.paddingS),
          padding: const EdgeInsets.all(AppConstants.paddingM),
          decoration: BoxDecoration(
            color: AppColors.primarySurface,
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  item.partOfSpeech,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          item.wordEn,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          item.pronunciation,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      item.wordVi,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFabPhraseList(
    List<FabPhraseItem> items,
    ScrollController controller,
  ) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.all(AppConstants.paddingM),
      itemCount: items.length,
      itemBuilder: (_, i) {
        final item = items[i];
        return Container(
          margin: const EdgeInsets.only(bottom: AppConstants.paddingS),
          padding: const EdgeInsets.all(AppConstants.paddingM),
          decoration: BoxDecoration(
            color: AppColors.successSurface,
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            border: Border.all(color: AppColors.success.withValues(alpha: 0.2)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('💬', style: TextStyle(fontSize: 16)),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.phrase,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.success,
                      ),
                    ),
                    Text(
                      item.meaning,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFabAnswerList(
    List<FabAnswerItem> items,
    ScrollController controller,
  ) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.all(AppConstants.paddingM),
      itemCount: items.length,
      itemBuilder: (_, i) {
        final item = items[i];
        return Container(
          margin: const EdgeInsets.only(bottom: AppConstants.paddingS),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingM,
            vertical: AppConstants.paddingS,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${i + 1}',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.warning,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: item.vi,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.warning,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '  →  ',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                      TextSpan(
                        text: item.en,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
      title: GestureDetector(
        // ✅ NEW: Tap vào title để mở phase selector
        onTap: () => _showPhaseSelector(context, state),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Day ${widget.dayNumber}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (state.isReviewMode) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'ÔN TẬP',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.warning,
                        fontWeight: FontWeight.w700,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    phaseName,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.expand_more,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        // ✅ NEW: Nút quay lại phase trước
        if (!state.isFirstPhase)
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: AppColors.textSecondary,
            ),
            tooltip: 'Phần trước',
            onPressed: () {
              context.read<LessonBloc>().add(PreviousPhaseEvent());
            },
          ),
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

  // ✅ NEW: Phase Selector Bottom Sheet
  void _showPhaseSelector(BuildContext context, LessonLoaded state) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
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
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              child: Row(
                children: [
                  const Text('📚', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: AppConstants.paddingS),
                  Text(
                    'Day ${widget.dayNumber} - Chọn phần học',
                    style: AppTextStyles.h3,
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Phase list
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(AppConstants.paddingS),
                itemCount: state.lessonDay.phases.length,
                itemBuilder: (_, index) {
                  final phase = state.lessonDay.phases[index];
                  final isCurrent = index == state.currentPhaseIndex;
                  final isCompleted = phase.isCompleted;

                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? AppColors.primary
                            : isCompleted
                            ? AppColors.success.withValues(alpha: 0.1)
                            : AppColors.background,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isCurrent
                              ? AppColors.primary
                              : isCompleted
                              ? AppColors.success
                              : AppColors.border,
                        ),
                      ),
                      child: Center(
                        child: isCurrent
                            ? const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 18,
                              )
                            : isCompleted
                            ? const Icon(
                                Icons.check,
                                color: AppColors.success,
                                size: 18,
                              )
                            : Text(
                                '${index + 1}',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                      ),
                    ),
                    title: Text(
                      phase.titleVi ?? phase.titleEn ?? 'Phase ${index + 1}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: isCurrent
                            ? FontWeight.w700
                            : FontWeight.normal,
                        color: isCurrent
                            ? AppColors.primary
                            : AppColors.textPrimary,
                      ),
                    ),
                    subtitle: Text(
                      _getPhaseTypeLabel(phase.phaseType),
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    trailing: isCurrent
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Hiện tại',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : null,
                    onTap: () {
                      Navigator.pop(ctx);
                      context.read<LessonBloc>().add(GoToPhaseEvent(index));
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

  String _getPhaseTypeLabel(PhaseType type) {
    switch (type) {
      case PhaseType.readListen:
        return '📖 Đọc & Nghe';
      case PhaseType.translate:
        return '🔄 Nghe & Dịch';
      case PhaseType.mindGame:
        return '🎮 Trò chơi Tư duy';
      case PhaseType.vocabulary:
        return '📚 Từ vựng';
      case PhaseType.listeningQuiz:
        return '🎯 Luyện nghe';
    }
  }

  // ── Phase Builder ──────────────────────────────────────────────
  Widget _buildPhase(BuildContext context, LessonLoaded state) {
    final phase = state.currentPhase;

    void onComplete() {
      context.read<LessonBloc>().add(CompletePhaseEvent(phase.id));

      // ✅ FIX: NextPhaseEvent tự động xử lý hoàn thành bài nếu là phase cuối
      context.read<LessonBloc>().add(NextPhaseEvent());
    }

    switch (phase.phaseType) {
      case PhaseType.readListen:
        return PhaseReadListenScreen(phase: phase, onComplete: onComplete);

      case PhaseType.translate:
        return PhaseTranslateScreen(phase: phase, onComplete: onComplete);

      case PhaseType.mindGame:
        if (phase.mixedSegments != null && phase.mixedSegments!.isNotEmpty) {
          context.read<MindGameBloc>().add(
            LoadMindGameEvent(phase.mixedSegments!),
          );
        }
        return PhaseMindGameScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: onComplete,
        );

      case PhaseType.vocabulary:
        return PhaseVocabularyScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: onComplete,
        );

      case PhaseType.listeningQuiz:
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
        content: Text(
          widget.isReviewMode
              ? 'Bạn có chắc muốn thoát chế độ ôn tập?'
              : 'Tiến độ của bạn trong bài học này sẽ không được lưu.',
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
              Navigator.pop(context);
              Navigator.pop(context);
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
        progress.currentStreak = 1;
      }
    } else {
      progress.currentStreak = 1;
    }

    if (progress.currentStreak > progress.longestStreak) {
      progress.longestStreak = progress.currentStreak;
    }

    progress.totalXP += xpEarned;
    progress.lastStudyDate = now;

    box.put('current_user', progress);
  }
}

class _VocabListTile extends StatelessWidget {
  final VocabModel vocab;
  const _VocabListTile({required this.vocab});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingM,
        vertical: AppConstants.paddingS,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // POS badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              vocab.partOfSpeech,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(width: AppConstants.paddingS),

          // Word + pronunciation + meaning
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      vocab.wordEn,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      vocab.pronunciation,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Text(
                  vocab.wordVi,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // ✅ Nút loa - hiển thị phiên âm qua SnackBar
          // (TODO: tích hợp TTS hoặc audio file sau)
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${vocab.wordEn}  ${vocab.pronunciation}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                  margin: const EdgeInsets.all(AppConstants.paddingM),
                ),
              );
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusS),
              ),
              child: const Icon(
                Icons.volume_up,
                size: 16,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

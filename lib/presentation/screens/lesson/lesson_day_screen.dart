// lib/presentation/screens/lesson/lesson_day_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
import '../../widgets/vocabulary_speaker_button.dart';

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

  List<VocabModel> _getAllVocabsFromAllThemes() {
    final result = <VocabModel>[];
    try {
      final themes = AllThemesRegistry.getAllThemes();
      for (final theme in themes) {
        result.addAll(AllThemesRegistry.getVocabulary(theme.id));
      }
    } catch (e) {
      debugPrint('Error loading vocabs: $e');
    }
    return result;
  }

  void _showFabSheet(BuildContext context, LessonLoaded state) {
    final phase = state.currentPhase;
    // ✅ FIX: Lấy vocab tất cả themes
    final allVocabs = _getAllVocabsFromAllThemes();

    final fabVocab = phase.fabVocab?.cast<FabVocabItem>() ?? [];
    final fabPhrases = phase.fabPhrases?.cast<FabPhraseItem>() ?? [];
    final fabAnswers = phase.fabAnswers?.cast<FabAnswerItem>() ?? [];

    // Kiểm tra phase hiện tại có data riêng không
    final hasPhaseData =
        fabVocab.isNotEmpty || fabPhrases.isNotEmpty || fabAnswers.isNotEmpty;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.95,
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
                margin: const EdgeInsets.only(top: 12, bottom: 4),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // ── 2-section tab: BÀI NÀY vs TỦ SÁCH ──────────────
              DefaultTabController(
                length: 2,
                child: Expanded(
                  child: Column(
                    children: [
                      // Section switcher
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppConstants.paddingM,
                          vertical: AppConstants.paddingS,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusM,
                          ),
                        ),
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          indicator: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(
                              AppConstants.radiusM,
                            ),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.white,
                          unselectedLabelColor: AppColors.textSecondary,
                          labelStyle: AppTextStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          tabs: const [
                            Tab(text: '🎯 Bài này'),
                            Tab(text: '📖 Tủ sách'),
                          ],
                        ),
                      ),

                      Expanded(
                        child: TabBarView(
                          children: [
                            // ── TAB 1: BÀI NÀY ──────────────────
                            _buildCurrentPhaseContent(
                              context,
                              phase,
                              fabVocab,
                              fabPhrases,
                              fabAnswers,
                              hasPhaseData,
                              scrollController,
                            ),

                            // ── TAB 2: TỦ SÁCH ──────────────────
                            _buildGlobalVocabLibrary(
                              allVocabs,
                              scrollController,
                            ),
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

  // ── TAB 1: Bài này - có sub-tabs ─────────────────────────────────
  Widget _buildCurrentPhaseContent(
    BuildContext context,
    LessonPhase phase,
    List<FabVocabItem> fabVocab,
    List<FabPhraseItem> fabPhrases,
    List<FabAnswerItem> fabAnswers,
    bool hasPhaseData,
    ScrollController scrollController,
  ) {
    // Không có data riêng → hiển thị thông báo
    if (!hasPhaseData) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('📭', style: TextStyle(fontSize: 40)),
            const SizedBox(height: AppConstants.paddingM),
            Text(
              'Phần này không có từ khóa riêng.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingS),
            Text(
              'Xem "Tủ sách" để tra cứu từ vựng chủ đề.',
              style: AppTextStyles.caption.copyWith(color: AppColors.textHint),
            ),
          ],
        ),
      );
    }

    // Xây dựng sub-tabs chỉ cho những tab có data
    final subTabs = <Tab>[];
    final subViews = <Widget>[];

    if (fabVocab.isNotEmpty) {
      subTabs.add(const Tab(text: '🔑 Từ khóa'));
      subViews.add(_buildFabVocabList(fabVocab, scrollController));
    }
    if (fabPhrases.isNotEmpty) {
      subTabs.add(const Tab(text: '💬 Cấu trúc'));
      subViews.add(_buildFabPhraseList(fabPhrases, scrollController));
    }
    if (fabAnswers.isNotEmpty) {
      subTabs.add(const Tab(text: '✅ Đáp án'));
      subViews.add(_buildFabAnswerList(fabAnswers, scrollController));
    }

    // Tiêu đề phase
    final phaseTitle = phase.titleVi ?? phase.titleEn ?? '';

    return Column(
      children: [
        // Phase label
        if (phaseTitle.isNotEmpty)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
              vertical: AppConstants.paddingXS,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
              vertical: AppConstants.paddingS,
            ),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
              border: Border.all(
                color: AppColors.warning.withValues(alpha: 0.25),
              ),
            ),
            child: Row(
              children: [
                const Text('📌', style: TextStyle(fontSize: 14)),
                const SizedBox(width: AppConstants.paddingS),
                Expanded(
                  child: Text(
                    phaseTitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.warning,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

        // Sub-tabs
        DefaultTabController(
          length: subTabs.length,
          child: Expanded(
            child: Column(
              children: [
                TabBar(
                  isScrollable: subTabs.length > 2,
                  tabAlignment: subTabs.length > 2
                      ? TabAlignment.start
                      : TabAlignment.fill,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.textSecondary,
                  indicatorColor: AppColors.primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: subTabs,
                ),
                Expanded(child: TabBarView(children: subViews)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ── TAB 2: Tủ sách - Toàn bộ từ vựng với search ─────────────────
  Widget _buildGlobalVocabLibrary(
    List<VocabModel> vocabs,
    ScrollController scrollController,
  ) {
    return _VocabLibraryWidget(
      vocabs: vocabs,
      scrollController: scrollController,
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
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 6,
                      children: [
                        Text(
                          item.wordEn,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
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
              // ✅ THÊM NÚT LỀA THẬT
              VocabularySpeakerButton(
                text: item.wordEn,
                size: 18,
                color: AppColors.primary,
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
        return PhaseReadListenScreen(
          phase: phase,
          themeId: widget.themeId,
          onComplete: onComplete,
        );

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
        return PhaseQuizScreen(
          phase: phase,
          themeId: widget.themeId,
          onComplete: onComplete,
        );
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

    progress ??= UserProgressModel(userId: 'local_user');

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

    // 1. Cập nhật bài học đã hoàn thành
    final lessonKey = '${widget.themeId}_day_${widget.dayNumber}';
    if (!progress.completedLessons.contains(lessonKey)) {
      progress.completedLessons.add(lessonKey);
      // Tăng số từ học ước tính (mỗi bài có 15 từ vựng mới)
      progress.totalWordsLearned += 15;
      // Cộng thêm 15 phút rèn luyện cho bài học mới
      progress.totalStudyMinutes += 15;
    } else {
      // Nếu học lại, chỉ cộng thêm 5 phút rèn luyện
      progress.totalStudyMinutes += 5;
    }

    // 2. Cập nhật tiến độ của Theme hiện tại
    final totalDays = AllThemesRegistry.getTotalDays(widget.themeId);
    final completedDays = widget.dayNumber;
    final progressPercent = totalDays > 0 ? completedDays / totalDays : 0.0;
    progress.themeProgress[widget.themeId] = progressPercent;

    // 3. Tăng XP tích lũy
    progress.totalXP += xpEarned;
    progress.lastStudyDate = now;

    // 4. Đồng bộ hóa số lượng từ thực tế từ SRS (nếu có thể)
    try {
      final learnedCount = HiveService.vocabBox.values
          .where((v) => v.nextReview != null || v.repetitionCount > 0)
          .length;
      if (learnedCount > 0) {
        progress.totalWordsLearned = learnedCount;
      }
    } catch (_) {}

    // 5. Kiểm tra huy hiệu
    if (!progress.earnedBadges.contains('starter') &&
        progress.completedLessons.isNotEmpty) {
      progress.earnedBadges.add('starter');
    }
    if (!progress.earnedBadges.contains('streak_7') &&
        progress.longestStreak >= 7) {
      progress.earnedBadges.add('streak_7');
    }
    if (!progress.earnedBadges.contains('theme_1_master') &&
        (progress.themeProgress['theme_01_offices'] ?? 0.0) >= 1.0) {
      progress.earnedBadges.add('theme_1_master');
    }

    box.put('current_user', progress);
  }
}

/// Tủ sách với search + filter loại từ
class _VocabLibraryWidget extends StatefulWidget {
  final List<VocabModel> vocabs;
  final ScrollController scrollController;

  const _VocabLibraryWidget({
    required this.vocabs,
    required this.scrollController,
  });

  @override
  State<_VocabLibraryWidget> createState() => _VocabLibraryWidgetState();
}

class _VocabLibraryWidgetState extends State<_VocabLibraryWidget> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  String _selectedPos = 'all'; // filter loại từ
  bool _showOnlyMine = true; // ✅ Mặc định hiện từ vựng của tôi

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<VocabModel> get _filtered {
    return widget.vocabs.where((v) {
      // Lấy từ trong Hive để có thông tin srs mới nhất
      final liveV = HiveService.vocabBox.get(v.id) ?? v;

      final matchQuery =
          _query.isEmpty ||
          v.wordEn.toLowerCase().contains(_query.toLowerCase()) ||
          v.wordVi.toLowerCase().contains(_query.toLowerCase());
      final matchPos = _selectedPos == 'all' || v.partOfSpeech == _selectedPos;

      if (!matchQuery || !matchPos) {
        return false;
      }

      if (_showOnlyMine) {
        final progressBox = HiveService.progressBox;
        final progress =
            progressBox.get('current_user') ??
            UserProgressModel(userId: 'local_user');
        final completedThemeIds = progress.completedLessons
            .map((key) => key.split('_day_')[0])
            .toSet();

        final hasSrsHistory =
            liveV.nextReview != null || liveV.repetitionCount > 0;
        final isThemeCompleted = completedThemeIds.contains(liveV.themeId);

        return hasSrsHistory || isThemeCompleted;
      }

      return true;
    }).toList();
  }

  // Lấy danh sách loại từ unique
  List<String> get _posList {
    final pos = widget.vocabs.map((v) => v.partOfSpeech).toSet().toList()
      ..sort();
    return ['all', ...pos];
  }

  Color _posColor(String pos) {
    switch (pos) {
      case 'n':
      case 'np':
        return AppColors.primary;
      case 'v':
      case 'vp':
        return AppColors.success;
      case 'adj':
        return AppColors.warning;
      case 'adv':
        return AppColors.secondary;
      default:
        return AppColors.textSecondary;
    }
  }

  String _posLabel(String pos) {
    switch (pos) {
      case 'all':
        return 'Tất cả';
      case 'n':
        return 'Danh từ';
      case 'np':
        return 'Cụm DT';
      case 'v':
        return 'Động từ';
      case 'vp':
        return 'Cụm ĐT';
      case 'adj':
        return 'Tính từ';
      case 'adv':
        return 'Trạng từ';
      default:
        return pos;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return Column(
      children: [
        // ── Mode selector ───────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppConstants.paddingM,
            AppConstants.paddingS,
            AppConstants.paddingM,
            0,
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _showOnlyMine = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: _showOnlyMine
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: _showOnlyMine
                            ? BorderRadius.circular(AppConstants.radiusS)
                            : null,
                        boxShadow: _showOnlyMine
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.2,
                                  ),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Text(
                        '📚 Của tôi',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: _showOnlyMine
                              ? Colors.white
                              : AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _showOnlyMine = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: !_showOnlyMine
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: !_showOnlyMine
                            ? BorderRadius.circular(AppConstants.radiusS)
                            : null,
                        boxShadow: !_showOnlyMine
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.2,
                                  ),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Text(
                        '✨ Tất cả tủ sách',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: !_showOnlyMine
                              ? Colors.white
                              : AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ── Search bar ────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppConstants.paddingM,
            AppConstants.paddingS,
            AppConstants.paddingM,
            AppConstants.paddingXS,
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(
              hintText: 'Tìm từ bằng tiếng Anh hoặc tiếng Việt...',
              hintStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textHint,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.textHint,
                size: 20,
              ),
              suffixIcon: _query.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _query = '');
                      },
                    )
                  : null,
              filled: true,
              fillColor: AppColors.background,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingM,
                vertical: AppConstants.paddingS,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // ── POS Filter chips ──────────────────────────────────
        SizedBox(
          height: 36,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
            ),
            itemCount: _posList.length,
            itemBuilder: (_, i) {
              final pos = _posList[i];
              final isSelected = _selectedPos == pos;
              final color = pos == 'all'
                  ? AppColors.textPrimary
                  : _posColor(pos);
              return Padding(
                padding: const EdgeInsets.only(right: AppConstants.paddingS),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedPos = pos),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingS,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? color.withValues(alpha: 0.15)
                          : AppColors.background,
                      borderRadius: BorderRadius.circular(AppConstants.radiusS),
                      border: Border.all(
                        color: isSelected ? color : AppColors.border,
                        width: isSelected ? 1.5 : 1,
                      ),
                    ),
                    child: Text(
                      _posLabel(pos),
                      style: AppTextStyles.caption.copyWith(
                        color: isSelected ? color : AppColors.textSecondary,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: AppConstants.paddingXS),

        // ── Result count ─────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingM,
            vertical: AppConstants.paddingXS,
          ),
          child: Row(
            children: [
              Text(
                '${filtered.length} từ',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),

        // ── Vocab list ───────────────────────────────────────
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('🔍', style: TextStyle(fontSize: 32)),
                      const SizedBox(height: AppConstants.paddingS),
                      Text(
                        'Không tìm thấy từ nào.',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  controller: widget.scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingM,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (_, i) => _VocabLibraryTile(
                    vocab: filtered[i],
                    posColor: _posColor(filtered[i].partOfSpeech),
                  ),
                ),
        ),
      ],
    );
  }
}

// ── Tile nâng cao cho Tủ sách ────────────────────────────────────
class _VocabLibraryTile extends StatelessWidget {
  final VocabModel vocab;
  final Color posColor;

  const _VocabLibraryTile({required this.vocab, required this.posColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // POS badge có màu
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: posColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  vocab.partOfSpeech,
                  style: AppTextStyles.caption.copyWith(
                    color: posColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),

              // Word EN + pronunciation
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: vocab.wordEn,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      TextSpan(
                        text: '  ${vocab.pronunciation}',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ✅ NÚT LỌA THẬT
              VocabularySpeakerButton(
                text: vocab.wordEn,
                size: 16,
                color: AppColors.primary,
              ),

              const SizedBox(width: 4),

              // ✅ NÚT GHIM ÔN TẬP THỦ CÔNG (PRIORITY/SRS PIN)
              ValueListenableBuilder(
                valueListenable: HiveService.vocabBox.listenable(
                  keys: [vocab.id],
                ),
                builder: (context, Box<VocabModel> box, _) {
                  final liveVocab = box.get(vocab.id) ?? vocab;
                  final isPinned = liveVocab.nextReview != null;

                  return InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () async {
                      if (isPinned) {
                        liveVocab.nextReview = null;
                        liveVocab.repetitionCount = 0;
                        await liveVocab.save();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Đã bỏ "${liveVocab.wordEn}" khỏi danh sách ôn tập',
                              ),
                              backgroundColor: AppColors.textPrimary,
                              duration: const Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      } else {
                        liveVocab.nextReview = DateTime.now();
                        liveVocab.repetitionCount = 0;
                        await liveVocab.save();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '⚡ Đã ghim "${liveVocab.wordEn}" vào hàng chờ ôn tập!',
                              ),
                              backgroundColor: AppColors.primary,
                              duration: const Duration(milliseconds: 1500),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                        color: isPinned
                            ? AppColors.warning
                            : AppColors.textHint,
                        size: 18,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 4),

          // Word VI
          Text(
            vocab.wordVi,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),

          // Example (nếu có) - thu gọn
          if (vocab.exampleEn != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                vocab.exampleEn!,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textHint,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}

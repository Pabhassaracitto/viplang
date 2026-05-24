import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/content/all_themes_registry.dart';
import '../../../data/models/lesson_model.dart';
import '../../../data/models/theme_model.dart';
import '../../../data/models/vocab_model.dart';
import '../../widgets/vocabulary_speaker_button.dart';
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
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (_) => _ThemeVocabSheet(
                    vocabs: vocabs,
                    themeTitle: theme.titleEn,
                  ),
                );
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

// ─── Theme Vocab Bottom Sheet ───────────────────────────────────────────────
class _ThemeVocabSheet extends StatefulWidget {
  final List<VocabModel> vocabs;
  final String themeTitle;

  const _ThemeVocabSheet({required this.vocabs, required this.themeTitle});

  @override
  State<_ThemeVocabSheet> createState() => _ThemeVocabSheetState();
}

class _ThemeVocabSheetState extends State<_ThemeVocabSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  String _selectedPos = 'all';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<VocabModel> get _filteredVocabs {
    return widget.vocabs.where((vocab) {
      final matchQuery =
          _query.isEmpty ||
          vocab.wordEn.toLowerCase().contains(_query.toLowerCase()) ||
          vocab.wordVi.toLowerCase().contains(_query.toLowerCase());
      final matchPos =
          _selectedPos == 'all' || vocab.partOfSpeech == _selectedPos;
      return matchQuery && matchPos;
    }).toList();
  }

  List<String> get _posList {
    final posSet = widget.vocabs.map((v) => v.partOfSpeech).toSet().toList()
      ..sort();
    return ['all', ...posSet];
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
        return pos.toUpperCase();
    }
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

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredVocabs;

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
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
            // Pull handle
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 4),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingM,
                vertical: AppConstants.paddingS,
              ),
              child: Row(
                children: [
                  const Text('📖', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: AppConstants.paddingS),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tủ từ vựng chủ đề',
                          style: AppTextStyles.h3.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.themeTitle,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Search bar
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              child: TextField(
                controller: _searchController,
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  hintText: 'Tìm từ tiếng Anh hoặc tiếng Việt...',
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

            // Filter tags (horizontal list)
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingM,
                ),
                itemCount: _posList.length,
                itemBuilder: (_, i) {
                  final pos = _posList[i];
                  final isSelected = _selectedPos == pos;
                  final chipColor = _posColor(pos);

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedPos = pos),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? chipColor
                              : chipColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusM,
                          ),
                          border: Border.all(
                            color: isSelected
                                ? chipColor
                                : chipColor.withValues(alpha: 0.25),
                          ),
                        ),
                        child: Text(
                          _posLabel(pos),
                          style: AppTextStyles.caption.copyWith(
                            color: isSelected ? Colors.white : chipColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: AppConstants.paddingM),

            // Vocabulary List
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('🔍', style: TextStyle(fontSize: 40)),
                          const SizedBox(height: AppConstants.paddingM),
                          Text(
                            'Không tìm thấy từ vựng phù hợp.',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingM,
                      ),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) {
                        final vocab = filtered[i];
                        final posColor = _posColor(vocab.partOfSpeech);

                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: AppConstants.paddingS,
                          ),
                          padding: const EdgeInsets.all(AppConstants.paddingM),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(
                              AppConstants.radiusL,
                            ),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // Part of speech
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: posColor.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      vocab.partOfSpeech.toUpperCase(),
                                      style: AppTextStyles.caption.copyWith(
                                        color: posColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppConstants.paddingS),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          vocab.wordEn,
                                          style: AppTextStyles.bodyMedium
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.textPrimary,
                                              ),
                                        ),
                                        Text(
                                          vocab.pronunciation,
                                          style: AppTextStyles.caption.copyWith(
                                            color: AppColors.textSecondary,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  VocabularySpeakerButton(
                                    text: vocab.wordEn,
                                    size: 18,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                vocab.wordVi,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (vocab.exampleEn != null &&
                                  vocab.exampleEn!.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(
                                    AppConstants.paddingS,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(
                                      AppConstants.radiusS,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vocab.exampleEn!,
                                        style: AppTextStyles.caption.copyWith(
                                          color: AppColors.textPrimary,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      if (vocab.exampleVi != null &&
                                          vocab.exampleVi!.isNotEmpty) ...[
                                        const SizedBox(height: 2),
                                        Text(
                                          vocab.exampleVi!,
                                          style: AppTextStyles.caption.copyWith(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

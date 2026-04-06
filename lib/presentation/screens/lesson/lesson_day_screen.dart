import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import 'phases/phase_read_listen_screen.dart';
import 'phases/phase_translate_screen.dart';
import 'phases/phase_mind_game_screen.dart';
import 'phases/phase_quiz_screen.dart';
import 'phases/phase_vocabulary_screen.dart';
import 'lesson_complete_screen.dart';

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
  int _currentPhaseIndex = 0;
  final int _correctAnswers = 0;
  final int _totalQuestions = 9;

  final List<String> _phaseNames = [
    'Đọc & Nghe',
    'Dịch & Hiểu',
    'Trò chơi tư duy',
    'Luyện nghe',
    'Từ vựng',
  ];

  void _nextPhase() {
    if (_currentPhaseIndex < _phaseNames.length - 1) {
      setState(() => _currentPhaseIndex++);
    } else {
      _completeLesson();
    }
  }

  void _completeLesson() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LessonCompleteScreen(
          dayNumber: widget.dayNumber,
          themeTitle: widget.themeTitle,
          totalWords: 15,
          correctAnswers: _correctAnswers,
          totalQuestions: _totalQuestions,
          xpEarned: 50 + (_correctAnswers * 5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: _buildCurrentPhase(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final progress = (_currentPhaseIndex + 1) / _phaseNames.length;

    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close, color: AppColors.textPrimary),
        onPressed: () => _showExitDialog(),
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
            _phaseNames[_currentPhaseIndex],
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
                '${_currentPhaseIndex + 1}/${_phaseNames.length}',
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

  Widget _buildCurrentPhase() {
    switch (_currentPhaseIndex) {
      case 0:
        return PhaseReadListenScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: _nextPhase,
        );
      case 1:
        return PhaseTranslateScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: _nextPhase,
        );
      case 2:
        return PhaseMindGameScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: _nextPhase,
        );
      case 3:
        return PhaseQuizScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: _nextPhase,
        );
      case 4:
        return PhaseVocabularyScreen(
          dayNumber: widget.dayNumber,
          themeId: widget.themeId,
          onComplete: _nextPhase,
        );
      default:
        return const Center(child: Text('Unknown phase'));
    }
  }

  void _showExitDialog() {
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
}

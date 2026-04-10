// lib/presentation/screens/lesson/phases/phase_quiz_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../data/models/lesson_model.dart';
import '../../../widgets/audio_player_widget.dart';

class PhaseQuizScreen extends StatefulWidget {
  final LessonPhase phase;
  final VoidCallback onComplete;

  const PhaseQuizScreen({
    super.key,
    required this.phase,
    required this.onComplete,
  });

  @override
  State<PhaseQuizScreen> createState() => _PhaseQuizScreenState();
}

class _PhaseQuizScreenState extends State<PhaseQuizScreen>
    with SingleTickerProviderStateMixin {
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  bool _hasAnswered = false;
  int _correctCount = 0;

  // ✅ FIX 1: Track audio đã phát cho mỗi practice
  String? _currentPracticeNumber;
  bool _audioPlayedForCurrentPractice = false;

  late AnimationController _resultController;
  late Animation<double> _resultAnimation;

  List<QuizQuestion> get _questions => widget.phase.questions ?? [];
  QuizQuestion get _currentQuestion => _questions[_currentQuestionIndex];
  bool get _isLastQuestion => _currentQuestionIndex >= _questions.length - 1;

  // ✅ FIX 2: Lấy audio từ question thay vì phase
  String get _currentAudioPath {
    final trackKey = _currentQuestion.audioTrackKey;
    return _resolveAudioPath(trackKey);
  }

  String _resolveAudioPath(String? trackKey) {
    const map = {
      // Theme 1
      'track_03': 'assets/audio/theme1_track03.mp3',
      'track_04': 'assets/audio/theme1_track04.mp3',
      'track_05': 'assets/audio/theme1_track05.mp3',
      'track_06': 'assets/audio/theme1_track06.mp3',
      // Theme 2
      'track_07': 'assets/audio/theme2_track07.mp3',
      'track_08': 'assets/audio/theme2_track08.mp3',
      'track_09': 'assets/audio/theme2_track09.mp3',
      'track_10': 'assets/audio/theme2_track10.mp3',
    };
    return map[trackKey] ?? '';
  }

  @override
  void initState() {
    super.initState();
    _resultController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _resultAnimation = CurvedAnimation(
      parent: _resultController,
      curve: Curves.elasticOut,
    );

    // ✅ FIX 3: Initialize practice tracking
    if (_questions.isNotEmpty) {
      _currentPracticeNumber = _currentQuestion.practiceNumber;
    }
  }

  @override
  void dispose() {
    _resultController.dispose();
    super.dispose();
  }

  void _selectAnswer(int index) {
    // ✅ FIX 4: Double-check hasAnswered để tránh chọn lại
    if (_hasAnswered || _selectedAnswerIndex != null) return;

    setState(() {
      _selectedAnswerIndex = index;
      _hasAnswered = true;
      if (index == _currentQuestion.correctIndex) _correctCount++;
    });
    _resultController.forward(from: 0);
  }

  void _nextQuestion() {
    if (_isLastQuestion) {
      widget.onComplete();
      return;
    }

    final nextQuestion = _questions[_currentQuestionIndex + 1];
    final isNewPractice = nextQuestion.practiceNumber != _currentPracticeNumber;

    setState(() {
      _currentQuestionIndex++;
      // ✅ FIX 5: Reset state hoàn toàn khi chuyển câu
      _selectedAnswerIndex = null;
      _hasAnswered = false;

      // ✅ FIX 6: Reset audio khi chuyển practice mới
      if (isNewPractice) {
        _currentPracticeNumber = nextQuestion.practiceNumber;
        _audioPlayedForCurrentPractice = false;
      }
    });
    _resultController.reset();
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.quiz_outlined,
              size: 48,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppConstants.paddingM),
            Text('Không có câu hỏi', style: AppTextStyles.bodyMedium),
            const SizedBox(height: AppConstants.paddingM),
            ElevatedButton(
              onPressed: widget.onComplete,
              child: const Text('Tiếp tục'),
            ),
          ],
        ),
      );
    }

    final progress = (_currentQuestionIndex + 1) / _questions.length;

    return Column(
      children: [
        _buildHeader(progress),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ FIX 7: Audio section với key để rebuild khi đổi practice
                _buildAudioSection(),
                const SizedBox(height: AppConstants.paddingM),
                _buildPracticeLabel(),
                const SizedBox(height: AppConstants.paddingM),
                _buildQuestionCard(),
                const SizedBox(height: AppConstants.paddingL),
                ..._buildAnswerOptions(),
                if (_hasAnswered) ...[
                  const SizedBox(height: AppConstants.paddingM),
                  _buildExplanation(),
                ],
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
        if (_hasAnswered) _buildNextButton(),
      ],
    );
  }

  // ─── Audio Section ────────────────────────────────────────────
  Widget _buildAudioSection() {
    final audioPath = _currentAudioPath;
    final practiceLabel = _currentQuestion.practiceNumber.replaceAll(
      'practice',
      'Practice ',
    );

    return Container(
      // ✅ FIX 8: Key để rebuild AudioPlayer khi đổi practice
      key: ValueKey('audio_${_currentQuestion.practiceNumber}'),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppConstants.paddingM,
              AppConstants.paddingM,
              AppConstants.paddingM,
              AppConstants.paddingS,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.headphones,
                  color: AppColors.primary,
                  size: 18,
                ),
                const SizedBox(width: AppConstants.paddingS),
                Expanded(
                  child: Text(
                    '🎧 $practiceLabel',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                // ✅ FIX 9: Hiển thị track đang phát
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(AppConstants.radiusXS),
                  ),
                  child: Text(
                    _currentQuestion.audioTrackKey?.toUpperCase() ?? 'N/A',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.warning,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (audioPath.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppConstants.paddingS,
                0,
                AppConstants.paddingS,
                AppConstants.paddingS,
              ),
              child: AudioPlayerWidget(
                // ✅ FIX 10: Key để rebuild khi đổi audio
                key: ValueKey(audioPath),
                audioUrl: audioPath,
                title:
                    _currentQuestion.audioTrackKey
                        ?.replaceAll('_', ' ')
                        .toUpperCase() ??
                    'Audio',
                onPlayComplete: () {
                  setState(() => _audioPlayedForCurrentPractice = true);
                },
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              child: Row(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.warning,
                    size: 16,
                  ),
                  const SizedBox(width: AppConstants.paddingS),
                  Expanded(
                    child: Text(
                      'File audio "${_currentQuestion.audioTrackKey}" chưa sẵn sàng',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.warning,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() => _audioPlayedForCurrentPractice = true);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(60, 28),
                    ),
                    child: const Text('Bỏ qua'),
                  ),
                ],
              ),
            ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  // ─── Header ───────────────────────────────────────────────────
  Widget _buildHeader(double progress) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.paddingM,
        AppConstants.paddingS,
        AppConstants.paddingM,
        AppConstants.paddingS,
      ),
      color: AppColors.surface,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingS,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppConstants.radiusS),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('🎯', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text(
                      'Luyện nghe',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.warning,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$_correctCount',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingM),
                  Text(
                    '${_currentQuestionIndex + 1}/${_questions.length}',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingS),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.radiusS),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.border,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.warning,
              ),
              minHeight: 5,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Practice Label ───────────────────────────────────────────
  Widget _buildPracticeLabel() {
    final q = _currentQuestion;
    final practiceLabel = q.practiceNumber.replaceAll('practice', 'Practice ');

    // ✅ FIX 11: Hiển thị câu hỏi số mấy trong practice
    final questionsInPractice = _questions
        .where((q) => q.practiceNumber == _currentQuestion.practiceNumber)
        .toList();
    final questionIndexInPractice =
        questionsInPractice.indexOf(_currentQuestion) + 1;

    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          const Text('📝', style: TextStyle(fontSize: 20)),
          const SizedBox(width: AppConstants.paddingS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  practiceLabel,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  'Câu $questionIndexInPractice/${questionsInPractice.length}',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  // ─── Question Card ────────────────────────────────────────────
  Widget _buildQuestionCard() {
    return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppConstants.paddingL),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppConstants.radiusL),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppConstants.radiusXS),
                ),
                child: Text(
                  'Question ${_currentQuestionIndex + 1}',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.warning,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.paddingM),
              Text(
                _currentQuestion.questionText,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        )
        .animate(key: ValueKey(_currentQuestionIndex))
        .fadeIn()
        .slideX(begin: 0.05);
  }

  // ─── Answer Options ───────────────────────────────────────────
  List<Widget> _buildAnswerOptions() {
    return List.generate(_currentQuestion.options.length, (index) {
      final isSelected = _selectedAnswerIndex == index;
      final isCorrect = index == _currentQuestion.correctIndex;
      final label = String.fromCharCode(65 + index); // A B C D

      Color bgColor = AppColors.surface;
      Color borderColor = AppColors.border;
      Color textColor = AppColors.textPrimary;
      IconData? trailingIcon;

      if (_hasAnswered) {
        if (isCorrect) {
          bgColor = AppColors.success.withValues(alpha: 0.1);
          borderColor = AppColors.success;
          textColor = AppColors.success;
          trailingIcon = Icons.check_circle;
        } else if (isSelected && !isCorrect) {
          bgColor = AppColors.error.withValues(alpha: 0.1);
          borderColor = AppColors.error;
          textColor = AppColors.error;
          trailingIcon = Icons.cancel;
        } else {
          bgColor = AppColors.background;
          textColor = AppColors.textHint;
        }
      } else if (isSelected) {
        bgColor = AppColors.primary.withValues(alpha: 0.1);
        borderColor = AppColors.primary;
        textColor = AppColors.primary;
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: AppConstants.paddingS),
        child: GestureDetector(
          onTap: () => _selectAnswer(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(AppConstants.paddingM),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _hasAnswered && isCorrect
                        ? AppColors.success
                        : _hasAnswered && isSelected && !isCorrect
                        ? AppColors.error
                        : AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color:
                            _hasAnswered &&
                                (isCorrect || (isSelected && !isCorrect))
                            ? Colors.white
                            : AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: Text(
                    _currentQuestion.options[index],
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: textColor,
                      fontWeight: isSelected || (_hasAnswered && isCorrect)
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
                if (trailingIcon != null)
                  ScaleTransition(
                    scale: _resultAnimation,
                    child: Icon(
                      trailingIcon,
                      color: isCorrect ? AppColors.success : AppColors.error,
                      size: 22,
                    ),
                  ),
              ],
            ),
          ),
        ).animate(delay: (index * 80).ms).fadeIn().slideX(begin: 0.05),
      );
    });
  }

  // ─── Explanation ──────────────────────────────────────────────
  Widget _buildExplanation() {
    final isCorrect = _selectedAnswerIndex == _currentQuestion.correctIndex;
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: isCorrect
            ? AppColors.success.withValues(alpha: 0.08)
            : AppColors.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(
          color: isCorrect
              ? AppColors.success.withValues(alpha: 0.3)
              : AppColors.error.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isCorrect ? '🎉 Chính xác!' : '❌ Chưa đúng',
            style: AppTextStyles.bodyMedium.copyWith(
              color: isCorrect ? AppColors.success : AppColors.error,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (!isCorrect) ...[
            const SizedBox(height: AppConstants.paddingS),
            Text(
              '✅ Đáp án đúng: '
              '${String.fromCharCode(65 + _currentQuestion.correctIndex)}. '
              '${_currentQuestion.options[_currentQuestion.correctIndex]}',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1);
  }

  // ─── Next Button ──────────────────────────────────────────────
  Widget _buildNextButton() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _nextQuestion,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              elevation: 0,
            ),
            child: Text(
              _isLastQuestion ? '✅ Hoàn thành' : '➡️ Câu tiếp theo',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.3);
  }
}

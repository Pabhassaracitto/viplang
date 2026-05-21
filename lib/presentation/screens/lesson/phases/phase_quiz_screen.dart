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
  final String themeId;
  final VoidCallback onComplete;

  const PhaseQuizScreen({
    super.key,
    required this.phase,
    required this.themeId,
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

  late AnimationController _resultController;
  late Animation<double> _resultAnimation;

  List<QuizQuestion> get _questions => widget.phase.questions ?? [];
  QuizQuestion get _currentQuestion => _questions[_currentQuestionIndex];
  bool get _isLastQuestion => _currentQuestionIndex >= _questions.length - 1;

  String get _currentAudioPath =>
      _resolveAudioPath(_currentQuestion.audioTrackKey);

  String _resolveAudioPath(String? trackKey) {
    const map = {
      // Theme 01
      'track_03': 'assets/audio/theme01_track03.mp3',
      'track_04': 'assets/audio/theme01_track04.mp3',
      'track_05': 'assets/audio/theme01_track05.mp3',
      'track_06': 'assets/audio/theme01_track06.mp3',
      // Theme 02
      'track_07': 'assets/audio/theme02_track07.mp3',
      'track_08': 'assets/audio/theme02_track08.mp3',
      'track_09': 'assets/audio/theme02_track09.mp3',
      'track_10': 'assets/audio/theme02_track10.mp3',
      // Theme 03
      'track_11': 'assets/audio/theme03_track11.mp3',
      'track_12': 'assets/audio/theme03_track12.mp3',
      'track_13': 'assets/audio/theme03_track13.mp3',
      'track_14': 'assets/audio/theme03_track14.mp3',
      // Theme 04
      'track_15': 'assets/audio/theme04_track15.mp3',
      'track_16': 'assets/audio/theme04_track16.mp3',
      'track_17': 'assets/audio/theme04_track17.mp3',
      'track_18': 'assets/audio/theme04_track18.mp3',
      // Theme 05
      'track_19': 'assets/audio/theme05_track19.mp3',
      'track_20': 'assets/audio/theme05_track20.mp3',
      'track_21': 'assets/audio/theme05_track21.mp3',
      'track_22': 'assets/audio/theme05_track22.mp3',
      // Theme 06
      'track_23': 'assets/audio/theme06_track23.mp3',
      'track_24': 'assets/audio/theme06_track24.mp3',
      'track_25': 'assets/audio/theme06_track25.mp3',
      'track_26': 'assets/audio/theme06_track26.mp3',
      // Theme 07
      'track_27': 'assets/audio/theme07_track27.mp3',
      'track_28': 'assets/audio/theme07_track28.mp3',
      'track_29': 'assets/audio/theme07_track29.mp3',
      'track_30': 'assets/audio/theme07_track30.mp3',
      // Theme 08
      'track_31': 'assets/audio/theme08_track31.mp3',
      'track_32': 'assets/audio/theme08_track32.mp3',
      'track_33': 'assets/audio/theme08_track33.mp3',
      'track_34': 'assets/audio/theme08_track34.mp3',
      // Theme 09
      'track_35': 'assets/audio/theme09_track35.mp3',
      'track_36': 'assets/audio/theme09_track36.mp3',
      'track_37': 'assets/audio/theme09_track37.mp3',
      'track_38': 'assets/audio/theme09_track38.mp3',
      // Theme 10
      'track_39': 'assets/audio/theme10_track39.mp3',
      'track_40': 'assets/audio/theme10_track40.mp3',
      'track_41': 'assets/audio/theme10_track41.mp3',
      'track_42': 'assets/audio/theme10_track42.mp3',
      // Theme 11
      'track_43': 'assets/audio/theme11_track43.mp3',
      'track_44': 'assets/audio/theme11_track44.mp3',
      'track_45': 'assets/audio/theme11_track45.mp3',
      'track_46': 'assets/audio/theme11_track46.mp3',
      // Theme 12
      'track_47': 'assets/audio/theme12_track47.mp3',
      'track_48': 'assets/audio/theme12_track48.mp3',
      'track_49': 'assets/audio/theme12_track49.mp3',
      'track_50': 'assets/audio/theme12_track50.mp3',
      // Theme 13
      'track_51': 'assets/audio/theme13_track51.mp3',
      'track_52': 'assets/audio/theme13_track52.mp3',
      'track_53': 'assets/audio/theme13_track53.mp3',
      'track_54': 'assets/audio/theme13_track54.mp3',
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

    _resetAllState();
  }

  @override
  void didUpdateWidget(covariant PhaseQuizScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.phase.id != widget.phase.id) {
      _resetAllState();
    }
  }

  void _resetAllState() {
    setState(() {
      _currentQuestionIndex = 0;
      _selectedAnswerIndex = null;
      _hasAnswered = false;
      _correctCount = 0;
    });
    _resultController.reset();
  }

  @override
  void dispose() {
    _resultController.dispose();
    super.dispose();
  }

  void _selectAnswer(int index) {
    if (_hasAnswered) return;

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

    setState(() {
      _currentQuestionIndex++;
      _selectedAnswerIndex = null;
      _hasAnswered = false;
    });
    _resultController.reset();
  }

  void _previousQuestion() {
    if (_currentQuestionIndex <= 0) return;
    setState(() {
      _currentQuestionIndex--;
      _selectedAnswerIndex = null;
      _hasAnswered = false;
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
            const Text('Không có câu hỏi', style: AppTextStyles.bodyMedium),
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
                  _buildTranscript(),
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
                key: ValueKey('player_$audioPath'),
                audioUrl: audioPath,
                title:
                    _currentQuestion.audioTrackKey
                        ?.replaceAll('_', ' ')
                        .toUpperCase() ??
                    'Audio',
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
        .animate(key: ValueKey('q_${_currentQuestion.id}'))
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
        child:
            GestureDetector(
                  onTap: _hasAnswered ? null : () => _selectAnswer(index),
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
                                        (isCorrect ||
                                            (isSelected && !isCorrect))
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
                              fontWeight:
                                  isSelected || (_hasAnswered && isCorrect)
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
                              color: isCorrect
                                  ? AppColors.success
                                  : AppColors.error,
                              size: 22,
                            ),
                          ),
                      ],
                    ),
                  ),
                )
                .animate(
                  key: ValueKey('opt_${_currentQuestion.id}_$index'),
                  delay: (index * 80).ms,
                )
                .fadeIn(duration: 200.ms)
                .slideX(begin: 0.05),
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

  Widget _buildTranscript() {
    final q = _currentQuestion;
    if (q.transcriptEn == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(top: AppConstants.paddingM),
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.primarySurface,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📄 Transcript',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            q.transcriptEn!,
            style: AppTextStyles.bodySmall.copyWith(height: 1.6),
          ),
          if (q.transcriptVi != null) ...[
            const Divider(height: AppConstants.paddingM),
            Text(
              q.transcriptVi!,
              style: AppTextStyles.bodySmall.copyWith(
                height: 1.6,
                color: AppColors.primary,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
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
        child: Row(
          children: [
            if (_currentQuestionIndex > 0)
              Padding(
                padding: const EdgeInsets.only(right: AppConstants.paddingS),
                child: OutlinedButton(
                  onPressed: _previousQuestion,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: const BorderSide(color: AppColors.border),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: AppConstants.paddingM,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    ),
                  ),
                  child: const Icon(Icons.arrow_back_ios, size: 16),
                ),
              ),
            Expanded(
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
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.3);
  }
}

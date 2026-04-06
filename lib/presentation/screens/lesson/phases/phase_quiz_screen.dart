import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';

class PhaseQuizScreen extends StatefulWidget {
  final int dayNumber;
  final String themeId;
  final VoidCallback onComplete;

  const PhaseQuizScreen({
    super.key,
    required this.dayNumber,
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
  int _currentPracticeSet = 0;

  late AnimationController _resultController;
  late Animation<double> _resultAnimation;

  late final List<_PracticeSet> _practiceSets;

  @override
  void initState() {
    super.initState();
    _practiceSets = _buildPracticeSets();
    _resultController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _resultAnimation = CurvedAnimation(
      parent: _resultController,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _resultController.dispose();
    super.dispose();
  }

  _PracticeSet get _currentSet => _practiceSets[_currentPracticeSet];

  _QuizQuestion get _currentQuestion =>
      _currentSet.questions[_currentQuestionIndex];

  bool get _isLastQuestion =>
      _currentQuestionIndex >= _currentSet.questions.length - 1;

  bool get _isLastSet => _currentPracticeSet >= _practiceSets.length - 1;

  void _selectAnswer(int index) {
    if (_hasAnswered) return;

    setState(() {
      _selectedAnswerIndex = index;
      _hasAnswered = true;
      if (index == _currentQuestion.correctIndex) {
        _correctCount++;
      }
    });
    _resultController.forward(from: 0);
  }

  void _nextQuestion() {
    if (_isLastQuestion) {
      if (_isLastSet) {
        widget.onComplete();
      } else {
        _showSetComplete();
      }
      return;
    }

    setState(() {
      _currentQuestionIndex++;
      _selectedAnswerIndex = null;
      _hasAnswered = false;
    });
    _resultController.reset();
  }

  void _showSetComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _SetCompleteDialog(
        setNumber: _currentPracticeSet + 1,
        correct: _correctCount,
        total: _currentSet.questions.length,
        onContinue: () {
          Navigator.pop(context);
          setState(() {
            _currentPracticeSet++;
            _currentQuestionIndex = 0;
            _selectedAnswerIndex = null;
            _hasAnswered = false;
            _correctCount = 0;
          });
          _resultController.reset();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = _currentSet.questions.length;
    final progress = (_currentQuestionIndex + 1) / totalQuestions;

    return Column(
      children: [
        // Header
        _buildHeader(progress, totalQuestions),

        // Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Practice Set Label
                _buildPracticeLabel(),
                const SizedBox(height: AppConstants.paddingM),

                // Question Card
                _buildQuestionCard(),
                const SizedBox(height: AppConstants.paddingL),

                // Answer Options
                ..._buildAnswerOptions(),

                const SizedBox(height: AppConstants.paddingL),

                // Explanation (after answering)
                if (_hasAnswered) _buildExplanation(),

                const SizedBox(height: AppConstants.paddingXL),
              ],
            ),
          ),
        ),

        // Bottom Action
        if (_hasAnswered) _buildNextButton(),
      ],
    );
  }

  Widget _buildHeader(double progress, int total) {
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
              // Score
              Row(
                children: [
                  Icon(Icons.check_circle, color: AppColors.success, size: 16),
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
                    '${_currentQuestionIndex + 1}/$total',
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

  Widget _buildPracticeLabel() {
    final setData = _currentSet;
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Text(setData.icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: AppConstants.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Practice ${_currentPracticeSet + 1}: ${setData.title}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  setData.description,
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
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingS,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(
                        AppConstants.radiusXS,
                      ),
                    ),
                    child: Text(
                      'Câu ${_currentQuestionIndex + 1}',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.warning,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
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
              if (_currentQuestion.audioNote != null) ...[
                const SizedBox(height: AppConstants.paddingM),
                Container(
                  padding: const EdgeInsets.all(AppConstants.paddingS),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(AppConstants.radiusS),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.headphones,
                        color: AppColors.primary,
                        size: 16,
                      ),
                      const SizedBox(width: AppConstants.paddingS),
                      Expanded(
                        child: Text(
                          _currentQuestion.audioNote!,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.primary,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        )
        .animate(key: ValueKey(_currentQuestionIndex))
        .fadeIn()
        .slideX(begin: 0.05);
  }

  List<Widget> _buildAnswerOptions() {
    return List.generate(_currentQuestion.options.length, (index) {
      final isSelected = _selectedAnswerIndex == index;
      final isCorrect = index == _currentQuestion.correctIndex;
      final label = String.fromCharCode(65 + index); // A, B, C, D

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
          Row(
            children: [
              Text(
                isCorrect ? '🎉 Chính xác!' : '❌ Chưa đúng',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isCorrect ? AppColors.success : AppColors.error,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          if (_currentQuestion.explanation != null) ...[
            const SizedBox(height: AppConstants.paddingS),
            Text(
              _currentQuestion.explanation!,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ],
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
              _isLastQuestion && _isLastSet
                  ? '✅ Hoàn thành Quiz'
                  : _isLastQuestion
                  ? '📊 Xem kết quả Practice ${_currentPracticeSet + 1}'
                  : '➡️ Câu tiếp theo',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.3);
  }

  // ─── Mock Data ─────────────────────────────────────────────────────────────

  List<_PracticeSet> _buildPracticeSets() {
    return [
      _PracticeSet(
        title: 'Conversation',
        description: 'Nghe hội thoại 2 người & trả lời câu hỏi',
        icon: '💬',
        questions: [
          _QuizQuestion(
            questionText: 'Why is the woman calling the man?',
            options: [
              'To place an order',
              'To ask about a report',
              'To arrange an interview',
              'To ask for assistance with a broken machine',
            ],
            correctIndex: 3,
            audioNote:
                'Track 04 – Nghe đoạn hội thoại giữa Jane và nhân viên bảo trì',
            explanation:
                'Jane gọi điện để báo máy phô-tô bị hỏng và cần kỹ thuật viên tới sửa.',
          ),
          _QuizQuestion(
            questionText: 'Why can\'t the man send a technician right now?',
            options: [
              'They are all very busy.',
              'It is a national holiday.',
              'They are on a weekend trip.',
              'The office is too far away.',
            ],
            correctIndex: 0,
            explanation:
                'Người đàn ông nói "all our technicians are on jobs right now" - tất cả kỹ thuật viên đều đang bận.',
          ),
          _QuizQuestion(
            questionText: 'What does the man offer to do?',
            options: [
              'Buy a new fax machine',
              'Send someone in the afternoon',
              'Do the repairs all on his own',
              'Give the office a discount',
            ],
            correctIndex: 2,
            explanation:
                '"I guess I will have to go there and fix it myself" - anh ta tự mình đến sửa.',
          ),
        ],
      ),
      _PracticeSet(
        title: 'Short Talk 1',
        description: 'Nghe thông báo ngắn & trả lời câu hỏi',
        icon: '📻',
        questions: [
          _QuizQuestion(
            questionText: 'Where is Mr. James this week?',
            options: [
              'On vacation',
              'In his office',
              'At a conference',
              'Visiting Ms. Clarke',
            ],
            correctIndex: 2,
            audioNote: 'Track 05 – Nghe hộp thư thoại của Brian James',
            explanation:
                '"I will be out of the office all week at a teachers\' conference."',
          ),
          _QuizQuestion(
            questionText: 'What is probably Mr. James\' job?',
            options: [
              'Teacher',
              'Office assistant',
              'Telephone operator',
              'Mail carrier',
            ],
            correctIndex: 0,
            explanation:
                'Anh James đến "teachers\' conference" và có "teaching assistant" → anh ấy là giáo viên.',
          ),
          _QuizQuestion(
            questionText: 'What is Ms. Clarke\'s extension number?',
            options: ['71', '17', '117', '171'],
            correctIndex: 0,
            explanation:
                '"please call my teaching assistant Ms. Clarke at extension 71."',
          ),
        ],
      ),
      _PracticeSet(
        title: 'Short Talk 2',
        description: 'Nghe bài phát biểu & trả lời câu hỏi',
        icon: '🎙️',
        questions: [
          _QuizQuestion(
            questionText: 'Where is the speech being made?',
            options: [
              'In a bank',
              'In a school',
              'In an office',
              'In a library',
            ],
            correctIndex: 2,
            audioNote:
                'Track 06 – Nghe bài phát biểu về vấn đề không gian văn phòng',
            explanation:
                'Diễn giả đề cập đến "our office", "third floor of the building", "desks".',
          ),
          _QuizQuestion(
            questionText: 'Why is space limited?',
            options: [
              'Because the new room is too small.',
              'Because there are five new employees.',
              'Because the meeting area is too large.',
              'Because the extra desks have not been removed yet.',
            ],
            correctIndex: 1,
            explanation:
                '"we added 5 new members to the marketing team" → tăng lên 20 người → thiếu không gian.',
          ),
          _QuizQuestion(
            questionText: 'What is the audience asked to do?',
            options: [
              'Move to a different room',
              'Get rid of unneeded books',
              'Move desks to the back of the room',
              'Move the meeting area to another room',
            ],
            correctIndex: 1,
            explanation:
                '"we will need to get rid of all the files and books that we no longer need."',
          ),
        ],
      ),
    ];
  }
}

// ─── Data Classes ───────────────────────────────────────────────────────────

class _PracticeSet {
  final String title;
  final String description;
  final String icon;
  final List<_QuizQuestion> questions;

  const _PracticeSet({
    required this.title,
    required this.description,
    required this.icon,
    required this.questions,
  });
}

class _QuizQuestion {
  final String questionText;
  final List<String> options;
  final int correctIndex;
  final String? audioNote;
  final String? explanation;

  const _QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctIndex,
    this.audioNote,
    this.explanation,
  });
}

// ─── Dialog ─────────────────────────────────────────────────────────────────

class _SetCompleteDialog extends StatelessWidget {
  final int setNumber;
  final int correct;
  final int total;
  final VoidCallback onContinue;

  const _SetCompleteDialog({
    required this.setNumber,
    required this.correct,
    required this.total,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final pct = (correct / total * 100).round();
    final emoji = pct == 100
        ? '🏆'
        : pct >= 67
        ? '👍'
        : '💪';

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 48),
            ).animate().scale(duration: 400.ms, curve: Curves.elasticOut),
            const SizedBox(height: AppConstants.paddingM),
            Text(
              'Practice $setNumber hoàn thành!',
              style: AppTextStyles.h3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.paddingS),
            Text(
              '$correct/$total câu đúng ($pct%)',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),
            _ScoreBar(value: pct / 100),
            const SizedBox(height: AppConstants.paddingXL),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Tiếp tục Practice tiếp theo →',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreBar extends StatelessWidget {
  final double value;

  const _ScoreBar({required this.value});

  @override
  Widget build(BuildContext context) {
    final color = value >= 0.8
        ? AppColors.success
        : value >= 0.6
        ? AppColors.warning
        : AppColors.error;

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.radiusS),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: AppColors.border,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 10,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value >= 0.8
              ? 'Xuất sắc! 🌟'
              : value >= 0.6
              ? 'Khá tốt! Cố lên!'
              : 'Cần luyện thêm! 💪',
          style: AppTextStyles.caption.copyWith(color: color),
        ),
      ],
    );
  }
}

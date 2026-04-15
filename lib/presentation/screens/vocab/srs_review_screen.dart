import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/srs_algorithm.dart';
import '../../../data/models/vocab_model.dart';

class SrsReviewScreen extends StatefulWidget {
  const SrsReviewScreen({super.key});

  @override
  State<SrsReviewScreen> createState() => _SrsReviewScreenState();
}

class _SrsReviewScreenState extends State<SrsReviewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  bool _isFlipped = false;
  bool _showRating = false;
  int _currentIndex = 0;
  int _sessionCorrect = 0;
  int _sessionTotal = 0;

  // ✅ Track phản hồi đã chọn
  SrsQuality? _selectedQuality;
  bool _isProcessing = false; // Tránh double-tap

  // Mock data - sau này lấy từ Hive + SRS queue
  final List<VocabModel> _reviewCards = _buildMockVocabs();

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (!_isFlipped && !_isProcessing) {
      _flipController.forward();
      setState(() {
        _isFlipped = true;
        _showRating = true;
      });
    }
  }

  void _rateCard(SrsQuality quality) async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
      _selectedQuality = quality;
    });

    // ✅ Visual feedback delay
    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;

    final card = _reviewCards[_currentIndex];
    // Apply SRS algorithm
    SrsAlgorithm.calculateNextReview(card, quality.value);

    if (quality == SrsQuality.good || quality == SrsQuality.easy) {
      _sessionCorrect++;
    }
    _sessionTotal++;

    if (_currentIndex < _reviewCards.length - 1) {
      setState(() {
        _currentIndex++;
        _isFlipped = false;
        _showRating = false;
        _selectedQuality = null;
        _isProcessing = false;
      });
      _flipController.reset();
    } else {
      setState(() {
        _isFlipped = false;
        _showRating = false;
        _isProcessing = false;
        _selectedQuality = null;
      });
      _showSessionComplete();
    }
  }

  void _showSessionComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _SessionCompleteDialog(
        correct: _sessionCorrect,
        total: _sessionTotal,
        onContinue: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        onRestart: () {
          Navigator.pop(context);
          setState(() {
            _currentIndex = 0;
            _sessionCorrect = 0;
            _sessionTotal = 0;
            _isFlipped = false;
            _showRating = false;
          });
          _flipController.reset();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_reviewCards.isEmpty) {
      return _buildEmptyState();
    }

    final card = _reviewCards[_currentIndex];
    final progress = (_currentIndex + 1) / _reviewCards.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Ôn tập SRS', style: AppTextStyles.h3),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: AppConstants.paddingM),
              child: Text(
                '${_currentIndex + 1}/${_reviewCards.length}',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.border,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
                minHeight: 6,
              ),
            ),
          ),

          const SizedBox(height: AppConstants.paddingM),

          // Session Stats
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SessionStat(
                  icon: Icons.check_circle,
                  value: _sessionCorrect,
                  color: AppColors.success,
                ),
                const SizedBox(width: AppConstants.paddingL),
                _SessionStat(
                  icon: Icons.cancel,
                  value: _sessionTotal - _sessionCorrect,
                  color: AppColors.error,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingM),

          // ✅ NEW: Mini vocab reference bar
          _buildVocabQuickRef(card),

          const SizedBox(height: AppConstants.paddingS),

          // Flashcard
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingM,
              ),
              child: GestureDetector(
                onTap: _isFlipped ? null : _flipCard,
                child: AnimatedBuilder(
                  animation: _flipAnimation,
                  builder: (context, child) {
                    final isShowingBack = _flipAnimation.value > 0.5;
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_flipAnimation.value * 3.14159),
                      child: isShowingBack
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(3.14159),
                              child: _buildBackCard(card),
                            )
                          : _buildFrontCard(card),
                    );
                  },
                ),
              ),
            ),
          ),

          // Rating Buttons
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showRating ? _buildRatingButtons() : _buildTapHint(),
          ),

          const SizedBox(height: AppConstants.paddingL),
        ],
      ),
    );
  }

  Widget _buildVocabQuickRef(VocabModel vocab) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              ),
            ),
          ),
          const SizedBox(width: AppConstants.paddingS),
          Text(
            vocab.pronunciation,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Spacer(),
          // ✅ Nút nghe phiên âm (placeholder)
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('🔊 ${vocab.wordEn} - ${vocab.pronunciation}'),
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColors.primary,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(6),
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

  Widget _buildFrontCard(VocabModel vocab) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
              vertical: AppConstants.paddingXS,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
            ),
            child: const Text('🤔', style: TextStyle(fontSize: 32)),
          ),
          const SizedBox(height: AppConstants.paddingM),
          Text(
            vocab.wordEn,
            style: AppTextStyles.h1.copyWith(
              fontSize: 36,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            vocab.pronunciation,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: AppConstants.paddingXL),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.touch_app, color: AppColors.textHint, size: 18),
              const SizedBox(width: 6),
              Text(
                'Nhớ lại nghĩa → Nhấn để lật thẻ',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard(VocabModel vocab) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.8)],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            vocab.wordEn,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
          Text(
            vocab.wordVi,
            style: AppTextStyles.h1.copyWith(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            vocab.pronunciation,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
              fontStyle: FontStyle.italic,
            ),
          ),
          if (vocab.exampleEn != null) ...[
            const SizedBox(height: AppConstants.paddingL),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingL,
              ),
              child: Container(
                padding: const EdgeInsets.all(AppConstants.paddingM),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                ),
                child: Column(
                  children: [
                    Text(
                      vocab.exampleEn!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (vocab.exampleVi != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        vocab.exampleVi!,
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white.withValues(alpha: 0.7),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRatingButtons() {
    return Padding(
      key: const ValueKey('rating'),
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
      child: Column(
        children: [
          Text(
            'Bạn nhớ tốt không?',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Row(
            children: [
              Expanded(
                child: _RatingButton(
                  label: 'Không nhớ',
                  sublabel: 'Ôn lại ngay',
                  color: AppColors.error,
                  icon: '😔',
                  isSelected: _selectedQuality == SrsQuality.blackout,
                  isProcessing: _isProcessing,
                  onTap: () => _rateCard(SrsQuality.blackout),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: _RatingButton(
                  label: 'Phải nghĩ',
                  sublabel: 'Ôn lại sớm',
                  color: AppColors.warning,
                  icon: '🤔',
                  isSelected: _selectedQuality == SrsQuality.hard,
                  isProcessing: _isProcessing,
                  onTap: () => _rateCard(SrsQuality.hard),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: _RatingButton(
                  label: 'Nhớ ngay',
                  sublabel: 'Tiếp tục tốt',
                  color: AppColors.success,
                  icon: '😊',
                  isSelected: _selectedQuality == SrsQuality.good,
                  isProcessing: _isProcessing,
                  onTap: () => _rateCard(SrsQuality.good),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: _RatingButton(
                  label: 'Dễ dàng',
                  sublabel: 'Tuyệt vời!',
                  color: AppColors.primary,
                  icon: '🚀',
                  isSelected: _selectedQuality == SrsQuality.easy,
                  isProcessing: _isProcessing,
                  onTap: () => _rateCard(SrsQuality.easy),
                ),
              ),
            ],
          ),
        ],
      ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.3, end: 0),
    );
  }

  Widget _buildTapHint() {
    return Padding(
      key: const ValueKey('hint'),
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Text(
        '💡 Nhớ lại nghĩa của từ trước khi lật thẻ',
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textHint,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🎉', style: TextStyle(fontSize: 64)),
            const SizedBox(height: AppConstants.paddingL),
            Text('Tuyệt vời!', style: AppTextStyles.h2),
            const SizedBox(height: AppConstants.paddingS),
            Text(
              'Không có thẻ nào cần ôn hôm nay.\nHãy quay lại sau!',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ).animate().fadeIn().scale(),
      ),
    );
  }

  static List<VocabModel> _buildMockVocabs() {
    return [
      VocabModel(
        id: 'v001',
        wordEn: 'familiar',
        wordVi: 'quen thuộc',
        pronunciation: '/fəˈmɪliər/',
        partOfSpeech: 'adj',
        themeId: 'theme_01',
        exampleEn: 'This familiar theme will occur in all seven sections.',
        exampleVi: 'Chủ đề quen thuộc này sẽ xuất hiện ở tất cả bảy phần.',
        repetitionCount: 0,
        easeFactor: 2.5,
        intervalDays: 1,
      ),
      VocabModel(
        id: 'v002',
        wordEn: 'conference',
        wordVi: 'hội nghị',
        pronunciation: '/ˈkɒnfərəns/',
        partOfSpeech: 'n',
        themeId: 'theme_01',
        exampleEn:
            'I will be out of the office all week at a teachers\' conference.',
        exampleVi:
            'Tôi sẽ không có ở văn phòng cả tuần để tham dự hội nghị giáo viên.',
        repetitionCount: 0,
        easeFactor: 2.5,
        intervalDays: 1,
      ),
      VocabModel(
        id: 'v003',
        wordEn: 'terminate',
        wordVi: 'chấm dứt, kết thúc',
        pronunciation: '/ˈtɜːrmɪneɪt/',
        partOfSpeech: 'v',
        themeId: 'theme_01',
        exampleEn: 'All of which mean to terminate someone\'s employment.',
        exampleVi: 'Tất cả đều có nghĩa là chấm dứt việc làm của ai đó.',
        repetitionCount: 0,
        easeFactor: 2.5,
        intervalDays: 1,
      ),
      VocabModel(
        id: 'v004',
        wordEn: 'comprehend',
        wordVi: 'hiểu, nắm bắt',
        pronunciation: '/ˌkɒmprɪˈhend/',
        partOfSpeech: 'v',
        themeId: 'theme_01',
        exampleEn: 'These would tend to be less difficult to comprehend.',
        exampleVi: 'Những thông báo này có xu hướng dễ hiểu hơn.',
        repetitionCount: 0,
        easeFactor: 2.5,
        intervalDays: 1,
      ),
      VocabModel(
        id: 'v005',
        wordEn: 'maintenance',
        wordVi: 'bảo trì, bảo dưỡng',
        pronunciation: '/ˈmeɪntənəns/',
        partOfSpeech: 'n',
        themeId: 'theme_01',
        exampleEn:
            'Are there any technicians from the maintenance department available?',
        exampleVi: 'Có kỹ thuật viên nào từ phòng bảo trì không bận không?',
        repetitionCount: 0,
        easeFactor: 2.5,
        intervalDays: 1,
      ),
    ];
  }
}

// ─── Sub-widgets ────────────────────────────────────────────────────────────

class _SessionStat extends StatelessWidget {
  final IconData icon;
  final int value;
  final Color color;

  const _SessionStat({
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 6),
        Text('$value', style: AppTextStyles.h3.copyWith(color: color)),
      ],
    );
  }
}

class _RatingButton extends StatelessWidget {
  final String label;
  final String sublabel;
  final Color color;
  final String icon;
  final bool isSelected;
  final bool isProcessing;
  final VoidCallback onTap;

  const _RatingButton({
    required this.label,
    required this.sublabel,
    required this.color,
    required this.icon,
    required this.isSelected,
    required this.isProcessing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isProcessing ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.paddingS,
          horizontal: AppConstants.paddingXS,
        ),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
          border: Border.all(
            color: isSelected ? color : color.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            isSelected && isProcessing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(icon, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: isSelected ? Colors.white : color,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              sublabel,
              style: AppTextStyles.caption.copyWith(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.8)
                    : color.withValues(alpha: 0.7),
                fontSize: 9,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionCompleteDialog extends StatelessWidget {
  final int correct;
  final int total;
  final VoidCallback onContinue;
  final VoidCallback onRestart;

  const _SessionCompleteDialog({
    required this.correct,
    required this.total,
    required this.onContinue,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = total > 0 ? (correct / total * 100).round() : 0;
    final String emoji = percentage >= 80
        ? '🏆'
        : percentage >= 60
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
              style: const TextStyle(fontSize: 56),
            ).animate().scale(duration: 400.ms, curve: Curves.elasticOut),
            const SizedBox(height: AppConstants.paddingM),
            Text('Phiên ôn tập hoàn thành!', style: AppTextStyles.h3),
            const SizedBox(height: AppConstants.paddingS),
            Text(
              '$correct/$total từ chính xác ($percentage%)',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingXL),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onRestart,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Ôn lại'),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Về trang chủ'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum SrsQuality {
  blackout(0),
  hard(2),
  good(4),
  easy(5);

  final int value;
  const SrsQuality(this.value);
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/services/tts_service.dart';
import '../../../../data/content/all_themes_registry.dart';
import '../../../../data/models/vocab_model.dart';
import '../../../widgets/vocabulary_speaker_button.dart';

class PhaseVocabularyScreen extends StatefulWidget {
  final int dayNumber;
  final String themeId;
  final VoidCallback onComplete;

  const PhaseVocabularyScreen({
    super.key,
    required this.dayNumber,
    required this.themeId,
    required this.onComplete,
  });

  @override
  State<PhaseVocabularyScreen> createState() => _PhaseVocabularyScreenState();
}

class _PhaseVocabularyScreenState extends State<PhaseVocabularyScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int _knownCount = 0;
  final Set<int> _knownIndices = {};
  final Set<int> _reviewIndices = {};
  bool _isSessionDone = false;
  bool _autoPlayTts = true; // ✅ Tự động phát âm mặc định là true

  // ✅ FIX: Flip state per card
  final Map<int, bool> _flippedMap = {};

  late final List<VocabModel> _vocabList;

  @override
  void initState() {
    super.initState();
    // ✅ FIX: Đọc từ AllThemesRegistry thay vì hardcode
    _vocabList = AllThemesRegistry.getVocabulary(widget.themeId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _speakCurrent();
    });
  }

  void _speakCurrent() {
    if (_autoPlayTts &&
        _vocabList.isNotEmpty &&
        _currentIndex < _vocabList.length) {
      TtsService.instance.speak(_vocabList[_currentIndex].wordEn);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    TtsService.instance.stop(); // ✅ Dừng đọc khi tắt màn hình
    super.dispose();
  }

  void _markKnown() {
    setState(() {
      _knownIndices.add(_currentIndex);
      _reviewIndices.remove(_currentIndex);
      _knownCount = _knownIndices.length;
    });
    _goNext();
  }

  void _markReview() {
    setState(() {
      _reviewIndices.add(_currentIndex);
      _knownIndices.remove(_currentIndex);
      _knownCount = _knownIndices.length;
    });
    _goNext();
  }

  void _goNext() {
    if (_currentIndex < _vocabList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      setState(() => _isSessionDone = true);
    }
  }

  void _goPrev() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _toggleFlip(int index) {
    setState(() {
      _flippedMap[index] = !(_flippedMap[index] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_vocabList.isEmpty) {
      return Center(
        child: ElevatedButton(
          onPressed: widget.onComplete,
          child: const Text('Tiếp tục'),
        ),
      );
    }

    if (_isSessionDone) {
      return _buildSummaryScreen();
    }

    final progress = (_currentIndex + 1) / _vocabList.length;

    return Column(
      children: [
        _buildHeader(progress),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _vocabList.length,
            onPageChanged: (i) {
              setState(() => _currentIndex = i);
              _speakCurrent();
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(AppConstants.paddingM),
                child: _VocabCardWidget(
                  vocab: _vocabList[index],
                  index: index,
                  isKnown: _knownIndices.contains(index),
                  isMarkedReview: _reviewIndices.contains(index),
                  isFlipped: _flippedMap[index] ?? false,
                  onFlip: () => _toggleFlip(index),
                ),
              );
            },
          ),
        ),
        _buildActionButtons(),
      ],
    );
  }

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
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppConstants.radiusS),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('📚', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text(
                      'Từ vựng',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
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
                    '$_knownCount thuộc',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingM),
                  Text(
                    '${_currentIndex + 1}/${_vocabList.length}',
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
                AppColors.primary,
              ),
              minHeight: 5,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                _autoPlayTts ? Icons.volume_up : Icons.volume_off,
                size: 14,
                color: _autoPlayTts ? AppColors.primary : AppColors.textHint,
              ),
              const SizedBox(width: 4),
              Text(
                'Tự động phát âm',
                style: AppTextStyles.caption.copyWith(
                  color: _autoPlayTts
                      ? AppColors.textPrimary
                      : AppColors.textHint,
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                ),
              ),
              const SizedBox(width: 6),
              SizedBox(
                height: 20,
                width: 32,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    value: _autoPlayTts,
                    onChanged: (val) {
                      setState(() {
                        _autoPlayTts = val;
                      });
                      if (val) {
                        _speakCurrent();
                      }
                    },
                    activeThumbColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
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
        child: Column(
          children: [
            Text(
              'Đánh giá mức độ thuộc của bạn:',
              style: AppTextStyles.caption.copyWith(color: AppColors.textHint),
            ),
            const SizedBox(height: AppConstants.paddingS),
            Row(
              children: [
                if (_currentIndex > 0)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: AppConstants.paddingS,
                    ),
                    child: GestureDetector(
                      onTap: _goPrev,
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusM,
                          ),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: GestureDetector(
                    onTap: _markReview,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.warning.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                        border: Border.all(
                          color: AppColors.warning.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text('🔄', style: TextStyle(fontSize: 18)),
                          const SizedBox(height: 2),
                          Text(
                            'Ôn thêm',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.warning,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingS),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: _markKnown,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                        border: Border.all(
                          color: AppColors.success.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text('✅', style: TextStyle(fontSize: 18)),
                          const SizedBox(height: 2),
                          Text(
                            'Tôi đã thuộc!',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.success,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryScreen() {
    final total = _vocabList.length;
    final known = _knownIndices.length;
    final needReview = _reviewIndices.length;
    final pct = total > 0 ? (known / total * 100).round() : 0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        children: [
          const SizedBox(height: AppConstants.paddingL),
          Text(
            pct >= 80
                ? '🏆'
                : pct >= 60
                ? '👍'
                : '💪',
            style: const TextStyle(fontSize: 64),
          ).animate().scale(duration: 500.ms, curve: Curves.elasticOut),
          const SizedBox(height: AppConstants.paddingM),
          const Text(
            'Tổng kết từ vựng',
            style: AppTextStyles.h2,
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: AppConstants.paddingL),
          Row(
            children: [
              Expanded(
                child: _SummaryStat(
                  icon: '✅',
                  value: '$known',
                  label: 'Đã thuộc',
                  color: AppColors.success,
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: _SummaryStat(
                  icon: '🔄',
                  value: '$needReview',
                  label: 'Cần ôn',
                  color: AppColors.warning,
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: _SummaryStat(
                  icon: '📊',
                  value: '$pct%',
                  label: 'Tỉ lệ thuộc',
                  color: AppColors.primary,
                ),
              ),
            ],
          ).animate().fadeIn(delay: 300.ms),
          const SizedBox(height: AppConstants.paddingL),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Độ thuộc từ vựng',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingS),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.radiusS),
                  child: LinearProgressIndicator(
                    value: pct / 100,
                    backgroundColor: AppColors.border,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      pct >= 80 ? AppColors.success : AppColors.warning,
                    ),
                    minHeight: 12,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingS),
                Text(
                  pct >= 80
                      ? '🌟 Xuất sắc! Tiếp tục duy trì nhé!'
                      : pct >= 60
                      ? '👍 Tốt lắm! Ôn thêm những từ chưa thuộc!'
                      : '💪 Cần cố gắng hơn! Ôn lại SRS mỗi ngày!',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: AppConstants.paddingL),
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(AppConstants.radiusL),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                const Text('🧠', style: TextStyle(fontSize: 24)),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lặp lại nhiều bối cảnh',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '$needReview từ đã được thêm vào hàng đợi ôn tập SRS.',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 500.ms),
          const SizedBox(height: AppConstants.paddingXL),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onComplete,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                ),
                elevation: 0,
              ),
              child: const Text(
                '🎉 Hoàn thành bài học!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ).animate().fadeIn(delay: 600.ms),
          const SizedBox(height: AppConstants.paddingXL),
        ],
      ),
    );
  }
}

// ─── VocabCard Widget (Flip Card) ────────────────────────────────────────────

class _VocabCardWidget extends StatelessWidget {
  final VocabModel vocab;
  final int index;
  final bool isKnown;
  final bool isMarkedReview;
  final bool isFlipped;
  final VoidCallback onFlip;

  const _VocabCardWidget({
    required this.vocab,
    required this.index,
    required this.isKnown,
    required this.isMarkedReview,
    required this.isFlipped,
    required this.onFlip,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Status badge
          if (isKnown || isMarkedReview)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingM,
                vertical: AppConstants.paddingXS,
              ),
              decoration: BoxDecoration(
                color: isKnown
                    ? AppColors.success.withValues(alpha: 0.1)
                    : AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
                border: Border.all(
                  color: isKnown
                      ? AppColors.success.withValues(alpha: 0.3)
                      : AppColors.warning.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                isKnown ? '✅ Đã thuộc' : '🔄 Cần ôn thêm',
                style: AppTextStyles.caption.copyWith(
                  color: isKnown ? AppColors.success : AppColors.warning,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ).animate().fadeIn(),

          const SizedBox(height: AppConstants.paddingS),

          // ✅ FIX: Flip Card - nhấn để lật Việt↔Anh↔Việt
          GestureDetector(
            onTap: onFlip,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: isFlipped ? _buildVietnameseSide() : _buildEnglishSide(),
            ),
          ),

          const SizedBox(height: AppConstants.paddingS),

          // Flip hint
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.touch_app, size: 14, color: AppColors.textHint),
              const SizedBox(width: 4),
              Text(
                isFlipped
                    ? 'Nhấn để xem tiếng Anh'
                    : 'Nhấn thẻ để xem tiếng Việt',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.paddingM),

          // Example box (luôn hiện)
          if (vocab.exampleEn != null || vocab.exampleVi != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '📝 Ví dụ:',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textHint,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (vocab.exampleEn != null)
                        VocabularySpeakerButton(
                          text: vocab.exampleEn!,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (vocab.exampleEn != null)
                    Text(
                      vocab.exampleEn!,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  if (vocab.exampleVi != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        vocab.exampleVi!,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEnglishSide() {
    return Container(
      key: const ValueKey('en'),
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingXL),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
            ),
            child: Text(
              vocab.partOfSpeech,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  vocab.wordEn,
                  style: AppTextStyles.h1.copyWith(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              VocabularySpeakerButton(text: vocab.wordEn, size: 24),
            ],
          ),
          const SizedBox(height: AppConstants.paddingXS),
          Text(
            vocab.pronunciation,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingL,
              vertical: AppConstants.paddingXS,
            ),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Text(
              '🇻🇳 Nhấn để xem nghĩa',
              style: AppTextStyles.caption.copyWith(color: AppColors.warning),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVietnameseSide() {
    return Container(
      key: const ValueKey('vi'),
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingXL),
      decoration: BoxDecoration(
        color: AppColors.successSurface,
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        boxShadow: [
          BoxShadow(
            color: AppColors.success.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
            ),
            child: Text(
              vocab.partOfSpeech,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  vocab.wordEn,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.success.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              VocabularySpeakerButton(
                text: vocab.wordEn,
                size: 18,
                color: AppColors.success,
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            vocab.wordVi,
            style: AppTextStyles.h2.copyWith(
              color: AppColors.success,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppConstants.paddingXS),
          Text(
            vocab.pronunciation,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.success.withValues(alpha: 0.7),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Summary Stat Widget ─────────────────────────────────────────────────────

class _SummaryStat extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final Color color;

  const _SummaryStat({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.h3.copyWith(color: color)),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

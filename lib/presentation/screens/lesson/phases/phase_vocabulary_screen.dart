import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../data/content/all_themes_registry.dart';
import '../../../../data/models/vocab_model.dart';

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

  late final List<_VocabCard> _vocabCards;

  @override
  void initState() {
    super.initState();
    _vocabCards = _buildVocabCards();
  }

  @override
  void dispose() {
    _pageController.dispose();
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
    if (_currentIndex < _vocabCards.length - 1) {
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

  @override
  Widget build(BuildContext context) {
    if (_isSessionDone) {
      return _buildSummaryScreen();
    }

    final progress = (_currentIndex + 1) / _vocabCards.length;

    return Column(
      children: [
        // Header
        _buildHeader(progress),

        // Page View
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _vocabCards.length,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(AppConstants.paddingM),
                child: _VocabCardWidget(
                  card: _vocabCards[index],
                  index: index,
                  isKnown: _knownIndices.contains(index),
                  isMarkedReview: _reviewIndices.contains(index),
                ),
              );
            },
          ),
        ),

        // Action Buttons
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
              // Known counter
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
                    '${_currentIndex + 1}/${_vocabCards.length}',
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
            // Navigation hint
            Text(
              'Đánh giá mức độ thuộc của bạn:',
              style: AppTextStyles.caption.copyWith(color: AppColors.textHint),
            ),
            const SizedBox(height: AppConstants.paddingS),
            Row(
              children: [
                // Prev
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

                // Need Review
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

                // Known
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
    final total = _vocabCards.length;
    final known = _knownIndices.length;
    final needReview = _reviewIndices.length;
    final pct = (known / total * 100).round();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        children: [
          const SizedBox(height: AppConstants.paddingL),

          // Trophy
          Text(
            pct >= 80
                ? '🏆'
                : pct >= 60
                ? '👍'
                : '💪',
            style: const TextStyle(fontSize: 64),
          ).animate().scale(duration: 500.ms, curve: Curves.elasticOut),

          const SizedBox(height: AppConstants.paddingM),

          Text(
            'Tổng kết từ vựng',
            style: AppTextStyles.h2,
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: AppConstants.paddingL),

          // Stats
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

          // Progress bar
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

          // SRS Reminder
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
                        'Bí mật #3: Lặp lại nhiều bối cảnh',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '$needReview từ đã được thêm vào hàng đợi ôn tập SRS của bạn.',
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

          // Complete Button
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

  // ─── Mock Data ─────────────────────────────────────────────────────────────

  List<_VocabCard> _buildVocabCards() {
    return [
      _VocabCard(
        wordEn: 'familiar',
        wordVi: 'quen thuộc',
        pronunciation: '/fəˈmɪliər/',
        partOfSpeech: 'adj',
        example: 'This familiar theme will occur in all seven sections.',
        exampleVi: 'Chủ đề quen thuộc này sẽ xuất hiện ở tất cả bảy phần.',
        synonyms: ['common', 'well-known', 'recognized'],
        tip:
            'Family → familiar: những gì thuộc về "gia đình" thì rất quen thuộc!',
      ),
      _VocabCard(
        wordEn: 'conference',
        wordVi: 'hội nghị, hội thảo',
        pronunciation: '/ˈkɒnfərəns/',
        partOfSpeech: 'n',
        example:
            'I will be out of the office all week at a teachers\' conference.',
        exampleVi:
            'Tôi sẽ không có ở văn phòng cả tuần để tham dự hội nghị giáo viên.',
        synonyms: ['meeting', 'summit', 'convention'],
        tip: 'Con + ference → nhiều người cùng (con) bàn luận (ference)',
      ),
      _VocabCard(
        wordEn: 'procedure',
        wordVi: 'quy trình, thủ tục',
        pronunciation: '/prəˈsiːdʒər/',
        partOfSpeech: 'n',
        example: 'Office situations include policies and procedures.',
        exampleVi: 'Các tình huống văn phòng bao gồm chính sách và quy trình.',
        synonyms: ['process', 'method', 'protocol'],
        tip: 'Pro + cede + ure → tiến hành theo bước',
      ),
      _VocabCard(
        wordEn: 'terminate',
        wordVi: 'chấm dứt, kết thúc',
        pronunciation: '/ˈtɜːrmɪneɪt/',
        partOfSpeech: 'v',
        example: 'All of which mean to terminate someone\'s employment.',
        exampleVi: 'Tất cả đều có nghĩa là chấm dứt việc làm của ai đó.',
        synonyms: ['end', 'dismiss', 'fire', 'sack'],
        tip: 'Terminal = trạm cuối → terminate = kết thúc',
      ),
      _VocabCard(
        wordEn: 'collocation',
        wordVi: 'cách kết hợp từ',
        pronunciation: '/ˌkɒləˈkeɪʃən/',
        partOfSpeech: 'n',
        example:
            'It is helpful to understand collocations such as "to hold a meeting".',
        exampleVi:
            'Sẽ rất hữu ích khi hiểu về các cách kết hợp từ như "to hold a meeting".',
        synonyms: ['word combination', 'phrase pattern'],
        tip: 'Co + locate → những từ thường "cùng vị trí" với nhau',
      ),
      _VocabCard(
        wordEn: 'comprehend',
        wordVi: 'hiểu, nắm bắt',
        pronunciation: '/ˌkɒmprɪˈhend/',
        partOfSpeech: 'v',
        example: 'These would tend to be less difficult to comprehend.',
        exampleVi: 'Những thông báo này có xu hướng dễ hiểu hơn.',
        synonyms: ['understand', 'grasp', 'perceive'],
        tip: 'Comprehend → comprehension (bài đọc hiểu) mà bạn hay gặp!',
      ),
      _VocabCard(
        wordEn: 'maintenance',
        wordVi: 'bảo trì, bảo dưỡng',
        pronunciation: '/ˈmeɪntənəns/',
        partOfSpeech: 'n',
        example: 'Technicians from the maintenance department.',
        exampleVi: 'Các kỹ thuật viên từ phòng bảo trì.',
        synonyms: ['upkeep', 'servicing', 'repair'],
        tip: 'Maintain (duy trì) → maintenance (sự duy trì/bảo trì)',
      ),
      _VocabCard(
        wordEn: 'available',
        wordVi: 'sẵn sàng, rảnh rỗi',
        pronunciation: '/əˈveɪləbl/',
        partOfSpeech: 'adj',
        example: 'Are there any technicians available?',
        exampleVi: 'Có kỹ thuật viên nào rảnh không?',
        synonyms: ['free', 'accessible', 'on hand'],
        tip: 'Avail (lợi ích) + able → có thể sử dụng được → sẵn sàng',
      ),
    ];
  }
}

// ─── VocabCard Widget ────────────────────────────────────────────────────────

class _VocabCardWidget extends StatefulWidget {
  final _VocabCard card;
  final int index;
  final bool isKnown;
  final bool isMarkedReview;

  const _VocabCardWidget({
    required this.card,
    required this.index,
    required this.isKnown,
    required this.isMarkedReview,
  });

  @override
  State<_VocabCardWidget> createState() => _VocabCardWidgetState();
}

class _VocabCardWidgetState extends State<_VocabCardWidget> {
  bool _showDetails = false;

  @override
  void didUpdateWidget(covariant _VocabCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      setState(() => _showDetails = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Status badge
          if (widget.isKnown || widget.isMarkedReview)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingM,
                vertical: AppConstants.paddingXS,
              ),
              decoration: BoxDecoration(
                color: widget.isKnown
                    ? AppColors.success.withValues(alpha: 0.1)
                    : AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
                border: Border.all(
                  color: widget.isKnown
                      ? AppColors.success.withValues(alpha: 0.3)
                      : AppColors.warning.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                widget.isKnown ? '✅ Đã thuộc' : '🔄 Cần ôn thêm',
                style: AppTextStyles.caption.copyWith(
                  color: widget.isKnown ? AppColors.success : AppColors.warning,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ).animate().fadeIn(),

          const SizedBox(height: AppConstants.paddingS),

          // Main Card
          Container(
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
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // POS badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingS,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppConstants.radiusS),
                  ),
                  child: Text(
                    widget.card.partOfSpeech,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.paddingM),

                // Word
                Text(
                  widget.card.wordEn,
                  style: AppTextStyles.h1.copyWith(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: AppConstants.paddingXS),

                // Pronunciation
                Text(
                  widget.card.pronunciation,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: AppConstants.paddingM),

                // Meaning
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingL,
                    vertical: AppConstants.paddingS,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                  child: Text(
                    widget.card.wordVi,
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: AppConstants.paddingL),

                // Example
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
                      Text(
                        '📝 Ví dụ:',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textHint,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.card.example,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textPrimary,
                          fontStyle: FontStyle.italic,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.card.exampleVi,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingM),

          // Expand Details Button
          GestureDetector(
            onTap: () => setState(() => _showDetails = !_showDetails),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
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
                  Icon(
                    _showDetails
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _showDetails
                        ? 'Ẩn chi tiết'
                        : 'Xem thêm: Từ đồng nghĩa & Mẹo nhớ',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Details
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showDetails
                ? Padding(
                    key: const ValueKey('details'),
                    padding: const EdgeInsets.only(top: AppConstants.paddingM),
                    child: Column(
                      children: [
                        // Synonyms
                        _buildSynonyms(),
                        const SizedBox(height: AppConstants.paddingS),
                        // Memory Tip
                        _buildMemoryTip(),
                      ],
                    ),
                  )
                : const SizedBox.shrink(key: ValueKey('empty')),
          ),

          const SizedBox(height: AppConstants.paddingM),
        ],
      ),
    );
  }

  Widget _buildSynonyms() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🔤 Từ đồng nghĩa (Synonyms)',
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Wrap(
            spacing: AppConstants.paddingS,
            runSpacing: AppConstants.paddingS,
            children: widget.card.synonyms
                .map(
                  (s) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingS,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(AppConstants.radiusS),
                      border: Border.all(
                        color: AppColors.success.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Text(
                      s,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 250.ms);
  }

  Widget _buildMemoryTip() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🧠', style: TextStyle(fontSize: 20)),
          const SizedBox(width: AppConstants.paddingS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mẹo nhớ nhanh',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.warning,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.card.tip,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms);
  }
}

// ─── Data Classes ───────────────────────────────────────────────────────────

class _VocabCard {
  final String wordEn;
  final String wordVi;
  final String pronunciation;
  final String partOfSpeech;
  final String example;
  final String exampleVi;
  final List<String> synonyms;
  final String tip;

  const _VocabCard({
    required this.wordEn,
    required this.wordVi,
    required this.pronunciation,
    required this.partOfSpeech,
    required this.example,
    required this.exampleVi,
    required this.synonyms,
    required this.tip,
  });
}

// ─── Summary Stat Widget ────────────────────────────────────────────────────

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

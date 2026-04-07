import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';

class PhaseTranslateScreen extends StatefulWidget {
  final int dayNumber;
  final String themeId;
  final VoidCallback onComplete;

  const PhaseTranslateScreen({
    super.key,
    required this.dayNumber,
    required this.themeId,
    required this.onComplete,
  });

  @override
  State<PhaseTranslateScreen> createState() => _PhaseTranslateScreenState();
}

class _PhaseTranslateScreenState extends State<PhaseTranslateScreen> {
  int _currentSectionIndex = 0;
  bool _showTranslation = false;
  final ScrollController _scrollController = ScrollController();

  // Mock data - sau này load từ content
  late final List<_TranslateSection> _sections;

  @override
  void initState() {
    super.initState();
    _sections = _buildSections();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isLastSection => _currentSectionIndex >= _sections.length - 1;

  void _toggleTranslation() {
    setState(() => _showTranslation = !_showTranslation);
  }

  void _nextSection() {
    if (_isLastSection) {
      widget.onComplete();
      return;
    }
    setState(() {
      _currentSectionIndex++;
      _showTranslation = false;
    });
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final section = _sections[_currentSectionIndex];
    final progress = (_currentSectionIndex + 1) / _sections.length;

    return Column(
      children: [
        // Header
        _buildHeader(progress),

        // Content
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(AppConstants.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Instruction Banner
                _buildInstructionBanner(),
                const SizedBox(height: AppConstants.paddingM),

                // English Text Card
                _buildEnglishCard(section),
                const SizedBox(height: AppConstants.paddingM),

                // Translation Toggle
                _buildTranslationSection(section),
                const SizedBox(height: AppConstants.paddingL),

                // Vocabulary Highlights
                if (section.keyVocabs.isNotEmpty) ...[
                  _buildKeyVocabs(section.keyVocabs),
                  const SizedBox(height: AppConstants.paddingL),
                ],

                // Study Tip
                _buildStudyTip(),
                const SizedBox(height: AppConstants.paddingXL),
              ],
            ),
          ),
        ),

        // Bottom Action
        _buildBottomAction(),
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
                  color: AppColors.secondary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppConstants.radiusS),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('📖', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text(
                      'Bước 2: Dịch & Hiểu',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                '${_currentSectionIndex + 1}/${_sections.length} đoạn',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
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
                AppColors.secondary,
              ),
              minHeight: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionBanner() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingS),
      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.secondary.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          const Text('💡', style: TextStyle(fontSize: 16)),
          const SizedBox(width: AppConstants.paddingS),
          Expanded(
            child: Text(
              'Đọc kỹ tiếng Anh trước, tự dịch trong đầu, rồi mới xem bản dịch.',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildEnglishCard(_TranslateSection section) {
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
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
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
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppConstants.radiusXS),
                ),
                child: Text(
                  '🇺🇸 Tiếng Anh',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Đoạn ${_currentSectionIndex + 1}',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingM),
          Text(
            section.englishText,
            style: AppTextStyles.bodyMedium.copyWith(
              height: 1.7,
              color: AppColors.textPrimary,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.05, end: 0);
  }

  Widget _buildTranslationSection(_TranslateSection section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Toggle Button
        GestureDetector(
          onTap: _toggleTranslation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: double.infinity,
            padding: const EdgeInsets.all(AppConstants.paddingM),
            decoration: BoxDecoration(
              color: _showTranslation
                  ? AppColors.success.withValues(alpha: 0.08)
                  : AppColors.background,
              borderRadius: BorderRadius.circular(AppConstants.radiusL),
              border: Border.all(
                color: _showTranslation
                    ? AppColors.success.withValues(alpha: 0.4)
                    : AppColors.border,
                width: _showTranslation ? 1.5 : 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _showTranslation
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: _showTranslation
                      ? AppColors.success
                      : AppColors.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: AppConstants.paddingS),
                Text(
                  _showTranslation ? 'Ẩn bản dịch' : 'Xem bản dịch tiếng Việt',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: _showTranslation
                        ? AppColors.success
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Translation Content
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (child, animation) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: _showTranslation
              ? Padding(
                  key: const ValueKey('translation'),
                  padding: const EdgeInsets.only(top: AppConstants.paddingM),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppConstants.paddingL),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(AppConstants.radiusL),
                      border: Border.all(
                        color: AppColors.success.withValues(alpha: 0.25),
                      ),
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
                                color: AppColors.success.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppConstants.radiusXS,
                                ),
                              ),
                              child: Text(
                                '🇻🇳 Tiếng Việt',
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.success,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                        Text(
                          section.vietnameseText,
                          style: AppTextStyles.bodyMedium.copyWith(
                            height: 1.7,
                            color: AppColors.textPrimary,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('empty')),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildKeyVocabs(List<_KeyVocab> vocabs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('🔑', style: TextStyle(fontSize: 16)),
            const SizedBox(width: AppConstants.paddingS),
            Text('Từ khóa cần nhớ', style: AppTextStyles.h3),
          ],
        ),
        const SizedBox(height: AppConstants.paddingS),
        Wrap(
          spacing: AppConstants.paddingS,
          runSpacing: AppConstants.paddingS,
          children: vocabs.map((v) => _VocabChip(vocab: v)).toList(),
        ),
      ],
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildStudyTip() {
    final tips = [
      '📌 Bí mật #2: Phải hiểu cặn kẽ ý nghĩa từng câu tiếng Anh.',
      '🔄 Bí mật #3: Từ vựng chỉ "sống" khi nằm trong bối cảnh thực tế.',
      '❤️ Bí mật #5: Học bằng cả con tim - đưa cảm xúc vào từng từ.',
      '🎯 Nguyên tắc: Hiểu sâu một câu tốt hơn đọc lướt mười câu.',
    ];

    final tip = tips[(_currentSectionIndex + widget.dayNumber) % tips.length];

    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.25)),
      ),
      child: Text(
        tip,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textSecondary,
          fontStyle: FontStyle.italic,
          height: 1.5,
        ),
      ),
    ).animate().fadeIn(delay: 400.ms);
  }

  Widget _buildBottomAction() {
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
            if (!_showTranslation)
              Padding(
                padding: const EdgeInsets.only(bottom: AppConstants.paddingS),
                child: Text(
                  '💬 Hãy tự dịch trước rồi mới xem đáp án!',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textHint,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _showTranslation ? _nextSection : _toggleTranslation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _showTranslation
                      ? AppColors.primary
                      : AppColors.secondary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _showTranslation
                          ? (_isLastSection
                                ? '✅ Hoàn thành bước này'
                                : '➡️ Đoạn tiếp theo')
                          : '👀 Xem bản dịch',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Mock Data ─────────────────────────────────────────────────────────────

  List<_TranslateSection> _buildSections() {
    return [
      _TranslateSection(
        englishText:
            'This familiar theme will occur in all seven sections of the TOEIC test. '
            'It is generally about office situations such as meetings, conferences, '
            'office equipment, policies and procedures and is related directly to both '
            'the Personnel and Purchasing themes.',
        vietnameseText:
            'Chủ đề quen thuộc này sẽ xuất hiện ở tất cả bảy phần của bài thi TOEIC. '
            'Chủ đề này nói về các tình huống trong văn phòng nói chung như là các cuộc họp, '
            'hội nghị, trang thiết bị trong văn phòng, các chính sách và các quy trình công '
            'việc trong công ty, và liên quan trực tiếp tới các chuyên đề Nhân sự và chuyên '
            'đề Mua sắm trong doanh nghiệp.',
        keyVocabs: [
          _KeyVocab('familiar', 'quen thuộc', 'adj'),
          _KeyVocab('conference', 'hội nghị', 'n'),
          _KeyVocab('procedure', 'quy trình', 'n'),
          _KeyVocab('personnel', 'nhân sự', 'n'),
        ],
      ),
      _TranslateSection(
        englishText:
            'In the office, situations will be about all kinds of meetings, memos, letters, '
            'faxes, emails, departments, all kinds of equipment that has to be looked after '
            'such as photocopiers, fax machines, computers, air conditioners, telephones.',
        vietnameseText:
            'Trong văn phòng, các tình huống sẽ là về các vấn đề gồm họp hành, thông báo nội bộ, '
            'thư tín, bản fax, thư điện tử, các phòng ban, tất cả các loại thiết bị văn phòng '
            'mà cần được quan tâm như là máy phô-tô, máy fax, máy tính, máy điều hòa, hay điện thoại.',
        keyVocabs: [
          _KeyVocab('memo', 'thông báo nội bộ', 'n'),
          _KeyVocab('department', 'phòng ban', 'n'),
          _KeyVocab('look after', 'quan tâm, chăm sóc', 'vp'),
          _KeyVocab('photocopier', 'máy phô-tô', 'n'),
        ],
      ),
      _TranslateSection(
        englishText:
            'It is helpful to understand collocations such as "to hold a meeting", '
            '"to downsize a department", or idiomatic/slang expressions such as "to sack someone", '
            '"to fire someone" or "show someone the door" or "let someone go" all of which mean '
            'to terminate (end) someone\'s employment.',
        vietnameseText:
            'Sẽ rất hữu ích khi hiểu về các cách kết hợp từ, chẳng hạn như "to hold a meeting" '
            '(tổ chức một buổi họp), "to downsize a department" (cắt giảm nhân viên của một phòng ban), '
            'hoặc các cách diễn đạt mang tính thành ngữ hoặc tiếng lóng như "to sack someone", '
            '"to fire someone", hoặc "show someone the door", hay "let someone go", '
            'tất cả đều có nghĩa là sa thải hoặc cho ai đó thôi việc.',
        keyVocabs: [
          _KeyVocab('collocation', 'cách kết hợp từ', 'n'),
          _KeyVocab('idiomatic', 'mang tính thành ngữ', 'adj'),
          _KeyVocab('terminate', 'chấm dứt', 'v'),
          _KeyVocab('sack / fire', 'sa thải', 'v'),
        ],
      ),
    ];
  }
}

// ─── Data Classes ───────────────────────────────────────────────────────────

class _TranslateSection {
  final String englishText;
  final String vietnameseText;
  final List<_KeyVocab> keyVocabs;

  const _TranslateSection({
    required this.englishText,
    required this.vietnameseText,
    required this.keyVocabs,
  });
}

class _KeyVocab {
  final String word;
  final String meaning;
  final String pos;

  const _KeyVocab(this.word, this.meaning, this.pos);
}

// ─── Sub-widgets ────────────────────────────────────────────────────────────

class _VocabChip extends StatefulWidget {
  final _KeyVocab vocab;

  const _VocabChip({required this.vocab});

  @override
  State<_VocabChip> createState() => _VocabChipState();
}

class _VocabChipState extends State<_VocabChip> {
  bool _showMeaning = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _showMeaning = !_showMeaning),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingM,
          vertical: AppConstants.paddingS,
        ),
        decoration: BoxDecoration(
          color: _showMeaning
              ? AppColors.primary
              : AppColors.primary.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: _showMeaning ? 1 : 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.vocab.word,
              style: AppTextStyles.bodySmall.copyWith(
                color: _showMeaning ? Colors.white : AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (_showMeaning) ...[
              const SizedBox(width: 6),
              Container(
                width: 1,
                height: 12,
                color: Colors.white.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 6),
              Text(
                widget.vocab.meaning,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ] else ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.vocab.pos,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// lib/presentation/screens/lesson/phases/phase_translate_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../data/models/lesson_model.dart';

class PhaseTranslateScreen extends StatefulWidget {
  final LessonPhase phase;
  final VoidCallback onComplete;

  const PhaseTranslateScreen({
    super.key,
    required this.phase,
    required this.onComplete,
  });

  @override
  State<PhaseTranslateScreen> createState() => _PhaseTranslateScreenState();
}

class _PhaseTranslateScreenState extends State<PhaseTranslateScreen> {
  int _currentIndex = 0;
  bool _isRevealed = false;
  int _correctCount = 0;
  late final List<_TranslateItem> _items;

  @override
  void initState() {
    super.initState();
    _items = _buildItemsFromPhase(widget.phase);
  }

  List<_TranslateItem> _buildItemsFromPhase(LessonPhase phase) {
    final enSentences = (phase.contentEn ?? '')
        .split('\n\n')
        .where((s) => s.trim().isNotEmpty)
        .toList();
    final viSentences = (phase.contentVi ?? '')
        .split('\n\n')
        .where((s) => s.trim().isNotEmpty)
        .toList();

    if (enSentences.isEmpty) return _getFallbackItems();

    return List.generate(
      enSentences.length,
      (i) => _TranslateItem(
        english: enSentences[i].trim(),
        vietnamese: i < viSentences.length ? viSentences[i].trim() : '',
      ),
    );
  }

  List<_TranslateItem> _getFallbackItems() {
    return const [
      _TranslateItem(
        english: 'No content available.',
        vietnamese: 'Chưa có nội dung.',
      ),
    ];
  }

  bool get _isLastItem => _currentIndex >= _items.length - 1;

  void _reveal() => setState(() => _isRevealed = true);

  void _markCorrect() {
    setState(() => _correctCount++);
    _next();
  }

  void _markWrong() => _next();

  void _next() {
    if (_isLastItem) {
      widget.onComplete();
      return;
    }
    setState(() {
      _currentIndex++;
      _isRevealed = false;
    });
  }

  void _previous() {
    if (_currentIndex <= 0) return;
    setState(() {
      _currentIndex--;
      _isRevealed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty)
      return Center(
        child: ElevatedButton(
          onPressed: widget.onComplete,
          child: const Text('Tiếp tục'),
        ),
      );
    final progress = (_currentIndex + 1) / _items.length;
    final item = _items[_currentIndex];

    return Column(
      children: [
        // ── Header ──────────────────────────────────────────────
        _buildHeader(progress),

        // ── Content ─────────────────────────────────────────────
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Instruction
                Container(
                  padding: const EdgeInsets.all(AppConstants.paddingM),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    border: Border.all(
                      color: AppColors.secondary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text('🔊', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: AppConstants.paddingS),
                      Expanded(
                        child: Text(
                          'Nghe lại audio rồi dịch đoạn tiếng Anh sang tiếng Việt!',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 300.ms),

                const SizedBox(height: AppConstants.paddingL),

                // English Text Card
                Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppConstants.paddingL),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusL,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.15),
                        ),
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
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(
                                AppConstants.radiusXS,
                              ),
                            ),
                            child: Text(
                              '🇬🇧 Tiếng Anh',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppConstants.paddingM),
                          Text(
                            item.english,
                            style: AppTextStyles.bodyLarge.copyWith(
                              height: 1.8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                    .animate(key: ValueKey('en_$_currentIndex'))
                    .fadeIn()
                    .slideX(begin: 0.05),

                const SizedBox(height: AppConstants.paddingL),

                // Vietnamese Translation (hidden/revealed)
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 400),
                  crossFadeState: _isRevealed
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: // Placeholder khi chưa reveal
                  GestureDetector(
                    onTap: _reveal,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppConstants.paddingL),
                      decoration: BoxDecoration(
                        color: AppColors.viChip.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusL,
                        ),
                        border: Border.all(
                          color: AppColors.viChipBorder.withValues(alpha: 0.5),
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.visibility_rounded,
                            color: AppColors.warning,
                            size: 32,
                          ),
                          const SizedBox(height: AppConstants.paddingS),
                          Text(
                            'Nhấn để xem bản dịch',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.warning,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '(Hãy tự dịch trước!)',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textHint,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  secondChild: // Bản dịch khi đã reveal
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppConstants.paddingL),
                    decoration: BoxDecoration(
                      color: AppColors.successSurface,
                      borderRadius: BorderRadius.circular(AppConstants.radiusL),
                      border: Border.all(
                        color: AppColors.success.withValues(alpha: 0.3),
                      ),
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
                            color: AppColors.success.withValues(alpha: 0.15),
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
                        const SizedBox(height: AppConstants.paddingM),
                        Text(
                          item.vietnamese,
                          style: AppTextStyles.bodyLarge.copyWith(
                            height: 1.8,
                            color: AppColors.success,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.paddingXL),

                // Self-assessment buttons (chỉ hiện khi đã reveal)
                if (_isRevealed) ...[
                  Text(
                    'Bạn dịch có đúng không?',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _markWrong,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: AppColors.error.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(
                                AppConstants.radiusM,
                              ),
                              border: Border.all(
                                color: AppColors.error.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  '😅',
                                  style: TextStyle(fontSize: 24),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Chưa đúng',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.error,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppConstants.paddingM),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: _markCorrect,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: AppColors.success.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(
                                AppConstants.radiusM,
                              ),
                              border: Border.all(
                                color: AppColors.success.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Text('✅', style: TextStyle(fontSize: 24)),
                                const SizedBox(height: 4),
                                Text(
                                  'Tôi dịch đúng!',
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
                  ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2),
                ],

                const SizedBox(height: AppConstants.paddingXL),
              ],
            ),
          ),
        ),

        // ── Reveal Button (khi chưa reveal) ────────────────────
        if (!_isRevealed)
          Container(
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
                  if (_currentIndex > 0)
                    Padding(
                      padding: const EdgeInsets.only(
                        right: AppConstants.paddingS,
                      ),
                      child: OutlinedButton(
                        onPressed: _previous,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.textSecondary,
                          side: const BorderSide(color: AppColors.border),
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: AppConstants.paddingM,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppConstants.radiusM,
                            ),
                          ),
                        ),
                        child: const Icon(Icons.arrow_back_ios, size: 16),
                      ),
                    ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _reveal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusM,
                          ),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        '👁️ Xem bản dịch',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.3),
      ],
    );
  }

  // ── Header ───────────────────────────────────────────────────

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
                  color: AppColors.secondary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppConstants.radiusS),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('🔄', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text(
                      'Nghe & Dịch',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.secondary,
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
                    '$_correctCount đúng',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingM),
                  Text(
                    '${_currentIndex + 1}/${_items.length}',
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
                AppColors.secondary,
              ),
              minHeight: 5,
            ),
          ),
        ],
      ),
    );
  }

  // ── Data ─────────────────────────────────────────────────────

  List<_TranslateItem> _buildItems() {
    return const [
      _TranslateItem(
        english:
            'This familiar theme will occur in all seven sections of the TOEIC test.',
        vietnamese:
            'Chủ đề quen thuộc này sẽ xuất hiện ở tất cả bảy phần của bài thi TOEIC.',
      ),
      _TranslateItem(
        english:
            'It is generally about office situations such as meetings, conferences, office equipment, policies and procedures.',
        vietnamese:
            'Chủ đề này nói về các tình huống trong văn phòng nói chung như là các cuộc họp, hội nghị, trang thiết bị trong văn phòng, các chính sách và các quy trình.',
      ),
      _TranslateItem(
        english:
            'In the office, situations will be about all kinds of meetings, memos, letters, faxes, emails, departments.',
        vietnamese:
            'Trong văn phòng, các tình huống sẽ là về các vấn đề gồm họp hành, thông báo nội bộ, thư tín, bản fax, thư điện tử, các phòng ban.',
      ),
      _TranslateItem(
        english:
            'It is helpful to understand collocations such as "to hold a meeting" or "to downsize a department".',
        vietnamese:
            'Sẽ rất hữu ích khi hiểu về các cách kết hợp từ như "to hold a meeting" (tổ chức họp) hay "to downsize a department" (cắt giảm nhân viên).',
      ),
      _TranslateItem(
        english:
            'The office theme also uses verbal announcements and written memos to communicate important news to the employees.',
        vietnamese:
            'Chuyên đề Văn phòng này cũng sử dụng các thông báo bằng lời và các thông báo nội bộ dưới dạng viết để truyền tải những tin tức quan trọng tới nhân viên.',
      ),
    ];
  }
}

// ── Data Model ───────────────────────────────────────────────────────────────

class _TranslateItem {
  final String english;
  final String vietnamese;

  const _TranslateItem({required this.english, required this.vietnamese});
}

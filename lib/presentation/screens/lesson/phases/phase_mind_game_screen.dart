import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../widgets/mixed_text_widget.dart';

class PhaseMindGameScreen extends StatefulWidget {
  final int dayNumber;
  final String themeId;
  final VoidCallback onComplete;

  const PhaseMindGameScreen({
    super.key,
    required this.dayNumber,
    required this.themeId,
    required this.onComplete,
  });

  @override
  State<PhaseMindGameScreen> createState() => _PhaseMindGameScreenState();
}

class _PhaseMindGameScreenState extends State<PhaseMindGameScreen> {
  int _currentIndex = 0;
  int _correctCount = 0;

  final List<_MixedParagraph> _paragraphs = [
    _MixedParagraph(
      segments: [
        _Segment('This familiar theme ', false, null),
        _Segment('sẽ xuất hiện', true, 'will occur'),
        _Segment(' in ', false, null),
        _Segment('tất cả bảy phần', true, 'all seven sections'),
        _Segment(' of the TOEIC test.', false, null),
      ],
    ),
    _MixedParagraph(
      segments: [
        _Segment('It is generally about ', false, null),
        _Segment('các tình huống văn phòng', true, 'office situations'),
        _Segment(' such as ', false, null),
        _Segment('các cuộc họp', true, 'meetings'),
        _Segment(', conferences, ', false, null),
        _Segment('thiết bị văn phòng', true, 'office equipment'),
        _Segment('.', false, null),
      ],
    ),
    _MixedParagraph(
      segments: [
        _Segment('Ở trong văn phòng', true, 'In the office'),
        _Segment(', situations will be about all ', false, null),
        _Segment('các thông báo nội bộ', true, 'memos'),
        _Segment(', letters, faxes, emails, ', false, null),
        _Segment('các phòng ban', true, 'departments'),
        _Segment('.', false, null),
      ],
    ),
  ];

  bool get _isLastParagraph => _currentIndex >= _paragraphs.length - 1;

  void _onParagraphComplete(int correct, int total) {
    setState(() {
      _correctCount += correct;
    });
  }

  void _nextParagraph() {
    if (_isLastParagraph) {
      widget.onComplete();
    } else {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentIndex + 1) / _paragraphs.length;

    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(AppConstants.paddingM),
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
                      children: [
                        const Text('🎮', style: TextStyle(fontSize: 14)),
                        const SizedBox(width: 4),
                        Text(
                          'Trò chơi tư duy',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.warning,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${_currentIndex + 1}/${_paragraphs.length}',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
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
                    AppColors.warning,
                  ),
                  minHeight: 5,
                ),
              ),
            ],
          ),
        ),

        // Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            child: Column(
              children: [
                // Instruction
                Container(
                  padding: const EdgeInsets.all(AppConstants.paddingM),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                  child: Row(
                    children: [
                      const Text('💡', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: AppConstants.paddingS),
                      Expanded(
                        child: Text(
                          'Chạm vào cụm từ tiếng Việt và NÓI TO bằng tiếng Anh!',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.warning,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(),

                const SizedBox(height: AppConstants.paddingL),

                // Mixed Text
                MixedTextWidget(
                  key: ValueKey(_currentIndex),
                  paragraph: _paragraphs[_currentIndex],
                  onComplete: _onParagraphComplete,
                ),

                const SizedBox(height: AppConstants.paddingXL),
              ],
            ),
          ),
        ),

        // Bottom Button
        Container(
          padding: const EdgeInsets.all(AppConstants.paddingM),
          decoration: BoxDecoration(
            color: AppColors.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _nextParagraph,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                ),
                child: Text(
                  _isLastParagraph ? '✅ Hoàn thành' : '➡️ Đoạn tiếp theo',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Data classes
class _MixedParagraph {
  final List<_Segment> segments;
  const _MixedParagraph({required this.segments});
}

class _Segment {
  final String text;
  final bool isVietnamese;
  final String? answer;
  const _Segment(this.text, this.isVietnamese, this.answer);
}

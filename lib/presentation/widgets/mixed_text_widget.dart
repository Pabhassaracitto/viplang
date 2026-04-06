import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../presentation/screens/lesson/phases/phase_mind_game_screen.dart';

class MixedTextWidget extends StatefulWidget {
  final dynamic paragraph;
  final Function(int correct, int total)? onComplete;

  const MixedTextWidget({super.key, required this.paragraph, this.onComplete});

  @override
  State<MixedTextWidget> createState() => _MixedTextWidgetState();
}

class _MixedTextWidgetState extends State<MixedTextWidget> {
  final Set<int> _revealedIndices = {};
  int _correctCount = 0;

  @override
  Widget build(BuildContext context) {
    final segments = (widget.paragraph as dynamic).segments as List;
    final vietnameseCount = segments.where((s) => s.isVietnamese).length;
    final allRevealed = _revealedIndices.length >= vietnameseCount;

    if (allRevealed && widget.onComplete != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onComplete!(_correctCount, vietnameseCount);
      });
    }

    return Container(
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
      child: Wrap(
        children: List.generate(segments.length, (index) {
          final segment = segments[index];
          if (segment.isVietnamese) {
            return _buildVietnameseSegment(segment, index);
          } else {
            return Text(
              segment.text,
              style: AppTextStyles.bodyMedium.copyWith(
                height: 2.0,
                color: AppColors.textPrimary,
              ),
            );
          }
        }),
      ),
    );
  }

  Widget _buildVietnameseSegment(dynamic segment, int index) {
    final isRevealed = _revealedIndices.contains(index);

    return GestureDetector(
          onTap: () {
            if (!isRevealed) {
              setState(() {
                _revealedIndices.add(index);
                _correctCount++;
              });
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingS,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: isRevealed
                  ? AppColors.success.withValues(alpha: 0.15)
                  : AppColors.warning.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
              border: Border.all(
                color: isRevealed
                    ? AppColors.success.withValues(alpha: 0.5)
                    : AppColors.warning.withValues(alpha: 0.5),
              ),
            ),
            child: Text(
              isRevealed ? segment.answer! : segment.text,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isRevealed ? AppColors.success : AppColors.warning,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
        .animate(target: isRevealed ? 1 : 0)
        .scale(
          begin: const Offset(1, 1),
          end: const Offset(1.05, 1.05),
          duration: 150.ms,
        );
  }
}

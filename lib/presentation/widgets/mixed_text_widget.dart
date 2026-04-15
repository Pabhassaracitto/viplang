import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/models/mixed_segment_model.dart';
import '../blocs/mind_game_bloc/mind_game_bloc.dart';

class MixedTextWidget extends StatefulWidget {
  final MixedParagraph paragraph;
  final Function(int correct, int total)? onComplete;

  const MixedTextWidget({super.key, required this.paragraph, this.onComplete});

  @override
  State<MixedTextWidget> createState() => MixedTextWidgetState();
}

class MixedTextWidgetState extends State<MixedTextWidget> {
  final Map<int, bool> _revealed = {};
  bool _completeCalled = false;

  List<MixedSegment> get _segments => widget.paragraph.segments;

  List<int> get _viIndices {
    List<int> indices = [];
    for (int i = 0; i < _segments.length; i++) {
      if (_segments[i].isVietnamese) indices.add(i);
    }
    return indices;
  }

  int get _totalVi => _viIndices.length;
  int get _revealedCount => _revealed.values.where((v) => v).length;
  bool get _allRevealed => _revealedCount >= _totalVi;

  @override
  void initState() {
    super.initState();
    _initRevealed();
  }

  void _initRevealed() {
    _revealed.clear();
    _completeCalled = false;
    for (final i in _viIndices) {
      _revealed[i] = false;
    }
  }

  @override
  void didUpdateWidget(covariant MixedTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.key != widget.key) {
      setState(() => _initRevealed());
    }
  }

  void _revealSegment(int index) {
    if (_revealed[index] == true) return;
    setState(() {
      _revealed[index] = true;
    });
    _checkComplete();
  }

  // ✅ Public method để PhaseMindGameScreen gọi được qua GlobalKey
  void _revealAll() {
    setState(() {
      for (final i in _viIndices) {
        _revealed[i] = true;
      }
    });
    _checkComplete();
  }

  // Alias cho revealAll để tương thích với hướng dẫn
  void revealAll() => _revealAll();

  void _checkComplete() {
    if (_allRevealed && !_completeCalled && widget.onComplete != null) {
      _completeCalled = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          widget.onComplete?.call(_revealedCount, _totalVi);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MindGameBloc, MindGameState>(
      listenWhen: (prev, curr) {
        if (curr is MindGameActive && prev is MindGameActive) {
          return curr.revealedIndices.length > prev.revealedIndices.length;
        }
        return false;
      },
      listener: (context, state) {
        if (state is MindGameActive) {
          // Nếu Bloc báo hiệu reveal all (qua event), widget cũng cập nhật
          if (state.revealedIndices.length >= state.totalViSegments) {
            revealAll();
          }
        }
      },
      child: Container(
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
          crossAxisAlignment: WrapCrossAlignment.center,
          children: List.generate(_segments.length, (index) {
            final segment = _segments[index];
            if (segment.isVietnamese) {
              return _buildViChip(segment, index);
            } else {
              return _buildEnText(segment.text);
            }
          }),
        ),
      ),
    );
  }

  Widget _buildEnText(String text) {
    return Text(
      text,
      style: AppTextStyles.bodyMedium.copyWith(
        height: 2.2,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildViChip(MixedSegment segment, int index) {
    final isRevealed = _revealed[index] == true;

    return RepaintBoundary(
          child: GestureDetector(
            onTap: () => _revealSegment(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingS,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: isRevealed ? AppColors.enReveal : AppColors.viChip,
                borderRadius: BorderRadius.circular(AppConstants.radiusS),
                border: Border.all(
                  color: isRevealed
                      ? AppColors.enRevealBorder
                      : AppColors.viChipBorder,
                  width: 1.5,
                ),
                boxShadow: isRevealed
                    ? [
                        BoxShadow(
                          color: AppColors.success.withValues(alpha: 0.15),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                isRevealed ? (segment.answer ?? segment.text) : segment.text,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isRevealed
                      ? AppColors.enRevealText
                      : AppColors.viChipText,
                  height: 1.4,
                ),
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

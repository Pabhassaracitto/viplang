// lib/presentation/screens/lesson/phases/phase_mind_game_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../data/models/mixed_segment_model.dart';
import '../../../blocs/mind_game_bloc/mind_game_bloc.dart';
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
  // Track xem paragraph hiện tại đã reveal hết chưa
  bool _currentParagraphDone = false;
  int _currentCorrect = 0;
  int _currentTotal = 0;

  /// Chia segments thành paragraphs dựa trên '\n\n'
  /// Mỗi paragraph tối đa 6 Vietnamese segments để tránh quá tải
  List<MixedParagraph> _splitToParagraphs(List<MixedSegment> segments) {
    if (segments.isEmpty) return [];

    // Bước 1: Tách tại \n\n
    final List<List<MixedSegment>> rawGroups = [];
    List<MixedSegment> current = [];

    for (final seg in segments) {
      if (!seg.isVietnamese && seg.text.contains('\n\n')) {
        final parts = seg.text.split('\n\n');

        // Phần trước \n\n
        if (parts[0].trim().isNotEmpty) {
          current.add(MixedSegment(text: parts[0]));
        }
        if (current.isNotEmpty) {
          rawGroups.add(List.from(current));
          current = [];
        }

        // Phần sau \n\n
        if (parts.length > 1 && parts[1].trim().isNotEmpty) {
          current.add(MixedSegment(text: parts[1]));
        }
      } else {
        current.add(seg);
      }
    }
    if (current.isNotEmpty) {
      rawGroups.add(List.from(current));
    }

    // Bước 2: Nếu không có \n\n, chia theo số VI segments (tối đa 6/nhóm)
    if (rawGroups.isEmpty) {
      return _chunkByViCount(segments, maxViPerChunk: 6);
    }

    // Bước 3: Nếu nhóm quá nhiều VI segments, chia nhỏ thêm
    final result = <MixedParagraph>[];
    for (final group in rawGroups) {
      final viCount = group.where((s) => s.isVietnamese).length;
      if (viCount > 8) {
        result.addAll(_chunkByViCount(group, maxViPerChunk: 6));
      } else {
        result.add(MixedParagraph(segments: group));
      }
    }

    return result.isEmpty ? [MixedParagraph(segments: segments)] : result;
  }

  /// Chia segments thành các nhóm, mỗi nhóm tối đa [maxViPerChunk] VI segments
  List<MixedParagraph> _chunkByViCount(
    List<MixedSegment> segs, {
    int maxViPerChunk = 6,
  }) {
    final result = <MixedParagraph>[];
    List<MixedSegment> chunk = [];
    int viCount = 0;

    for (final seg in segs) {
      if (seg.isVietnamese) {
        if (viCount >= maxViPerChunk && chunk.isNotEmpty) {
          result.add(MixedParagraph(segments: List.from(chunk)));
          chunk = [];
          viCount = 0;
        }
        viCount++;
      }
      chunk.add(seg);
    }

    if (chunk.isNotEmpty) {
      result.add(MixedParagraph(segments: List.from(chunk)));
    }

    return result.isEmpty ? [MixedParagraph(segments: segs)] : result;
  }

  void _onParagraphComplete(int correct, int total) {
    setState(() {
      _currentParagraphDone = true;
      _currentCorrect = correct;
      _currentTotal = total;
    });
  }

  void _nextParagraph(List<MixedParagraph> paragraphs) {
    if (_currentIndex >= paragraphs.length - 1) {
      widget.onComplete();
    } else {
      setState(() {
        _currentIndex++;
        _currentParagraphDone = false;
        _currentCorrect = 0;
        _currentTotal = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MindGameBloc, MindGameState>(
      builder: (context, state) {
        List<MixedParagraph> paragraphs;

        if (state is MindGameActive && state.segments.isNotEmpty) {
          paragraphs = _splitToParagraphs(state.segments);
        } else {
          paragraphs = _getFallbackParagraphs();
        }

        if (paragraphs.isEmpty) {
          return Center(
            child: ElevatedButton(
              onPressed: widget.onComplete,
              child: const Text('Tiếp tục'),
            ),
          );
        }

        // Clamp index phòng out of bounds
        if (_currentIndex >= paragraphs.length) {
          _currentIndex = paragraphs.length - 1;
        }

        final progress = (_currentIndex + 1) / paragraphs.length;
        final isLast = _currentIndex >= paragraphs.length - 1;

        return Column(
          children: [
            // ── Header ──────────────────────────────────────────
            _buildHeader(progress, paragraphs.length),

            // ── Content ─────────────────────────────────────────
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
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text('💡', style: TextStyle(fontSize: 20)),
                          const SizedBox(width: AppConstants.paddingS),
                          Expanded(
                            child: Text(
                              'Chạm vào cụm từ tiếng Việt → NÓI TO bằng tiếng Anh → Tap lần nữa để xem đáp án!',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.warning,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(),

                    const SizedBox(height: AppConstants.paddingM),

                    // Paragraph info
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.paddingS,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(
                              AppConstants.radiusS,
                            ),
                          ),
                          child: Text(
                            'Đoạn ${_currentIndex + 1}/${paragraphs.length}',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppConstants.paddingS),
                        Text(
                          '${paragraphs[_currentIndex].segments.where((s) => s.isVietnamese).length} cụm từ',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppConstants.paddingM),

                    // Mixed Text Widget
                    MixedTextWidget(
                      key: ValueKey(_currentIndex),
                      paragraph: paragraphs[_currentIndex],
                      onComplete: _onParagraphComplete,
                    ),

                    const SizedBox(height: AppConstants.paddingXL),

                    // Score nếu đã hoàn thành paragraph
                    if (_currentParagraphDone) ...[
                      _buildParagraphScore(),
                      const SizedBox(height: AppConstants.paddingM),
                    ],
                  ],
                ),
              ),
            ),

            // ── Bottom Button ────────────────────────────────────
            _buildBottomButton(isLast, paragraphs),
          ],
        );
      },
    );
  }

  Widget _buildHeader(double progress, int total) {
    return Container(
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
                '${_currentIndex + 1}/$total đoạn',
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
    );
  }

  Widget _buildParagraphScore() {
    final pct = _currentTotal > 0
        ? (_currentCorrect / _currentTotal * 100).round()
        : 0;
    final color = pct >= 80
        ? AppColors.success
        : pct >= 60
        ? AppColors.warning
        : AppColors.error;

    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Text(
            pct >= 80
                ? '🎉'
                : pct >= 60
                ? '👍'
                : '💪',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: AppConstants.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Đoạn này: $_currentCorrect/$_currentTotal cụm từ đúng ($pct%)',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  pct >= 80
                      ? 'Xuất sắc! Sẵn sàng qua đoạn tiếp!'
                      : 'Hãy thử lại đoạn này trước khi tiếp tục!',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2);
  }

  Widget _buildBottomButton(bool isLast, List<MixedParagraph> paragraphs) {
    return Container(
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Reveal All button
            if (!_currentParagraphDone)
              Padding(
                padding: const EdgeInsets.only(bottom: AppConstants.paddingS),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<MindGameBloc>().add(RevealAllEvent());
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.warning,
                      side: const BorderSide(color: AppColors.warning),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                      ),
                    ),
                    child: const Text(
                      '👁️ Xem tất cả đáp án',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

            // Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _nextParagraph(paragraphs),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentParagraphDone
                      ? AppColors.primary
                      : AppColors.textTertiary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                ),
                child: Text(
                  isLast ? '✅ Hoàn thành' : '➡️ Đoạn tiếp theo',
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
    );
  }

  List<MixedParagraph> _getFallbackParagraphs() {
    return [
      const MixedParagraph(
        segments: [
          MixedSegment.english('This familiar theme '),
          MixedSegment.vietnamese('sẽ xuất hiện', 'will occur'),
          MixedSegment.english(' in '),
          MixedSegment.vietnamese('tất cả bảy phần', 'all seven sections'),
          MixedSegment.english(' of the TOEIC test.'),
        ],
      ),
    ];
  }
}

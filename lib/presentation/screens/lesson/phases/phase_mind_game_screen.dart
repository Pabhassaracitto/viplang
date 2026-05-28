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
  bool _currentParagraphDone = false;
  int _currentCorrect = 0;
  int _currentTotal = 0;
  List<MixedParagraph> _paragraphs = []; // Thêm biến này để lưu trữ paragraphs

  // ✅ GlobalKey để gọi revealAll() trực tiếp trên MixedTextWidget

  final GlobalKey<MixedTextWidgetState> _mixedTextKey =
      GlobalKey<MixedTextWidgetState>();

  /// Chia segments thành paragraphs dựa trên '\n\n'
  /// Mỗi paragraph tối đa 8 Vietnamese segments để tránh quá tải
  List<MixedParagraph> _splitToParagraphs(List<MixedSegment> segments) {
    if (segments.isEmpty) return [];

    // Bước 1: Tách tại \n\n
    final List<List<MixedSegment>> rawGroups = [];
    List<MixedSegment> current = [];

    for (int i = 0; i < segments.length; i++) {
      final seg = segments[i];

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
        for (int j = 1; j < parts.length; j++) {
          if (parts[j].trim().isNotEmpty) {
            if (j < parts.length - 1) {
              // Nếu còn nhiều phần, tạo group riêng
              rawGroups.add([MixedSegment(text: parts[j])]);
            } else {
              // Phần cuối, thêm vào current
              current.add(MixedSegment(text: parts[j]));
            }
          }
        }
      } else {
        current.add(seg);
      }
    }

    if (current.isNotEmpty) {
      rawGroups.add(List.from(current));
    }

    // Bước 2: Nếu không có \n\n, chia theo số VI segments
    if (rawGroups.isEmpty) {
      return _chunkByViCount(segments, maxViPerChunk: 8);
    }

    // Bước 3: Nếu nhóm quá nhiều VI segments, chia nhỏ thêm
    final result = <MixedParagraph>[];
    for (final group in rawGroups) {
      final viCount = group.where((s) => s.isVietnamese).length;
      if (viCount > 10) {
        result.addAll(_chunkByViCount(group, maxViPerChunk: 8));
      } else if (viCount > 0) {
        result.add(MixedParagraph(segments: group));
      } else {
        // Group chỉ có text EN, gộp vào group tiếp theo hoặc tạo mới
        if (result.isNotEmpty) {
          final lastSegments = List<MixedSegment>.from(result.last.segments);
          lastSegments.addAll(group);
          result[result.length - 1] = MixedParagraph(segments: lastSegments);
        } else {
          result.add(MixedParagraph(segments: group));
        }
      }
    }

    return result.isEmpty ? [MixedParagraph(segments: segments)] : result;
  }

  /// Chia segments thành các nhóm, mỗi nhóm tối đa [maxViPerChunk] VI segments
  List<MixedParagraph> _chunkByViCount(
    List<MixedSegment> segs, {
    int maxViPerChunk = 8,
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
    if (!mounted) return;
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

  void _previousParagraph() {
    if (_currentIndex <= 0) return;
    setState(() {
      _currentIndex--;
      _currentParagraphDone = false;
      _currentCorrect = 0;
      _currentTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MindGameBloc, MindGameState>(
      // Chỉ lắng nghe khi segments thay đổi hoặc khi trạng thái chuyển sang Active lần đầu
      listenWhen: (previous, current) =>
          (previous is! MindGameActive && current is MindGameActive) ||
          (previous is MindGameActive &&
              current is MindGameActive &&
              previous.segments != current.segments),
      listener: (context, state) {
        if (state is MindGameActive && state.segments.isNotEmpty) {
          // Chỉ tính toán paragraphs khi segments thực sự thay đổi từ Bloc
          setState(() {
            _paragraphs = _splitToParagraphs(state.segments);
            _currentIndex = 0; // Reset index khi có segments mới
            _currentParagraphDone = false;
            _currentCorrect = 0;
            _currentTotal = 0;
          });
        }
      },
      child: BlocBuilder<MindGameBloc, MindGameState>(
        builder: (context, state) {
          // Sử dụng danh sách _paragraphs đã được lưu trữ
          // Nếu _paragraphs rỗng (ví dụ: trạng thái ban đầu hoặc chưa có segments từ bloc),
          // thì sử dụng fallback.
          final paragraphsToDisplay = _paragraphs.isNotEmpty
              ? _paragraphs
              : _getFallbackParagraphs();

          if (paragraphsToDisplay.isEmpty) {
            return Center(
              child: ElevatedButton(
                onPressed: widget.onComplete,
                child: const Text('Tiếp tục'),
              ),
            );
          }

          // Đảm bảo index không vượt quá giới hạn
          if (_currentIndex >= paragraphsToDisplay.length) {
            _currentIndex = paragraphsToDisplay.length - 1;
          }

          final progress = (_currentIndex + 1) / paragraphsToDisplay.length;
          final isLast = _currentIndex >= paragraphsToDisplay.length - 1;
          final currentViCount = paragraphsToDisplay[_currentIndex].segments
              .where((s) => s.isVietnamese)
              .length;

          return Column(
            children: [
              // ── Header ──────────────────────────────────────────
              _buildHeader(progress, paragraphsToDisplay.length),

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
                                'Nhấn chip 🟡 → Nói to bằng tiếng Anh → Chip đổi sang 🟢 là đáp án!',
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
                              'Đoạn ${_currentIndex + 1}/${paragraphsToDisplay.length}',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppConstants.paddingS),
                          Text(
                            '$currentViCount cụm từ cần dịch',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppConstants.paddingM),

                      // Mixed Text Widget
                      MixedTextWidget(
                        key: _mixedTextKey,
                        paragraph: paragraphsToDisplay[_currentIndex],
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

              // ── Bottom Button ──────────────────────────────────────────
              _buildBottomButton(isLast, paragraphsToDisplay),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(double progress, int total) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
              border: Border.all(
                color: AppColors.warning.withValues(alpha: 0.15),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('🎮', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: AppConstants.paddingS),
                    Expanded(
                      child: Text(
                        'CHƠI TRÒ CHƠI TƯ DUY',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.warning,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingS),
                    // Back button integrated inside the box
                    if (_currentIndex > 0) ...[
                      GestureDetector(
                        onTap: _previousParagraph,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(
                              AppConstants.radiusS,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                size: 10,
                                color: AppColors.warning,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Đoạn trước',
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.warning,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.warning.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusS,
                        ),
                      ),
                      child: Text(
                        '${_currentIndex + 1}/$total đoạn',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.warning,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.paddingM),
                Text(
                  'Hãy NÓI TO những cụm từ tiếng Việt 🟡 thành tiếng Anh dựa vào bài đọc trước. '
                  'Nhấn vào chip để kiểm tra đáp án 🟢.\n\n'
                  '⚠️ Nếu bạn nói thầm hoặc chỉ nhìn bằng mắt, bạn sẽ không đạt tiến bộ đáng kể!',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.warning,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(),
          const SizedBox(height: AppConstants.paddingM),
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
                  '$_currentCorrect/$_currentTotal từ đã reveal ($pct%)',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  pct >= 80
                      ? 'Xuất sắc! Nhấn tiếp tục!'
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
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _revealAllCurrentParagraph();
                    },
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text(
                      'Xem tất cả đáp án',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                      : AppColors.primary.withValues(alpha: 0.5),
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

  void _revealAllCurrentParagraph() {
    _mixedTextKey.currentState?.revealAll();
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

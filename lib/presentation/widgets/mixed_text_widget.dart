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
  final Map<int, bool> _hasBeenRevealed = {};
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
  int get _revealedCount => _hasBeenRevealed.values.where((v) => v).length;
  bool get _allRevealed => _revealedCount >= _totalVi;

  @override
  void initState() {
    super.initState();
    _initRevealed();
  }

  void _initRevealed() {
    _revealed.clear();
    _hasBeenRevealed.clear();
    _completeCalled = false;
    for (final i in _viIndices) {
      _revealed[i] = false;
      _hasBeenRevealed[i] = false;
    }
  }

  @override
  void didUpdateWidget(covariant MixedTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.paragraph != widget.paragraph) {
      setState(() => _initRevealed());
    }
  }

  void _revealSegment(int index) {
    setState(() {
      final wasRevealed = _revealed[index] == true;
      _revealed[index] = !wasRevealed;
      if (!wasRevealed) {
        _hasBeenRevealed[index] = true;
      }
    });
    _checkComplete();
  }

  // ✅ Public method để PhaseMindGameScreen gọi được qua GlobalKey
  void _revealAll() {
    setState(() {
      for (final i in _viIndices) {
        _revealed[i] = true;
        _hasBeenRevealed[i] = true;
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

  bool _isVietnamese(String s1, String s2) {
    // 1. Check for explicit Vietnamese accented characters (No raw-string regex bounds issue)
    final viSpecialChars = RegExp(
      '[àáảãạăắằẳẵặâấầẩẫậèéẻẽẹêếềểễệìíỉĩịòóỏõọôốồổỗộơớờởỡợùúủũụưứừửữựỳýỷỹỵđ' // No change here
      'ÀÁẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬÈÉẺẼẸÊẾỀỂỄỆÌÍỈĨỊÒÓỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÙÚỦŨỤƯỨỪỬỮỰỲÝỶỸỴĐ]',
    );
    final hasVi1 = viSpecialChars.hasMatch(s1);
    final hasVi2 = viSpecialChars.hasMatch(s2);
    if (hasVi1 != hasVi2) {
      return hasVi1; // The one with explicit Vietnamese accented characters is Vietnamese!
    }

    // 2. Count non-ASCII characters (Vietnamese characters in Unicode usually fall outside standard ASCII)
    final nonAscii1 = RegExp(r'[^\x00-\x7F]').allMatches(s1).length;
    final nonAscii2 = RegExp(r'[^\x00-\x7F]').allMatches(s2).length;
    if (nonAscii1 != nonAscii2) {
      return nonAscii1 > nonAscii2;
    }

    // 3. Clean strings to lowercase alphanumeric words for dictionary checking (Keep accents intact)
    List<String> getWords(String s) {
      return s
          .toLowerCase()
          .replaceAll(
            RegExp(
              r'[^a-z0-9àáảãạăắằẳẵặâấầẩẫậèéẻẽẹêếềểễệìíỉĩịòóỏõọôốồổỗộơớờởỡợùúủũụưứừửữựỳýỷỹỵđ\s]',
            ),
            '',
          )
          .split(RegExp(r'\s+'))
          .where((w) => w.isNotEmpty)
          .toList();
    }

    final words1 = getWords(s1);
    final words2 = getWords(s2);

    // 4. Common English vocabulary check
    final commonEn = {
      'the', 'is', 'at', 'on', 'in', 'to', 'for', 'of', 'and', 'with',
      'but', 'not', 'you', 'we', 'that', 'this', 'have', 'be', 'are',
      'up',
      'out',
      'off',
      'down',
      'about',
      'back',
      'right', // Removed duplicate 'will'
      'now',
      'it',
      'an',
      'our',
      'their',
      'your',
      'my',
      'his',
      'her', // Removed duplicate 'will'
      'they', 'them', 'who', 'which', 'what', 'where', 'when', 'how',
      'why', 'can', 'could', 'should', 'would', 'office', 'meeting',
      'equipment',
      'procedure',
      'procedures',
      'member',
      'space',
      'team',
      'people',
      'chair', 'desk', 'file', 'book', 'need', 'job', 'available',
      'occur', 'section', 'sections', 'test', 'memos', 'memo',
      'department', 'departments', 'processed', 'form', 'evaluation',
      'human',
      'resources',
      'research',
      'competitor',
      'competitors',
      'outperform',
    };

    int enCount1 = words1
        .where(
          (w) =>
              commonEn.contains(w) ||
              commonEn.contains('${w}s') ||
              (w.endsWith('s') &&
                  commonEn.contains(w.substring(0, w.length - 1))),
        )
        .length;
    int enCount2 = words2
        .where(
          (w) =>
              commonEn.contains(w) ||
              commonEn.contains('${w}s') ||
              (w.endsWith('s') &&
                  commonEn.contains(w.substring(0, w.length - 1))),
        )
        .length;
    if (enCount1 != enCount2) {
      return enCount1 <
          enCount2; // The one with FEWER English matched words is Vietnamese
    }

    // 5. Common Vietnamese vocabulary check
    final commonVi = {
      'và',
      'có',
      'không',
      'là',
      'các',
      'của',
      'ngày',
      'học',
      'từ',
      'trong',
      'cho',
      'bằng',
      'với',
      'được',
      'này',
      'tôi',
      'bạn',
      'ta',
      'ra',
      'đi',
      'vào',
      'lên',
      'xuống',
      'một',
      'nhiều',
      'ít',
      'quá',
      'văn',
      'phòng',
      'máy',
      'thực',
      'tế',
      'thế',
      'nào',
      'chúng',
      'ông',
      'bà',
      'anh',
      'em',
      'nhất',
      'hơn',
      'đã',
      'đang',
      'sẽ',
      'chưa',
      'bị',
      'tự',
      'mình',
      'ngay',
      'tập',
      'lúc',
      'nghiên',
      'cứu',
      'chuyên',
      'đề',
      'bình',
      'luận',
      'phản',
      'hồi',
      'chiến',
      'lược',
      'phát',
      'triển',
      'thiết',
      'quy',
      'trình',
      'báo',
      'cáo',
      'quyết',
      'định',
      'thông',
    };

    int viCount1 = words1.where((w) => commonVi.contains(w)).length;
    int viCount2 = words2.where((w) => commonVi.contains(w)).length;
    if (viCount1 != viCount2) {
      return viCount1 > viCount2;
    }

    // 6. Default fallback
    return s1.length > s2.length;
  }

  String _getEnglishText(MixedSegment segment) {
    final text = segment.text;
    final answer = segment.answer;
    if (answer == null || answer.isEmpty) return text;

    final textIsVi = _isVietnamese(text, answer);

    if (textIsVi) {
      return answer; // text is Vietnamese, so answer is English.
    } else {
      return text; // text is English.
    }
  }

  String _getVietnameseText(MixedSegment segment) {
    final text = segment.text;
    final answer = segment.answer;
    if (answer == null || answer.isEmpty) return text;

    final textIsVi = _isVietnamese(text, answer);

    if (textIsVi) {
      return text; // text is Vietnamese.
    } else {
      return answer; // text is English, so answer is Vietnamese.
    }
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
                isRevealed
                    ? _getEnglishText(segment)
                    : _getVietnameseText(segment),
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

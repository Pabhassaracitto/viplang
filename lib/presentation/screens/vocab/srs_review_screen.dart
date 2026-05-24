import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/services/hive_service.dart';
import '../../../core/utils/srs_algorithm.dart';
import '../../../data/models/vocab_model.dart';
import '../../../presentation/blocs/progress/progress_event.dart';
import '../../blocs/progress/progress_bloc.dart';
import '../../../data/models/user_progress_model.dart';

// ─── TTS Service (file-scoped singleton, không cần file riêng nếu chưa có) ──
// Nếu đã có TtsService riêng thì import và xóa class này
class _TtsService {
  static final _TtsService _instance = _TtsService._();
  factory _TtsService() => _instance;
  _TtsService._();

  final FlutterTts _tts = FlutterTts();
  bool _ready = false;

  Future<void> _init() async {
    if (_ready) return;
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.45); // Hơi chậm hơn Gemini đề xuất để rõ hơn
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    _ready = true;
  }

  /// Phát âm — tự stop nếu đang phát để tránh chồng chéo
  Future<void> speak(String text) async {
    if (text.trim().isEmpty) return;
    await _init();
    await _tts.stop();
    await _tts.speak(text.trim());
  }

  Future<void> stop() async {
    await _tts.stop();
  }
}

// ─── Main Screen ─────────────────────────────────────────────────────────────

class SrsReviewScreen extends StatefulWidget {
  final VoidCallback? onClose;

  const SrsReviewScreen({super.key, this.onClose});

  @override
  State<SrsReviewScreen> createState() => _SrsReviewScreenState();
}

class _SrsReviewScreenState extends State<SrsReviewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  bool _isFlipped = false;
  bool _showRating = false;
  int _currentIndex = 0;
  int _sessionCorrect = 0;
  int _sessionTotal = 0;

  SrsQuality? _selectedQuality;
  bool _isProcessing = false;

  // TTS — dùng singleton, không tạo mới mỗi lần
  final _tts = _TtsService();

  final List<VocabModel> _reviewCards = [];

  @override
  void initState() {
    super.initState();

    final box = HiveService.vocabBox;
    final progressBox = HiveService.progressBox;
    final progress =
        progressBox.get('current_user') ??
        UserProgressModel(userId: 'local_user');

    // 1. Chỉ lấy các themeId của những bài học đã hoàn thành thực tế
    final completedThemeIds = progress.completedLessons
        .map((key) => key.split('_day_')[0])
        .toSet();

    if (box.isNotEmpty) {
      // 2. Chỉ lọc những từ của theme đã học HOẶC từ vựng đã có lịch sử ôn tập (repetitionCount > 0 hoặc nextReview != null)
      final eligibleVocabs = box.values.where((v) {
        if (v.nextReview != null || v.repetitionCount > 0) {
          return true;
        }
        return completedThemeIds.contains(v.themeId);
      }).toList();

      final now = DateTime.now();

      // 3. Phân nhóm thẻ sang Thẻ đến hạn (Due Cards) và Thẻ mới (New Cards)
      final dueCards = eligibleVocabs.where((v) {
        return v.nextReview != null && now.isAfter(v.nextReview!);
      }).toList();

      final newCards = eligibleVocabs.where((v) {
        return v.nextReview == null;
      }).toList();

      // 4. Sắp xếp thẻ đến hạn theo thứ tự khẩn cấp (quá hạn lâu nhất, easeFactor thấp nhất)
      dueCards.sort((a, b) {
        final aDate = a.nextReview ?? DateTime(2000);
        final bDate = b.nextReview ?? DateTime(2000);
        int cmp = aDate.compareTo(bDate);
        if (cmp != 0) return cmp;
        return a.easeFactor.compareTo(b.easeFactor);
      });

      // 5. Áp dụng mục tiêu hàng ngày (Tối đa 20 thẻ đến hạn + 10 thẻ học từ mới)
      final selectedDue = dueCards.take(20).toList();
      final selectedNew = newCards.take(10).toList();

      _reviewCards.addAll(selectedDue);
      _reviewCards.addAll(selectedNew);

      debugPrint(
        '📚 SRS Review: Khởi tạo ${_reviewCards.length} thẻ ôn tập hôm nay (Due: ${selectedDue.length}/${dueCards.length}, New: ${selectedNew.length}/${newCards.length})',
      );
    } else {
      debugPrint('⚠️ vocabBox rỗng');
    }

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    // Dừng TTS khi rời screen — tránh phát âm khi đã pop
    _tts.stop();
    super.dispose();
  }

  // ─── Lật thẻ + auto-play TTS ───────────────────────────────────────────────
  void _flipCard() {
    if (_isFlipped || _isProcessing) return;

    _flipController.forward();
    setState(() {
      _isFlipped = true;
      _showRating = true;
    });

    // Auto-play TTS khi lật ra mặt sau
    // Quyết định: phát wordEn (tiếng Anh), không phải nghĩa tiếng Việt
    // Lý do: mục tiêu là nghe và ghi nhớ phát âm chuẩn
    // Delay 350ms: chờ animation lật hoàn tất trước khi phát
    final currentWord = _reviewCards[_currentIndex].wordEn;
    Future.delayed(const Duration(milliseconds: 350), () {
      if (mounted && _isFlipped) {
        _tts.speak(currentWord);
      }
    });
  }

  // ─── Rating ────────────────────────────────────────────────────────────────
  void _rateCard(SrsQuality quality) async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
      _selectedQuality = quality;
    });

    // ✅ Dừng TTS khi user đã rate
    await _tts.stop();

    try {
      await Future.delayed(const Duration(milliseconds: 300));
      if (!mounted) return;

      final card =
          _reviewCards[_currentIndex]; // ← 'card' được định nghĩa ở đây

      // ✅ Tích hợp SrsAlgorithm
      SrsAlgorithm.calculateNextReview(card, quality.value);
      await card.save();

      if (quality == SrsQuality.good || quality == SrsQuality.easy) {
        _sessionCorrect++;
      }
      _sessionTotal++;

      if (_currentIndex < _reviewCards.length - 1) {
        setState(() {
          _currentIndex++;
          _isFlipped = false;
          _showRating = false;
          _selectedQuality = null;
        });
        _flipController.reset();
      } else {
        setState(() {
          _isFlipped = false;
          _showRating = false;
          _selectedQuality = null;
        });
        _showSessionComplete();
      }
    } catch (e) {
      debugPrint('Lỗi lưu dữ liệu SRS: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  void _showSessionComplete() {
    try {
      // Cập nhật UserProgressModel khi hoàn thành SRS
      final userBox = HiveService.progressBox;
      UserProgressModel? progress = userBox.get('current_user');
      progress ??= UserProgressModel(userId: 'local_user');

      final xpEarned = _sessionCorrect * 2;
      progress.totalXP += xpEarned;

      final minutesEarned = (_sessionTotal * 0.25).clamp(2.0, 30.0).round();
      progress.totalStudyMinutes += minutesEarned;

      final vocabBox = HiveService.vocabBox;
      final learnedCount = vocabBox.values
          .where((v) => v.nextReview != null || v.repetitionCount > 0)
          .length;
      progress.totalWordsLearned = learnedCount;

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      if (progress.lastStudyDate != null) {
        final lastStudy = DateTime(
          progress.lastStudyDate!.year,
          progress.lastStudyDate!.month,
          progress.lastStudyDate!.day,
        );
        final diff = today.difference(lastStudy).inDays;
        if (diff == 1) {
          progress.currentStreak++;
        } else if (diff > 1) {
          progress.currentStreak = 1;
        }
      } else {
        progress.currentStreak = 1;
      }
      if (progress.currentStreak > progress.longestStreak) {
        progress.longestStreak = progress.currentStreak;
      }
      progress.lastStudyDate = now;

      // Badge check
      if (!progress.earnedBadges.contains('starter') &&
          (progress.completedLessons.isNotEmpty || learnedCount > 0)) {
        progress.earnedBadges.add('starter');
      }
      if (!progress.earnedBadges.contains('streak_7') &&
          progress.longestStreak >= 7) {
        progress.earnedBadges.add('streak_7');
      }

      userBox.put('current_user', progress);
    } catch (e) {
      debugPrint('Lỗi cập nhật tiến độ học tập: $e');
    }

    try {
      context.read<ProgressBloc>().add(RefreshAfterSrsEvent());
    } catch (_) {}

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _SessionCompleteDialog(
        correct: _sessionCorrect,
        total: _sessionTotal,
        onContinue: () {
          Navigator.pop(context); // Đóng dialog
          // ✅ FIX: Quay về Home thay vì pop
          if (widget.onClose != null) {
            widget.onClose!();
          } else {
            Navigator.pop(context);
          }
        },
        onRestart: () {
          Navigator.pop(context); // Đóng dialog
          setState(() {
            _currentIndex = 0;
            _sessionCorrect = 0;
            _sessionTotal = 0;
            _isFlipped = false;
            _showRating = false;
          });
          _flipController.reset();
        },
      ),
    );
  }

  // ─── Build ─────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    if (_reviewCards.isEmpty) {
      return _buildEmptyState(); // Giữ nguyên
    }

    final card = _reviewCards[_currentIndex];
    final progress = (_currentIndex + 1) / _reviewCards.length;

    // ✅ NEW: Hiển thị thống kê SRS
    final progressBox = HiveService.progressBox;
    final progressUser =
        progressBox.get('current_user') ??
        UserProgressModel(userId: 'local_user');
    final completedThemeIds = progressUser.completedLessons
        .map((key) => key.split('_day_')[0])
        .toSet();

    final totalDue = HiveService.vocabBox.values.where((v) {
      if (v.nextReview == null) return false;
      return DateTime.now().isAfter(v.nextReview!) &&
          completedThemeIds.contains(v.themeId);
    }).length;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () async {
            await _tts.stop();
            if (widget.onClose != null) {
              widget.onClose!();
            } else if (mounted) {
              Navigator.pop(context);
            }
          },
        ),
        title: Text('Ôn tập SRS', style: AppTextStyles.h3),
        actions: [
          // ✅ Hiển thị: từ này / tổng ngày hôm nay | tổng due toàn bộ
          Tooltip(
            message: '$totalDue từ cần ôn trong tương lai',
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: AppConstants.paddingM),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_currentIndex + 1}/${_reviewCards.length}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.border,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
                minHeight: 6,
              ),
            ),
          ),

          const SizedBox(height: AppConstants.paddingM),

          // Session Stats
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SessionStat(
                  icon: Icons.check_circle,
                  value: _sessionCorrect,
                  color: AppColors.success,
                ),
                const SizedBox(width: AppConstants.paddingL),
                _SessionStat(
                  icon: Icons.cancel,
                  value: _sessionTotal - _sessionCorrect,
                  color: AppColors.error,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingM),

          // Vocab Quick Ref Bar (đã tích hợp TTS thật)
          _buildVocabQuickRef(card),

          const SizedBox(height: AppConstants.paddingS),

          // Flashcard
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingM,
              ),
              child: GestureDetector(
                onTap: _isFlipped ? null : _flipCard,
                child: AnimatedBuilder(
                  animation: _flipAnimation,
                  builder: (context, child) {
                    final isShowingBack = _flipAnimation.value > 0.5;
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_flipAnimation.value * 3.14159),
                      child: isShowingBack
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(3.14159),
                              child: _buildBackCard(card),
                            )
                          : _buildFrontCard(card),
                    );
                  },
                ),
              ),
            ),
          ),

          // Rating / Hint
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showRating ? _buildRatingButtons() : _buildTapHint(),
          ),

          const SizedBox(height: AppConstants.paddingL),
        ],
      ),
    );
  }

  // ─── Vocab Quick Ref — nút loa hoạt động thật ──────────────────────────────
  Widget _buildVocabQuickRef(VocabModel vocab) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingM,
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
          // Part of speech badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              vocab.partOfSpeech,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: AppConstants.paddingS),
          Text(
            vocab.pronunciation,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Spacer(),

          // ✅ Nút loa — TTS thật, thay thế SnackBar placeholder
          _SpeakerButton(text: vocab.wordEn, tts: _tts),
        ],
      ),
    );
  }

  // ─── Front Card ────────────────────────────────────────────────────────────
  Widget _buildFrontCard(VocabModel vocab) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
              vertical: AppConstants.paddingXS,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
            ),
            child: const Text('🤔', style: TextStyle(fontSize: 32)),
          ),
          const SizedBox(height: AppConstants.paddingM),
          Text(
            vocab.wordEn,
            style: AppTextStyles.h1.copyWith(
              fontSize: 36,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            vocab.pronunciation,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: AppConstants.paddingXL),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.psychology, color: AppColors.primary, size: 16),
              const SizedBox(width: 6),
              Text(
                'Hãy cố gắng nhớ lại bối cảnh và nghĩa!',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.touch_app, color: AppColors.textHint, size: 18),
              const SizedBox(width: 6),
              Text(
                'Nhớ lại nghĩa → Nhấn để lật thẻ',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Back Card — thêm nút loa thủ công bên cạnh từ ────────────────────────
  Widget _buildBackCard(VocabModel vocab) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.8)],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Từ tiếng Anh + nút loa thủ công
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                vocab.wordEn,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              // Nút loa để user phát lại thủ công sau auto-play
              _SpeakerButton(
                text: vocab.wordEn,
                tts: _tts,
                color: Colors.white.withValues(alpha: 0.85),
                iconSize: 18,
              ),
            ],
          ),

          const SizedBox(height: AppConstants.paddingM),

          Text(
            vocab.wordVi,
            style: AppTextStyles.h1.copyWith(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            vocab.pronunciation,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: AppConstants.paddingM),
          // 🎙️ Nói to phản xạ
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.mic, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Text(
                  'Đọc TO phát âm để kích hoạt siêu trí nhớ!',
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          if (vocab.exampleEn != null) ...[
            const SizedBox(height: AppConstants.paddingL),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingL,
              ),
              child: Container(
                padding: const EdgeInsets.all(AppConstants.paddingM),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                ),
                child: Column(
                  children: [
                    Text(
                      vocab.exampleEn!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (vocab.exampleVi != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        vocab.exampleVi!,
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white.withValues(alpha: 0.7),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRatingButtons() {
    return Padding(
      key: const ValueKey('rating'),
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingM),
      child: Column(
        children: [
          Text(
            'Bạn nhớ tốt không?',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Row(
            children: [
              Expanded(
                child: _RatingButton(
                  label: 'Không nhớ',
                  sublabel: 'Ôn lại ngay',
                  color: AppColors.error,
                  icon: '😔',
                  isSelected: _selectedQuality == SrsQuality.blackout,
                  isProcessing: _isProcessing,
                  onTap: () => _rateCard(SrsQuality.blackout),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: _RatingButton(
                  label: 'Phải nghĩ',
                  sublabel: 'Ôn lại sớm',
                  color: AppColors.warning,
                  icon: '🤔',
                  isSelected: _selectedQuality == SrsQuality.hard,
                  isProcessing: _isProcessing,
                  onTap: () => _rateCard(SrsQuality.hard),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: _RatingButton(
                  label: 'Nhớ ngay',
                  sublabel: 'Tiếp tục tốt',
                  color: AppColors.success,
                  icon: '😊',
                  isSelected: _selectedQuality == SrsQuality.good,
                  isProcessing: _isProcessing,
                  onTap: () => _rateCard(SrsQuality.good),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),
              Expanded(
                child: _RatingButton(
                  label: 'Dễ dàng',
                  sublabel: 'Tuyệt vời!',
                  color: AppColors.primary,
                  icon: '🚀',
                  isSelected: _selectedQuality == SrsQuality.easy,
                  isProcessing: _isProcessing,
                  onTap: () => _rateCard(SrsQuality.easy),
                ),
              ),
            ],
          ),
        ],
      ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.3, end: 0),
    );
  }

  Widget _buildTapHint() {
    return Padding(
      key: const ValueKey('hint'),
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Text(
        '💡 Nhớ lại nghĩa của từ trước khi lật thẻ',
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textHint,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () async {
            await _tts.stop();
            if (widget.onClose != null) {
              widget.onClose!();
            } else if (mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingXL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text('🎉', style: TextStyle(fontSize: 48)),
                ),
              ),
              const SizedBox(height: AppConstants.paddingXL),
              Text(
                'Sạch hòm từ vựng!',
                style: AppTextStyles.h2.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.paddingM),
              Text(
                'Tất cả từ vựng đã được ôn tập hoàn hảo hoặc bạn chưa bắt đầu bài học nào.\n\nHãy tiếp tục chinh phục bài mới hoặc ghim thêm từ vựng từ Tủ sách để rèn luyện nhé!',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.paddingXL),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    await _tts.stop();
                    if (widget.onClose != null) {
                      widget.onClose!();
                    } else if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    ),
                  ),
                  child: Text(
                    'Về Trang chủ',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ).animate().fadeIn(duration: 400.ms).scale(begin: const Offset(0.95, 0.95)),
        ),
      ),
    );
  }
}

// ─── Speaker Button Widget ───────────────────────────────────────────────────
// Widget nhỏ dùng chung trong screen này
// Nếu sau này tách TtsService ra file riêng → tách widget này ra cùng

class _SpeakerButton extends StatefulWidget {
  final String text;
  final _TtsService tts;
  final Color? color;
  final double iconSize;

  const _SpeakerButton({
    required this.text,
    required this.tts,
    this.color,
    this.iconSize = 16,
  });

  @override
  State<_SpeakerButton> createState() => _SpeakerButtonState();
}

class _SpeakerButtonState extends State<_SpeakerButton> {
  bool _isPlaying = false;

  Future<void> _onTap() async {
    if (_isPlaying) return; // Chống double-tap

    setState(() => _isPlaying = true);

    await widget.tts.speak(widget.text);

    // Reset icon sau khi phát xong (ước tính ~1.5s cho từ đơn)
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) setState(() => _isPlaying = false);
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? AppColors.primary;

    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: _isPlaying
              ? color.withValues(alpha: 0.25)
              : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppConstants.radiusS),
        ),
        child: Icon(
          _isPlaying ? Icons.volume_up : Icons.volume_up_outlined,
          size: widget.iconSize,
          color: color,
        ),
      ),
    );
  }
}

// ─── Sub-widgets (giữ nguyên từ file gốc) ───────────────────────────────────

class _SessionStat extends StatelessWidget {
  final IconData icon;
  final int value;
  final Color color;

  const _SessionStat({
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 6),
        Text('$value', style: AppTextStyles.h3.copyWith(color: color)),
      ],
    );
  }
}

class _RatingButton extends StatelessWidget {
  final String label;
  final String sublabel;
  final Color color;
  final String icon;
  final bool isSelected;
  final bool isProcessing;
  final VoidCallback onTap;

  const _RatingButton({
    required this.label,
    required this.sublabel,
    required this.color,
    required this.icon,
    required this.isSelected,
    required this.isProcessing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isProcessing ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.paddingS,
          horizontal: AppConstants.paddingXS,
        ),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
          border: Border.all(
            color: isSelected ? color : color.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            isSelected && isProcessing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(icon, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: isSelected ? Colors.white : color,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              sublabel,
              style: AppTextStyles.caption.copyWith(
                color: isSelected
                    ? Colors.white.withValues(alpha: 0.8)
                    : color.withValues(alpha: 0.7),
                fontSize: 9,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionCompleteDialog extends StatelessWidget {
  final int correct;
  final int total;
  final VoidCallback onContinue;
  final VoidCallback onRestart;

  const _SessionCompleteDialog({
    required this.correct,
    required this.total,
    required this.onContinue,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = total > 0 ? (correct / total * 100).round() : 0;
    final String emoji = percentage >= 80
        ? '🏆'
        : percentage >= 60
        ? '👍'
        : '';

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 56),
            ).animate().scale(duration: 400.ms, curve: Curves.elasticOut),
            const SizedBox(height: AppConstants.paddingM),
            const Text('Phiên ôn tập hoàn thành!', style: AppTextStyles.h3),
            const SizedBox(height: AppConstants.paddingS),
            Text(
              '$correct/$total từ chính xác ($percentage%)',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingXL),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onRestart,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Ôn lại'),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Về trang chủ'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Enum (giữ nguyên) ───────────────────────────────────────────────────────

enum SrsQuality {
  blackout(0),
  hard(2),
  good(4),
  easy(5);

  final int value;
  const SrsQuality(this.value);
}

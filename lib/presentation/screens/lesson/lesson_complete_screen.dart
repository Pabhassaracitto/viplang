// lib/presentation/screens/lesson/lesson_complete_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import 'lesson_day_screen.dart';

class LessonCompleteScreen extends StatefulWidget {
  final int dayNumber;
  final String themeId;
  final String themeTitle;
  final int totalWords;
  final int correctAnswers;
  final int totalQuestions;
  final int xpEarned;
  final int? nextDayNumber;

  const LessonCompleteScreen({
    super.key,
    required this.dayNumber,
    required this.themeId,
    required this.themeTitle,
    required this.totalWords,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.xpEarned,
    this.nextDayNumber,
  });

  @override
  State<LessonCompleteScreen> createState() => _LessonCompleteScreenState();
}

class _LessonCompleteScreenState extends State<LessonCompleteScreen> {
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showContent = true);
    });
  }

  double get _accuracy => widget.totalQuestions > 0
      ? widget.correctAnswers / widget.totalQuestions
      : 1.0;

  String get _grade {
    if (_accuracy >= 0.9) return 'S';
    if (_accuracy >= 0.8) return 'A';
    if (_accuracy >= 0.7) return 'B';
    if (_accuracy >= 0.6) return 'C';
    return 'D';
  }

  Color get _gradeColor {
    if (_accuracy >= 0.9) return const Color(0xFFFFD700);
    if (_accuracy >= 0.8) return AppColors.primary;
    if (_accuracy >= 0.7) return AppColors.success;
    if (_accuracy >= 0.6) return AppColors.warning;
    return AppColors.error;
  }

  String get _motivationMessage {
    if (_accuracy >= 0.9) return 'Xuất sắc! Bạn đang trên đỉnh! 🏆';
    if (_accuracy >= 0.8) return 'Tuyệt vời! Tiếp tục phát huy! 🌟';
    if (_accuracy >= 0.7) return 'Tốt lắm! Bạn đang tiến bộ! 👍';
    if (_accuracy >= 0.6) return 'Cố lên! Luyện tập thêm nhé! 💪';
    return 'Đừng nản! Mỗi lần thử là một bước tiến! 🔥';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _BackgroundPainter())),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              child: Column(
                children: [
                  const SizedBox(height: AppConstants.paddingXL),
                  _buildTrophy(),
                  const SizedBox(height: AppConstants.paddingL),
                  if (_showContent) ...[
                    const Text(
                      'Bài học hoàn thành!',
                      style: AppTextStyles.h1,
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.3),

                    const SizedBox(height: AppConstants.paddingS),

                    Text(
                      'Day ${widget.dayNumber} - ${widget.themeTitle}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(delay: 200.ms),

                    const SizedBox(height: AppConstants.paddingL),

                    _buildGradeCard()
                        .animate()
                        .fadeIn(delay: 300.ms)
                        .scale(begin: const Offset(0.8, 0.8), delay: 300.ms),

                    const SizedBox(height: AppConstants.paddingL),

                    _buildStatsRow().animate().fadeIn(delay: 500.ms),

                    const SizedBox(height: AppConstants.paddingL),

                    _buildMotivationCard().animate().fadeIn(delay: 600.ms),

                    const SizedBox(height: AppConstants.paddingXL),

                    _buildButtons(context).animate().fadeIn(delay: 700.ms),

                    const SizedBox(height: AppConstants.paddingXL),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Trophy ──────────────────────────────────────────────────────

  Widget _buildTrophy() {
    return Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _gradeColor.withValues(alpha: 0.15),
            border: Border.all(
              color: _gradeColor.withValues(alpha: 0.3),
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              _accuracy >= 0.8
                  ? '🏆'
                  : _accuracy >= 0.6
                  ? '🌟'
                  : '💪',
              style: const TextStyle(fontSize: 52),
            ),
          ),
        )
        .animate()
        .scale(
          duration: 600.ms,
          curve: Curves.elasticOut,
          begin: const Offset(0, 0),
          end: const Offset(1, 1),
        )
        .fadeIn(duration: 400.ms);
  }

  // ── Grade Card ──────────────────────────────────────────────────

  Widget _buildGradeCard() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingXL),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
        boxShadow: [
          BoxShadow(
            color: _gradeColor.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: _gradeColor.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        children: [
          Text(
            'Điểm',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            _grade,
            style: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.w900,
              color: _gradeColor,
              height: 1,
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            '${(_accuracy * 100).round()}% chính xác',
            style: AppTextStyles.bodyMedium.copyWith(
              color: _gradeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ── Stats Row ───────────────────────────────────────────────────

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _CompleteStat(
            icon: '📚',
            value: '${widget.totalWords}',
            label: 'Từ học được',
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: AppConstants.paddingS),
        Expanded(
          child: _CompleteStat(
            icon: '✅',
            value: '${widget.correctAnswers}/${widget.totalQuestions}',
            label: 'Câu đúng',
            color: AppColors.success,
          ),
        ),
        const SizedBox(width: AppConstants.paddingS),
        Expanded(
          child: _CompleteStat(
            icon: '⚡',
            value: '+${widget.xpEarned}',
            label: 'XP nhận được',
            color: AppColors.warning,
          ),
        ),
      ],
    );
  }

  // ── Motivation Card ─────────────────────────────────────────────

  Widget _buildMotivationCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.secondary.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Text('💬', style: TextStyle(fontSize: 24)),
          const SizedBox(width: AppConstants.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bí mật #2',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  _motivationMessage,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Buttons ─────────────────────────────────────────────────────

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        // ✅ Nút 1: Học Day tiếp theo (nếu có)
        if (widget.nextDayNumber != null) ...[
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LessonDayScreen(
                      dayNumber: widget.nextDayNumber!,
                      themeId: widget.themeId,
                      themeTitle: widget.themeTitle,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward_rounded),
              label: Text('Học Day ${widget.nextDayNumber} →'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.success,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
        ],

        // ✅ Nút 2: Về trang chủ
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(Icons.home_rounded),
            label: const Text('Về trang chủ'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: AppConstants.paddingM),

        // ✅ Nút 3: Học lại
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.replay_rounded),
            label: const Text('Học lại bài này'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Sub-widgets (TOP-LEVEL, ngoài class) ─────────────────────────────────────

class _CompleteStat extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final Color color;

  const _CompleteStat({
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

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.04)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.08),
      120,
      paint,
    );
    canvas.drawCircle(Offset(size.width * 0.1, size.height * 0.85), 80, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

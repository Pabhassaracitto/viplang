// lib/presentation/screens/onboarding/onboarding_screen.dart
//
// Onboarding 3 màn (Giai đoạn 3):
//   1. Chào mừng
//   2. Đặt mục tiêu → lưu UserGoal (điểm TOEIC, phút học/ngày, ngày thi)
//   3. Hướng dẫn 5 phase học
//
// Dùng 2 chế độ:
//   - Lần đầu mở app: `isEditing = false` → kết thúc sẽ vào HomeScreen
//   - Sửa mục tiêu từ Cài đặt / Tiến độ: `isEditing = true` → kết thúc chỉ pop()

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/services/hive_service.dart';
import '../../../data/models/user_progress_model.dart';
import '../home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  /// Mục tiêu hiện tại (khi sửa) để điền sẵn.
  final UserGoal? initialGoal;

  /// true = chỉnh sửa mục tiêu (không chạy lại phần chào mừng).
  final bool isEditing;

  const OnboardingScreen({
    super.key,
    this.initialGoal,
    this.isEditing = false,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const List<int> _scoreOptions = [400, 500, 650, 750, 850];
  static const List<int> _minuteOptions = [10, 15, 20, 30];

  late final PageController _pageController;
  int _page = 0;

  int _targetScore = 650;
  int _dailyMinutes = 15;
  DateTime? _targetDate;

  @override
  void initState() {
    super.initState();
    final goal = widget.initialGoal;
    _targetScore = goal?.targetScore ?? 650;
    _dailyMinutes = goal?.dailyMinutes ?? 15;
    _targetDate = goal?.targetDate;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // ─── Lưu mục tiêu ─────────────────────────────────────────────────────────
  Future<void> _saveAndFinish() async {
    try {
      final box = HiveService.progressBox;
      final progress =
          box.get('current_user') ?? UserProgressModel(userId: 'local_user');

      progress.goal = UserGoal(
        description: 'Đạt TOEIC $_targetScore+ · $_dailyMinutes phút/ngày',
        targetScore: _targetScore,
        targetDate: _targetDate ?? DateTime.now().add(const Duration(days: 90)),
        dailyMinutes: _dailyMinutes,
      );

      await box.put('current_user', progress);
      await HiveService.settingsBox.put('onboarding_done', true);
    } catch (e) {
      debugPrint('⚠️ Không lưu được mục tiêu: $e');
    }

    if (!mounted) return;

    if (widget.isEditing) {
      Navigator.pop(context);
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  Future<void> _pickTargetDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _targetDate ?? now.add(const Duration(days: 90)),
      firstDate: now,
      lastDate: DateTime(now.year + 5),
      helpText: 'Chọn ngày dự kiến thi TOEIC',
    );
    if (picked != null) {
      setState(() => _targetDate = picked);
    }
  }

  void _next() {
    if (_page < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      _saveAndFinish();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Nút bỏ qua
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: widget.isEditing ? () => Navigator.pop(context) : _saveAndFinish,
                child: Text(
                  widget.isEditing ? 'Huỷ' : 'Bỏ qua',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _page = i),
                children: [
                  const _WelcomePage(),
                  _GoalPage(
                    targetScore: _targetScore,
                    dailyMinutes: _dailyMinutes,
                    targetDate: _targetDate,
                    scoreOptions: _scoreOptions,
                    minuteOptions: _minuteOptions,
                    onScoreChanged: (v) => setState(() => _targetScore = v),
                    onMinutesChanged: (v) => setState(() => _dailyMinutes = v),
                    onPickDate: _pickTargetDate,
                  ),
                  const _HowItWorksPage(),
                ],
              ),
            ),

            // Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (i) {
                final active = i == _page;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active ? AppColors.primary : AppColors.border,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),

            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingL),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _next,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    ),
                  ),
                  child: Text(
                    _page == 2
                        ? (widget.isEditing ? 'Lưu mục tiêu' : 'Bắt đầu học 🚀')
                        : 'Tiếp tục',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Page 1: Chào mừng ───────────────────────────────────────────────────────

class _WelcomePage extends StatelessWidget {
  const _WelcomePage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_viplang.png', width: 130)
              .animate()
              .scale(duration: 600.ms, curve: Curves.easeOutBack),
          const SizedBox(height: AppConstants.paddingL),
          Text(
            'Chào mừng tới VipLang',
            textAlign: TextAlign.center,
            style: AppTextStyles.h1.copyWith(color: AppColors.primary),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            'Học tiếng Anh công sở theo phương pháp Do Thái:\n'
            'hiểu cặn kẽ từng câu — nhớ bằng bối cảnh, không học vẹt.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ).animate().fadeIn(delay: 350.ms),
          const SizedBox(height: AppConstants.paddingL),
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: AppConstants.paddingS,
            runSpacing: AppConstants.paddingS,
            children: [
              _Pill('13 chủ đề TOEIC'),
              _Pill('556 từ vựng'),
              _Pill('26 bài học'),
              _Pill('SRS nhắc ôn'),
            ],
          ).animate().fadeIn(delay: 500.ms),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  const _Pill(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primarySurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.caption.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ─── Page 2: Đặt mục tiêu ────────────────────────────────────────────────────

class _GoalPage extends StatelessWidget {
  final int targetScore;
  final int dailyMinutes;
  final DateTime? targetDate;
  final List<int> scoreOptions;
  final List<int> minuteOptions;
  final ValueChanged<int> onScoreChanged;
  final ValueChanged<int> onMinutesChanged;
  final VoidCallback onPickDate;

  const _GoalPage({
    required this.targetScore,
    required this.dailyMinutes,
    required this.targetDate,
    required this.scoreOptions,
    required this.minuteOptions,
    required this.onScoreChanged,
    required this.onMinutesChanged,
    required this.onPickDate,
  });

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppConstants.paddingM),
          const Text('Mục tiêu của bạn 🎯', style: AppTextStyles.h1),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            'Đặt mục tiêu rõ ràng là bí mật số 1 để học hiệu quả. '
            'Bạn có thể đổi bất cứ lúc nào trong Cài đặt.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: AppConstants.paddingL),

          const Text('Điểm TOEIC mục tiêu', style: AppTextStyles.h3),
          const SizedBox(height: AppConstants.paddingS),
          Wrap(
            spacing: AppConstants.paddingS,
            runSpacing: AppConstants.paddingS,
            children: scoreOptions.map((score) {
              final selected = score == targetScore;
              return _ChoiceChip(
                label: '$score+',
                selected: selected,
                onTap: () => onScoreChanged(score),
              );
            }).toList(),
          ),
          const SizedBox(height: AppConstants.paddingL),

          const Text('Thời gian học mỗi ngày', style: AppTextStyles.h3),
          const SizedBox(height: AppConstants.paddingS),
          Wrap(
            spacing: AppConstants.paddingS,
            runSpacing: AppConstants.paddingS,
            children: minuteOptions.map((minutes) {
              final selected = minutes == dailyMinutes;
              return _ChoiceChip(
                label: '$minutes phút',
                selected: selected,
                onTap: () => onMinutesChanged(minutes),
              );
            }).toList(),
          ),
          const SizedBox(height: AppConstants.paddingL),

          const Text(
            'Ngày dự kiến thi (không bắt buộc)',
            style: AppTextStyles.h3,
          ),
          const SizedBox(height: AppConstants.paddingS),
          OutlinedButton.icon(
            onPressed: onPickDate,
            icon: const Icon(Icons.event_rounded, size: 18),
            label: Text(
              targetDate == null ? 'Chọn ngày thi' : _formatDate(targetDate!),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingXL),
        ],
      ),
    );
  }
}

class _ChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ChoiceChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: selected ? Colors.white : AppColors.textPrimary,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ─── Page 3: Cách hoạt động ──────────────────────────────────────────────────

class _HowItWorksPage extends StatelessWidget {
  const _HowItWorksPage();

  static const List<(String, String, String)> _steps = [
    ('🎧', 'Nghe – Đọc', 'Nghe đoạn hội thoại rồi đọc theo, hiểu từng câu.'),
    ('📖', 'Từ vựng', 'Học từ mới có phát âm, ví dụ Anh–Việt.'),
    ('🔤', 'Dịch câu', 'Tự dịch câu tiếng Việt sang tiếng Anh.'),
    ('🎮', 'Trò chơi', 'Điền từ vào đoạn văn — nhớ theo bối cảnh.'),
    ('✅', 'Quiz', 'Nghe hiểu & kiểm tra, có đáp án giải thích.'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppConstants.paddingM),
          const Text('Mỗi ngày học thế nào? 📚', style: AppTextStyles.h1),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            'Một bài học gồm 5 bước, khoảng 15–20 phút:',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
          ...List.generate(_steps.length, (i) {
            final step = _steps[i];
            return Padding(
              padding: const EdgeInsets.only(bottom: AppConstants.paddingS),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    ),
                    child: Center(
                      child: Text(
                        step.$1,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bước ${i + 1}: ${step.$2}',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          step.$3,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: (i * 80).ms).slideX(begin: 0.05);
          }),
          const SizedBox(height: AppConstants.paddingS),
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            decoration: BoxDecoration(
              color: AppColors.secondarySurface,
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Row(
              children: [
                const Text('🔥', style: TextStyle(fontSize: 22)),
                const SizedBox(width: AppConstants.paddingS),
                Expanded(
                  child: Text(
                    'Học mỗi ngày để giữ streak. Bỏ lỡ 1 ngày? '
                    'Bạn có 1 lượt “đóng băng streak” mỗi tuần để cứu chuỗi!',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.paddingL),
        ],
      ),
    );
  }
}

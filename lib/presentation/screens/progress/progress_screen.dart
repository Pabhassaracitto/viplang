import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tiến độ học tập', style: AppTextStyles.h1),
              const Text(
                'Theo dõi hành trình của bạn',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: AppConstants.paddingL),

              // Stats Overview
              _buildStatsOverview(),
              const SizedBox(height: AppConstants.paddingL),

              // 13 Bí mật
              _buildSecretsProgress(),
              const SizedBox(height: AppConstants.paddingL),

              // Badges
              _buildBadges(),
              const SizedBox(height: AppConstants.paddingXL),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsOverview() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tổng quan', style: AppTextStyles.h3),
        SizedBox(height: AppConstants.paddingS),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: '🔥',
                value: '0',
                label: 'Ngày streak',
                color: AppColors.secondary,
              ),
            ),
            SizedBox(width: AppConstants.paddingS),
            Expanded(
              child: _StatCard(
                icon: '📚',
                value: '0',
                label: 'Từ đã học',
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: AppConstants.paddingS),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: '⚡',
                value: '0',
                label: 'Tổng XP',
                color: AppColors.warning,
              ),
            ),
            SizedBox(width: AppConstants.paddingS),
            Expanded(
              child: _StatCard(
                icon: '⏱️',
                value: '0 phút',
                label: 'Tổng thời gian',
                color: AppColors.success,
              ),
            ),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 100.ms);
  }

  Widget _buildSecretsProgress() {
    final secrets = [
      ('Mục tiêu rõ ràng', '🎯', true),
      ('Rèn luyện đều đặn', '💪', true),
      ('Lặp lại nhiều bối cảnh', '🔄', true),
      ('Giao tiếp tích cực', '💬', false),
      ('Cảm xúc mạnh', '❤️', false),
      ('Cam kết làm đến cùng', '🏆', false),
      ('Tập trung đột phá', '⚡', false),
      ('Học cùng bạn bè', '👥', false),
      ('Hình mẫu cảm hứng', '⭐', false),
      ('Dám sai để đúng', '🎲', false),
      ('Thi thố thường xuyên', '🥊', false),
      ('Vượt ra đám đông', '🚀', false),
      ('Dạy lại người khác', '🎓', false),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('13 Bí mật', style: AppTextStyles.h3),
        const SizedBox(height: AppConstants.paddingS),
        Container(
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
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: secrets.length,
            separatorBuilder: (_, __) => const Divider(
              height: 1,
              color: AppColors.border,
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) {
              final secret = secrets[index];
              final isUnlocked = secret.$3;
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isUnlocked
                        ? AppColors.primary.withValues(alpha: 0.1)
                        : AppColors.background,
                    borderRadius: BorderRadius.circular(AppConstants.radiusS),
                  ),
                  child: Center(
                    child: Text(
                      secret.$2,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                title: Text(
                  'Bí mật ${index + 1}: ${secret.$1}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isUnlocked
                        ? AppColors.textPrimary
                        : AppColors.textHint,
                    fontWeight: isUnlocked
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
                trailing: isUnlocked
                    ? const Icon(
                        Icons.check_circle,
                        color: AppColors.success,
                        size: 20,
                      )
                    : const Icon(
                        Icons.lock_outline,
                        color: AppColors.textHint,
                        size: 18,
                      ),
              );
            },
          ),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildBadges() {
    final badges = [
      const _BadgeData(
        icon: '🌟',
        title: 'Người khởi đầu',
        desc: 'Hoàn thành bài học đầu tiên',
        isEarned: true,
        color: AppColors.warning,
      ),
      const _BadgeData(
        icon: '🔥',
        title: 'Kiên trì 7 ngày',
        desc: 'Học 7 ngày liên tiếp',
        isEarned: false,
        color: AppColors.secondary,
      ),
      const _BadgeData(
        icon: '🏢',
        title: 'Bậc thầy Văn phòng',
        desc: 'Hoàn thành Theme 1',
        isEarned: false,
        color: AppColors.primary,
      ),
      const _BadgeData(
        icon: '📖',
        title: 'Đa bối cảnh',
        desc: 'Gặp 1 từ trong 5 bối cảnh',
        isEarned: false,
        color: AppColors.success,
      ),
      const _BadgeData(
        icon: '🎯',
        title: 'Siêu chính xác',
        desc: 'Đạt 100% trong 1 bài quiz',
        isEarned: false,
        color: AppColors.primary,
      ),
      const _BadgeData(
        icon: '🚀',
        title: 'Vô địch trí nhớ',
        desc: 'Hoàn thành tất cả 13 chủ đề',
        isEarned: false,
        color: AppColors.secondary,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Huy hiệu thành tích', style: AppTextStyles.h3),
        const SizedBox(height: AppConstants.paddingS),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: AppConstants.paddingS,
            mainAxisSpacing: AppConstants.paddingS,
            childAspectRatio: 0.85,
          ),
          itemCount: badges.length,
          itemBuilder: (context, index) {
            return _BadgeCard(badge: badges[index])
                .animate()
                .fadeIn(delay: (300 + index * 80).ms)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  delay: (300 + index * 80).ms,
                );
          },
        ),
      ],
    );
  }
}

// ─── Sub-widgets ────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
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
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.12),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 22)),
              const Spacer(),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(value, style: AppTextStyles.h2.copyWith(color: color)),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeData {
  final String icon;
  final String title;
  final String desc;
  final bool isEarned;
  final Color color;

  const _BadgeData({
    required this.icon,
    required this.title,
    required this.desc,
    required this.isEarned,
    required this.color,
  });
}

class _BadgeCard extends StatelessWidget {
  final _BadgeData badge;

  const _BadgeCard({required this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingS),
      decoration: BoxDecoration(
        color: badge.isEarned
            ? badge.color.withValues(alpha: 0.08)
            : AppColors.background,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(
          color: badge.isEarned
              ? badge.color.withValues(alpha: 0.3)
              : AppColors.border,
          width: badge.isEarned ? 1.5 : 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: badge.isEarned
                      ? badge.color.withValues(alpha: 0.15)
                      : Colors.grey.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    badge.isEarned ? badge.icon : '🔒',
                    style: TextStyle(fontSize: badge.isEarned ? 26 : 20),
                  ),
                ),
              ),
              if (badge.isEarned)
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.check, size: 8, color: Colors.white),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            badge.title,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: badge.isEarned ? badge.color : AppColors.textHint,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

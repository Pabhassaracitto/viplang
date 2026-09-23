// lib/presentation/widgets/activity_charts.dart
//
// Biểu đồ tiến độ (Giai đoạn 3) dùng fl_chart + widget heatmap tự vẽ.
// Tất cả dữ liệu đầu vào là số nguyên (XP/ngày) → dễ test và không phụ thuộc Hive.

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/services/streak_service.dart';

/// Heatmap hoạt động [n] ngày gần nhất (mặc định 7).
///
/// [xpPerDay]: XP theo từng ngày, thứ tự **cũ → mới** (phần tử cuối là hôm nay).
class WeeklyActivityHeatmap extends StatelessWidget {
  final List<int> xpPerDay;
  final DateTime today;

  const WeeklyActivityHeatmap({
    super.key,
    required this.xpPerDay,
    required this.today,
  });

  Color _cellColor(int xp, int maxXp) {
    if (xp <= 0) return AppColors.surfaceVariant;
    if (maxXp <= 0) return AppColors.primary.withValues(alpha: 0.25);

    final ratio = (xp / maxXp).clamp(0.0, 1.0);
    if (ratio >= 0.75) return AppColors.primary;
    if (ratio >= 0.5) return AppColors.primary.withValues(alpha: 0.75);
    if (ratio >= 0.25) return AppColors.primary.withValues(alpha: 0.5);
    return AppColors.primary.withValues(alpha: 0.28);
  }

  @override
  Widget build(BuildContext context) {
    final maxXp = xpPerDay.isEmpty
        ? 0
        : xpPerDay.reduce((a, b) => a > b ? a : b);

    return Row(
      children: List.generate(xpPerDay.length, (i) {
        final day = today.subtract(Duration(days: xpPerDay.length - 1 - i));
        final xp = xpPerDay[i];
        final isToday = i == xpPerDay.length - 1;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              children: [
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: _cellColor(xp, maxXp),
                    borderRadius: BorderRadius.circular(AppConstants.radiusS),
                    border: isToday
                        ? Border.all(color: AppColors.primary, width: 2)
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      xp > 0 ? '$xp' : '',
                      style: AppTextStyles.caption.copyWith(
                        color: xp > 0 && xp >= maxXp * 0.5
                            ? Colors.white
                            : AppColors.primaryDark,
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  StudyLog.shortWeekdayLabel(day),
                  style: AppTextStyles.caption.copyWith(
                    fontSize: 10,
                    color: isToday
                        ? AppColors.primary
                        : AppColors.textTertiary,
                    fontWeight: isToday ? FontWeight.w700 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

/// Line chart XP theo ngày (fl_chart).
class XpTrendChart extends StatelessWidget {
  final List<int> xpPerDay;
  final DateTime today;
  final double height;

  const XpTrendChart({
    super.key,
    required this.xpPerDay,
    required this.today,
    this.height = 170,
  });

  @override
  Widget build(BuildContext context) {
    if (xpPerDay.isEmpty) return const SizedBox.shrink();

    final maxXp = xpPerDay.reduce((a, b) => a > b ? a : b);
    // Trục Y luôn có khoảng đệm để đường không dính sát mép
    final maxY = (maxXp <= 0 ? 40 : (maxXp * 1.25)).toDouble();
    final interval = (maxY / 4).clamp(5, 1000).toDouble();

    final labels = List.generate(xpPerDay.length, (i) {
      final day = today.subtract(Duration(days: xpPerDay.length - 1 - i));
      return StudyLog.shortWeekdayLabel(day);
    });

    return SizedBox(
      height: height,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (xpPerDay.length - 1).toDouble(),
          minY: 0,
          maxY: maxY,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: interval,
            getDrawingHorizontalLine: (value) =>
                const FlLine(color: AppColors.border, strokeWidth: 1),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 34,
                interval: interval,
                getTitlesWidget: (value, meta) => Text(
                  value.toInt().toString(),
                  style: AppTextStyles.caption.copyWith(
                    fontSize: 10,
                    color: AppColors.textTertiary,
                  ),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 26,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final index = value.round();
                  if (index < 0 || index >= labels.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      labels[index],
                      style: AppTextStyles.caption.copyWith(
                        fontSize: 10,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) => touchedSpots
                  .map(
                    (spot) => LineTooltipItem(
                      '${spot.y.toInt()} XP',
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                xpPerDay.length,
                (i) => FlSpot(i.toDouble(), xpPerDay[i].toDouble()),
              ),
              isCurved: true,
              curveSmoothness: 0.3,
              preventCurveOverShooting: true,
              barWidth: 3,
              isStrokeCapRound: true,
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
              ),
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                      radius: 3,
                      color: Colors.white,
                      strokeWidth: 2,
                      strokeColor: AppColors.primary,
                    ),
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.22),
                    AppColors.primary.withValues(alpha: 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Thanh tiến độ phần trăm của một theme (đơn giản, không cần chart).
class ThemeProgressBar extends StatelessWidget {
  final String emoji;
  final String title;
  final double percent;

  const ThemeProgressBar({
    super.key,
    required this.emoji,
    required this.title,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    final clamped = percent.clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 8),
          SizedBox(
            width: 96,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: clamped,
                minHeight: 8,
                backgroundColor: AppColors.surfaceVariant,
                valueColor: AlwaysStoppedAnimation<Color>(
                  clamped >= 1.0 ? AppColors.success : AppColors.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 38,
            child: Text(
              '${(clamped * 100).toStringAsFixed(0)}%',
              textAlign: TextAlign.right,
              style: AppTextStyles.caption.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: clamped >= 1.0
                    ? AppColors.success
                    : AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../data/models/lesson_model.dart';
import '../../../widgets/audio_player_widget.dart';

class PhaseReadListenScreen extends StatefulWidget {
  // ✅ Fix: Nhận LessonPhase thay vì dayNumber + themeId
  final LessonPhase phase;
  final VoidCallback onComplete;

  const PhaseReadListenScreen({
    super.key,
    required this.phase,
    required this.onComplete,
  });

  @override
  State<PhaseReadListenScreen> createState() => _PhaseReadListenScreenState();
}

class _PhaseReadListenScreenState extends State<PhaseReadListenScreen> {
  bool _hasListened = false;

  // Map audioTrackKey → tên file thực
  String _resolveAudioPath(String? trackKey) {
    const map = {
      // Theme 1
      'track_03': 'assets/audio/theme1_track03.mp3',
      'track_04': 'assets/audio/theme1_track04.mp3',
      'track_05': 'assets/audio/theme1_track05.mp3',
      'track_06': 'assets/audio/theme1_track06.mp3',
      // Theme 2
      'track_07': 'assets/audio/theme2_track07.mp3',
      'track_08': 'assets/audio/theme2_track08.mp3',
      'track_09': 'assets/audio/theme2_track09.mp3',
      'track_10': 'assets/audio/theme2_track10.mp3',
    };
    return map[trackKey] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final phase = widget.phase;
    final audioPath = _resolveAudioPath(phase.audioTrackKey);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Instruction banner ──────────────────────────────
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                const Text('🎧', style: TextStyle(fontSize: 24)),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        phase.titleVi ?? 'Bước 1: Đọc & Nghe',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'Nghe kỹ rồi đọc to theo',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms),

          const SizedBox(height: AppConstants.paddingL),

          // ── Audio Player ────────────────────────────────────
          if (audioPath.isNotEmpty)
            AudioPlayerWidget(
              audioUrl: audioPath,
              title:
                  phase.audioTrackKey?.replaceAll('_', ' ').toUpperCase() ??
                  'Audio',
              onPlayComplete: () {
                setState(() => _hasListened = true);
              },
            )
          else
            // Nếu chưa có file audio, cho phép bỏ qua
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.warningSurface,
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                border: Border.all(
                  color: AppColors.warning.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.warning,
                  ),
                  const SizedBox(width: AppConstants.paddingS),
                  Expanded(
                    child: Text(
                      'File audio chưa sẵn sàng. Bạn có thể đọc bài trước.',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.warning,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => setState(() => _hasListened = true),
                    child: const Text('Bỏ qua'),
                  ),
                ],
              ),
            ),

          const SizedBox(height: AppConstants.paddingL),

          // ── Reading Content ─────────────────────────────────
          _buildReadingContent(phase),

          const SizedBox(height: AppConstants.paddingXL),

          // ── Complete Button ─────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _hasListened ? widget.onComplete : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: AppColors.border,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                ),
              ),
              child: Text(
                _hasListened ? '✅ Tiếp tục' : '🎧 Hãy nghe audio trước',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(height: AppConstants.paddingL),
        ],
      ),
    );
  }

  Widget _buildReadingContent(LessonPhase phase) {
    // ✅ Fix: Dùng content từ LessonPhase data, KHÔNG hardcode
    final paragraphsEn = (phase.contentEn ?? '')
        .split('\n\n')
        .where((s) => s.trim().isNotEmpty)
        .toList();
    final paragraphsVi = (phase.contentVi ?? '')
        .split('\n\n')
        .where((s) => s.trim().isNotEmpty)
        .toList();

    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingL),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingS,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
            ),
            child: Text(
              '📖 Bài đọc',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: AppConstants.paddingM),

          // ✅ Render TẤT CẢ đoạn văn từ data
          ...List.generate(paragraphsEn.length, (i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tiếng Anh
                Text(
                  paragraphsEn[i].trim(),
                  style: AppTextStyles.bodyMedium.copyWith(
                    height: 1.8,
                    color: AppColors.textPrimary,
                  ),
                ),
                // Tiếng Việt (nếu có)
                if (i < paragraphsVi.length) ...[
                  const SizedBox(height: AppConstants.paddingS),
                  Container(
                    padding: const EdgeInsets.all(AppConstants.paddingS),
                    decoration: BoxDecoration(
                      color: AppColors.primarySurface,
                      borderRadius: BorderRadius.circular(AppConstants.radiusS),
                    ),
                    child: Text(
                      paragraphsVi[i].trim(),
                      style: AppTextStyles.bodySmall.copyWith(
                        height: 1.7,
                        color: AppColors.primary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: AppConstants.paddingM),
              ],
            );
          }),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms);
  }
}

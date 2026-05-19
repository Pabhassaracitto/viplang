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
      // Theme 01
      'track_03': 'assets/audio/theme01_track03.mp3',
      'track_04': 'assets/audio/theme01_track04.mp3',
      'track_05': 'assets/audio/theme01_track05.mp3',
      'track_06': 'assets/audio/theme01_track06.mp3',
      // Theme 02
      'track_07': 'assets/audio/theme02_track07.mp3',
      'track_08': 'assets/audio/theme02_track08.mp3',
      'track_09': 'assets/audio/theme02_track09.mp3',
      'track_10': 'assets/audio/theme02_track10.mp3',
      // Theme 03
      'track_11': 'assets/audio/theme03_track11.mp3',
      'track_12': 'assets/audio/theme03_track12.mp3',
      'track_13': 'assets/audio/theme03_track13.mp3',
      'track_14': 'assets/audio/theme03_track14.mp3',
      // Theme 04
      'track_15': 'assets/audio/theme04_track15.mp3',
      'track_16': 'assets/audio/theme04_track16.mp3',
      'track_17': 'assets/audio/theme04_track17.mp3',
      'track_18': 'assets/audio/theme04_track18.mp3',
      // Theme 05
      'track_19': 'assets/audio/theme05_track19.mp3',
      'track_20': 'assets/audio/theme05_track20.mp3',
      'track_21': 'assets/audio/theme05_track21.mp3',
      'track_22': 'assets/audio/theme05_track22.mp3',
      // Theme 06
      'track_23': 'assets/audio/theme06_track23.mp3',
      'track_24': 'assets/audio/theme06_track24.mp3',
      'track_25': 'assets/audio/theme06_track25.mp3',
      'track_26': 'assets/audio/theme06_track26.mp3',
      // Theme 07
      'track_27': 'assets/audio/theme07_track27.mp3',
      'track_28': 'assets/audio/theme07_track28.mp3',
      'track_29': 'assets/audio/theme07_track29.mp3',
      'track_30': 'assets/audio/theme07_track30.mp3',
      // Theme 08
      'track_31': 'assets/audio/theme08_track31.mp3',
      'track_32': 'assets/audio/theme08_track32.mp3',
      'track_33': 'assets/audio/theme08_track33.mp3',
      'track_34': 'assets/audio/theme08_track34.mp3',
      // Theme 09
      'track_35': 'assets/audio/theme09_track35.mp3',
      'track_36': 'assets/audio/theme09_track36.mp3',
      'track_37': 'assets/audio/theme09_track37.mp3',
      'track_38': 'assets/audio/theme09_track38.mp3',
      // Theme 10
      'track_39': 'assets/audio/theme10_track39.mp3',
      'track_40': 'assets/audio/theme10_track40.mp3',
      'track_41': 'assets/audio/theme10_track41.mp3',
      'track_42': 'assets/audio/theme10_track42.mp3',
      // Theme 11
      'track_43': 'assets/audio/theme11_track43.mp3',
      'track_44': 'assets/audio/theme11_track44.mp3',
      'track_45': 'assets/audio/theme11_track45.mp3',
      'track_46': 'assets/audio/theme11_track46.mp3',
      // Theme 12
      'track_47': 'assets/audio/theme12_track47.mp3',
      'track_48': 'assets/audio/theme12_track48.mp3',
      'track_49': 'assets/audio/theme12_track49.mp3',
      'track_50': 'assets/audio/theme12_track50.mp3',
      // Theme 13
      'track_51': 'assets/audio/theme13_track51.mp3',
      'track_52': 'assets/audio/theme13_track52.mp3',
      'track_53': 'assets/audio/theme13_track53.mp3',
      'track_54': 'assets/audio/theme13_track54.mp3',
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
              key: ValueKey(
                'player_$audioPath',
              ), // Thêm key để buộc rebuild khi audioPath thay đổi
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

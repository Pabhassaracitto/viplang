import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../widgets/audio_player_widget.dart';

class PhaseReadListenScreen extends StatefulWidget {
  final int dayNumber;
  final String themeId;
  final VoidCallback onComplete;

  const PhaseReadListenScreen({
    super.key,
    required this.dayNumber,
    required this.themeId,
    required this.onComplete,
  });

  @override
  State<PhaseReadListenScreen> createState() => _PhaseReadListenScreenState();
}

class _PhaseReadListenScreenState extends State<PhaseReadListenScreen> {
  bool _hasListened = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Instruction
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
                        'Bước 1: Đọc & Nghe',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'Nghe kỹ rồi mới nói to theo',
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

          // Audio Player
          AudioPlayerWidget(
            audioUrl: 'assets/audio/theme1_track03.mp3', // Tên file bạn đặt vào
            title: 'Track 03 - Listening 1.1',
            onPlayComplete: () {
              setState(() => _hasListened = true);
            },
          ),

          const SizedBox(height: AppConstants.paddingL),

          // Reading Content
          _buildReadingContent(),

          const SizedBox(height: AppConstants.paddingXL),

          // Complete Button
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

  Widget _buildReadingContent() {
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
          Row(
            children: [
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
            ],
          ),
          const SizedBox(height: AppConstants.paddingM),
          Text(
            'This familiar theme will occur in all seven sections of the TOEIC test. '
            'It is generally about office situations such as meetings, conferences, '
            'office equipment, policies and procedures and is related directly to both '
            'the Personnel and Purchasing themes.',
            style: AppTextStyles.bodyMedium.copyWith(
              height: 1.8,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingM),
          Text(
            'In the office, situations will be about all kinds of meetings, memos, letters, '
            'faxes, emails, departments, all kinds of equipment that has to be looked after '
            'such as photocopiers, fax machines, computers, air conditioners, telephones.',
            style: AppTextStyles.bodyMedium.copyWith(
              height: 1.8,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms);
  }
}

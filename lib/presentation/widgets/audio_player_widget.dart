// lib/presentation/widgets/audio_player_widget.dart

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;
  final String title;
  final VoidCallback? onPlayComplete;

  const AudioPlayerWidget({
    super.key,
    required this.audioUrl,
    required this.title,
    this.onPlayComplete,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late final AudioPlayer _player;
  bool _isPlaying = false;
  bool _isLoading = false;
  bool _hasError = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  double _speed = 1.0;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    // Lắng nghe trạng thái phát
    _player.playerStateStream.listen((state) {
      if (!mounted) return;
      setState(() {
        _isPlaying = state.playing;
        _isLoading =
            state.processingState == ProcessingState.loading ||
            state.processingState == ProcessingState.buffering;
      });
      // Gọi callback khi phát xong
      if (state.processingState == ProcessingState.completed) {
        widget.onPlayComplete?.call();
        setState(() => _isPlaying = false);
      }
    });

    // Lắng nghe duration
    _player.durationStream.listen((d) {
      if (!mounted) return;
      setState(() => _duration = d ?? Duration.zero);
    });

    // Lắng nghe position
    _player.positionStream.listen((p) {
      if (!mounted) return;
      setState(() => _position = p);
    });

    // Load audio
    await _loadAudio();
  }

  Future<void> _loadAudio() async {
    if (widget.audioUrl.isEmpty) return;

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      if (widget.audioUrl.startsWith('http')) {
        await _player.setUrl(widget.audioUrl);
      } else {
        // Asset audio
        await _player.setAsset(widget.audioUrl);
      }
      setState(() => _isLoading = false);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      debugPrint('AudioPlayer error: $e');
    }
  }

  Future<void> _togglePlay() async {
    if (_hasError) {
      await _loadAudio();
      return;
    }
    if (_isPlaying) {
      await _player.pause();
    } else {
      // Nếu đã phát xong thì seek về đầu
      if (_player.processingState == ProcessingState.completed) {
        await _player.seek(Duration.zero);
      }
      await _player.play();
    }
  }

  Future<void> _setSpeed(double speed) async {
    setState(() => _speed = speed);
    await _player.setSpeed(speed);
  }

  String _formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Title row ────────────────────────────────────────
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppConstants.radiusXS),
                ),
                child: Text(
                  '🎵 ${widget.title}',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              // Speed selector
              _buildSpeedSelector(),
            ],
          ),

          const SizedBox(height: AppConstants.paddingM),

          // ── Controls row ──────────────────────────────────────
          Row(
            children: [
              // Play/Pause button
              GestureDetector(
                onTap: _isLoading ? null : _togglePlay,
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: _hasError ? AppColors.error : AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: _isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(14),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Icon(
                          _hasError
                              ? Icons.refresh_rounded
                              : _isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                ),
              ),

              const SizedBox(width: AppConstants.paddingM),

              // Progress + Duration
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Slider
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 6,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 12,
                        ),
                        activeTrackColor: AppColors.primary,
                        inactiveTrackColor: AppColors.border,
                        thumbColor: AppColors.primary,
                        overlayColor: AppColors.primary.withValues(alpha: 0.15),
                      ),
                      child: Slider(
                        value: _duration.inMilliseconds > 0
                            ? (_position.inMilliseconds /
                                      _duration.inMilliseconds)
                                  .clamp(0.0, 1.0)
                            : 0.0,
                        onChanged: _duration.inMilliseconds > 0
                            ? (v) {
                                final pos = Duration(
                                  milliseconds: (v * _duration.inMilliseconds)
                                      .round(),
                                );
                                _player.seek(pos);
                              }
                            : null,
                      ),
                    ),

                    // Time labels
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingXS,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_position),
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 10,
                            ),
                          ),
                          if (_hasError)
                            Text(
                              'File chưa có - nhấn để thử lại',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.error,
                                fontSize: 10,
                              ),
                            )
                          else
                            Text(
                              _formatDuration(_duration),
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 10,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpeedSelector() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [0.75, 1.0, 1.25].map((speed) {
        final isSelected = _speed == speed;
        return GestureDetector(
          onTap: () => _setSpeed(speed),
          child: Container(
            margin: const EdgeInsets.only(left: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppConstants.radiusXS),
            ),
            child: Text(
              '${speed}x',
              style: AppTextStyles.caption.copyWith(
                color: isSelected ? Colors.white : AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 10,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

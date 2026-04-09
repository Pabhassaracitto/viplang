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
  late AudioPlayer _player;
  bool _isLoading = true;
  bool _hasError = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  double _speed = 1.0;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
    _setupListeners();
  }

  Future<void> _initAudio() async {
    try {
      // Hỗ trợ cả asset và network URL
      if (widget.audioUrl.startsWith('http')) {
        await _player.setUrl(widget.audioUrl);
      } else {
        await _player.setAsset(widget.audioUrl);
      }
      if (mounted) {
        setState(() {
          _duration = _player.duration ?? Duration.zero;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
      debugPrint('Audio error: $e');
    }
  }

  void _setupListeners() {
    // Lắng nghe vị trí hiện tại
    _player.positionStream.listen((position) {
      if (mounted) {
        setState(() => _position = position);
      }
    });

    // Lắng nghe trạng thái phát
    _player.playerStateStream.listen((state) {
      if (mounted) {
        setState(() => _isPlaying = state.playing);

        // Khi phát xong
        if (state.processingState == ProcessingState.completed) {
          _player.seek(Duration.zero);
          _player.stop();
          widget.onPlayComplete?.call();
        }
      }
    });

    // Lắng nghe duration
    _player.durationStream.listen((duration) {
      if (mounted && duration != null) {
        setState(() => _duration = duration);
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _togglePlay() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  void _seekBackward() async {
    final newPos = _position - const Duration(seconds: 10);
    await _player.seek(newPos < Duration.zero ? Duration.zero : newPos);
  }

  void _seekForward() async {
    final newPos = _position + const Duration(seconds: 10);
    await _player.seek(newPos > _duration ? _duration : newPos);
  }

  void _changeSpeed() async {
    final speeds = [0.75, 1.0, 1.25, 1.5];
    final currentIdx = speeds.indexOf(_speed);
    final nextIdx = (currentIdx + 1) % speeds.length;
    setState(() => _speed = speeds[nextIdx]);
    await _player.setSpeed(_speed);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  double get _progressValue {
    if (_duration.inMilliseconds == 0) return 0.0;
    return (_position.inMilliseconds / _duration.inMilliseconds).clamp(
      0.0,
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingM),
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
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          // Title Row
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppConstants.radiusS),
                ),
                child: const Icon(
                  Icons.headphones,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppConstants.paddingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      _isLoading
                          ? 'Đang tải...'
                          : _hasError
                          ? 'Không tải được audio'
                          : _formatDuration(_duration),
                      style: AppTextStyles.caption.copyWith(
                        color: _hasError
                            ? AppColors.error
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              // Speed Button
              if (!_isLoading && !_hasError)
                GestureDetector(
                  onTap: _changeSpeed,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingS,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppConstants.radiusS),
                    ),
                    child: Text(
                      '${_speed}x',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: AppConstants.paddingM),

          // Error State
          if (_hasError)
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 20,
                  ),
                  const SizedBox(width: AppConstants.paddingS),
                  Expanded(
                    child: Text(
                      'Không tìm thấy file audio: ${widget.audioUrl}',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Loading State
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(AppConstants.paddingM),
              child: CircularProgressIndicator(),
            ),

          // Player Controls
          if (!_isLoading && !_hasError) ...[
            // Progress Slider
            Column(
              children: [
                SliderTheme(
                  data: SliderThemeData(
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 6,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 12,
                    ),
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.border,
                    thumbColor: AppColors.primary,
                    overlayColor: AppColors.primary.withValues(alpha: 0.2),
                    trackHeight: 3,
                  ),
                  child: Slider(
                    value: _progressValue,
                    onChanged: (value) {
                      final newPos = Duration(
                        milliseconds: (value * _duration.inMilliseconds)
                            .round(),
                      );
                      _player.seek(newPos);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingS,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_position),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textHint,
                        ),
                      ),
                      Text(
                        _formatDuration(_duration),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppConstants.paddingS),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Rewind 10s
                IconButton(
                  onPressed: _seekBackward,
                  icon: const Icon(Icons.replay_10),
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: AppConstants.paddingM),

                // Play/Pause
                GestureDetector(
                  onTap: _togglePlay,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingM),

                // Forward 10s
                IconButton(
                  onPressed: _seekForward,
                  icon: const Icon(Icons.forward_10),
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

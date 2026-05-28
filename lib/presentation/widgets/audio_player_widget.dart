// lib/presentation/widgets/audio_player_widget.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/services/audio_path_resolver.dart';
import '../../core/services/download_service.dart';
import '../../core/services/safe_audio_service.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String? audioUrl;
  final String? themeId;
  final int? trackNum;
  final String title;
  final VoidCallback? onPlayComplete;

  const AudioPlayerWidget({
    super.key,
    this.audioUrl,
    this.themeId,
    this.trackNum,
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
  bool _isDownloading = false;
  bool _hasError = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  double _speed = 1.0;
  bool _isLooping = false;

  bool _isAudioAvailable = false;
  bool _isLocalAvailable = false;
  bool _isServerAvailable = true;
  String _fileName = '';

  Future<void> _toggleLoop() async {
    setState(() {
      _isLooping = !_isLooping;
    });
    await _player.setLoopMode(_isLooping ? LoopMode.one : LoopMode.off);
  }

  Future<void> _rewind() async {
    if (!_isAudioAvailable || _hasError) return;
    final newPosition = _position - const Duration(seconds: 5);
    await _player.seek(newPosition < Duration.zero ? Duration.zero : newPosition);
  }

  Future<void> _forward() async {
    if (!_isAudioAvailable || _hasError) return;
    final newPosition = _position + const Duration(seconds: 5);
    await _player.seek(newPosition > _duration ? _duration : newPosition);
  }

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
      
      // ✅ Fix: Khi bật chế độ lặp (hoặc phát bình thường), nếu vị trí phát đạt >= 95% thời lượng hoặc cách cuối < 1s,
      // coi như đã nghe xong để kích hoạt nút "Tiếp tục" ở Phase 1.
      if (_duration > Duration.zero &&
          (p >= _duration - const Duration(seconds: 1) || 
           p.inMilliseconds >= _duration.inMilliseconds * 0.95)) {
        widget.onPlayComplete?.call();
      }
    });

    // Kiểm tra tính khả dụng trước
    debugPrint('[AudioPlayer] _initAudio: url=${widget.audioUrl}, themeId=${widget.themeId}, trackNum=${widget.trackNum}');
    if (widget.themeId != null && widget.trackNum != null) {
      _fileName = AudioPathResolver.instance.getFileName(widget.themeId!, widget.trackNum!);
      final isLocal = await DownloadService.instance.isDownloaded(_fileName);
      final available = isLocal || await SafeAudioService.instance.isAudioAvailable(widget.themeId!, widget.trackNum!);
      final serverAvailable = AudioPathResolver.instance.isServerFileAvailable(_fileName);
      setState(() {
        _isAudioAvailable = available;
        _isLocalAvailable = isLocal;
        _isServerAvailable = serverAvailable;
      });
    } else if (widget.audioUrl != null && widget.audioUrl!.isNotEmpty) {
      final pathParts = widget.audioUrl!.split('/');
      _fileName = pathParts.last;
      
      final isLocal = await DownloadService.instance.isDownloaded(_fileName);
      final isAssetAvailable = widget.audioUrl!.startsWith('assets/')
          ? await SafeAudioService.instance.isAssetAvailable(widget.audioUrl!)
          : true; // URL http luôn coi là Streamable
      final serverAvailable = AudioPathResolver.instance.isServerFileAvailable(_fileName);

      setState(() {
        _isAudioAvailable = isLocal || isAssetAvailable;
        _isLocalAvailable = isLocal;
        _isServerAvailable = serverAvailable;
      });
    } else {
      setState(() {
        _isAudioAvailable = true;
        _isLocalAvailable = false;
        _isServerAvailable = true;
      });
    }

    // Load audio nếu file đã có sẵn
    if (_isAudioAvailable) {
      await _loadAudio();
    }
  }

  Future<void> _loadAudio() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      // 1. Thử tải từ file local đã download trước (cho tất cả trường hợp có _fileName)
      if (_fileName.isNotEmpty) {
        final isDownloaded = await DownloadService.instance.isDownloaded(_fileName);
        if (isDownloaded) {
          final localPath = await DownloadService.instance.getLocalPathForFile(_fileName);
          final file = File(localPath);
          if (await file.exists()) {
            await _player.setFilePath(localPath);
            setState(() => _isLoading = false);
            return;
          }
        }
      }

      // 2. Nếu chưa tải local, load bằng dịch vụ chuẩn hóa hoặc fallback
      if (widget.themeId != null && widget.trackNum != null) {
        await SafeAudioService.instance.preparePlayer(
          _player,
          widget.themeId!,
          widget.trackNum!,
        );
      } else if (widget.audioUrl != null && widget.audioUrl!.isNotEmpty) {
        // Fallback cho URL trực tiếp hoặc asset cũ
        if (widget.audioUrl!.startsWith('http')) {
          await _player.setUrl(widget.audioUrl!);
        } else {
          await _player.setAsset(widget.audioUrl!);
        }
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

  Future<void> _downloadOnDemand() async {
    if (_isDownloading) return;
    setState(() {
      _isDownloading = true;
    });

    try {
      final file = await DownloadService.instance.downloadAudio(_fileName);
      if (file != null) {
        setState(() {
          _isAudioAvailable = true;
          _isLocalAvailable = true;
          _hasError = false;
        });
        await _loadAudio();
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tải file học thất bại. Vui lòng kiểm tra lại kết nối mạng.'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Error on-demand download: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
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

          // ── Progress + Duration Full-Width ────────────────────
          Column(
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
                  onChanged: (_duration.inMilliseconds > 0 && _isAudioAvailable)
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
                  horizontal: AppConstants.paddingS,
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
                    if (!_isAudioAvailable || (_hasError && !_isLocalAvailable))
                      Text(
                        _isServerAvailable
                            ? 'Nhấn nút cam để tải Audio học ngoại tuyến (<1MB)'
                            : 'Bài học này chưa hỗ trợ Audio',
                        style: AppTextStyles.caption.copyWith(
                          color: _isServerAvailable ? Colors.amber.shade800 : Colors.grey.shade500,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else if (_hasError)
                      Text(
                        'Gặp lỗi khi load audio - Click nút để thử lại',
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

          const SizedBox(height: AppConstants.paddingM),

          // ── Playback Controls Row ────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Loop Button
              Tooltip(
                message: _isLooping ? 'Tắt lặp lại' : 'Lặp lại vô cực',
                child: GestureDetector(
                  onTap: _isAudioAvailable && !_hasError && !_isLoading ? _toggleLoop : null,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _isLooping
                          ? AppColors.primary.withValues(alpha: 0.15)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.repeat_one_rounded,
                      color: _isLooping
                          ? AppColors.primary
                          : (_isAudioAvailable && !_hasError ? AppColors.textSecondary : Colors.grey.shade400),
                      size: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.paddingM),

              // 2. Rewind 5s Button
              Tooltip(
                message: 'Lùi lại 5s',
                child: IconButton(
                  onPressed: _isAudioAvailable && !_hasError && !_isLoading ? _rewind : null,
                  icon: const Icon(Icons.replay_5_rounded),
                  iconSize: 26,
                  color: AppColors.primary,
                  disabledColor: Colors.grey.shade400,
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),

              // 3. Play/Pause/Download button
              GestureDetector(
                onTap: _isDownloading
                    ? null
                    : ((!_isAudioAvailable || (_hasError && !_isLocalAvailable))
                        ? (_isServerAvailable ? _downloadOnDemand : null)
                        : (_isLoading ? null : _togglePlay)),
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: _isDownloading
                        ? AppColors.primary.withValues(alpha: 0.5)
                        : ((!_isAudioAvailable || (_hasError && !_isLocalAvailable))
                            ? (_isServerAvailable ? Colors.amber.shade700 : Colors.grey.shade300)
                            : (_hasError ? AppColors.error : AppColors.primary)),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ((!_isAudioAvailable || (_hasError && !_isLocalAvailable)) && !_isDownloading)
                            ? (_isServerAvailable
                                ? Colors.amber.withValues(alpha: 0.3)
                                : Colors.transparent)
                            : AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: _isDownloading
                      ? const Padding(
                          padding: EdgeInsets.all(14),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : ((!_isAudioAvailable || (_hasError && !_isLocalAvailable))
                          ? Icon(
                              _isServerAvailable
                                  ? Icons.download_for_offline_rounded
                                  : Icons.music_off_rounded,
                              color: _isServerAvailable ? Colors.white : Colors.grey.shade500,
                              size: 26,
                            )
                          : (_isLoading
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
                                ))),
                ),
              ),
              const SizedBox(width: AppConstants.paddingS),

              // 4. Forward 5s Button
              Tooltip(
                message: 'Tiến lên 5s',
                child: IconButton(
                  onPressed: _isAudioAvailable && !_hasError && !_isLoading ? _forward : null,
                  icon: const Icon(Icons.forward_5_rounded),
                  iconSize: 26,
                  color: AppColors.primary,
                  disabledColor: Colors.grey.shade400,
                ),
              ),
              const SizedBox(width: AppConstants.paddingM),
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

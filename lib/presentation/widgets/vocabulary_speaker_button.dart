// lib/presentation/widgets/vocabulary_speaker_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// Nút loa nhỏ gọn dùng chung cho SRS, FAB, vocab list
/// Sử dụng TTS để phát âm từ tiếng Anh
class VocabularySpeakerButton extends StatefulWidget {
  final String text;
  final double size;
  final Color? color;

  const VocabularySpeakerButton({
    super.key,
    required this.text,
    this.size = 20,
    this.color,
  });

  @override
  State<VocabularySpeakerButton> createState() =>
      _VocabularySpeakerButtonState();
}

class _VocabularySpeakerButtonState extends State<VocabularySpeakerButton> {
  final FlutterTts _tts = FlutterTts();
  bool _isPlaying = false;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    if (_initialized) return;
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.45);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    _initialized = true;
  }

  Future<void> _onTap() async {
    if (_isPlaying || !_initialized) return;

    setState(() => _isPlaying = true);

    try {
      await _tts.stop();
      await _initTts();
      await _tts.speak(widget.text.trim());
    } catch (e) {
      debugPrint('TTS error: $e');
    }

    // Reset icon sau ~1.5s
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() => _isPlaying = false);
    }
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: _isPlaying
              ? color.withValues(alpha: 0.25)
              : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          _isPlaying ? Icons.volume_up : Icons.volume_up_outlined,
          size: widget.size,
          color: color,
        ),
      ),
    );
  }
}

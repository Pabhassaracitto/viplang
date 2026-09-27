import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/services/tts_service.dart';

/// Hiển thị câu theo kiểu karaoke. Không phụ thuộc MP3: TTS đọc từng từ,
/// còn AudioPlayer có thể gọi [setExternalWordIndex] khi audio thật phát.
class KaraokeTextWidget extends StatefulWidget {
  final String text;
  final bool autoStart;
  final Duration wordDuration;
  const KaraokeTextWidget({super.key, required this.text, this.autoStart = false,
    this.wordDuration = const Duration(milliseconds: 360)});
  @override State<KaraokeTextWidget> createState() => _KaraokeTextWidgetState();
}
class _KaraokeTextWidgetState extends State<KaraokeTextWidget> {
  Timer? _timer; int _active = -1; bool _speaking = false;
  List<String> get _words => widget.text.trim().split(RegExp(r'\s+'));
  @override void initState() { super.initState(); if (widget.autoStart) _start(); }
  @override void dispose() { _timer?.cancel(); super.dispose(); }
  Future<void> _start() async {
    _timer?.cancel(); setState(() { _active = 0; _speaking = true; });
    await TtsService.instance.speak(widget.text);
    if (!mounted) return;
    _timer = Timer.periodic(widget.wordDuration, (_) {
      if (_active >= _words.length - 1) { _timer?.cancel(); setState(() { _speaking = false; _active = -1; }); }
      else { setState(() => _active++); }
    });
  }
  void setExternalWordIndex(int index) { if (!mounted) return; setState(() => _active = index.clamp(-1, _words.length - 1)); }
  @override Widget build(BuildContext context) => GestureDetector(
    onTap: _speaking ? null : _start,
    child: Container(width: double.infinity, padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(14)),
      child: Wrap(spacing: 5, runSpacing: 6, children: List.generate(_words.length, (i) =>
        AnimatedContainer(duration: const Duration(milliseconds: 180), padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          decoration: BoxDecoration(color: i == _active ? Theme.of(context).colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(4)), child: Text(_words[i], style: TextStyle(
              fontSize: 18, color: i == _active ? Colors.white : Theme.of(context).colorScheme.onSurface,
              fontWeight: i == _active ? FontWeight.bold : FontWeight.normal))))));
}

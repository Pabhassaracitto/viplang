import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  TtsService._();
  static final TtsService instance = TtsService._();

  final FlutterTts _tts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;

  Future<void> _ensureInitialized() async {
    if (_isInitialized) return;

    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);

    // Chọn giọng tốt nhất có sẵn trên thiết bị
    final voices = await _tts.getVoices;
    if (voices != null) {
      final preferred = (voices as List).firstWhere(
        (v) =>
            v['locale']?.toString().startsWith('en') == true &&
            v['name']?.toString().toLowerCase().contains('female') == true,
        orElse: () => null,
      );
      if (preferred != null) {
        await _tts.setVoice({
          'name': preferred['name'],
          'locale': preferred['locale'],
        });
      }
    }

    _tts.setCompletionHandler(() => _isSpeaking = false);
    _tts.setErrorHandler((msg) {
      _isSpeaking = false;
      debugPrint('❌ TTS Error: $msg');
    });

    _isInitialized = true;
  }

  /// Phát âm thanh — tự động dừng nếu đang phát
  Future<void> speak(String text) async {
    if (text.trim().isEmpty) return;

    await _ensureInitialized();

    // Chống phát chồng chéo: dừng trước khi phát mới
    if (_isSpeaking) {
      await stop();
      // Delay nhỏ để tránh click sound
      await Future.delayed(const Duration(milliseconds: 100));
    }

    _isSpeaking = true;
    await _tts.speak(text.trim());
  }

  Future<void> stop() async {
    _isSpeaking = false;
    await _tts.stop();
  }

  bool get isSpeaking => _isSpeaking;

  /// Giải phóng resource khi app tắt
  Future<void> dispose() async {
    await stop();
    await _tts.stop();
  }
}

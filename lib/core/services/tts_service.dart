import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'hive_service.dart';

/// Đọc văn bản bằng giọng máy (Text-To-Speech).
///
/// Vai trò trong app:
/// 1. Đọc từ vựng ở màn Từ vựng / SRS (như cũ).
/// 2. **Phương án dự phòng khi chưa có MP3 thật** — người học vẫn nghe được
///    bài đọc dù chưa tải được file từ máy chủ (xem `AudioPlayerWidget`).
///
/// Thứ tự ưu tiên của app luôn là: **MP3 thật (local → asset) → tải về → TTS**.
class TtsService {
  TtsService._();
  static final TtsService instance = TtsService._();

  final FlutterTts _tts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;

  /// Tăng mỗi lần [stop] để vòng lặp đọc nhiều đoạn biết mà dừng lại.
  int _sessionId = 0;

  /// Hoàn tất khi engine báo đọc xong (hoặc lỗi/huỷ) 1 đoạn.
  Completer<void>? _utterance;

  /// Cho UI lắng nghe để đổi icon phát ↔ dừng.
  final ValueNotifier<bool> speakingNotifier = ValueNotifier<bool>(false);

  /// Android/iOS đọc quá dài dễ bị engine cắt ngang → tách đoạn ngắn.
  static const int maxChunkChars = 280;

  /// Người dùng tắt TTS trong Settings thì speak() thành no-op
  bool get isEnabled {
    try {
      return HiveService.settingsBox.get('tts_enabled', defaultValue: true)
          as bool;
    } catch (_) {
      return true;
    }
  }

  bool get isSpeaking => _isSpeaking;

  /// Tốc độ đọc suy ra từ "Tốc độ phát mặc định" trong Cài đặt.
  /// 0.5 là tốc độ "bình thường" của engine → nhân với hệ số người dùng chọn.
  double get _preferredRate {
    var speed = 1.0;
    try {
      final stored = HiveService.settingsBox.get('playback_speed');
      if (stored is num) speed = stored.toDouble();
    } catch (_) {
      // Chưa init Hive → giữ mặc định
    }
    return (0.5 * speed).clamp(0.1, 1.0);
  }

  Future<void> _ensureInitialized() async {
    if (_isInitialized) return;

    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(_preferredRate);
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

    _tts.setCompletionHandler(() => _finishUtterance());
    _tts.setCancelHandler(() => _finishUtterance());
    _tts.setErrorHandler((msg) {
      debugPrint('❌ TTS Error: $msg');
      _finishUtterance();
    });

    _isInitialized = true;
  }

  void _finishUtterance() {
    _isSpeaking = false;
    speakingNotifier.value = false;
    final completer = _utterance;
    _utterance = null;
    if (completer != null && !completer.isCompleted) completer.complete();
  }

  /// Phát âm 1 câu/1 từ — không chờ đọc xong (giữ nguyên API cũ).
  Future<void> speak(String text) async {
    if (text.trim().isEmpty) return;
    if (!isEnabled) return; // Đã tắt trong Cài đặt

    await _ensureInitialized();
    await _tts.setSpeechRate(_preferredRate);

    // Chống phát chồng chéo: dừng trước khi phát mới
    if (_isSpeaking) {
      await stop();
      // Delay nhỏ để tránh click sound
      await Future.delayed(const Duration(milliseconds: 100));
    }

    _isSpeaking = true;
    speakingNotifier.value = true;
    await _tts.speak(text.trim());
  }

  /// Đọc cả bài (nhiều câu) và **chờ đọc xong**.
  ///
  /// Dùng làm phương án thay thế khi chưa có MP3: tách thành từng đoạn ngắn
  /// rồi đọc tuần tự, dừng ngay khi người dùng bấm dừng ([stop]).
  ///
  /// Trả về `true` nếu đọc hết bài, `false` nếu bị dừng giữa chừng / TTS tắt.
  Future<bool> speakLongText(String text) async {
    final chunks = splitIntoChunks(text);
    if (chunks.isEmpty) return false;
    if (!isEnabled) return false;

    await stop();
    await _ensureInitialized();
    await _tts.setSpeechRate(_preferredRate);

    final session = ++_sessionId;
    _isSpeaking = true;
    speakingNotifier.value = true;

    try {
      for (final chunk in chunks) {
        if (session != _sessionId) return false; // đã bị stop()
        final completer = Completer<void>();
        _utterance = completer;
        await _tts.speak(chunk);
        await completer.future.timeout(
          _estimatedDuration(chunk),
          onTimeout: () {},
        );
      }
    } catch (e) {
      debugPrint('❌ TTS speakLongText: $e');
      _finishUtterance();
      return false;
    }

    if (session != _sessionId) return false;
    _finishUtterance();
    return true;
  }

  /// Trần thời gian chờ 1 đoạn — chỉ là lưới an toàn khi engine không báo xong.
  Duration _estimatedDuration(String chunk) =>
      Duration(milliseconds: 5000 + chunk.length * 150);

  Future<void> stop() async {
    _sessionId++;
    _isSpeaking = false;
    speakingNotifier.value = false;
    final completer = _utterance;
    _utterance = null;
    if (completer != null && !completer.isCompleted) completer.complete();
    try {
      await _tts.stop();
    } catch (e) {
      debugPrint('❌ TTS stop: $e');
    }
  }

  /// Tách văn bản dài thành các đoạn ≤ [maxChars], ưu tiên cắt ở cuối câu.
  ///
  /// Hàm thuần (không đụng plugin) để test được.
  @visibleForTesting
  static List<String> splitIntoChunks(String text, {int maxChars = maxChunkChars}) {
    final normalized = text.replaceAll('\r\n', '\n').trim();
    if (normalized.isEmpty) return const [];

    // Tách theo câu, giữ lại dấu câu.
    final sentences = <String>[];
    final buffer = StringBuffer();
    for (var i = 0; i < normalized.length; i++) {
      final ch = normalized[i];
      buffer.write(ch);
      final isEnd = ch == '.' || ch == '!' || ch == '?' || ch == '\n';
      final next = i + 1 < normalized.length ? normalized[i + 1] : '';
      if (isEnd && (next.isEmpty || next == ' ' || next == '\n')) {
        final s = buffer.toString().trim();
        if (s.isNotEmpty) sentences.add(s);
        buffer.clear();
      }
    }
    final tail = buffer.toString().trim();
    if (tail.isNotEmpty) sentences.add(tail);

    final chunks = <String>[];
    var current = StringBuffer();

    void flush() {
      final s = current.toString().trim();
      if (s.isNotEmpty) chunks.add(s);
      current = StringBuffer();
    }

    for (final sentence in sentences) {
      if (sentence.length > maxChars) {
        flush();
        // Câu quá dài (hiếm) → cắt cứng theo khoảng trắng gần nhất.
        var rest = sentence;
        while (rest.length > maxChars) {
          var cut = rest.lastIndexOf(' ', maxChars);
          if (cut <= 0) cut = maxChars;
          chunks.add(rest.substring(0, cut).trim());
          rest = rest.substring(cut).trim();
        }
        if (rest.isNotEmpty) chunks.add(rest);
        continue;
      }

      if (current.length + sentence.length + 1 > maxChars) flush();
      if (current.isNotEmpty) current.write(' ');
      current.write(sentence);
    }
    flush();

    return chunks;
  }

  /// Giải phóng resource khi app tắt
  Future<void> dispose() async {
    await stop();
  }
}

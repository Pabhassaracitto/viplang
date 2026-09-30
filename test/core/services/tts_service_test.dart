// test/core/services/tts_service_test.dart
//
// TTS chỉ là phương án dự phòng khi chưa có MP3 thật, nhưng phải đọc được
// cả bài dài: engine Android/iOS hay cắt ngang câu quá dài nên bài đọc được
// tách thành từng đoạn ngắn theo ranh giới câu.
import 'package:flutter_test/flutter_test.dart';
import 'package:viplang/core/services/tts_service.dart';

void main() {
  group('TtsService.splitIntoChunks', () {
    test('văn bản rỗng → không có đoạn nào', () {
      expect(TtsService.splitIntoChunks(''), isEmpty);
      expect(TtsService.splitIntoChunks('   \n  '), isEmpty);
    });

    test('bài ngắn giữ nguyên 1 đoạn', () {
      const text = 'This theme is anything but general.';
      expect(TtsService.splitIntoChunks(text), [text]);
    });

    test('không đoạn nào vượt quá giới hạn và không mất chữ', () {
      final text = List.generate(
        40,
        (i) => 'This is sentence number $i about corporate business.',
      ).join(' ');

      final chunks = TtsService.splitIntoChunks(text);

      expect(chunks.length, greaterThan(1));
      for (final chunk in chunks) {
        expect(chunk.length, lessThanOrEqualTo(TtsService.maxChunkChars));
      }
      expect(
        chunks.join(' ').replaceAll(RegExp(r'\s+'), ' '),
        text.replaceAll(RegExp(r'\s+'), ' '),
      );
    });

    test('cắt ở cuối câu, không cắt giữa câu', () {
      final text = '${'A' * 200}. ${'B' * 200}. ${'C' * 100}.';

      final chunks = TtsService.splitIntoChunks(text);

      expect(chunks.length, 3);
      expect(chunks[0], '${'A' * 200}.');
      expect(chunks[1], '${'B' * 200}.');
      expect(chunks[2], '${'C' * 100}.');
    });

    test('câu dài hơn giới hạn vẫn được cắt nhỏ theo khoảng trắng', () {
      final text = List.filled(120, 'word').join(' '); // 1 "câu" ~599 ký tự

      final chunks = TtsService.splitIntoChunks(text);

      expect(chunks.length, greaterThan(1));
      for (final chunk in chunks) {
        expect(chunk.length, lessThanOrEqualTo(TtsService.maxChunkChars));
        expect(chunk.trim(), isNotEmpty);
      }
      expect(chunks.join(' '), text);
    });

    test('gộp nhiều câu ngắn vào cùng một đoạn', () {
      final text = List.filled(10, 'Hi there.').join(' '); // ~99 ký tự
      expect(TtsService.splitIntoChunks(text).length, 1);
    });

    test('xuống dòng cũng là ranh giới đoạn', () {
      const text = 'Paragraph one\n\nParagraph two';
      final chunks = TtsService.splitIntoChunks(text, maxChars: 20);
      expect(chunks, ['Paragraph one', 'Paragraph two']);
    });
  });
}

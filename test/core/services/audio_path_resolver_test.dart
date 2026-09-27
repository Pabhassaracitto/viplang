import 'package:flutter_test/flutter_test.dart';
import 'package:viplang/core/services/audio_path_resolver.dart';
import 'package:viplang/data/content/all_themes_registry.dart';

void main() {
  final resolver = AudioPathResolver.instance;

  group('AudioPathResolver.getFileName', () {
    test('theme 1 → track tuyệt đối 03–06', () {
      expect(resolver.getFileName('theme_01_offices', 1), 'theme01_track03.mp3');
      expect(resolver.getFileName('theme_01_offices', 4), 'theme01_track06.mp3');
    });

    test('theme 13 → track tuyệt đối 51–54', () {
      expect(resolver.getFileName('theme_13_health', 1), 'theme13_track51.mp3');
      expect(resolver.getFileName('theme_13_health', 4), 'theme13_track54.mp3');
    });

    test('công thức: absTrack = (theme-1)*4 + track + 2', () {
      expect(resolver.getFileName('theme_05_entertainment', 2), 'theme05_track20.mp3');
      // (5-1)*4 + 2 + 2 = 20
      expect(resolver.getFileName('theme_10_corporate_development', 3), 'theme10_track41.mp3');
      // (10-1)*4 + 3 + 2 = 41
    });
  });

  group('AudioPathResolver whitelist server', () {
    test('13 theme × 4 track = 52 file, tất cả khớp whitelist', () {
      final themes = AllThemesRegistry.getAllThemes();
      expect(themes.length, 13);

      final allFiles = <String>{};
      for (final theme in themes) {
        final files = resolver.getAllFileNamesForTheme(theme.id);
        expect(files.length, 4, reason: '${theme.id} cần đúng 4 track');
        for (final f in files) {
          expect(
            resolver.isServerFileAvailable(f),
            isTrue,
            reason: '$f phải có trong whitelist server',
          );
        }
        allFiles.addAll(files);
      }
      expect(allFiles.length, 52);
    });

    test('file không tồn tại trên server → isServerFileAvailable false', () {
      expect(resolver.isServerFileAvailable('theme01_track01.mp3'), isFalse);
      expect(resolver.isServerFileAvailable('theme99_track99.mp3'), isFalse);
      expect(resolver.isServerFileAvailable('index.html'), isFalse);
    });

    test('themeId thiếu phần số → throw', () {
      expect(
        () => resolver.getFileName('invalid', 1),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('themeId có phần số không parse được → FormatException', () {
      expect(
        () => resolver.getFileName('invalid_id', 1),
        throwsA(isA<FormatException>()),
      );
    });

    test('trackNum phải 1–4', () {
      expect(
        () => resolver.getFileName('theme_01_offices', 0),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => resolver.getFileName('theme_01_offices', 5),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}

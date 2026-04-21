/// Quản lý tập trung toàn bộ đường dẫn audio cho 13 chủ đề.
/// Không còn hardcode path rải rác trong từng màn hình.
class AudioPathResolver {
  AudioPathResolver._();
  static final AudioPathResolver instance = AudioPathResolver._();

  /// trackNum convention:
  /// 1 = Day 1 Reading
  /// 2 = Day 2 Practice 1 (Conversation)
  /// 3 = Day 2 Practice 2 (Short Talk 1)
  /// 4 = Day 2 Practice 3 (Short Talk 2)
  String getListeningPath(String themeId, int trackNum) {
    assert(trackNum >= 1 && trackNum <= 4,
        'trackNum phải từ 1–4, nhận được: $trackNum');

    final num = _extractThemeNumber(themeId);
    return 'assets/audio/theme$num/listening_${num}_$trackNum.mp3';
  }

  /// Lấy tất cả tracks của một theme (để precheck existence)
  List<String> getAllTracksForTheme(String themeId) {
    return List.generate(4, (i) => getListeningPath(themeId, i + 1));
  }

  String _extractThemeNumber(String themeId) {
    // theme_12_housing_property → '12'
    final parts = themeId.split('_');
    if (parts.length < 2) {
      throw ArgumentError('ThemeId không hợp lệ: $themeId');
    }
    return parts[1].padLeft(2, '0');
  }
}

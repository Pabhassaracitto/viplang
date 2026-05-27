import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Quản lý tập trung toàn bộ đường dẫn audio cho 13 chủ đề.
/// Không còn hardcode path rải rác trong từng màn hình.
class AudioPathResolver {
  AudioPathResolver._();
  static final AudioPathResolver instance = AudioPathResolver._();

  static String? _localDirPath;

  /// Hoạt động lưu trữ thực của file audio trên Supabase Storage
  static const Set<String> _existingServerFiles = {
    // Theme 1
    'theme01_track03.mp3',
    'theme01_track04.mp3',
    'theme01_track05.mp3',
    'theme01_track06.mp3',
    // Theme 2
    'theme02_track07.mp3',
    'theme02_track08.mp3',
    'theme02_track09.mp3',
    'theme02_track10.mp3',
    // Theme 3
    'theme03_track11.mp3',
    'theme03_track12.mp3',
    'theme03_track13.mp3',
    'theme03_track14.mp3',
    // Theme 4
    'theme04_track15.mp3',
    'theme04_track16.mp3',
    'theme04_track17.mp3',
    'theme04_track18.mp3',
    // Theme 5
    'theme05_track19.mp3',
    'theme05_track20.mp3',
    'theme05_track21.mp3',
    'theme05_track22.mp3',
    // Theme 6
    'theme06_track23.mp3',
    'theme06_track24.mp3',
    'theme06_track25.mp3',
    'theme06_track26.mp3',
    // Theme 7
    'theme07_track27.mp3',
    'theme07_track28.mp3',
    'theme07_track29.mp3',
    'theme07_track30.mp3',
    // Theme 8
    'theme08_track31.mp3',
    'theme08_track32.mp3',
    'theme08_track33.mp3',
    'theme08_track34.mp3',
    // Theme 9
    'theme09_track35.mp3',
    'theme09_track36.mp3',
    'theme09_track37.mp3',
    'theme09_track38.mp3',
    // Theme 10
    'theme10_track39.mp3',
    'theme10_track40.mp3',
    'theme10_track41.mp3',
    'theme10_track42.mp3',
    // Theme 11
    'theme11_track43.mp3',
    'theme11_track44.mp3',
    'theme11_track45.mp3',
    'theme11_track46.mp3',
    // Theme 12
    'theme12_track47.mp3',
    'theme12_track48.mp3',
    'theme12_track49.mp3',
    'theme12_track50.mp3',
    // Theme 13
    'theme13_track51.mp3',
    'theme13_track52.mp3',
    'theme13_track53.mp3',
    'theme13_track54.mp3',
  };

  /// Khởi tạo đường dẫn local (nên gọi lúc app start)
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    _localDirPath = directory.path;
  }

  /// Kiểm tra xem file audio này có tồn tại trên máy chủ hay không
  bool isServerFileAvailable(String fileName) {
    return _existingServerFiles.contains(fileName);
  }

  /// trackNum convention:
  /// 1 = Day 1 Reading
  /// 2 = Day 2 Practice 1 (Conversation)
  /// 3 = Day 2 Practice 2 (Short Talk 1)
  /// 4 = Day 2 Practice 3 (Short Talk 2)
  Future<String> getListeningPath(String themeId, int trackNum) async {
    assert(
      trackNum >= 1 && trackNum <= 4,
      'trackNum phải từ 1–4, nhận được: $trackNum',
    );

    final fileName = getFileName(themeId, trackNum);

    // 1. Kiểm tra local storage trước
    if (_localDirPath != null) {
      final localFile = File('$_localDirPath/$fileName');
      if (await localFile.exists()) {
        return localFile.path;
      }
    }

    // 2. Trả về asset path mặc định
    return 'assets/audio/$fileName';
  }

  /// Lấy tên file chuẩn hóa cho một track
  String getFileName(String themeId, int trackNum) {
    final numStr = _extractThemeNumber(themeId);
    final numInt = int.parse(numStr);
    final absTrackIndex = (numInt - 1) * 4 + trackNum + 2;
    final trackStr = absTrackIndex.toString().padLeft(2, '0');
    final themeStr = numInt.toString().padLeft(2, '0');
    return 'theme${themeStr}_track$trackStr.mp3';
  }

  /// Lấy tất cả tracks của một theme (dưới dạng fileName để tải)
  List<String> getAllFileNamesForTheme(String themeId) {
    return List.generate(
      4,
      (i) => getFileName(themeId, i + 1),
    ).where((name) => _existingServerFiles.contains(name)).toList();
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

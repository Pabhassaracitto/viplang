import '../models/lesson_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';
import 'theme1_content.dart';
import 'theme2_content.dart';
import 'theme3_content.dart';

class AllThemesRegistry {
  static List<ThemeModel> getAllThemes() {
    return [Theme1Content.theme, Theme2Content.theme, Theme3Content.theme];
  }

  static LessonDay? getLesson(String themeId, int dayNumber) {
    switch (themeId) {
      case 'theme_01_offices':
        if (dayNumber == 1) return Theme1Content.day1;
        if (dayNumber == 2) return Theme1Content.day2;
        break;
      case 'theme_02_commerce':
        if (dayNumber == 1) return Theme2Content.day1;
        if (dayNumber == 2) return Theme2Content.day2;
        break;
      case 'theme_03_technical':
        if (dayNumber == 1) return Theme3Content.day1;
        if (dayNumber == 2) return Theme3Content.day2;
        break;
    }
    return null;
  }

  static int getTotalDays(String themeId) {
    switch (themeId) {
      case 'theme_01_offices':
      case 'theme_02_commerce':
      case 'theme_03_technical':
        return 2;
      default:
        return 0;
    }
  }

  static List<VocabModel> getVocabulary(String themeId) {
    switch (themeId) {
      case 'theme_01_offices':
        return Theme1Content.vocabulary;
      case 'theme_02_commerce':
        return Theme2Content.vocabulary;
      case 'theme_03_technical':
        return Theme3Content.vocabulary;
      default:
        return [];
    }
  }
}

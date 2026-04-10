// lib/data/content/all_themes_registry.dart

import '../models/lesson_model.dart';
import '../models/vocab_model.dart';
import 'theme1_content.dart';
import 'theme2_content.dart';

class AllThemesRegistry {
  static LessonDay? getLesson(String themeId, int dayNumber) {
    switch (themeId) {
      case 'theme_01_offices':
        return dayNumber == 1
            ? Theme1Content.day1
            : dayNumber == 2
            ? Theme1Content.day2
            : null;
      case 'theme_02_general_business':
        return dayNumber == 1
            ? Theme2Content.day1
            : dayNumber == 2
            ? Theme2Content.day2
            : null;
      default:
        return null;
    }
  }

  static int getTotalDays(String themeId) {
    switch (themeId) {
      case 'theme_01_offices':
      case 'theme_02_general_business':
        return 2;
      default:
        return 0;
    }
  }

  static List<VocabModel> getVocabulary(String themeId) {
    switch (themeId) {
      case 'theme_01_offices':
        return Theme1Content.vocabulary;
      case 'theme_02_general_business':
        return Theme2Content.vocabulary;
      default:
        return [];
    }
  }
}

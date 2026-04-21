import '../models/lesson_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';
import 'content_validator.dart';
import 'theme10_content.dart';
import 'theme11_content.dart';
import 'theme12_content.dart';
import 'theme13_content.dart';
import 'theme1_content.dart';
import 'theme2_content.dart';
import 'theme3_content.dart';
import 'theme4_content.dart';
import 'theme5_content.dart';
import 'theme6_content.dart';
import 'theme7_content.dart';
import 'theme8_content.dart';
import 'theme9_content.dart';

class AllThemesRegistry {
  static List<ThemeModel> getAllThemes() {
    final themes = [
      Theme1Content.theme,
      Theme2Content.theme,
      Theme3Content.theme,
      Theme4Content.theme,
      Theme5Content.theme,
      Theme6Content.theme,
      Theme7Content.theme,
      Theme8Content.theme,
      Theme9Content.theme,
      Theme10Content.theme,
      Theme11Content.theme,
      Theme12Content.theme,
      Theme13Content.theme,
    ];

    // Debug-only validation (prints to terminal + fails fast if missing/mismatch)
    assert(() {
      ContentValidator.validateLessonDay(Theme1Content.day1);
      ContentValidator.validateLessonDay(Theme1Content.day2);

      ContentValidator.validateLessonDay(Theme2Content.day1);
      ContentValidator.validateLessonDay(Theme2Content.day2);

      ContentValidator.validateLessonDay(Theme3Content.day1);
      ContentValidator.validateLessonDay(Theme3Content.day2);

      ContentValidator.validateLessonDay(Theme4Content.day1);
      ContentValidator.validateLessonDay(Theme4Content.day2);

      ContentValidator.validateLessonDay(Theme5Content.day1);
      ContentValidator.validateLessonDay(Theme5Content.day2);

      ContentValidator.validateLessonDay(Theme6Content.day1);
      ContentValidator.validateLessonDay(Theme6Content.day2);

      ContentValidator.validateLessonDay(Theme7Content.day1);
      ContentValidator.validateLessonDay(Theme7Content.day2);

      ContentValidator.validateLessonDay(Theme8Content.day1);
      ContentValidator.validateLessonDay(Theme8Content.day2);

      ContentValidator.validateLessonDay(Theme9Content.day1);
      ContentValidator.validateLessonDay(Theme9Content.day2);

      ContentValidator.validateLessonDay(Theme10Content.day1);
      ContentValidator.validateLessonDay(Theme10Content.day2);

      ContentValidator.validateLessonDay(Theme11Content.day1);
      ContentValidator.validateLessonDay(Theme11Content.day2);

      ContentValidator.validateLessonDay(Theme12Content.day1);
      ContentValidator.validateLessonDay(Theme12Content.day2);

      ContentValidator.validateLessonDay(Theme13Content.day1);
      ContentValidator.validateLessonDay(Theme13Content.day2);

      return true;
    }());

    return themes;
  }

  static LessonDay? getLesson(String themeId, int dayNumber) {
    switch (themeId) {
      case 'theme_01_offices':
        if (dayNumber == 1) return Theme1Content.day1;
        if (dayNumber == 2) return Theme1Content.day2;
        break;

      case 'theme_02_general_business':
        if (dayNumber == 1) return Theme2Content.day1;
        if (dayNumber == 2) return Theme2Content.day2;
        break;

      case 'theme_03_technical_areas':
        if (dayNumber == 1) return Theme3Content.day1;
        if (dayNumber == 2) return Theme3Content.day2;
        break;

      case 'theme_04_travel':
        if (dayNumber == 1) return Theme4Content.day1;
        if (dayNumber == 2) return Theme4Content.day2;
        break;

      case 'theme_05_entertainment':
        if (dayNumber == 1) return Theme5Content.day1;
        if (dayNumber == 2) return Theme5Content.day2;
        break;

      case 'theme_06_purchasing':
        if (dayNumber == 1) return Theme6Content.day1;
        if (dayNumber == 2) return Theme6Content.day2;
        break;

      case 'theme_07_dining_out':
        if (dayNumber == 1) return Theme7Content.day1;
        if (dayNumber == 2) return Theme7Content.day2;
        break;

      case 'theme_08_personnel':
        if (dayNumber == 1) return Theme8Content.day1;
        if (dayNumber == 2) return Theme8Content.day2;
        break;

      case 'theme_09_finance_budgeting':
        if (dayNumber == 1) return Theme9Content.day1;
        if (dayNumber == 2) return Theme9Content.day2;
        break;

      case 'theme_10_corporate_development':
        if (dayNumber == 1) return Theme10Content.day1;
        if (dayNumber == 2) return Theme10Content.day2;
        break;

      case 'theme_11_manufacturing':
        if (dayNumber == 1) return Theme11Content.day1;
        if (dayNumber == 2) return Theme11Content.day2;
        break;

      case 'theme_12_housing_property':
        if (dayNumber == 1) return Theme12Content.day1;
        if (dayNumber == 2) return Theme12Content.day2;
        break;

      case 'theme_13_health':
        if (dayNumber == 1) return Theme13Content.day1;
        if (dayNumber == 2) return Theme13Content.day2;
        break;
    }
    return null;
  }

  static int getTotalDays(String themeId) {
    switch (themeId) {
      case 'theme_01_offices':
      case 'theme_02_general_business':
      case 'theme_03_technical_areas':
      case 'theme_04_travel':
      case 'theme_05_entertainment':
      case 'theme_06_purchasing':
      case 'theme_07_dining_out':
      case 'theme_08_personnel':
      case 'theme_09_finance_budgeting':
      case 'theme_10_corporate_development':
      case 'theme_11_manufacturing':
      case 'theme_12_housing_property':
      case 'theme_13_health':
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
      case 'theme_03_technical_areas':
        return Theme3Content.vocabulary;
      case 'theme_04_travel':
        return Theme4Content.vocabulary;
      case 'theme_05_entertainment':
        return Theme5Content.vocabulary;
      case 'theme_06_purchasing':
        return Theme6Content.vocabulary;
      case 'theme_07_dining_out':
        return Theme7Content.vocabulary;
      case 'theme_08_personnel':
        return Theme8Content.vocabulary;
      case 'theme_09_finance_budgeting':
        return Theme9Content.vocabulary;
      case 'theme_10_corporate_development':
        return Theme10Content.vocabulary;
      case 'theme_11_manufacturing':
        return Theme11Content.vocabulary;
      case 'theme_12_housing_property':
        return Theme12Content.vocabulary;
      case 'theme_13_health':
        return Theme13Content.vocabulary;
      default:
        return [];
    }
  }
}

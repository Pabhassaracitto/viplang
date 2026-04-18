// lib/data/content/theme13_content.dart

import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme13Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_13_health',
    themeNumber: 13,
    titleEn: 'Health',
    titleVi: 'Sức Khỏe và Y Tế',
    description:
        'Thăm khám bác sĩ, nha sĩ, bảo hiểm y tế, thể dục, dinh dưỡng và chăm sóc sức khỏe.',
    iconEmoji: '🏥',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY (30 từ)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v13_01',
      wordEn: 'clinic',
      wordVi: 'phòng khám',
      pronunciation: '/ˈklɪnɪk/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The clinic opens at 8 AM for patients.',
      exampleVi: 'Phòng khám mở cửa lúc 8 giờ sáng cho bệnh nhân.',
    ),
    VocabModel(
      id: 'v13_02',
      wordEn: 'hospital',
      wordVi: 'bệnh viện',
      pronunciation: '/ˈhɑːspɪtl/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'She was admitted to the hospital for surgery.',
      exampleVi: 'Cô ấy được nhập viện để phẫu thuật.',
    ),
    VocabModel(
      id: 'v13_03',
      wordEn: 'ambulance',
      wordVi: 'xe cứu thương',
      pronunciation: '/ˈæmbjələns/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'An ambulance rushed to the scene of the accident.',
      exampleVi: 'Một xe cứu thương đã lao đến hiện trường vụ tai nạn.',
    ),
    VocabModel(
      id: 'v13_04',
      wordEn: 'emergency',
      wordVi: 'tình trạng khẩn cấp',
      pronunciation: '/ɪˈmɜːrdʒənsi/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'In case of emergency, call 911 immediately.',
      exampleVi: 'Trong trường hợp khẩn cấp, hãy gọi 911 ngay lập tức.',
    ),
    VocabModel(
      id: 'v13_05',
      wordEn: 'medical checkup',
      wordVi: 'việc kiểm tra sức khỏe',
      pronunciation: '/ˈmedɪkl ˈtʃekʌp/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn: 'It\'s important to have a medical checkup every year.',
      exampleVi: 'Việc kiểm tra sức khỏe hàng năm là rất quan trọng.',
    ),
    VocabModel(
      id: 'v13_06',
      wordEn: 'surgeon',
      wordVi: 'bác sĩ phẫu thuật',
      pronunciation: '/ˈsɜːrdʒən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The surgeon performed a successful operation.',
      exampleVi: 'Bác sĩ phẫu thuật đã thực hiện ca phẫu thuật thành công.',
    ),
    VocabModel(
      id: 'v13_07',
      wordEn: 'vaccination',
      wordVi: 'việc tiêm chủng',
      pronunciation: '/ˌvæksɪˈneɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Vaccination helps prevent many serious diseases.',
      exampleVi: 'Tiêm chủng giúp ngăn ngừa nhiều bệnh nghiêm trọng.',
    ),
    VocabModel(
      id: 'v13_08',
      wordEn: 'medication',
      wordVi: 'thuốc thang',
      pronunciation: '/ˌmedɪˈkeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The doctor prescribed medication for the patient.',
      exampleVi: 'Bác sĩ kê đơn thuốc cho bệnh nhân.',
    ),
    VocabModel(
      id: 'v13_09',
      wordEn: 'fever',
      wordVi: 'sốt',
      pronunciation: '/ˈfiːvər/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'He has a high fever and needs to rest.',
      exampleVi: 'Anh ấy bị sốt cao và cần nghỉ ngơi.',
    ),
    VocabModel(
      id: 'v13_10',
      wordEn: 'headache',
      wordVi: 'đau đầu',
      pronunciation: '/ˈhedeɪk/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'I have a terrible headache this morning.',
      exampleVi: 'Tôi bị đau đầu kinh khủng sáng nay.',
    ),
    VocabModel(
      id: 'v13_11',
      wordEn: 'sore throat',
      wordVi: 'đau họng',
      pronunciation: '/sɔːr θroʊt/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn: 'A sore throat is often the first sign of a cold.',
      exampleVi: 'Đau họng thường là dấu hiệu đầu tiên của cảm lạnh.',
    ),
    VocabModel(
      id: 'v13_12',
      wordEn: 'examine',
      wordVi: 'khám bệnh',
      pronunciation: '/ɪɡˈzæmɪn/',
      partOfSpeech: 'v',
      themeId: 'theme_13_health',
      exampleEn: 'The doctor will examine you shortly.',
      exampleVi: 'Bác sĩ sẽ khám cho bạn ngay.',
    ),
    VocabModel(
      id: 'v13_13',
      wordEn: 'recover',
      wordVi: 'hồi phục',
      pronunciation: '/rɪˈkʌvər/',
      partOfSpeech: 'v',
      themeId: 'theme_13_health',
      exampleEn: 'It took him two weeks to recover from the flu.',
      exampleVi: 'Anh ấy mất hai tuần để hồi phục sau cơn cúm.',
    ),
    VocabModel(
      id: 'v13_14',
      wordEn: 'dentist',
      wordVi: 'nha sĩ',
      pronunciation: '/ˈdentɪst/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'I need to see a dentist about my toothache.',
      exampleVi: 'Tôi cần gặp nha sĩ về cơn đau răng của mình.',
    ),
    VocabModel(
      id: 'v13_15',
      wordEn: 'nurse',
      wordVi: 'y tá',
      pronunciation: '/nɜːrs/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The nurse took my blood pressure.',
      exampleVi: 'Y tá đã đo huyết áp của tôi.',
    ),
    VocabModel(
      id: 'v13_16',
      wordEn: 'fitness',
      wordVi: 'sự khỏe mạnh, sự rèn luyện thân thể',
      pronunciation: '/ˈfɪtnəs/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Regular exercise improves your fitness level.',
      exampleVi: 'Tập thể dục thường xuyên cải thiện mức độ khỏe mạnh của bạn.',
    ),
    VocabModel(
      id: 'v13_17',
      wordEn: 'gym',
      wordVi: 'phòng tập thể hình',
      pronunciation: '/dʒɪm/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'I go to the gym three times a week.',
      exampleVi: 'Tôi đến phòng tập thể hình ba lần một tuần.',
    ),
    VocabModel(
      id: 'v13_18',
      wordEn: 'work-out',
      wordVi: 'việc rèn luyện thân thể',
      pronunciation: '/ˈwɜːrkaʊt/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'A good work-out helps reduce stress.',
      exampleVi: 'Một buổi tập luyện tốt giúp giảm căng thẳng.',
    ),
    VocabModel(
      id: 'v13_19',
      wordEn: 'muscle',
      wordVi: 'cơ bắp',
      pronunciation: '/ˈmʌsəl/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Weight training builds muscle strength.',
      exampleVi: 'Tập tạ giúp tăng sức mạnh cơ bắp.',
    ),
    VocabModel(
      id: 'v13_20',
      wordEn: 'nutrition',
      wordVi: 'dinh dưỡng',
      pronunciation: '/nuːˈtrɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Good nutrition is essential for children\'s growth.',
      exampleVi: 'Dinh dưỡng tốt là thiết yếu cho sự phát triển của trẻ em.',
    ),
    VocabModel(
      id: 'v13_21',
      wordEn: 'vitamin',
      wordVi: 'vi-ta-min',
      pronunciation: '/ˈvaɪtəmɪn/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Vitamin C helps boost the immune system.',
      exampleVi: 'Vitamin C giúp tăng cường hệ miễn dịch.',
    ),
    VocabModel(
      id: 'v13_22',
      wordEn: 'protein',
      wordVi: 'chất đạm, pro-tê-in',
      pronunciation: '/ˈproʊtiːn/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Meat and fish are good sources of protein.',
      exampleVi: 'Thịt và cá là nguồn cung cấp protein tốt.',
    ),
    VocabModel(
      id: 'v13_23',
      wordEn: 'calorie',
      wordVi: 'ca-lo',
      pronunciation: '/ˈkæləri/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'This meal contains about 500 calories.',
      exampleVi: 'Bữa ăn này chứa khoảng 500 ca-lo.',
    ),
    VocabModel(
      id: 'v13_24',
      wordEn: 'diet',
      wordVi: 'chế độ ăn',
      pronunciation: '/ˈdaɪət/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'A balanced diet is important for good health.',
      exampleVi: 'Chế độ ăn cân bằng là quan trọng cho sức khỏe tốt.',
    ),
    VocabModel(
      id: 'v13_25',
      wordEn: 'appointment',
      wordVi: 'cuộc hẹn',
      pronunciation: '/əˈpɔɪntmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'I have a doctor\'s appointment at 3 PM.',
      exampleVi: 'Tôi có cuộc hẹn với bác sĩ lúc 3 giờ chiều.',
    ),
    VocabModel(
      id: 'v13_26',
      wordEn: 'physical therapist',
      wordVi: 'bác sĩ vật lý trị liệu',
      pronunciation: '/ˈfɪzɪkl ˈθerəpɪst/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn: 'The physical therapist helped me recover from my injury.',
      exampleVi: 'Bác sĩ vật lý trị liệu đã giúp tôi hồi phục sau chấn thương.',
    ),
    VocabModel(
      id: 'v13_27',
      wordEn: 'cholesterol',
      wordVi: 'colesterol',
      pronunciation: '/kəˈlestərɔːl/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'High cholesterol can increase the risk of heart disease.',
      exampleVi: 'Cholesterol cao có thể tăng nguy cơ bệnh tim.',
    ),
    VocabModel(
      id: 'v13_28',
      wordEn: 'obesity',
      wordVi: 'chứng béo phì',
      pronunciation: '/oʊˈbiːsəti/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Obesity is a major health problem in many countries.',
      exampleVi: 'Béo phì là vấn đề sức khỏe lớn ở nhiều quốc gia.',
    ),
    VocabModel(
      id: 'v13_29',
      wordEn: 'immunization',
      wordVi: 'sự miễn dịch',
      pronunciation: '/ˌɪmjunəˈzeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Immunization protects children from dangerous diseases.',
      exampleVi: 'Miễn dịch bảo vệ trẻ em khỏi các bệnh nguy hiểm.',
    ),
    VocabModel(
      id: 'v13_30',
      wordEn: 'operation',
      wordVi: 'ca phẫu thuật',
      pronunciation: '/ˌɑːpəˈreɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The operation lasted for three hours.',
      exampleVi: 'Ca phẫu thuật kéo dài ba giờ.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 1 Reading
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => [
    FabVocabItem(
      wordEn: 'medical',
      wordVi: 'Thuộc về y học',
      pronunciation: '/ˈmedɪkl/',
      partOfSpeech: 'adj',
    ),
    FabVocabItem(
      wordEn: 'dentist',
      wordVi: 'Nha sĩ',
      pronunciation: '/ˈdentɪst/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'nurse',
      wordVi: 'Y tá',
      pronunciation: '/nɜːrs/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'fitness',
      wordVi: 'Sự khỏe mạnh',
      pronunciation: '/ˈfɪtnəs/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'nutrition',
      wordVi: 'Dinh dưỡng',
      pronunciation: '/nuːˈtrɪʃən/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'vaccination',
      wordVi: 'Việc tiêm chủng',
      pronunciation: '/ˌvæksɪˈneɪʃən/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'recover',
      wordVi: 'Hồi phục',
      pronunciation: '/rɪˈkʌvər/',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'examine',
      wordVi: 'Khám bệnh',
      pronunciation: '/ɪɡˈzæmɪn/',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'obesity',
      wordVi: 'Chứng béo phì',
      pronunciation: '/oʊˈbiːsəti/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'cholesterol',
      wordVi: 'Colesterol',
      pronunciation: '/kəˈlestərɔːl/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    FabPhraseItem(
      phrase: 'Make an appointment',
      meaning: 'Hẹn gặp, sắp xếp cuộc hẹn',
    ),
    FabPhraseItem(phrase: 'Cancel an appointment', meaning: 'Hủy cuộc hẹn'),
    FabPhraseItem(phrase: 'Medical checkup', meaning: 'Kiểm tra sức khỏe'),
    FabPhraseItem(phrase: 'Get better', meaning: 'Khỏe hơn, hồi phục'),
    FabPhraseItem(phrase: 'Parts of the body', meaning: 'Các bộ phận cơ thể'),
  ];

  static List<FabAnswerItem> get readingAnswers => [
    FabAnswerItem(vi: 'Chuyên đề này', en: 'This theme'),
    FabAnswerItem(vi: 'Được nhìn thấy', en: 'is often seen'),
    FabAnswerItem(vi: 'Các phần khác nhau', en: 'various other sections'),
    FabAnswerItem(
      vi: 'Kiến thức y học kỹ thuật',
      en: 'technical, medical knowledge',
    ),
    FabAnswerItem(vi: 'Được yêu cầu', en: 'required'),
    FabAnswerItem(vi: 'Các sự kiện hàng ngày', en: 'everyday events'),
    FabAnswerItem(vi: 'Thăm bác sĩ', en: 'visiting the doctor'),
    FabAnswerItem(vi: 'Nha sĩ', en: 'the dentist'),
    FabAnswerItem(vi: 'Được hỗ trợ bởi y tá', en: 'being assisted by a nurse'),
    FabAnswerItem(vi: 'Hẹn gặp', en: 'making an appointment'),
    FabAnswerItem(vi: 'Hủy cuộc hẹn', en: 'cancelling an appointment'),
    FabAnswerItem(vi: 'Sự khỏe mạnh', en: 'fitness'),
    FabAnswerItem(vi: 'Cũng như', en: 'as well as'),
    FabAnswerItem(vi: 'Dinh dưỡng', en: 'nutrition'),
    FabAnswerItem(
      vi: 'Từ vựng y học phổ biến',
      en: 'Common medical vocabulary',
    ),
    FabAnswerItem(vi: 'Phòng khám', en: 'clinic'),
    FabAnswerItem(vi: 'Bệnh viện', en: 'hospital'),
    FabAnswerItem(vi: 'Xe cứu thương', en: 'ambulance'),
    FabAnswerItem(vi: 'Tình trạng khẩn cấp', en: 'emergency'),
    FabAnswerItem(vi: 'Kiểm tra y tế', en: 'medical checkup'),
    FabAnswerItem(vi: 'Bác sĩ phẫu thuật', en: 'surgeon'),
    FabAnswerItem(vi: 'Tiêm chủng', en: 'vaccination'),
    FabAnswerItem(vi: 'Thuốc', en: 'medication'),
    FabAnswerItem(vi: 'Ca phẫu thuật', en: 'operation'),
    FabAnswerItem(vi: 'Sốt', en: 'fever'),
    FabAnswerItem(vi: 'Đau đầu', en: 'headache'),
    FabAnswerItem(vi: 'Đau họng', en: 'sore throat'),
    FabAnswerItem(vi: 'Khám bệnh', en: 'to examine'),
    FabAnswerItem(vi: 'Hồi phục', en: 'to recover'),
    FabAnswerItem(vi: 'Phòng tập thể hình', en: 'gym'),
    FabAnswerItem(vi: 'Rèn luyện thân thể', en: 'work-out'),
    FabAnswerItem(vi: 'Cơ bắp', en: 'muscle'),
    FabAnswerItem(vi: 'Các bộ phận cơ thể', en: 'parts of the body'),
    FabAnswerItem(vi: 'Vai', en: 'shoulder'),
    FabAnswerItem(vi: 'Khuỷu tay', en: 'elbow'),
    FabAnswerItem(vi: 'Đầu gối', en: 'knee'),
    FabAnswerItem(vi: 'Vi-ta-min', en: 'vitamins'),
    FabAnswerItem(vi: 'Chất béo', en: 'fat'),
    FabAnswerItem(vi: 'Chất đạm', en: 'protein'),
    FabAnswerItem(vi: 'Ca-lo', en: 'calories'),
    FabAnswerItem(vi: 'Đường huyết', en: 'blood sugar'),
    FabAnswerItem(vi: 'Colesterol', en: 'cholesterol'),
    FabAnswerItem(vi: 'Chế độ ăn', en: 'diet'),
    FabAnswerItem(vi: 'Chứng béo phì', en: 'obesity'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme13_day1',
    dayNumber: 1,
    themeId: 'theme_13_health',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      LessonPhase(
        id: 'theme13_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_51',
        contentEn:
            '''This theme is often seen in the Part I picture description as well as various other sections. There is not much technical, medical knowledge required by the student as situations are everyday events such as visiting the doctor, the dentist, being assisted by a nurse, making or cancelling an appointment.

Students will also hear and read about fitness as well as nutrition.

Common medical vocabulary would be: clinic, hospital, ambulance, emergency, medical checkup, surgeon, flu shot, vaccination, immunization, medicine, medication, operation, fever, headache, sore throat, to examine, to consult, to check, to recover (get better).

Common fitness vocabulary: gym, work-out, jogging, weight-lifting, muscle, strain, and parts of the body (shoulder, elbow, knee etc.), physical therapist, personal trainer.

Common nutrition vocabulary: vitamins, fat, protein, calories, blood sugar, carbohydrates, fibre, cholesterol, nutritionist, homeopathic food supplements, food groups, diet, obesity.''',
        contentVi:
            '''Chuyên đề này thường xuất hiện trong phần I miêu tả tranh cũng như nhiều phần khác. Không có nhiều kiến thức y học kỹ thuật được yêu cầu từ học viên vì các tình huống là những sự kiện hàng ngày như thăm bác sĩ, nha sĩ, được y tá hỗ trợ, hẹn gặp hoặc hủy cuộc hẹn.

Học viên cũng sẽ nghe và đọc về thể dục cũng như dinh dưỡng.

Từ vựng y học phổ biến sẽ là: phòng khám, bệnh viện, xe cứu thương, tình trạng khẩn cấp, kiểm tra sức khỏe, bác sĩ phẫu thuật, tiêm phòng cúm, tiêm chủng, miễn dịch, thuốc, thuốc men, ca phẫu thuật, sốt, đau đầu, đau họng, khám bệnh, tư vấn, kiểm tra, hồi phục (khỏe hơn).

Từ vựng về thể dục phổ biến: phòng tập, tập luyện, chạy bộ, nâng tạ, cơ bắp, căng cơ, và các bộ phận cơ thể (vai, khuỷu tay, đầu gối, v.v.), bác sĩ vật lý trị liệu, huấn luyện viên cá nhân.

Từ vựng về dinh dưỡng phổ biến: vi-ta-min, chất béo, chất đạm, ca-lo, đường huyết, các-bon hi-đrat, chất xơ, colesterol, nhà dinh dưỡng học, thực phẩm bổ sung vi lượng đồng căn, nhóm thực phẩm, chế độ ăn, béo phì.''',
        fabVocab: Theme13Content.readingVocab,
        fabPhrases: Theme13Content.readingPhrases,
      ),
      LessonPhase(
        id: 'theme13_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_51',
        contentEn: null,
        contentVi: null,
      ),
      LessonPhase(
        id: 'theme13_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme13Content.readingAnswers,
      ),
      LessonPhase(
        id: 'theme13_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.vietnamese('Chuyên đề này', 'This theme'),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('được nhìn thấy', 'is often seen'),
    const MixedSegment.english(
      ' in the Part I picture description as well as ',
    ),
    const MixedSegment.vietnamese(
      'các phần khác nhau',
      'various other sections',
    ),
    const MixedSegment.english('. There is not much '),
    const MixedSegment.vietnamese(
      'kiến thức y học kỹ thuật',
      'technical, medical knowledge',
    ),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('được yêu cầu', 'required'),
    const MixedSegment.english(' by the student as situations are '),
    const MixedSegment.vietnamese('các sự kiện hàng ngày', 'everyday events'),
    const MixedSegment.english(' such as '),
    const MixedSegment.vietnamese('thăm bác sĩ', 'visiting the doctor'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('nha sĩ', 'the dentist'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese(
      'được hỗ trợ bởi y tá',
      'being assisted by a nurse',
    ),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('hẹn gặp', 'making an appointment'),
    const MixedSegment.english(' or '),
    const MixedSegment.vietnamese('hủy cuộc hẹn', 'cancelling an appointment'),
    const MixedSegment.english('. Students will also hear and read about '),
    const MixedSegment.vietnamese('sự khỏe mạnh', 'fitness'),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('cũng như', 'as well as'),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('dinh dưỡng', 'nutrition'),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese(
      'Từ vựng y học phổ biến',
      'Common medical vocabulary',
    ),
    const MixedSegment.english(' would be: '),
    const MixedSegment.vietnamese('phòng khám', 'clinic'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('bệnh viện', 'hospital'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('xe cứu thương', 'ambulance'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('tình trạng khẩn cấp', 'emergency'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('kiểm tra y tế', 'medical checkup'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('bác sĩ phẫu thuật', 'surgeon'),
    const MixedSegment.english(', flu shot, '),
    const MixedSegment.vietnamese('tiêm chủng', 'vaccination'),
    const MixedSegment.english(', immunization, medicine, '),
    const MixedSegment.vietnamese('thuốc', 'medication'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('ca phẫu thuật', 'operation'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('sốt', 'fever'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('đau đầu', 'headache'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('đau họng', 'sore throat'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('khám bệnh', 'to examine'),
    const MixedSegment.english(', to consult, to check, '),
    const MixedSegment.vietnamese('hồi phục', 'to recover'),
    const MixedSegment.english(' (get better). Common fitness vocabulary: '),
    const MixedSegment.vietnamese('phòng tập thể hình', 'gym'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('rèn luyện thân thể', 'work-out'),
    const MixedSegment.english(', jogging, weight-lifting, '),
    const MixedSegment.vietnamese('cơ bắp', 'muscle'),
    const MixedSegment.english(', strain, and '),
    const MixedSegment.vietnamese('các bộ phận cơ thể', 'parts of the body'),
    const MixedSegment.english(' ('),
    const MixedSegment.vietnamese('vai', 'shoulder'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('khuỷu tay', 'elbow'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('đầu gối', 'knee'),
    const MixedSegment.english(
      ' etc.), physical therapist, personal trainer. Common nutrition vocabulary: ',
    ),
    const MixedSegment.vietnamese('vi-ta-min', 'vitamins'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('chất béo', 'fat'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('chất đạm', 'protein'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('ca-lo', 'calories'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('đường huyết', 'blood sugar'),
    const MixedSegment.english(', carbohydrates, fibre, '),
    const MixedSegment.vietnamese('colesterol', 'cholesterol'),
    const MixedSegment.english(
      ', nutritionist, homeopathic food supplements, food groups, ',
    ),
    const MixedSegment.vietnamese('chế độ ăn', 'diet'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('chứng béo phì', 'obesity'),
    const MixedSegment.english('.'),
  ];

  // // ═══════════════════════════════════════════════════════════════
// DAY 2 - PHẦN 2: NGHE VÀ LUYỆN TRÍ NHỚ
// ═══════════════════════════════════════════════════════════════
static LessonDay get day2 => LessonDay(
  id: 'theme13_day2',
  dayNumber: 2,
  themeId: 'theme_13_health',
  titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
  phases: [
    // ═══════════════════════════════════════════════════════════════
    // PRACTICE 1: CONVERSATION - TENNIS ELBOW
    // ═══════════════════════════════════════════════════════════════
    LessonPhase(
      id: 'theme13_day2_quiz1',
      phaseTypeStr: 'listening_quiz',
      titleEn: 'Practice 1: Conversation - Tennis Elbow',
      titleVi: 'Luyện tập 1: Hội thoại - Chứng đau nhức khuỷu tay',
      audioTrackKey: 'track_52',
      contentEn:
          '''W: OK, Mr. Thomas, I see no breaks in your arm or elbow. And there are no signs of inflammation, but it is obviously quite painful for you. When did you say this happened?
M: Exactly 5 days ago. I was having a game of tennis with my colleagues and shortly after the game, I began to feel sore all over my arm. It did go away after a few hours but the next time I played it was even worse. That's how it has continued; a little bit worse and lasting a little bit longer each time I play.
W: Now I think I see what it is. It's tennis elbow. It's not something too serious. What you should do now is to see a sports therapist who can massage it, and remember to treat it with an ice pack before you sleep. You should be okay after 3 or 4 days.
M: You know, I think you're right. I guess I have to stop playing tennis for a few days.''',
      contentVi:
          '''W: Được rồi, anh Thomas. Tôi không nhận thấy có chỗ nào bị gãy ở cánh tay hay khuỷu tay của anh cả. Và không có các dấu hiệu của viêm nhiễm, nhưng rõ ràng là anh vẫn còn đau. Anh đã nói rằng việc này xảy ra khi nào nhỉ?
M: Chính xác là 5 ngày trước. Tôi đang chơi tennis với các đồng nghiệp của tôi và không lâu sau trận đấu, tôi bắt đầu cảm thấy đau nhức khắp cánh tay của tôi. Nó đã biến mất sau một vài giờ đồng hồ nhưng lần tiếp theo tôi chơi thì thậm chí còn đau hơn. Luôn là như vậy từ lúc đó tới giờ, nó đau hơn một chút và kéo dài hơn một chút mỗi lần tôi chơi.
W: Giờ thì tôi nghĩ là tôi biết vấn đề là gì rồi. Nó là chứng đau nhức khuỷu tay do chơi tennis. Nó không quá nghiêm trọng. Những gì anh nên làm bây giờ là đến gặp một bác sĩ trị liệu thể thao, người mà có thể xoa bóp nó, và nhớ chườm đá trước khi anh đi ngủ. Anh sẽ khỏi sau ba hoặc bốn ngày.
M: Tôi hiểu, tôi nghĩ là chị nói đúng đấy. Chắc là tôi sẽ phải dừng chơi tennis trong một vài ngày.''',
      questions: _practice1Questions,
      fabVocab: Theme13Content.day2ConversationVocab,
      fabPhrases: Theme13Content.day2ConversationPhrases,
      fabAnswers: Theme13Content.day2ConversationAnswers,
    ),

    // ═══════════════════════════════════════════════════════════════
    // PRACTICE 2: SHORT TALK 1 - MEDICAL FORM
    // ═══════════════════════════════════════════════════════════════
    LessonPhase(
      id: 'theme13_day2_quiz2',
      phaseTypeStr: 'listening_quiz',
      titleEn: 'Practice 2: Short Talk 1 - Medical Form',
      titleVi: 'Luyện tập 2: Bài ngắn 1 - Mẫu đơn y tế',
      audioTrackKey: 'track_53',
      contentEn:
          '''Now, Mr. Thomas, according to our records, this is your first visit to our clinic. Before Dr. James can examine you, you'll have to fill out these medical history and insurance forms. Could you please list all of the medications you are taking and any allergies you may have. After you have filled out the forms, a nurse will take your blood pressure and temperature. I'll be here in my office if you have any questions.''',
      contentVi:
          '''Vâng, thưa ông Thomas, theo hồ sơ của chúng tôi thì đây là lần thăm khám đầu tiên của ông tại phòng khám của chúng tôi. Trước khi bác sĩ James tiến hành khám cho ông, ông sẽ phải điền đầy đủ vào các mẫu tiểu sử bệnh và bảo hiểm y tế này. Ông hãy vui lòng liệt kê tất cả các loại thuốc mà ông đang sử dụng và bất kỳ loại dị ứng nào mà ông có thể gặp phải. Sau khi ông điền xong các mẫu đơn, y tá sẽ đo huyết áp và thân nhiệt của ông. Tôi sẽ chờ ở trong văn phòng nếu ông có bất kỳ câu hỏi nào cần hỏi.''',
      questions: _practice2Questions,
      fabVocab: Theme13Content.day2ShortTalk1Vocab,
      fabPhrases: Theme13Content.day2ShortTalk1Phrases,
      fabAnswers: Theme13Content.day2ShortTalk1Answers,
    ),

    // ═══════════════════════════════════════════════════════════════
    // PRACTICE 3: SHORT TALK 2 - FITNESS PROGRAM
    // ═══════════════════════════════════════════════════════════════
    LessonPhase(
      id: 'theme13_day2_quiz3',
      phaseTypeStr: 'listening_quiz',
      titleEn: 'Practice 3: Short Talk 2 - Fitness Program',
      titleVi: 'Luyện tập 3: Bài ngắn 2 - Chương trình fitness',
      audioTrackKey: 'track_54',
      contentEn:
          '''We all know that both exercise and diet play an important part in our daily lives. The importance of maintaining good health has long been emphasized by health and fitness experts. We are here to offer you a fresh start. Our program, Fitness For All, combines nutrition and diet with regular exercise. No two people are alike. So, unlike other weight loss programs, our trainers will provide you with a nutrition and exercise plan tailored personally for you. We will work together in order for you to obtain your desired results in weight loss by providing you with the tools you need. We are committed to providing you with fast results: it's our 40-day guarantee.''',
      contentVi:
          '''Chúng ta đều biết rằng, cả việc luyện tập và chế độ ăn đều đóng một vai trò quan trọng trong cuộc sống hàng ngày của chúng ta. Tầm quan trọng của việc duy trì một sức khỏe tốt từ lâu đã được các chuyên gia về y tế và sức khỏe nhấn mạnh. Chúng tôi ở đây để mang đến cho bạn một sự khởi đầu mới. Chương trình của chúng tôi có tên là "Sức khỏe cho mọi người" kết hợp yếu tố dinh dưỡng và chế độ ăn với việc rèn luyện cơ thể đều đặn. Chúng ta không ai giống ai cả. Do vậy, khác với các chương trình giảm cân khác, các huấn luyện viên của chúng tôi sẽ cung cấp cho bạn một kế hoạch dinh dưỡng và luyện tập được thiết kế dành riêng cho cá nhân bạn. Chúng ta sẽ hợp tác cùng nhau để bạn đạt được kết quả mong muốn trong việc giảm cân bằng việc cung cấp cho bạn các công cụ cần thiết. Chúng tôi cam kết mang lại kết quả nhanh chóng. Đó là sự cam kết đem lại kết quả mong muốn sau 40 ngày.''',
      questions: _practice3Questions,
      fabVocab: Theme13Content.day2ShortTalk2Vocab,
      fabPhrases: Theme13Content.day2ShortTalk2Phrases,
      fabAnswers: Theme13Content.day2ShortTalk2Answers,
    ),

    // ═══════════════════════════════════════════════════════════════
    // MIND GAME 1: CONVERSATION
    // ═══════════════════════════════════════════════════════════════
    LessonPhase(
      id: 'theme13_day2_mindgame1',
      phaseTypeStr: 'mind_game',
      titleEn: 'Memory Training: Tennis Elbow',
      titleVi: 'Huấn luyện Trí nhớ: Chứng đau nhức khuỷu tay',
      mixedSegments: _day2ConversationSegments,
      fabVocab: Theme13Content.day2ConversationVocab,
      fabPhrases: Theme13Content.day2ConversationPhrases,
      fabAnswers: Theme13Content.day2ConversationAnswers,
    ),

    // ═══════════════════════════════════════════════════════════════
    // MIND GAME 2: SHORT TALK 1
    // ═══════════════════════════════════════════════════════════════
    LessonPhase(
      id: 'theme13_day2_mindgame2',
      phaseTypeStr: 'mind_game',
      titleEn: 'Memory Training: Medical Form',
      titleVi: 'Huấn luyện Trí nhớ: Mẫu đơn y tế',
      mixedSegments: _day2ShortTalk1Segments,
      fabVocab: Theme13Content.day2ShortTalk1Vocab,
      fabPhrases: Theme13Content.day2ShortTalk1Phrases,
      fabAnswers: Theme13Content.day2ShortTalk1Answers,
    ),

    // ═══════════════════════════════════════════════════════════════
    // MIND GAME 3: SHORT TALK 2
    // ═══════════════════════════════════════════════════════════════
    LessonPhase(
      id: 'theme13_day2_mindgame3',
      phaseTypeStr: 'mind_game',
      titleEn: 'Memory Training: Fitness Program',
      titleVi: 'Huấn luyện Trí nhớ: Chương trình fitness',
      mixedSegments: _day2ShortTalk2Segments,
      fabVocab: Theme13Content.day2ShortTalk2Vocab,
      fabPhrases: Theme13Content.day2ShortTalk2Phrases,
      fabAnswers: Theme13Content.day2ShortTalk2Answers,
    ),
  ],
);

// ═══════════════════════════════════════════════════════════════
// DAY 2 - FAB VOCABULARY & PHRASES
// ═══════════════════════════════════════════════════════════════
static List<FabVocabItem> get day2ConversationVocab => [
  FabVocabItem(
    wordEn: 'tennis elbow',
    wordVi: 'Chứng đau nhức khuỷu tay',
    pronunciation: '/ˈtɛnɪs ˈɛlboʊ/',
  ),
  FabVocabItem(
    wordEn: 'inflammation',
    wordVi: 'Viêm nhiễm',
    pronunciation: '/ˌɪnfləˈmeɪʃən/',
  ),
  FabVocabItem(
    wordEn: 'sports therapist',
    wordVi: 'Bác sĩ trị liệu thể thao',
    pronunciation: '/spɔːrts ˈθɛrəpɪst/',
  ),
  FabVocabItem(
    wordEn: 'ice pack',
    wordVi: 'Túi chườm đá',
    pronunciation: '/ˈaɪs pæk/',
  ),
];

static List<FabPhraseItem> get day2ConversationPhrases => [
  FabPhraseItem(phrase: 'See no breaks', meaning: 'Không thấy chỗ nào bị gãy'),
  FabPhraseItem(phrase: 'Signs of inflammation', meaning: 'Dấu hiệu viêm nhiễm'),
  FabPhraseItem(phrase: 'Feel sore all over', meaning: 'Cảm thấy đau nhức khắp nơi'),
  FabPhraseItem(phrase: 'Tennis elbow', meaning: 'Chứng đau nhức khuỷu tay'),
  FabPhraseItem(phrase: 'See a therapist', meaning: 'Đến gặp bác sĩ trị liệu'),
  FabPhraseItem(phrase: 'Treat with ice pack', meaning: 'Chườm đá'),
];

static List<FabAnswerItem> get day2ConversationAnswers => [
  FabAnswerItem(vi: 'không có chỗ nào bị gãy', en: 'see no breaks'),
  FabAnswerItem(vi: 'cánh tay hay khuỷu tay', en: 'arm or elbow'),
  FabAnswerItem(vi: 'dấu hiệu viêm nhiễm', en: 'signs of inflammation'),
  FabAnswerItem(vi: 'rõ ràng khá đau', en: 'obviously quite painful'),
  FabAnswerItem(vi: '5 ngày trước', en: 'Exactly 5 days ago'),
  FabAnswerItem(vi: 'chơi tennis với các đồng nghiệp', en: 'having a game of tennis with my colleagues'),
  FabAnswerItem(vi: 'bắt đầu cảm thấy đau nhức', en: 'began to feel sore'),
  FabAnswerItem(vi: 'khắp cánh tay', en: 'all over my arm'),
  FabAnswerItem(vi: 'biến mất sau vài giờ', en: 'did go away after a few hours'),
  FabAnswerItem(vi: 'lần tiếp theo', en: 'the next time'),
  FabAnswerItem(vi: 'thậm chí còn tệ hơn', en: 'even worse'),
  FabAnswerItem(vi: 'tệ hơn một chút', en: 'a little bit worse'),
  FabAnswerItem(vi: 'kéo dài hơn', en: 'lasting longer'),
  FabAnswerItem(vi: 'chứng đau nhức khuỷu tay do chơi tennis', en: 'tennis elbow'),
  FabAnswerItem(vi: 'quá nghiêm trọng', en: 'too serious'),
  FabAnswerItem(vi: 'nên làm bây giờ', en: 'should do now'),
  FabAnswerItem(vi: 'bác sĩ trị liệu thể thao', en: 'sports therapist'),
  FabAnswerItem(vi: 'xoa bóp nó', en: 'massage it'),
  FabAnswerItem(vi: 'chườm đá', en: 'ice pack'),
  FabAnswerItem(vi: 'trước khi đi ngủ', en: 'before you sleep'),
  FabAnswerItem(vi: 'khỏi sau 3 hoặc 4 ngày', en: 'okay after 3 or 4 days'),
  FabAnswerItem(vi: 'dừng chơi tennis', en: 'stop playing tennis'),
];

// SHORT TALK 1 FAB
static List<FabVocabItem> get day2ShortTalk1Vocab => [
  FabVocabItem(
    wordEn: 'records',
    wordVi: 'Hồ sơ',
    pronunciation: '/ˈrɛkərdz/',
  ),
  FabVocabItem(
    wordEn: 'medical history',
    wordVi: 'Tiểu sử bệnh',
    pronunciation: '/ˈmɛdɪkəl ˈhɪstəri/',
  ),
  FabVocabItem(
    wordEn: 'insurance form',
    wordVi: 'Mẫu đơn bảo hiểm',
    pronunciation: '/ɪnˈʃʊrəns fɔːrm/',
  ),
  FabVocabItem(
    wordEn: 'allergy',
    wordVi: 'Dị ứng',
    pronunciation: '/ˈælɜːrdʒi/',
  ),
];

static List<FabPhraseItem> get day2ShortTalk1Phrases => [
  FabPhraseItem(phrase: 'According to records', meaning: 'Theo hồ sơ'),
  FabPhraseItem(phrase: 'First visit', meaning: 'Lần thăm khám đầu tiên'),
  FabPhraseItem(phrase: 'Fill out forms', meaning: 'Điền các mẫu đơn'),
  FabPhraseItem(phrase: 'List medications', meaning: 'Liệt kê các loại thuốc'),
  FabPhraseItem(phrase: 'Take blood pressure', meaning: 'Đo huyết áp'),
];

static List<FabAnswerItem> get day2ShortTalk1Answers => [
  FabAnswerItem(vi: 'theo hồ sơ của chúng tôi', en: 'according to our records'),
  FabAnswerItem(vi: 'lần thăm khám đầu tiên', en: 'your first visit'),
  FabAnswerItem(vi: 'phòng khám của chúng tôi', en: 'our clinic'),
  FabAnswerItem(vi: 'trước khi khám', en: 'before examine you'),
  FabAnswerItem(vi: 'điền đầy đủ', en: 'fill out'),
  FabAnswerItem(vi: 'tiểu sử bệnh', en: 'medical history'),
  FabAnswerItem(vi: 'mẫu bảo hiểm', en: 'insurance forms'),
  FabAnswerItem(vi: 'liệt kê', en: 'list'),
  FabAnswerItem(vi: 'các loại thuốc', en: 'medications'),
  FabAnswerItem(vi: 'bất kỳ dị ứng nào', en: 'any allergies'),
  FabAnswerItem(vi: 'y tá sẽ đo', en: 'a nurse will take'),
  FabAnswerItem(vi: 'huyết áp', en: 'blood pressure'),
  FabAnswerItem(vi: 'thân nhiệt', en: 'temperature'),
  FabAnswerItem(vi: 'văn phòng của tôi', en: 'my office'),
  FabAnswerItem(vi: 'câu hỏi nào', en: 'any questions'),
];

// SHORT TALK 2 FAB
static List<FabVocabItem> get day2ShortTalk2Vocab => [
  FabVocabItem(
    wordEn: 'exercise',
    wordVi: 'Luyện tập',
    pronunciation: '/ˈɛksərsaɪz/',
  ),
  FabVocabItem(
    wordEn: 'nutrition',
    wordVi: 'Dinh dưỡng',
    pronunciation: '/nuːˈtrɪʃən/',
  ),
  FabVocabItem(
    wordEn: 'fitness program',
    wordVi: 'Chương trình fitness',
    pronunciation: '/ˈfɪtnəs ˈproʊɡræm/',
  ),
  FabVocabItem(
    wordEn: 'weight loss',
    wordVi: 'Giảm cân',
    pronunciation: '/ˈweɪt lɔːs/',
  ),
];

static List<FabPhraseItem> get day2ShortTalk2Phrases => [
  FabPhraseItem(phrase: 'Play important part', meaning: 'Đóng vai trò quan trọng'),
  FabPhraseItem(phrase: 'Maintaining good health', meaning: 'Duy trì sức khỏe tốt'),
  FabPhraseItem(phrase: 'Combine nutrition and diet', meaning: 'Kết hợp dinh dưỡng và chế độ ăn'),
  FabPhraseItem(phrase: 'Tailored personally', meaning: 'Thiết kế riêng cho từng người'),
  FabPhraseItem(phrase: 'Obtain desired results', meaning: 'Đạt được kết quả mong muốn'),
];

static List<FabAnswerItem> get day2ShortTalk2Answers => [
  FabAnswerItem(vi: 'đóng vai trò quan trọng', en: 'play important part'),
  FabAnswerItem(vi: 'cuộc sống hàng ngày', en: 'daily lives'),
  FabAnswerItem(vi: 'duy trì sức khỏe tốt', en: 'maintaining good health'),
  FabAnswerItem(vi: 'được nhấn mạnh', en: 'emphasized'),
  FabAnswerItem(vi: 'chuyên gia y tế', en: 'health and fitness experts'),
  FabAnswerItem(vi: 'sự khởi đầu mới', en: 'fresh start'),
  FabAnswerItem(vi: 'kết hợp', en: 'combines'),
  FabAnswerItem(vi: 'luyện tập thường xuyên', en: 'regular exercise'),
  FabAnswerItem(vi: 'không ai giống ai', en: 'No two people are alike'),
  FabAnswerItem(vi: 'khác với các chương trình khác', en: 'unlike other weight loss programs'),
  FabAnswerItem(vi: 'huấn luyện viên', en: 'trainers'),
  FabAnswerItem(vi: 'cung cấp cho bạn', en: 'provide you with'),
  FabAnswerItem(vi: 'kế hoạch dinh dưỡng và luyện tập', en: 'nutrition and exercise plan'),
  FabAnswerItem(vi: 'thiết kế riêng cho', en: 'tailored personally for'),
  FabAnswerItem(vi: 'hợp tác cùng nhau', en: 'work together'),
  FabAnswerItem(vi: 'đạt được kết quả mong muốn', en: 'obtain your desired results'),
  FabAnswerItem(vi: 'việc giảm cân', en: 'weight loss'),
  FabAnswerItem(vi: 'công cụ cần thiết', en: 'tools you need'),
  FabAnswerItem(vi: 'cam kết cung cấp', en: 'committed to providing'),
  FabAnswerItem(vi: 'kết quả nhanh chóng', en: 'fast results'),
  FabAnswerItem(vi: 'cam kết 40 ngày', en: '40-day guarantee'),
];

// ═══════════════════════════════════════════════════════════════
// QUIZ QUESTIONS DAY 2
// ═══════════════════════════════════════════════════════════════
static List<QuizQuestion> get _practice1Questions => [
  QuizQuestion(
    id: 'theme13_q01',
    questionText: 'Where is this conversation taking place?',
    options: [
      '(A) In a doctor\'s office',
      '(B) At a tennis court',
      '(C) In a massage room',
      '(D) In a hospital operating room',
    ],
    correctIndex: 0,
    audioTrackKey: 'track_52',
    practiceNumber: 'practice1',
  ),
  QuizQuestion(
    id: 'theme13_q02',
    questionText: 'What does the man say about the pain?',
    options: [
      '(A) It happened in the middle of a tennis game.',
      '(B) It is constant.',
      '(C) It is getting worse.',
      '(D) It is getting better.',
    ],
    correctIndex: 2,
    audioTrackKey: 'track_52',
    practiceNumber: 'practice1',
  ),
  QuizQuestion(
    id: 'theme13_q03',
    questionText: 'What does the woman advise the man to do?',
    options: [
      '(A) Not to play tennis again',
      '(B) See a therapist',
      '(C) Keep playing tennis on a regular basis',
      '(D) Have surgery on his arm',
    ],
    correctIndex: 1,
    audioTrackKey: 'track_52',
    practiceNumber: 'practice1',
  ),
];

static List<QuizQuestion> get _practice2Questions => [
  QuizQuestion(
    id: 'theme13_q04',
    questionText: 'Where is this conversation or talk taking place?',
    options: [
      '(A) In a medical clinic',
      '(B) In an insurance office',
      '(C) In a school',
      '(D) In a sports equipment store',
    ],
    correctIndex: 0,
    audioTrackKey: 'track_53',
    practiceNumber: 'practice2',
  ),
  QuizQuestion(
    id: 'theme13_q05',
    questionText: 'What information should be included on the form?',
    options: [
      '(A) Height and weight',
      '(B) Blood pressure chart',
      '(C) Names of medications being taken',
      '(D) Home address',
    ],
    correctIndex: 2,
    audioTrackKey: 'track_53',
    practiceNumber: 'practice2',
  ),
  QuizQuestion(
    id: 'theme13_q06',
    questionText: 'What will happen after the form has been filled out?',
    options: [
      '(A) The bill must be paid in full.',
      '(B) Laboratory tests will be run.',
      '(C) Blood pressure and temperature will be taken.',
      '(D) The doctor will prescribe new medication.',
    ],
    correctIndex: 2,
    audioTrackKey: 'track_53',
    practiceNumber: 'practice2',
  ),
];

static List<QuizQuestion> get _practice3Questions => [
  QuizQuestion(
    id: 'theme13_q07',
    questionText: 'Who most likely is the speaker?',
    options: [
      '(A) A doctor',
      '(B) A dietitian',
      '(C) A salesperson',
      '(D) A chef',
    ],
    correctIndex: 1,
    audioTrackKey: 'track_54',
    practiceNumber: 'practice3',
  ),
  QuizQuestion(
    id: 'theme13_q08',
    questionText: 'How is this program different?',
    options: [
      '(A) It provides a weight gain guarantee.',
      '(B) It is specifically designed for each customer.',
      '(C) It is less expensive than its competitor.',
      '(D) It was designed by health and fitness experts.',
    ],
    correctIndex: 1,
    audioTrackKey: 'track_54',
    practiceNumber: 'practice3',
  ),
  QuizQuestion(
    id: 'theme13_q09',
    questionText: 'What does the program guarantee?',
    options: [
      '(A) The lowest price',
      '(B) Lots of heavy exercises',
      '(C) Transportation',
      '(D) Short-time period',
    ],
    correctIndex: 3,
    audioTrackKey: 'track_54',
    practiceNumber: 'practice3',
  ),
];

// ═══════════════════════════════════════════════════════════════
// MIND GAME SEGMENTS DAY 2
// ═══════════════════════════════════════════════════════════════
static List<MixedSegment> get _day2ConversationSegments => [
  const MixedSegment.english('W: OK, Mr. Thomas, I '),
  const MixedSegment.vietnamese('nhận thấy không có chỗ nào bị gãy', 'see no breaks'),
  const MixedSegment.english(' in your arm or '),
  const MixedSegment.vietnamese('khuỷu tay', 'elbow'),
  const MixedSegment.english('. And there are no '),
  const MixedSegment.vietnamese('dấu hiệu viêm nhiễm', 'signs of inflammation'),
  const MixedSegment.english(', but it is '),
  const MixedSegment.vietnamese('rõ ràng khá đau', 'obviously quite painful'),
  const MixedSegment.english(' for you. When did you say this happened?'),
  const MixedSegment.english('M: Exactly 5 days ago. I was having a game of tennis '),
  const MixedSegment.vietnamese('với các đồng nghiệp của tôi', 'with my colleagues'),
  const MixedSegment.english(' and shortly after the game, I '),
  const MixedSegment.vietnamese('bắt đầu cảm thấy đau nhức', 'began to feel sore'),
  const MixedSegment.english(' all over my arm. It '),
  const MixedSegment.vietnamese('đã biến mất', 'did go away'),
  const MixedSegment.english(' after a few hours but '),
  const MixedSegment.vietnamese('lần tiếp theo', 'the next time'),
  const MixedSegment.english(' I played it was '),
  const MixedSegment.vietnamese('thậm chí còn tệ hơn', 'even worse'),
  const MixedSegment.english('. That\'s how it has continued; '),
  const MixedSegment.vietnamese('tệ hơn một chút', 'a little bit worse'),
  const MixedSegment.english(' and lasting a little bit longer each time I play.'),
  const MixedSegment.english('W: Now I think I see what it is. It\'s '),
  const MixedSegment.vietnamese('chứng đau nhức khuỷu tay do chơi tennis', 'tennis elbow'),
  const MixedSegment.english('. It\'s not something '),
  const MixedSegment.vietnamese('quá nghiêm trọng', 'too serious'),
  const MixedSegment.english('. What you should do now is to '),
  const MixedSegment.vietnamese('gặp một bác sĩ trị liệu thể thao', 'see a sports therapist'),
  const MixedSegment.english(' who can '),
  const MixedSegment.vietnamese('xoa bóp nó', 'massage it'),
  const MixedSegment.english(', and remember to treat it with '),
  const MixedSegment.vietnamese('một túi chườm đá', 'an ice pack'),
  const MixedSegment.english(' before you sleep. You should be okay after 3 or 4 days.'),
  const MixedSegment.english('M: You know, I think you\'re right. I guess I '),
  const MixedSegment.vietnamese('phải dừng chơi tennis', 'have to stop playing tennis'),
  const MixedSegment.english(' for a few days.'),
];

static List<MixedSegment> get _day2ShortTalk1Segments => [
  const MixedSegment.english('Now, Mr. Thomas, '),
  const MixedSegment.vietnamese('theo hồ sơ của chúng tôi', 'according to our records'),
  const MixedSegment.english(', this is your '),
  const MixedSegment.vietnamese('lần thăm khám đầu tiên', 'first visit'),
  const MixedSegment.english(' to our '),
  const MixedSegment.vietnamese('phòng khám', 'clinic'),
  const MixedSegment.english('. Before Dr. James can '),
  const MixedSegment.vietnamese('khám cho ông', 'examine you'),
  const MixedSegment.english(', you\'ll have to '),
  const MixedSegment.vietnamese('điền đầy đủ', 'fill out'),
  const MixedSegment.english(' these '),
  const MixedSegment.vietnamese('tiểu sử bệnh', 'medical history'),
  const MixedSegment.english(' and insurance forms. Could you please '),
  const MixedSegment.vietnamese('liệt kê', 'list'),
  const MixedSegment.english(' all of '),
  const MixedSegment.vietnamese('các loại thuốc', 'the medications'),
  const MixedSegment.english(' you are taking and '),
  const MixedSegment.vietnamese('bất kỳ dị ứng nào', 'any allergies'),
  const MixedSegment.english(' you may have. After you '),
  const MixedSegment.vietnamese('đã điền xong các mẫu đơn', 'have filled out the forms'),
  const MixedSegment.english(', a nurse will '),
  const MixedSegment.vietnamese('đo huyết áp và thân nhiệt', 'take your blood pressure and temperature'),
  const MixedSegment.english('. I\'ll be here in my '),
  const MixedSegment.vietnamese('văn phòng', 'office'),
  const MixedSegment.english(' if you have '),
  const MixedSegment.vietnamese('bất kỳ câu hỏi nào', 'any questions'),
  const MixedSegment.english('.'),
];

static List<MixedSegment> get _day2ShortTalk2Segments => [
  const MixedSegment.english('We all know that both exercise and diet '),
  const MixedSegment.vietnamese('đóng vai trò quan trọng', 'play an important part'),
  const MixedSegment.english(' in our '),
  const MixedSegment.vietnamese('cuộc sống hàng ngày', 'daily lives'),
  const MixedSegment.english('. The importance of '),
  const MixedSegment.vietnamese('duy trì sức khỏe tốt', 'maintaining good health'),
  const MixedSegment.english(' has long been '),
  const MixedSegment.vietnamese('được nhấn mạnh', 'emphasized'),
  const MixedSegment.english(' by '),
  const MixedSegment.vietnamese('các chuyên gia y tế', 'health and fitness experts'),
  const MixedSegment.english('. We are here to offer you '),
  const MixedSegment.vietnamese('một sự khởi đầu mới', 'a fresh start'),
  const MixedSegment.english('. Our program, Fitness For All, '),
  const MixedSegment.vietnamese('kết hợp', 'combines'),
  const MixedSegment.english(' nutrition and diet with '),
  const MixedSegment.vietnamese('luyện tập thường xuyên', 'regular exercise'),
  const MixedSegment.english('. No two people are alike. So, '),
  const MixedSegment.vietnamese('khác với các chương trình khác', 'unlike other weight loss programs'),
  const MixedSegment.english(', our '),
  const MixedSegment.vietnamese('huấn luyện viên', 'trainers'),
  const MixedSegment.english(' will '),
  const MixedSegment.vietnamese('cung cấp cho bạn', 'provide you with'),
  const MixedSegment.english(' a '),
  const MixedSegment.vietnamese('kế hoạch dinh dưỡng và luyện tập', 'nutrition and exercise plan'),
  const MixedSegment.vietnamese('thiết kế riêng cho', 'tailored personally for'),
  const MixedSegment.english(' you. We will '),
  const MixedSegment.vietnamese('hợp tác cùng nhau', 'work together'),
  const MixedSegment.english(' in order for you to '),
  const MixedSegment.vietnamese('đạt được kết quả mong muốn', 'obtain your desired results'),
  const MixedSegment.english(' in '),
  const MixedSegment.vietnamese('việc giảm cân', 'weight loss'),
  const MixedSegment.english(' by providing you with '),
  const MixedSegment.vietnamese('các công cụ cần thiết', 'the tools you need'),
  const MixedSegment.english('. We are '),
  const MixedSegment.vietnamese('cam kết cung cấp', 'committed to providing'),
  const MixedSegment.english(' you with '),
  const MixedSegment.vietnamese('kết quả nhanh chóng', 'fast results'),
  const MixedSegment.english(': it\'s our '),
  const MixedSegment.vietnamese('cam kết 40 ngày', '40-day guarantee'),
  const MixedSegment.english('.'),
];
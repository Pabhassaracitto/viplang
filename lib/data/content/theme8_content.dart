import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme8Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_08_personnel',
    themeNumber: 8,
    titleEn: 'Personnel',
    titleVi: 'Nhân Sự',
    description:
        'Quá trình tuyển dụng, lương thưởng, chính sách công ty, đánh giá hiệu quả công việc, phát triển nhân viên, thủ tục hành chính liên quan đến nhân sự.',
    iconEmoji: '👥',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY (30 từ - bao phủ Day 1 + 3 practices)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v08_01',
      wordEn: 'Human Resources',
      wordVi: 'Nguồn nhân lực',
      pronunciation: '/ˈhjuːmən ˈrɪsɔːrsɪz/',
      partOfSpeech: 'np',
      themeId: 'theme_08_personnel',
      exampleEn:
          'The Human Resources department handles hiring and employee benefits.',
      exampleVi:
          'Phòng Nguồn nhân lực xử lý việc tuyển dụng và phúc lợi nhân viên.',
    ),
    VocabModel(
      id: 'v08_02',
      wordEn: 'recruit',
      wordVi: 'tuyển dụng',
      pronunciation: '/rɪˈkruːt/',
      partOfSpeech: 'v',
      themeId: 'theme_08_personnel',
      exampleEn: 'The company is recruiting new employees for the sales team.',
      exampleVi:
          'Công ty đang tuyển dụng những nhân viên mới cho phòng bán hàng.',
    ),
    VocabModel(
      id: 'v08_03',
      wordEn: 'advertise',
      wordVi: 'quảng cáo',
      pronunciation: '/ˈædvərtaɪz/',
      partOfSpeech: 'v',
      themeId: 'theme_08_personnel',
      exampleEn: 'We advertise job positions on our company website.',
      exampleVi:
          'Chúng tôi quảng cáo các vị trí việc làm trên trang web công ty.',
    ),
    VocabModel(
      id: 'v08_04',
      wordEn: 'salary',
      wordVi: 'lương',
      pronunciation: '/ˈsæləri/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'Her annual salary is \$60,000.',
      exampleVi: 'Lương hằng năm của cô ấy là 60,000 đô la.',
    ),
    VocabModel(
      id: 'v08_05',
      wordEn: 'promotion',
      wordVi: 'sự thăng tiến',
      pronunciation: '/prəˈmoʊʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn:
          'He received a promotion to manager after working for 5 years.',
      exampleVi: 'Anh ấy được thăng chức lên quản lý sau 5 năm làm việc.',
    ),
    VocabModel(
      id: 'v08_06',
      wordEn: 'job application',
      wordVi: 'hồ sơ xin việc',
      pronunciation: '/ˈdʒɑːb ˌæplɪˈkeɪʃən/',
      partOfSpeech: 'np',
      themeId: 'theme_08_personnel',
      exampleEn: 'She submitted her job application yesterday.',
      exampleVi: 'Cô ấy nộp hồ sơ xin việc hôm qua.',
    ),
    VocabModel(
      id: 'v08_07',
      wordEn: 'pension',
      wordVi: 'lương hưu',
      pronunciation: '/ˈpenʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'Employees receive a pension after retirement.',
      exampleVi: 'Nhân viên nhận lương hưu sau khi nghỉ hưu.',
    ),
    VocabModel(
      id: 'v08_08',
      wordEn: 'benefit',
      wordVi: 'phúc lợi',
      pronunciation: '/ˈbenɪfɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'The company offers health insurance as a benefit.',
      exampleVi: 'Công ty cung cấp bảo hiểm sức khỏe như một phúc lợi.',
    ),
    VocabModel(
      id: 'v08_09',
      wordEn: 'performance review',
      wordVi: 'bản đánh giá hiệu quả công việc',
      pronunciation: '/pərˈfɔːrməns rɪˈvjuː/',
      partOfSpeech: 'np',
      themeId: 'theme_08_personnel',
      exampleEn: 'Employees have a performance review every year.',
      exampleVi: 'Nhân viên được đánh giá hiệu quả công việc mỗi năm.',
    ),
    VocabModel(
      id: 'v08_10',
      wordEn: 'policy',
      wordVi: 'chính sách',
      pronunciation: '/ˈpɑːləsi/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'Company policy requires all employees to arrive on time.',
      exampleVi: 'Chính sách công ty yêu cầu tất cả nhân viên đến đúng giờ.',
    ),
    VocabModel(
      id: 'v08_11',
      wordEn: 'vacation',
      wordVi: 'kỳ nghỉ',
      pronunciation: '/vəˈkeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'Employees get 20 days of vacation per year.',
      exampleVi: 'Nhân viên được 20 ngày nghỉ mỗi năm.',
    ),
    VocabModel(
      id: 'v08_12',
      wordEn: 'absence',
      wordVi: 'sự vắng mặt',
      pronunciation: '/ˈæbsəns/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'Three absences in a month can result in disciplinary action.',
      exampleVi:
          'Ba lần vắng mặt trong một tháng có thể dẫn đến xử lý kỷ luật.',
    ),
    VocabModel(
      id: 'v08_13',
      wordEn: 'tardiness',
      wordVi: 'sự đi muộn',
      pronunciation: '/ˈtɑːrdɪnəs/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'Repeated tardiness may affect your annual review.',
      exampleVi:
          'Tình trạng đi muộn lặp lại có thể ảnh hưởng đến đánh giá hằng năm.',
    ),
    VocabModel(
      id: 'v08_14',
      wordEn: 'retirement',
      wordVi: 'việc nghỉ hưu',
      pronunciation: '/rɪˈtaɪərmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'She is planning her retirement for next year.',
      exampleVi: 'Cô ấy đang lên kế hoạch nghỉ hưu vào năm tới.',
    ),
    VocabModel(
      id: 'v08_15',
      wordEn: 'replacement',
      wordVi: 'người thay thế',
      pronunciation: '/rɪˈpleɪsmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'We need to find a replacement before she leaves.',
      exampleVi: 'Chúng ta cần tìm người thay thế trước khi cô ấy rời đi.',
    ),
    VocabModel(
      id: 'v08_16',
      wordEn: 'training',
      wordVi: 'đào tạo/huấn luyện',
      pronunciation: '/ˈtreɪnɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'New employees receive training in the first two weeks.',
      exampleVi: 'Nhân viên mới được đào tạo trong hai tuần đầu tiên.',
    ),
    VocabModel(
      id: 'v08_17',
      wordEn: 'evaluation',
      wordVi: 'việc đánh giá',
      pronunciation: '/ˌevəlˈjuːeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'The evaluation process takes about two weeks.',
      exampleVi: 'Quy trình đánh giá mất khoảng hai tuần.',
    ),
    VocabModel(
      id: 'v08_18',
      wordEn: 'compensation',
      wordVi: 'tiền bồi thường/công lao',
      pronunciation: '/ˌkɑːmpenˈseɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'The compensation package includes salary and benefits.',
      exampleVi: 'Gói công lao bao gồm lương và các phúc lợi.',
    ),
    VocabModel(
      id: 'v08_19',
      wordEn: 'recommendation',
      wordVi: 'thư giới thiệu/sự giới thiệu',
      pronunciation: '/ˌrekəmenˈdeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'I received two recommendations from my colleagues.',
      exampleVi: 'Tôi nhận được hai lá thư giới thiệu từ các đồng nghiệp.',
    ),
    VocabModel(
      id: 'v08_20',
      wordEn: 'supervisor',
      wordVi: 'người quản lý/cấp trên',
      pronunciation: '/ˈsuːpərvˌaɪzər/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'Talk to your supervisor if you have any questions.',
      exampleVi: 'Nói chuyện với người quản lý của bạn nếu bạn có câu hỏi.',
    ),
    VocabModel(
      id: 'v08_21',
      wordEn: 'resignation',
      wordVi: 'sự từ chức',
      pronunciation: '/ˌrezɪɡˈneɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'His resignation was effective immediately.',
      exampleVi: 'Sự từ chức của anh ấy có hiệu lực ngay lập tức.',
    ),
    VocabModel(
      id: 'v08_22',
      wordEn: 'candidate',
      wordVi: 'ứng viên',
      pronunciation: '/ˈkændɪdeɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'We interviewed three candidates for the position.',
      exampleVi: 'Chúng tôi phỏng vấn ba ứng viên cho vị trí đó.',
    ),
    VocabModel(
      id: 'v08_23',
      wordEn: 'professional development',
      wordVi: 'sự phát triển nghề nghiệp',
      pronunciation: '/prəˈfeʃənəl dɪˈveləpmənt/',
      partOfSpeech: 'np',
      themeId: 'theme_08_personnel',
      exampleEn: 'The company offers courses for professional development.',
      exampleVi: 'Công ty cung cấp các khóa học cho sự phát triển nghề nghiệp.',
    ),
    VocabModel(
      id: 'v08_24',
      wordEn: 'merit',
      wordVi: 'xứng đáng',
      pronunciation: '/ˈmerɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'Promotions are based on merit and performance.',
      exampleVi:
          'Những cuộc thăng tiến dựa trên xứng đáng và hiệu quả công việc.',
    ),
    VocabModel(
      id: 'v08_25',
      wordEn: 'bonus',
      wordVi: 'tiền thưởng',
      pronunciation: '/ˈboʊnəs/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'Employees receive a bonus at the end of the year.',
      exampleVi: 'Nhân viên nhận tiền thưởng vào cuối năm.',
    ),
    VocabModel(
      id: 'v08_26',
      wordEn: 'resign',
      wordVi: 'từ chức',
      pronunciation: '/rɪˈzaɪn/',
      partOfSpeech: 'v',
      themeId: 'theme_08_personnel',
      exampleEn: 'She decided to resign from her position.',
      exampleVi: 'Cô ấy quyết định từ chức khỏi vị trí của mình.',
    ),
    VocabModel(
      id: 'v08_27',
      wordEn: 'hiring process',
      wordVi: 'quá trình tuyển dụng',
      pronunciation: '/ˈhaɪrɪŋ ˈproʊses/',
      partOfSpeech: 'np',
      themeId: 'theme_08_personnel',
      exampleEn: 'The hiring process typically takes two months.',
      exampleVi: 'Quá trình tuyển dụng thường mất hai tháng.',
    ),
    VocabModel(
      id: 'v08_28',
      wordEn: 'payroll',
      wordVi: 'bảng lương',
      pronunciation: '/ˈpeɪroʊl/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'The payroll department processes salaries every month.',
      exampleVi: 'Phòng bảng lương xử lý lương mỗi tháng.',
    ),
    VocabModel(
      id: 'v08_29',
      wordEn: 'qualifications',
      wordVi: 'bằng cấp/năng lực',
      pronunciation: '/ˌkwɑːlɪfɪˈkeɪʃənz/',
      partOfSpeech: 'n',
      themeId: 'theme_08_personnel',
      exampleEn: 'The job requires specific qualifications and experience.',
      exampleVi: 'Công việc yêu cầu bằng cấp và kinh nghiệm cụ thể.',
    ),
    VocabModel(
      id: 'v08_30',
      wordEn: 'medical insurance',
      wordVi: 'bảo hiểm y tế',
      pronunciation: '/ˈmedɪkəl ɪnˈʃʊrəns/',
      partOfSpeech: 'np',
      themeId: 'theme_08_personnel',
      exampleEn: 'The company provides comprehensive medical insurance.',
      exampleVi: 'Công ty cung cấp bảo hiểm y tế toàn diện.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 1 Reading Vocabulary
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => [
    const FabVocabItem(
      wordEn: 'Human Resources',
      wordVi: 'Nguồn nhân lực',
      pronunciation: '/ˈhjuːmən ˈrɪsɔːrsɪz/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'recruit',
      wordVi: 'Tuyển dụng',
      pronunciation: '/rɪˈkruːt/',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'advertise',
      wordVi: 'Quảng cáo',
      pronunciation: '/ˈædvərtaɪz/',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'salary',
      wordVi: 'Lương',
      pronunciation: '/ˈsæləri/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'promotion',
      wordVi: 'Sự thăng tiến',
      pronunciation: '/prəˈmoʊʃən/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'pension',
      wordVi: 'Lương hưu',
      pronunciation: '/ˈpenʃən/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'performance review',
      wordVi: 'Đánh giá hiệu quả công việc',
      pronunciation: '/pərˈfɔːrməns rɪˈvjuː/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'absence',
      wordVi: 'Sự vắng mặt',
      pronunciation: '/ˈæbsəns/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'tardiness',
      wordVi: 'Sự đi muộn',
      pronunciation: '/ˈtɑːrdɪnəs/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'benefit',
      wordVi: 'Phúc lợi',
      pronunciation: '/ˈbenɪfɪt/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    const FabPhraseItem(phrase: 'Be related to', meaning: 'Có liên quan đến'),
    const FabPhraseItem(phrase: 'Be familiar with', meaning: 'Quen thuộc với'),
    const FabPhraseItem(
      phrase: 'Be responsible for',
      meaning: 'Chịu trách nhiệm về',
    ),
    const FabPhraseItem(
      phrase: 'Commensurate with experience',
      meaning: 'Tương xứng với kinh nghiệm',
    ),
    const FabPhraseItem(phrase: 'Involve in', meaning: 'Liên quan tới'),
    const FabPhraseItem(phrase: 'Deal with', meaning: 'Xử lý/Giải quyết'),
    const FabPhraseItem(phrase: 'Respond to', meaning: 'Phản hồi lại'),
  ];

  static List<FabAnswerItem> get readingAnswers => const [
    FabAnswerItem(vi: 'Nguồn nhân lực', en: 'Human Resources'),
    FabAnswerItem(vi: 'liên quan trực tiếp', en: 'directly related'),
    FabAnswerItem(vi: 'liên quan những người', en: 'involves the people'),
    FabAnswerItem(vi: 'tình huống', en: 'the situations'),
    FabAnswerItem(vi: 'quá trình tuyển dụng', en: 'the hiring process'),
    FabAnswerItem(vi: 'quảng cáo cho', en: 'advertising for'),
    FabAnswerItem(
      vi: 'tuyển dụng nhân viên mới',
      en: 'recruiting new employees',
    ),
    FabAnswerItem(vi: 'xử lý lương', en: 'dealing with salaries'),
    FabAnswerItem(vi: 'những sự thăng tiến', en: 'promotions'),
    FabAnswerItem(vi: 'hồ sơ xin việc', en: 'job applications'),
    FabAnswerItem(vi: 'quảng cáo tuyển dụng', en: 'job advertisements'),
    FabAnswerItem(vi: 'lương hưu', en: 'pensions'),
    FabAnswerItem(
      vi: 'các phúc lợi khác của công ty',
      en: 'other company benefits',
    ),
    FabAnswerItem(
      vi: 'các bản đánh giá hiệu quả công việc',
      en: 'performance reviews',
    ),
    FabAnswerItem(vi: 'các vấn đề về y tế', en: 'medical issues'),
    FabAnswerItem(vi: 'sự vắng mặt', en: 'absences'),
    FabAnswerItem(vi: 'sự đi muộn', en: 'tardiness'),
    FabAnswerItem(vi: 'quen thuộc với', en: 'familiar with'),
    FabAnswerItem(
      vi: 'việc trao đổi các thông báo nội bộ',
      en: 'exchange of memos',
    ),
    FabAnswerItem(vi: 'Ngoài những điều trên', en: 'In addition to the above'),
    FabAnswerItem(vi: 'chịu trách nhiệm về', en: 'is responsible for'),
    FabAnswerItem(
      vi: 'sự phát triển nghề nghiệp',
      en: 'professional development',
    ),
    FabAnswerItem(vi: 'nâng cao chuyên môn', en: 'improve qualifications'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Conversation Vocabulary
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get conversationVocab => [
    const FabVocabItem(
      wordEn: 'retirement',
      wordVi: 'Nghỉ hưu',
      pronunciation: '/rɪˈtaɪərmənt/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'replacement',
      wordVi: 'Người thay thế',
      pronunciation: '/rɪˈpleɪsmənt/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'suitable',
      wordVi: 'Phù hợp',
      pronunciation: '/ˈsuːtəbəl/',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'train',
      wordVi: 'Đào tạo',
      pronunciation: '/treɪn/',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'recruit',
      wordVi: 'Người được tuyển dụng',
      pronunciation: '/ˈriːkruːt/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get conversationPhrases => [
    const FabPhraseItem(
      phrase: 'Lean towards',
      meaning: 'Nghiêng về/có xu hướng',
    ),
    const FabPhraseItem(
      phrase: 'Before the end of',
      meaning: 'Trước khi kết thúc',
    ),
    const FabPhraseItem(
      phrase: 'Find a replacement',
      meaning: 'Tìm người thay thế',
    ),
    const FabPhraseItem(
      phrase: 'Place an ad',
      meaning: 'Đưa một bài quảng cáo',
    ),
    const FabPhraseItem(
      phrase: 'Have lots of time',
      meaning: 'Có rất nhiều thời gian',
    ),
  ];

  static List<FabAnswerItem> get conversationAnswers => const [
    FabAnswerItem(vi: 'đã quyết định', en: 'decided'),
    FabAnswerItem(vi: 'nghỉ hưu', en: 'retirement'),
    FabAnswerItem(vi: 'đang nghiêng về', en: 'am leaning towards'),
    FabAnswerItem(vi: 'cuối năm', en: 'the end of the year'),
    FabAnswerItem(vi: 'Tuy nhiên', en: 'However'),
    FabAnswerItem(vi: 'rời công ty', en: 'leave the company'),
    FabAnswerItem(vi: 'cần tìm được', en: 'need to find'),
    FabAnswerItem(vi: 'vị trí của tôi', en: 'my position'),
    FabAnswerItem(vi: 'có thể giúp', en: 'can help'),
    FabAnswerItem(vi: 'đưa một bài quảng cáo', en: 'place an ad'),
    FabAnswerItem(vi: 'Sau đó', en: 'Then'),
    FabAnswerItem(vi: 'huấn luyện người', en: 'train the person'),
    FabAnswerItem(
      vi: 'Đó là một ý tưởng tuyệt vời',
      en: 'That is a great idea',
    ),
    FabAnswerItem(vi: 'có rất nhiều thời gian', en: 'have lots of time'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 1 Vocabulary (Job Hotline)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk1Vocab => [
    const FabVocabItem(
      wordEn: 'job hotline',
      wordVi: 'Đường dây nóng tuyển dụng',
      pronunciation: '/ˈdʒɑːb ˈhɑːtlaɪn/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'background',
      wordVi: 'Nền tảng kiến thức',
      pronunciation: '/ˈbækɡraʊnd/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'job description',
      wordVi: 'Mô tả công việc',
      pronunciation: '/ˈdʒɑːb dɪˈskrɪpʃən/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'application status',
      wordVi: 'Trạng thái hồ sơ',
      pronunciation: '/ˌæplɪˈkeɪʃən ˈsteɪtəs/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'relevant information',
      wordVi: 'Thông tin liên quan',
      pronunciation: '/ˈreləvənt ɪnˈfɔːrmeɪʃən/',
      partOfSpeech: 'np',
    ),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
    const FabPhraseItem(
      phrase: 'Looking to recruit',
      meaning: 'Đang tìm cách tuyển dụng',
    ),
    const FabPhraseItem(phrase: 'To hear about', meaning: 'Để nghe về'),
    const FabPhraseItem(
      phrase: 'Press one/two/three',
      meaning: 'Ấn phím 1/2/3',
    ),
    const FabPhraseItem(
      phrase: 'Have a pen and paper',
      meaning: 'Chuẩn bị bút và giấy',
    ),
    const FabPhraseItem(
      phrase: 'Be ready to write',
      meaning: 'Sẵn sàng ghi chép',
    ),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => const [
    FabAnswerItem(vi: 'đường dây nóng tuyển dụng', en: 'Job Hotline'),
    FabAnswerItem(vi: 'đang tìm cách tuyển dụng', en: 'looking to recruit'),
    FabAnswerItem(vi: 'nền tảng kiến thức', en: 'background'),
    FabAnswerItem(vi: 'bao gồm', en: 'including'),
    FabAnswerItem(
      vi: 'các khóa đào tạo ngôn ngữ mới',
      en: 'new language training courses',
    ),
    FabAnswerItem(vi: 'Để nghe', en: 'To hear'),
    FabAnswerItem(vi: 'cơ hội việc làm', en: 'job opportunity'),
    FabAnswerItem(vi: 'Để nghe', en: 'To listen to'),
    FabAnswerItem(vi: 'vị trí đang cần tuyển', en: 'job openings'),
    FabAnswerItem(vi: 'Để yêu cầu', en: 'To request'),
    FabAnswerItem(vi: 'trạng thái hồ sơ', en: 'application status'),
    FabAnswerItem(vi: 'chuẩn bị bút và giấy', en: 'have a pen and paper'),
    FabAnswerItem(vi: 'sẵn sàng ghi', en: 'ready to write'),
    FabAnswerItem(vi: 'thông tin liên quan', en: 'relevant information'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 2 Vocabulary (Raise & Bonus Evaluation)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk2Vocab => [
    const FabVocabItem(
      wordEn: 'raise',
      wordVi: 'Tăng lương',
      pronunciation: '/reɪz/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'evaluation',
      wordVi: 'Đánh giá',
      pronunciation: '/ˌevæljˈueɪʃən/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'supervisor',
      wordVi: 'Cấp trên trực tiếp',
      pronunciation: '/ˈsuːpərvaɪzər/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'responsibility',
      wordVi: 'Trách nhiệm',
      pronunciation: '/rɪˌspɑːnsəˈbɪləti/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'withdraw',
      wordVi: 'Rút lại',
      pronunciation: '/wɪðˈdrɔː/',
      partOfSpeech: 'v',
    ),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
    const FabPhraseItem(phrase: 'Short notice', meaning: 'Thông báo gấp'),
    const FabPhraseItem(
      phrase: 'Address the issue',
      meaning: 'Giải quyết vấn đề',
    ),
    const FabPhraseItem(phrase: 'In the past', meaning: 'Trước đây'),
    const FabPhraseItem(phrase: 'Double (increase)', meaning: 'Tăng gấp đôi'),
    const FabPhraseItem(phrase: 'Fill in a form', meaning: 'Điền vào biểu mẫu'),
    const FabPhraseItem(
      phrase: 'Deserve a raise',
      meaning: 'Xứng đáng được tăng lương',
    ),
    const FabPhraseItem(
      phrase: 'Submit to Administration',
      meaning: 'Nộp cho phòng hành chính',
    ),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => const [
    FabAnswerItem(vi: 'theo một thông báo gấp', en: 'on such short notice'),
    FabAnswerItem(vi: 'giải quyết', en: 'address'),
    FabAnswerItem(vi: 'tăng lương và thưởng', en: 'raise and bonus'),
    FabAnswerItem(vi: 'yêu cầu tăng lương', en: 'ask for a pay raise'),
    FabAnswerItem(vi: 'quyết định của ông chủ', en: 'the employer\'s decision'),
    FabAnswerItem(vi: 'liệu có xứng đáng hay không', en: 'worthy of it or not'),
    FabAnswerItem(vi: 'đã gần như tăng gấp đôi', en: 'has almost doubled'),
    FabAnswerItem(
      vi: 'khoảng cách giữa người lao động và người sử dụng lao động',
      en: 'employee - employer relationship gap',
    ),
    FabAnswerItem(vi: 'Từ bây giờ trở đi', en: 'From now on'),
    FabAnswerItem(
      vi: 'để đạt được bất kỳ khoản tăng lương nào',
      en: 'to attain any raise',
    ),
    FabAnswerItem(vi: 'các khoản thưởng thêm', en: 'extra bonuses'),
    FabAnswerItem(vi: 'điền vào', en: 'fill in'),
    FabAnswerItem(vi: 'bản đánh giá', en: 'evaluation form'),
    FabAnswerItem(
      vi: 'đưa ra một lời giải thích chính thức',
      en: 'give a formal explanation',
    ),
    FabAnswerItem(vi: 'xứng đáng được tăng lương', en: 'deserve a raise'),
    FabAnswerItem(vi: 'ít nhất', en: 'at least'),
    FabAnswerItem(vi: 'các đồng nghiệp của mình', en: 'your colleagues'),
    FabAnswerItem(
      vi: 'cấp trên trực tiếp của mình',
      en: 'your immediate supervisor',
    ),
    FabAnswerItem(vi: 'nộp cho', en: 'submit it to'),
    FabAnswerItem(vi: 'được xử lý', en: 'be processed'),
    FabAnswerItem(vi: 'Phòng nhân sự', en: 'Human Resources'),
    FabAnswerItem(vi: 'nhận được phản hồi', en: 'get a response'),
    FabAnswerItem(
      vi: 'nhiều trách nhiệm và nghĩa vụ hơn',
      en: 'more responsibility and duties',
    ),
    FabAnswerItem(vi: 'liệu anh chị có chấp nhận', en: 'whether you accept'),
    FabAnswerItem(vi: 'những điều khoản mới', en: 'new terms'),
    FabAnswerItem(vi: 'có thể rút lại', en: 'could withdraw'),
    FabAnswerItem(
      vi: 'một quy trình tốn thời gian',
      en: 'a time-consuming procedure',
    ),
    FabAnswerItem(vi: 'xử lý những vấn đề này', en: 'handle these matters'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme08_day1',
    dayNumber: 1,
    themeId: 'theme_08_personnel',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      LessonPhase(
        id: 'theme08_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_31',
        contentEn:
            '''Personnel (or Human Resources) is directly related to the Office theme as it involves the people who work in the office and a lot of the situations involve the hiring process such as advertising for and recruiting new employees, dealing with salaries and promotions, job applications, responding to job advertisements, pensions and other company benefits. There are also conversations about performance reviews, company policy (rules and regulations), employee vacations, medical issues, absences from work or issues with tardiness (being late for work or meetings). Students will become familiar with policies and procedures through documents and exchange of memos in the Reading section.

In addition to the above, in many companies the Personnel department is responsible for employee development and thus some listening scripts and reading passages will be about professional development, seminars, courses of study or courses to improve qualifications.

Common vocabulary: salary, remuneration, compensation, wage, pay, payroll, commensurate with experience, vacation pay, stock sharing, stock options, comprehensive medical insurance, regulation, resume, curriculum vitae, travel allowance, company vehicle, expense account, disciplinary action, absences, tardiness.''',
        contentVi:
            '''Chuyên đề Nhân sự (hoặc Nguồn nhân lực) liên quan trực tiếp đến chuyên đề Văn phòng vì nó liên quan những người làm trong văn phòng và nhiều tình huống có liên quan tới quá trình tuyển dụng như là quảng cáo và tuyển nhân viên mới, xử lý các vấn đề lương và thăng chức, hồ sơ xin việc, phản hồi các quảng cáo tuyển dụng, lương hưu và các phúc lợi khác trong doanh nghiệp. Cũng có các cuộc hội thoại về việc đánh giá hiệu quả công việc của nhân viên, chính sách của công ty (các quy tắc và quy định), nghỉ phép của nhân viên, các vấn đề về y tế, việc vắng mặt ở nơi làm việc, hoặc các vấn đề liên quan đến việc đi muộn (đi làm hoặc đi họp). Học viên sẽ dần quen với các chính sách và các thủ tục thông qua các văn bản và việc trao đổi thông tin nội bộ trong phần đọc.

Ngoài những điều trên, ở nhiều công ty, phòng Nhân sự còn phụ trách việc phát triển nhân viên, và do đó một vài bài nghe và bài đọc còn liên quan tới các nội dung như sự phát triển sự nghiệp, các hội thảo, các khóa học nghiên cứu, hoặc các khóa học nâng cao chuyên môn.

Từ vựng thường gặp của chuyên đề này gồm: lương, tiền công, bồi thường, lương tuần, lương, bảng lương, tương xứng với kinh nghiệm, tiền chi trả cho kỳ nghỉ, việc phân chia cổ phần, quyền chọn mua cổ phiếu, bảo hiểm y tế toàn diện, quy định, sơ yếu lý lịch, trợ cấp đi lại, xe công ty, công tác phí, xử lý kỷ luật, sự vắng mặt, sự chậm trễ.''',
        fabVocab: Theme8Content.readingVocab,
        fabPhrases: Theme8Content.readingPhrases,
      ),
      LessonPhase(
        id: 'theme08_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_31',
        contentEn: null,
        contentVi: null,
      ),
      LessonPhase(
        id: 'theme08_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme8Content.readingAnswers,
      ),
      LessonPhase(
        id: 'theme08_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('Personnel (or '),
    const MixedSegment.vietnamese('Nguồn nhân lực', 'Human Resources'),
    const MixedSegment.english(') is '),
    const MixedSegment.vietnamese('liên quan trực tiếp', 'directly related'),
    const MixedSegment.english(' to the Office theme as it '),
    const MixedSegment.vietnamese(
      'liên quan những người',
      'involves the people',
    ),
    const MixedSegment.english(' who work in the office and a lot of '),
    const MixedSegment.vietnamese('tình huống', 'the situations'),
    const MixedSegment.english(' involve '),
    const MixedSegment.vietnamese('quá trình tuyển dụng', 'the hiring process'),
    const MixedSegment.english(' such as '),
    const MixedSegment.vietnamese('quảng cáo cho', 'advertising for'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese(
      'tuyển dụng nhân viên mới',
      'recruiting new employees',
    ),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('xử lý lương', 'dealing with salaries'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('những sự thăng tiến', 'promotions'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('hồ sơ xin việc', 'job applications'),
    const MixedSegment.english(', responding to '),
    const MixedSegment.vietnamese('quảng cáo tuyển dụng', 'job advertisements'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('lương hưu', 'pensions'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese(
      'các phúc lợi khác của công ty',
      'other company benefits',
    ),
    const MixedSegment.english('. There are also conversations about '),
    const MixedSegment.vietnamese(
      'các bản đánh giá hiệu quả công việc',
      'performance reviews',
    ),
    const MixedSegment.english(
      ', company policy (rules and regulations), employee vacations, ',
    ),
    const MixedSegment.vietnamese('các vấn đề về y tế', 'medical issues'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('sự vắng mặt', 'absences'),
    const MixedSegment.english(' from work or issues with '),
    const MixedSegment.vietnamese('sự đi muộn', 'tardiness'),
    const MixedSegment.english(
      '(being late for work or meetings). Students will become ',
    ),
    const MixedSegment.vietnamese('quen thuộc với', 'familiar with'),
    const MixedSegment.english(
      ' policies and procedures through documents and ',
    ),
    const MixedSegment.vietnamese(
      'việc trao đổi các thông báo nội bộ',
      'exchange of memos',
    ),
    const MixedSegment.english(' in the Reading section.\n\n'),
    const MixedSegment.vietnamese(
      'Ngoài những điều trên',
      'In addition to the above',
    ),
    const MixedSegment.english(', in many companies the Personnel department '),
    const MixedSegment.vietnamese('chịu trách nhiệm về', 'is responsible for'),
    const MixedSegment.english(
      ' employee development and thus some listening scripts and reading passages will be about ',
    ),
    const MixedSegment.vietnamese(
      'sự phát triển nghề nghiệp',
      'professional development',
    ),
    const MixedSegment.english(', seminars, courses of study or courses to '),
    const MixedSegment.vietnamese(
      'nâng cao chuyên môn',
      'improve qualifications',
    ),
    const MixedSegment.english('.'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme08_day2',
    dayNumber: 2,
    themeId: 'theme_08_personnel',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      LessonPhase(
        id: 'theme08_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation - Retirement & Hiring',
        titleVi: 'Luyện tập 1: Hội thoại - Nghỉ hưu & Tuyển dụng',
        audioTrackKey: 'track_32',
        questions: _practice1Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 1 (D): W nói "retiring before the end of the year" = Trước khi năm kết thúc (cuối tháng 12).',
            en: 'Q1 (D): W says "retiring before the end of the year" = Before the end of the year (end of December).',
          ),
          const FabAnswerItem(
            vi: 'Câu 2 (B): W nói "I need to find a suitable replacement for my position" = Chưa tìm được người thay thế.',
            en: 'Q2 (B): W says "I need to find a suitable replacement for my position" = She hasn\'t found a person to replace her.',
          ),
          const FabAnswerItem(
            vi: 'Câu 3 (C): M đề nghị "place an ad on our website and hire somebody" = Giúp tìm kiếm ứng viên.',
            en: 'Q3 (C): M suggests "place an ad on our website and hire somebody" = Help the woman look for a candidate.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme08_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Job Hotline',
        titleVi: 'Luyện tập 2: Bài ngắn - Đường dây nóng tuyển dụng',
        audioTrackKey: 'track_33',
        questions: _practice2Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 4 (A): Bài nói cung cấp thông tin "job openings" và "job descriptions" = Người tìm việc.',
            en: 'Q4 (A): The talk provides information about "job openings" and "job descriptions" = A job seeker.',
          ),
          const FabAnswerItem(
            vi: 'Câu 5 (B): "looking to recruit candidates with a strong background in Asian languages" = Người nói ngoại ngữ.',
            en: 'Q5 (B): "looking to recruit candidates with a strong background in Asian languages" = Foreign language speakers.',
          ),
          const FabAnswerItem(
            vi: 'Câu 6 (A): Bài nói hướng dẫn "press one... press two" để nghe về cơ hội việc làm = Thông báo cơ hội nghề nghiệp.',
            en: 'Q6 (A): The talk instructs "press one... press two" to hear about job opportunities = To inform callers of job opportunities.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme08_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Raise & Bonus Evaluation',
        titleVi: 'Luyện tập 3: Bài ngắn - Đánh giá tăng lương & thưởng',
        audioTrackKey: 'track_34',
        questions: _practice3Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 7 (A): "Now that our staff has almost doubled" = Số lượng nhân viên tăng lên.',
            en: 'Q7 (A): "Now that our staff has almost doubled" = The number of employees has increased.',
          ),
          const FabAnswerItem(
            vi: 'Câu 8 (C): "You will need at least two recommendations from your colleagues and a letter... from your immediate supervisor" = Đồng nghiệp và cấp trên.',
            en: 'Q8 (C): "You will need at least two recommendations from your colleagues and a letter... from your immediate supervisor" = Co-workers and immediate supervisor.',
          ),
          const FabAnswerItem(
            vi: 'Câu 9 (B): "with any pay increase, you will be expected to handle more responsibility and duties" = Thêm nhiệm vụ.',
            en: 'Q9 (B): "with any pay increase, you will be expected to handle more responsibility and duties" = More duties.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme08_day2_translate1',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Conversation',
        titleVi: 'Nghe và Dịch: Hội thoại',
        audioTrackKey: 'track_32',
        contentEn: '''M: What have you decided about retirement?
W: I am leaning towards retiring before the end of the year. However, before I leave the company, I need to find a suitable replacement for my position.
M: I think I can help you with this. Why don't we place an ad on our website and hire somebody? Then we can train the person by the end of October.
W: That is a great idea. Let's do that. It's now August, so I guess we have lots of time to get the new recruit ready for the job.''',
        contentVi: '''M: Chị đã quyết định gì cho việc nghỉ hưu rồi?
W: Tôi đang nghiêng về khả năng nghỉ hưu vào cuối năm nay. Tuy nhiên, trước khi tôi rời khỏi công ty, tôi cần tìm một người thay thế phù hợp cho vị trí của tôi.
M: Tôi nghĩ là tôi có thể giúp chị việc này. Tại sao ta không đưa một quảng cáo lên trang web của chúng ta và tuyển ai đó? Sau đó chúng ta có thể huấn luyện người đó cho tới cuối tháng Mười.
W: Ý tưởng này hay đấy. Hãy thực hiện nó thôi. Bây giờ là tháng Tám, vì vậy tôi nghĩ rằng chúng ta còn rất nhiều thời gian để giúp người mới tuyển đó sẵn sàng cho công việc.''',
      ),
      LessonPhase(
        id: 'theme08_day2_translate2',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Job Hotline',
        titleVi: 'Nghe và Dịch: Đường dây nóng tuyển dụng',
        audioTrackKey: 'track_33',
        contentEn:
            '''Thank you for calling the Smartcom Personnel Job Hotline. Smartcom is currently looking to recruit candidates with a strong background in Asian languages including Chinese, Japanese, and Korean to teach new language training courses at the company. To hear about this special job opportunity, press one. To listen to job descriptions for all of our current job openings, press two. To request an application, press three. To check your application status, press four. Please have a pen and paper by the phone and be ready to write down any relevant information.''',
        contentVi:
            '''Cảm ơn bạn đã gọi tới đường dây nóng tuyển dụng của Phòng nhân sự công ty Smartcom. Vào thời điểm hiện tại, công ty Smartcom đang tìm kiếm các ứng viên có kiến thức vững vàng về các ngôn ngữ Châu Á gồm: tiếng Trung, tiếng Nhật và tiếng Hàn để giảng dạy các khóa đào tạo ngôn ngữ mới tại công ty. Để nghe thông tin về cơ hội việc làm đặc biệt này, hãy ấn phím một. Để nghe mô tả công việc cho tất cả các vị trí đang cần tuyển dụng vào thời điểm hiện tại, ấn phím hai. Để yêu cầu hồ sơ, ấn phím ba. Để kiểm tra trạng thái hồ sơ của bạn, ấn phím bốn. Xin vui lòng chuẩn bị bút và giấy cạnh điện thoại và sẵn sàng để ghi lại các thông tin có liên quan.''',
      ),
      LessonPhase(
        id: 'theme08_day2_translate3',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Raise & Bonus Evaluation',
        titleVi: 'Nghe và Dịch: Đánh giá tăng lương & thưởng',
        audioTrackKey: 'track_34',
        contentEn:
            '''Good afternoon, everybody. Thank you all for coming to this meeting on such short notice. We are here this afternoon to address the new raise and bonus evaluations. In the past, in order to ask for a pay raise, you simply had to ask the employer for a raise and it was the employer's decision whether the employee was worthy of it or not. Now that our staff has almost doubled, there's a far bigger employee - employer relationship gap. From now on, to attain any raise, or to be considered for any extra bonuses, you must fill in our wage increase evaluation form, in which you must give a formal explanation about why you believe you deserve a raise. You will need at least two recommendations from your colleagues and a letter of recommendation from your immediate supervisor, after which you must submit it to Administration. Your evaluation form will then be processed by Human Resources and you should get a response within 2 weeks. Of course, with any pay increase, you will be expected to handle more responsibility and duties. However, it's your choice whether you accept the new offer with the new terms or you could withdraw your evaluation form. I know it's a time-consuming procedure, but you must understand that Administration needs time to handle these matters openly and professionally.''',
        contentVi:
            '''Xin chào buổi chiều các quý vị. Cảm ơn mọi người đã đến dự cuộc họp này chỉ sau thời gian thông báo ngắn như thế. Chúng ta có mặt ở đây buổi chiều này để bàn về quy trình đánh giá tăng lương và thưởng mới. Trước đây, để yêu cầu tăng lương, anh chị đơn giản chỉ cần yêu cầu ông chủ tăng lương cho mình và ông chủ là người đưa ra quyết định xem anh chị có xứng đáng được tăng lương hay không. Vì hiện tại số lượng nhân viên của chúng ta đã tăng gần gấp đôi, nên khoảng cách giữa người lao động và người sử dụng lao động càng xa hơn. Từ bây giờ trở về sau, để được tăng lương, hoặc để được xét bất kỳ một khoản thưởng thêm nào, anh chị phải điền vào đơn đánh giá xét tăng lương, trong đó anh chị phải giải thích lý do mà anh chị tin rằng mình xứng đáng được tăng lương. Anh chị cần ít nhất là hai thư giới thiệu từ đồng nghiệp và một thư giới thiệu của cấp trên trực tiếp, sau đó anh chị nộp đơn này cho phòng hành chính. Bản đánh giá của anh chị sẽ được xử lý bởi phòng Nhân sự và anh chị sẽ nhận được hồi đáp trong vòng hai tuần. Đương nhiên là với bất kỳ sự tăng lương nào, anh chị được kỳ vọng sẽ gánh thêm nhiều trách nhiệm và nghĩa vụ hơn. Tuy nhiên, việc chấp nhận lời đề nghị mới cùng với các điều khoản mới hay rút lại bản đánh giá là tùy thuộc vào sự lựa chọn của anh chị. Tôi biết đây là một quy trình mất thời gian nhưng anh chị phải hiểu rằng bộ phận hành chính cần có thời gian để giải quyết các vấn đề này một cách công khai và chuyên nghiệp.''',
      ),
      LessonPhase(
        id: 'theme08_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Conversation',
        titleVi: 'Huấn luyện Trí nhớ: Hội thoại',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme8Content.conversationVocab,
        fabPhrases: Theme8Content.conversationPhrases,
        fabAnswers: Theme8Content.conversationAnswers,
      ),
      LessonPhase(
        id: 'theme08_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Job Hotline',
        titleVi: 'Huấn luyện Trí nhớ: Đường dây nóng tuyển dụng',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme8Content.shortTalk1Vocab,
        fabPhrases: Theme8Content.shortTalk1Phrases,
        fabAnswers: Theme8Content.shortTalk1Answers,
      ),
      LessonPhase(
        id: 'theme08_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Raise & Bonus Evaluation',
        titleVi: 'Huấn luyện Trí nhớ: Đánh giá tăng lương',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme8Content.shortTalk2Vocab,
        fabPhrases: Theme8Content.shortTalk2Phrases,
        fabAnswers: Theme8Content.shortTalk2Answers,
      ),
    ],
  );

  // ═══════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ═══════════════════════════════════════════════════════════════
  static List<QuizQuestion> get _practice1Questions => [
    const QuizQuestion(
      id: 'theme08_q01',
      questionText: 'When is the woman probably going to retire?',
      options: [
        '(A) By the end of the month',
        '(B) By the end of August',
        '(C) By the end of October',
        '(D) By the end of December',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_32',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme08_q02',
      questionText:
          'Why is it difficult for the woman to make a decision on her retirement?',
      options: [
        '(A) She is still too young to retire.',
        '(B) She hasn\'t found a person to replace her.',
        '(C) She loves her job too much to leave.',
        '(D) She wants to make more money.',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_32',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme08_q03',
      questionText: 'What does the man suggest?',
      options: [
        '(A) That the woman retire right away.',
        '(B) That the woman wait until next year.',
        '(C) That he help the woman look for a candidate.',
        '(D) That he will replace the woman\'s position.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_32',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    const QuizQuestion(
      id: 'theme08_q04',
      questionText: 'Who would call in to this hotline?',
      options: [
        '(A) A job seeker',
        '(B) An employer',
        '(C) A recruiter',
        '(D) A Personnel manager',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_33',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme08_q05',
      questionText: 'What kind of people is Smartcom currently looking for?',
      options: [
        '(A) Personnel experts',
        '(B) Foreign language speakers',
        '(C) Telephone operators',
        '(D) Professional recruiters',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_33',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme08_q06',
      questionText: 'What is the purpose of this recording?',
      options: [
        '(A) To inform callers of job opportunities at the company',
        '(B) To explain to callers about services the company is providing',
        '(C) To give background information about a new product',
        '(D) To inform callers about new language training courses',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_33',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
      id: 'theme08_q07',
      questionText:
          'Why does the firm need a new raise and bonus evaluation procedure?',
      options: [
        '(A) The number of employees has increased.',
        '(B) The number of employees has decreased.',
        '(C) The old way was too time-consuming.',
        '(D) The old way was too easy.',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_34',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme08_q08',
      questionText:
          'Who will an employee need recommendations from for the evaluation?',
      options: [
        '(A) One coworker and employer',
        '(B) Only colleagues',
        '(C) Co-workers and immediate supervisor',
        '(D) Employer and immediate supervisor',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_34',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme08_q09',
      questionText: 'What can an employee expect with a pay raise?',
      options: [
        '(A) More vacation days',
        '(B) More duties',
        '(C) Fewer responsibilities',
        '(D) Less annual bonus',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_34',
      practiceNumber: 'practice3',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // MIND GAME SEGMENTS
  // ═══════════════════════════════════════════════════════════════
  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('M: What have you '),
    const MixedSegment.vietnamese('đã quyết định', 'decided'),
    const MixedSegment.english(' about '),
    const MixedSegment.vietnamese('nghỉ hưu', 'retirement'),
    const MixedSegment.english('?\n\nW: I '),
    const MixedSegment.vietnamese('đang nghiêng về', 'am leaning towards'),
    const MixedSegment.english(' retiring before '),
    const MixedSegment.vietnamese('cuối năm', 'the end of the year'),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese('Tuy nhiên', 'However'),
    const MixedSegment.english(', before I '),
    const MixedSegment.vietnamese('rời công ty', 'leave the company'),
    const MixedSegment.english(', I '),
    const MixedSegment.vietnamese('cần tìm được', 'need to find'),
    const MixedSegment.english(' a suitable replacement for '),
    const MixedSegment.vietnamese('vị trí của tôi', 'my position'),
    const MixedSegment.english('.\n\nM: I think I '),
    const MixedSegment.vietnamese('có thể giúp', 'can help'),
    const MixedSegment.english(' you with this. Why don\'t we '),
    const MixedSegment.vietnamese('đưa một bài quảng cáo', 'place an ad'),
    const MixedSegment.english(' on our website and hire somebody? '),
    const MixedSegment.vietnamese('Sau đó', 'Then'),
    const MixedSegment.english(' we can '),
    const MixedSegment.vietnamese('huấn luyện người', 'train the person'),
    const MixedSegment.english(' by the end of October.\n\nW: '),
    const MixedSegment.vietnamese(
      'Đó là một ý tưởng tuyệt vời',
      'That is a great idea',
    ),
    const MixedSegment.english(
      '. Let\'s do that. It\'s now August, so I guess we ',
    ),
    const MixedSegment.vietnamese(
      'có rất nhiều thời gian',
      'have lots of time',
    ),
    const MixedSegment.english(' to get the new recruit ready for the job.'),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Thank you for calling the Smartcom Personnel '),
    const MixedSegment.vietnamese('đường dây nóng tuyển dụng', 'Job Hotline'),
    const MixedSegment.english('. Smartcom is currently '),
    const MixedSegment.vietnamese(
      'đang tìm cách tuyển dụng',
      'looking to recruit',
    ),
    const MixedSegment.english(' candidates with a strong '),
    const MixedSegment.vietnamese('nền tảng kiến thức', 'background'),
    const MixedSegment.english(' in Asian languages '),
    const MixedSegment.vietnamese('bao gồm', 'including'),
    const MixedSegment.english(' Chinese, Japanese, and Korean to teach '),
    const MixedSegment.vietnamese(
      'các khóa đào tạo ngôn ngữ mới',
      'new language training courses',
    ),
    const MixedSegment.english(' at the company. '),
    const MixedSegment.vietnamese('Để nghe', 'To hear'),
    const MixedSegment.english(' about this special '),
    const MixedSegment.vietnamese('cơ hội việc làm', 'job opportunity'),
    const MixedSegment.english(', press one. '),
    const MixedSegment.vietnamese('Để nghe', 'To listen to'),
    const MixedSegment.english(' job descriptions for all of our current '),
    const MixedSegment.vietnamese('vị trí đang cần tuyển', 'job openings'),
    const MixedSegment.english(', press two. '),
    const MixedSegment.vietnamese('Để yêu cầu', 'To request'),
    const MixedSegment.english(' an application, press three. To check your '),
    const MixedSegment.vietnamese('trạng thái hồ sơ', 'application status'),
    const MixedSegment.english(', press four. Please '),
    const MixedSegment.vietnamese(
      'chuẩn bị bút và giấy',
      'have a pen and paper',
    ),
    const MixedSegment.english(' by the phone and be '),
    const MixedSegment.vietnamese('sẵn sàng ghi', 'ready to write'),
    const MixedSegment.english(' down any '),
    const MixedSegment.vietnamese(
      'thông tin liên quan',
      'relevant information',
    ),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english(
      'Good afternoon, everybody. Thank you all for coming to this meeting ',
    ),
    const MixedSegment.vietnamese(
      'theo một thông báo gấp',
      'on such short notice',
    ),
    const MixedSegment.english('. We are here this afternoon to '),
    const MixedSegment.vietnamese('giải quyết', 'address'),
    const MixedSegment.english(' the new '),
    const MixedSegment.vietnamese('tăng lương và thưởng', 'raise and bonus'),
    const MixedSegment.english(' evaluations. In the past, in order to '),
    const MixedSegment.vietnamese('yêu cầu tăng lương', 'ask for a pay raise'),
    const MixedSegment.english(
      ', you simply had to ask the employer for a raise and it was ',
    ),
    const MixedSegment.vietnamese(
      'quyết định của ông chủ',
      'the employer\'s decision',
    ),
    const MixedSegment.english(' whether the employee was '),
    const MixedSegment.vietnamese(
      'liệu có xứng đáng hay không',
      'worthy of it or not',
    ),
    const MixedSegment.english('. Now that our staff '),
    const MixedSegment.vietnamese(
      'đã gần như tăng gấp đôi',
      'has almost doubled',
    ),
    const MixedSegment.english(', there\'s a far bigger '),
    const MixedSegment.vietnamese(
      'khoảng cách giữa người lao động và người sử dụng lao động',
      'employee - employer relationship gap',
    ),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese('Từ bây giờ trở đi', 'From now on'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese(
      'để đạt được bất kỳ khoản tăng lương nào',
      'to attain any raise',
    ),
    const MixedSegment.english(', or to be considered for any '),
    const MixedSegment.vietnamese('các khoản thưởng thêm', 'extra bonuses'),
    const MixedSegment.english(', you must '),
    const MixedSegment.vietnamese('điền vào', 'fill in'),
    const MixedSegment.english(' our wage increase '),
    const MixedSegment.vietnamese('bản đánh giá', 'evaluation form'),
    const MixedSegment.english(', in which you must '),
    const MixedSegment.vietnamese(
      'đưa ra một lời giải thích chính thức',
      'give a formal explanation',
    ),
    const MixedSegment.english(' about why you believe you '),
    const MixedSegment.vietnamese(
      'xứng đáng được tăng lương',
      'deserve a raise',
    ),
    const MixedSegment.english('. You will need '),
    const MixedSegment.vietnamese('ít nhất', 'at least'),
    const MixedSegment.english(' two recommendations from '),
    const MixedSegment.vietnamese(
      'các đồng nghiệp của mình',
      'your colleagues',
    ),
    const MixedSegment.english(' and a letter of recommendation from '),
    const MixedSegment.vietnamese(
      'cấp trên trực tiếp của mình',
      'your immediate supervisor',
    ),
    const MixedSegment.english(', after which you must '),
    const MixedSegment.vietnamese('nộp cho', 'submit it to'),
    const MixedSegment.english(
      ' Administration. Your evaluation form will then ',
    ),
    const MixedSegment.vietnamese('được xử lý', 'be processed'),
    const MixedSegment.english(' by '),
    const MixedSegment.vietnamese('Phòng nhân sự', 'Human Resources'),
    const MixedSegment.english(' and you should '),
    const MixedSegment.vietnamese('nhận được phản hồi', 'get a response'),
    const MixedSegment.english(
      ' within 2 weeks. Of course, with any pay increase, you will be expected to handle ',
    ),
    const MixedSegment.vietnamese(
      'nhiều trách nhiệm và nghĩa vụ hơn',
      'more responsibility and duties',
    ),
    const MixedSegment.english('. However, it\'s your choice '),
    const MixedSegment.vietnamese(
      'liệu anh chị có chấp nhận',
      'whether you accept',
    ),
    const MixedSegment.english(' the new offer with the '),
    const MixedSegment.vietnamese('những điều khoản mới', 'new terms'),
    const MixedSegment.english(' or you '),
    const MixedSegment.vietnamese('có thể rút lại', 'could withdraw'),
    const MixedSegment.english(' your evaluation form. I know it\'s '),
    const MixedSegment.vietnamese(
      'một quy trình tốn thời gian',
      'a time-consuming procedure',
    ),
    const MixedSegment.english(
      ', but you must understand that Administration needs time to ',
    ),
    const MixedSegment.vietnamese(
      'xử lý những vấn đề này',
      'handle these matters',
    ),
    const MixedSegment.english(' openly and professionally.'),
  ];
}

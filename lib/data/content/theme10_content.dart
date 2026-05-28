// lib/data/content/theme10_content.dart

import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme10Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_10_corporate_development',
    themeNumber: 10,
    titleEn: 'Corporate Development',
    titleVi: 'Phát Triển Sản Phẩm Trong Doanh Nghiệp',
    description:
        'Nghiên cứu sản phẩm, phản hồi khách hàng, chiến lược marketing, phát triển sản phẩm mới và hiện có.',
    iconEmoji: '📈',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY (38 từ)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v10_01',
      wordEn: 'Corporate Development',
      wordVi: 'Phát triển sản phẩm trong doanh nghiệp',
      pronunciation: '/ˈkɔːpərət dɪˈveləpmənt/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'He is in charge of corporate development at the electronics firm.',
      exampleVi:
          'Ông ấy phụ trách việc phát triển sản phẩm tại công ty điện tử.',
    ),
    VocabModel(
      id: 'v10_02',
      wordEn: 'language structure',
      wordVi: 'Cấu trúc ngôn ngữ',
      pronunciation: '/ˈlæŋɡwɪdʒ ˈstrʌktʃə/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'The passage uses complex language structures to describe the process.',
      exampleVi:
          'Đoạn văn sử dụng các cấu trúc ngôn ngữ phức tạp để miêu tả quá trình.',
    ),
    VocabModel(
      id: 'v10_03',
      wordEn: 'describe',
      wordVi: 'Mô tả',
      pronunciation: '/dɪˈskraɪb/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Can you describe the main features of the new model?',
      exampleVi: 'Bạn có thể mô tả các tính năng chính của mẫu mới không?',
    ),
    VocabModel(
      id: 'v10_04',
      wordEn: 'Research (into)',
      wordVi: 'Nghiên cứu; bài nghiên cứu về vấn đề gì',
      pronunciation: '/rɪˈsɜːtʃ/',
      partOfSpeech: 'v/n',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'The team is conducting intensive research into consumer habits.',
      exampleVi:
          'Nhóm đang thực hiện nghiên cứu chuyên sâu về thói quen của người tiêu dùng.',
    ),
    VocabModel(
      id: 'v10_05',
      wordEn: 'product',
      wordVi: 'Sản phẩm',
      pronunciation: '/ˈprɒdʌkt/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Our latest product has received positive reviews.',
      exampleVi:
          'Sản phẩm mới nhất của chúng tôi đã nhận được những đánh giá tích cực.',
    ),
    VocabModel(
      id: 'v10_06',
      wordEn: 'customer feedback',
      wordVi: 'Phản hồi của khách hàng',
      pronunciation: '/ˈkʌstəmə ˈfiːdbæk/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'We value customer feedback to improve our services.',
      exampleVi:
          'Chúng tôi coi trọng phản hồi của khách hàng để cải thiện dịch vụ của mình.',
    ),
    VocabModel(
      id: 'v10_07',
      wordEn: 'marketing strategy',
      wordVi: 'Chiến lược tiếp thị',
      pronunciation: '/ˈmɑːkɪtɪŋ ˈstrætədʒi/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The new marketing strategy aims to reach a younger audience.',
      exampleVi:
          'Chiến lược tiếp thị mới nhằm mục đích tiếp cận đối tượng khán giả trẻ hơn.',
    ),
    VocabModel(
      id: 'v10_08',
      wordEn: 'development',
      wordVi: 'Sự phát triển',
      pronunciation: '/dɪˈveləpmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The development of the new software took several months.',
      exampleVi: 'Việc phát triển phần mềm mới đã mất vài tháng.',
    ),
    VocabModel(
      id: 'v10_09',
      wordEn: 'existing',
      wordVi: 'Hiện tại, hiện có',
      pronunciation: '/ɪɡˈzɪstɪŋ/',
      partOfSpeech: 'adj',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'We need to upgrade our existing systems.',
      exampleVi: 'Chúng ta cần nâng cấp các hệ thống hiện có của mình.',
    ),
    VocabModel(
      id: 'v10_10',
      wordEn: 'note',
      wordVi: 'Lưu ý, chú ý',
      pronunciation: '/nəʊt/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Please note that the deadline has been changed.',
      exampleVi: 'Vui lòng lưu ý rằng thời hạn đã được thay đổi.',
    ),
    VocabModel(
      id: 'v10_11',
      wordEn: 'apply to',
      wordVi: 'Áp dụng đối với cái gì',
      pronunciation: '/əˈplaɪ tuː/',
      partOfSpeech: 'vp',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'These rules apply to all employees.',
      exampleVi: 'Những quy tắc này áp dụng đối với tất cả nhân viên.',
    ),
    VocabModel(
      id: 'v10_12',
      wordEn: 'supply',
      wordVi: 'Cung cấp',
      pronunciation: '/səˈplaɪ/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The company supplies office equipment to various firms.',
      exampleVi:
          'Công ty cung cấp thiết bị văn phòng cho nhiều hãng khác nhau.',
    ),
    VocabModel(
      id: 'v10_13',
      wordEn: 'service',
      wordVi: 'Dịch vụ',
      pronunciation: '/ˈsɜːvɪs/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'They offer excellent customer service.',
      exampleVi: 'Họ cung cấp dịch vụ chăm sóc khách hàng xuất sắc.',
    ),
    VocabModel(
      id: 'v10_14',
      wordEn: 'a manufactured product',
      wordVi: 'Một sản phẩm được sản xuất',
      pronunciation: '/ə ˌmænjuˈfæktʃəd ˈprɒdʌkt/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The quality of a manufactured product should be inspected.',
      exampleVi: 'Chất lượng của một sản phẩm được sản xuất nên được kiểm tra.',
    ),
    VocabModel(
      id: 'v10_15',
      wordEn: 'key',
      wordVi: 'Chính, quan trọng, chủ yếu',
      pronunciation: '/kiː/',
      partOfSpeech: 'adj',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Innovation is key to staying competitive.',
      exampleVi:
          'Sáng tạo là chìa khóa (quan trọng) để duy trì khả năng cạnh tranh.',
    ),
    VocabModel(
      id: 'v10_16',
      wordEn: 'lexicon',
      wordVi: 'Từ vựng',
      pronunciation: '/ˈleksɪkən/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The professional lexicon can be difficult for beginners.',
      exampleVi:
          'Từ vựng chuyên môn có thể gây khó khăn cho người mới bắt đầu.',
    ),
    VocabModel(
      id: 'v10_17',
      wordEn: 'advertising campaign',
      wordVi: 'Chiến dịch quảng cáo',
      pronunciation: '/ˈædvətaɪzɪŋ kæmˈpeɪn/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The advertising campaign was launched nationwide.',
      exampleVi: 'Chiến dịch quảng cáo đã được khởi động trên toàn quốc.',
    ),
    VocabModel(
      id: 'v10_18',
      wordEn: 'component',
      wordVi: 'Cấu kiện sản phẩm',
      pronunciation: '/kəmˈpəʊnənt/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'This component is essential for the machine to function.',
      exampleVi: 'Cấu kiện này là thiết yếu để máy móc hoạt động.',
    ),
    VocabModel(
      id: 'v10_19',
      wordEn: 'schedule',
      wordVi: 'Lịch trình',
      pronunciation: '/ˈʃedjuːl/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'We need to stick to the production schedule.',
      exampleVi: 'Chúng ta cần tuân thủ lịch trình sản xuất.',
    ),
    VocabModel(
      id: 'v10_20',
      wordEn: 'upgrade',
      wordVi: 'Sự nâng cấp, cải tiến',
      pronunciation: '/ˈʌpɡreɪd/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The system upgrade will take place this weekend.',
      exampleVi: 'Sự nâng cấp hệ thống sẽ diễn ra vào cuối tuần này.',
    ),
    VocabModel(
      id: 'v10_21',
      wordEn: 'warranty',
      wordVi: 'Việc bảo hành',
      pronunciation: '/ˈwɒrənti/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Does this product come with a warranty?',
      exampleVi: 'Sản phẩm này có đi kèm with việc bảo hành không?',
    ),
    VocabModel(
      id: 'v10_22',
      wordEn: 'questionnaire',
      wordVi: 'Bản câu hỏi khảo sát',
      pronunciation: '/ˌkwestʃəˈneə/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Please fill out this customer satisfaction questionnaire.',
      exampleVi:
          'Vui lòng điền vào bản câu hỏi khảo sát mức độ hài lòng của khách hàng này.',
    ),
    VocabModel(
      id: 'v10_23',
      wordEn: 'competitor',
      wordVi: 'Đối thủ cạnh tranh',
      pronunciation: '/kəmˈpetɪtə/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'We are monitoring the activities of our main competitor.',
      exampleVi:
          'Chúng tôi đang theo dõi hoạt động của đối thủ cạnh tranh chính.',
    ),
    VocabModel(
      id: 'v10_24',
      wordEn: 'initiate',
      wordVi: 'Khởi xướng',
      pronunciation: '/ɪˈnɪʃieɪt/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'The manager decided to initiate a new quality control process.',
      exampleVi:
          'Người quản lý quyết định khởi xướng một quy trình kiểm soát chất lượng mới.',
    ),
    VocabModel(
      id: 'v10_25',
      wordEn: 'design',
      wordVi: 'Thiết kế',
      pronunciation: '/dɪˈzaɪn/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'They are designing a new logo for the brand.',
      exampleVi: 'Họ đang thiết kế một biểu trưng mới cho thương hiệu.',
    ),
    VocabModel(
      id: 'v10_26',
      wordEn: 'survey',
      wordVi: 'Điều tra, khảo sát',
      pronunciation: '/ˈsɜːveɪ/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'The company is surveying its employees about workplace satisfaction.',
      exampleVi:
          'Công ty đang khảo sát nhân viên về mức độ hài lòng tại nơi làm việc.',
    ),
    VocabModel(
      id: 'v10_27',
      wordEn: 'modify',
      wordVi: 'Sửa đổi',
      pronunciation: '/ˈmɒdɪfaɪ/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'We may need to modify the design to reduce costs.',
      exampleVi: 'Chúng ta có thể cần sửa đổi thiết kế để giảm chi phí.',
    ),
    VocabModel(
      id: 'v10_28',
      wordEn: 'poll',
      wordVi: 'Thăm dò ý kiến',
      pronunciation: '/pəʊl/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'They polled over 1,000 residents on the new policy.',
      exampleVi: 'Họ đã thăm dò ý kiến hơn 1,000 cư dân về chính sách mới.',
    ),
    VocabModel(
      id: 'v10_29',
      wordEn: 'respond',
      wordVi: 'Phản hồi',
      pronunciation: '/rɪˈspɒnd/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The company responded quickly to the complaints.',
      exampleVi: 'Công ty đã phản hồi nhanh chóng trước những lời phàn nàn.',
    ),
    VocabModel(
      id: 'v10_30',
      wordEn: 'concept',
      wordVi: 'Khái niệm',
      pronunciation: '/ˈkɒnsept/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The basic concept of the project is simple.',
      exampleVi: 'Khái niệm cơ bản của dự án này rất đơn giản.',
    ),
    VocabModel(
      id: 'v10_31',
      wordEn: 'speaker',
      wordVi: 'Diễn giả, người phát biểu',
      pronunciation: '/ˈspiːkə/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The keynote speaker discussed the future of AI.',
      exampleVi:
          'Diễn giả chính đã thảo luận về tương lai của trí tuệ nhân tạo.',
    ),
    VocabModel(
      id: 'v10_32',
      wordEn: 'involved',
      wordVi: 'Có liên quan, có tham gia',
      pronunciation: '/ɪnˈvɒlvd/',
      partOfSpeech: 'adj',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'How many people are involved in this project?',
      exampleVi: 'Có bao nhiêu người tham gia vào dự án này?',
    ),
    VocabModel(
      id: 'v10_33',
      wordEn: 'single',
      wordVi: 'Một, đơn lẻ',
      pronunciation: '/ˈsɪŋɡəl/',
      partOfSpeech: 'adj',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'A single mistake can be very costly.',
      exampleVi: 'Một sai lầm đơn lẻ cũng có thể rất tốn kém.',
    ),
    VocabModel(
      id: 'v10_34',
      wordEn: 'double',
      wordVi: 'Đôi, kép',
      pronunciation: '/ˈdʌbəl/',
      partOfSpeech: 'adj',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The reading section contains some double passages.',
      exampleVi: 'Phần đọc bao gồm một số bài đọc kép.',
    ),
    VocabModel(
      id: 'v10_35',
      wordEn: 'passage',
      wordVi: 'Đoạn văn',
      pronunciation: '/ˈpæsɪdʒ/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Read the passage and choose the best answer.',
      exampleVi: 'Đọc đoạn văn và chọn câu trả lời tốt nhất.',
    ),
    VocabModel(
      id: 'v10_36',
      wordEn: 'major',
      wordVi: 'Chính, chủ yếu',
      pronunciation: '/ˈmeɪdʒə/',
      partOfSpeech: 'adj',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'There are no major changes in the new version.',
      exampleVi: 'Không có thay đổi chính nào trong phiên bản mới.',
    ),
    VocabModel(
      id: 'v10_37',
      wordEn: 'requirement',
      wordVi: 'Yêu cầu',
      pronunciation: '/rɪˈkwaɪəmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Please list all the technical requirements.',
      exampleVi: 'Vui lòng liệt kê tất cả các yêu cầu kỹ thuật.',
    ),
    VocabModel(
      id: 'v10_38',
      wordEn: 'procedure',
      wordVi: 'Quy trình',
      pronunciation: '/prəˈsiːdʒə/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'You must follow the standard safety procedure.',
      exampleVi: 'Bạn phải tuân thủ quy trình an toàn tiêu chuẩn.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 1 Reading
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => vocabulary
      .map(
        (v) => FabVocabItem(
          wordEn: v.wordEn,
          wordVi: v.wordVi,
          pronunciation: v.pronunciation,
          partOfSpeech: v.partOfSpeech,
        ),
      )
      .toList();

  static List<FabPhraseItem> get readingPhrases => [
    const FabPhraseItem(
      phrase: 'Apply to companies',
      meaning: 'Áp dụng đối với công ty',
    ),
    const FabPhraseItem(
      phrase: 'Research and development',
      meaning: 'Nghiên cứu và phát triển',
    ),
    const FabPhraseItem(
      phrase: 'It will be easier (to do sth)',
      meaning: 'Sẽ dễ dàng hơn để làm gì',
    ),
    const FabPhraseItem(phrase: 'Either...or', meaning: 'Hoặc...hoặc'),
    const FabPhraseItem(
      phrase: 'Goes about developing',
      meaning: 'Thực hiện việc phát triển',
    ),
    const FabPhraseItem(
      phrase: 'Double passages',
      meaning: 'Bài đọc hai đoạn văn',
    ),
    const FabPhraseItem(
      phrase: 'Apply to sth',
      meaning: 'Áp dụng đối với cái gì',
    ),
  ];

  static List<FabAnswerItem> get readingAnswers => const [
    FabAnswerItem(vi: 'các cấu trúc ngôn ngữ', en: 'language structures'),
    FabAnswerItem(vi: 'việc nghiên cứu', en: 'research'),
    FabAnswerItem(vi: 'phản hồi của khách hàng', en: 'customer feedback'),
    FabAnswerItem(
      vi: 'các sản phẩm hiện có hay sản phẩm mới',
      en: 'existing or new products',
    ),
    FabAnswerItem(vi: 'cũng áp dụng với', en: 'also applies to'),
    FabAnswerItem(
      vi: 'một sản phẩm được sản xuất',
      en: 'a manufactured product',
    ),
    FabAnswerItem(
      vi: 'nghiên cứu và phát triển',
      en: 'research and development',
    ),
    FabAnswerItem(vi: 'chiến dịch quảng cáo', en: 'advertising campaign'),
    FabAnswerItem(vi: 'việc nâng cấp', en: 'upgrade'),
    FabAnswerItem(vi: 'đối thủ cạnh tranh', en: 'competitor'),
    FabAnswerItem(vi: 'thiết kế', en: 'design'),
    FabAnswerItem(vi: 'sửa đổi', en: 'modify'),
    FabAnswerItem(vi: 'giới thiệu', en: 'introduce'),
    FabAnswerItem(vi: 'khái niệm', en: 'concept'),
    FabAnswerItem(
      vi: 'việc phát triển hoặc cải tiến',
      en: 'developing or improving',
    ),
    FabAnswerItem(
      vi: 'tại sao điều này lại quan trọng',
      en: 'why this is important',
    ),
    FabAnswerItem(vi: 'trong các buổi họp', en: 'in meetings'),
    FabAnswerItem(vi: 'hai người nói', en: 'two speakers'),
    FabAnswerItem(vi: 'sẽ dễ dàng hơn', en: 'will be easier'),
    FabAnswerItem(vi: 'những bài đọc kép', en: 'double passages'),
    FabAnswerItem(vi: 'thường là', en: 'commonly'),
    FabAnswerItem(vi: 'một chuyên đề chính', en: 'a major theme'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Conversation
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get conversationVocab => vocabulary
      .map(
        (v) => FabVocabItem(
          wordEn: v.wordEn,
          wordVi: v.wordVi,
          pronunciation: v.pronunciation,
          partOfSpeech: v.partOfSpeech,
        ),
      )
      .toList();

  static List<FabPhraseItem> get conversationPhrases => [
    const FabPhraseItem(
      phrase: 'Outperform competitors',
      meaning: 'Vượt mặt đối thủ cạnh tranh',
    ),
    const FabPhraseItem(
      phrase: 'Focus on prices',
      meaning: 'Tập trung vào giá cả',
    ),
    const FabPhraseItem(
      phrase: 'Promote our strong point',
      meaning: 'Quảng bá điểm mạnh của chúng ta',
    ),
    const FabPhraseItem(
      phrase: 'Start developing advertisements',
      meaning: 'Bắt đầu phát triển quảng cáo',
    ),
    const FabPhraseItem(
      phrase: 'Focus more on',
      meaning: 'Tập trung nhiều hơn vào',
    ),
  ];

  static List<FabAnswerItem> get conversationAnswers => const [
    FabAnswerItem(vi: 'các sản phẩm của chúng ta', en: 'our products'),
    FabAnswerItem(vi: 'một chất lượng cao hơn', en: 'a higher quality'),
    FabAnswerItem(vi: 'trên thị trường', en: 'in the market'),
    FabAnswerItem(
      vi: 'những đối thủ cạnh tranh lớn nhất của chúng ta',
      en: 'our biggest competitors',
    ),
    FabAnswerItem(vi: 'vượt mặt chúng ta', en: 'outperform us'),
    FabAnswerItem(vi: 'Chắc phải có điều gì đó', en: 'There must be something'),
    FabAnswerItem(vi: 'đã và đang làm sai', en: 'have been doing wrong'),
    FabAnswerItem(
      vi: 'các chiến dịch tiếp thị của chúng ta',
      en: 'our marketing campaigns',
    ),
    FabAnswerItem(vi: 'giá cả', en: 'prices'),
    FabAnswerItem(
      vi: 'sẽ luôn cao hơn so với',
      en: 'are always going to be higher than',
    ),
    FabAnswerItem(vi: 'lý do tại sao', en: 'the reason why'),
    FabAnswerItem(
      vi: 'chọn các sản phẩm của chúng ta',
      en: 'choose our products',
    ),
    FabAnswerItem(
      vi: 'nên tập trung nhiều hơn vào',
      en: 'should focus more on',
    ),
    FabAnswerItem(
      vi: 'những sản phẩm chất lượng tốt hơn nhiều',
      en: 'much better quality products',
    ),
    FabAnswerItem(vi: 'phải quảng bá', en: 'have to promote'),
    FabAnswerItem(vi: 'bắt đầu phát triển', en: 'start developing'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 1 (Planet Pizza)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk1Vocab => vocabulary
      .map(
        (v) => FabVocabItem(
          wordEn: v.wordEn,
          wordVi: v.wordVi,
          pronunciation: v.pronunciation,
          partOfSpeech: v.partOfSpeech,
        ),
      )
      .toList();

  static List<FabPhraseItem> get shortTalk1Phrases => [
    const FabPhraseItem(
      phrase: 'Set a goal to do sth',
      meaning: 'Đặt ra mục tiêu làm gì',
    ),
    const FabPhraseItem(
      phrase: 'By the end of the decade',
      meaning: 'Tính đến cuối thập kỷ này',
    ),
    const FabPhraseItem(
      phrase: 'Be interested in',
      meaning: 'Quan tâm đến, có hứng thú với',
    ),
    const FabPhraseItem(phrase: 'Get into detail', meaning: 'Đi vào chi tiết'),
    const FabPhraseItem(
      phrase: 'Expand nationwide',
      meaning: 'Mở rộng ra toàn quốc',
    ),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => const [
    FabAnswerItem(vi: 'giám đốc tiếp thị', en: 'director of marketing'),
    FabAnswerItem(
      vi: 'những chuỗi pizza thành công nhất',
      en: 'most successful pizza chains',
    ),
    FabAnswerItem(vi: 'đã mở được', en: 'have opened'),
    FabAnswerItem(vi: 'ở khu vực phía Bắc', en: 'in the Northern region'),
    FabAnswerItem(vi: 'mở rộng ra toàn quốc', en: 'expand nationwide'),
    FabAnswerItem(vi: 'đặt một mục tiêu', en: 'set a goal'),
    FabAnswerItem(
      vi: 'ở mọi trung tâm thương mại',
      en: 'in every shopping mall',
    ),
    FabAnswerItem(
      vi: 'tính đến cuối thập kỷ này',
      en: 'by the end of the decade',
    ),
    FabAnswerItem(vi: 'trên khắp đất nước', en: 'all over the country'),
    FabAnswerItem(vi: 'có hứng thú với', en: 'are interested in'),
    FabAnswerItem(
      vi: 'một người sở hữu cửa hàng nhượng quyền',
      en: 'a franchise owner',
    ),
    FabAnswerItem(
      vi: 'công việc kinh doanh phát triển nhanh chóng',
      en: 'rapidly-expanding business',
    ),
    FabAnswerItem(vi: 'kiếm tiền', en: 'make money'),
    FabAnswerItem(vi: 'đi vào chi tiết', en: 'get into detail'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 2 (Sales Strategy)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk2Vocab => vocabulary
      .map(
        (v) => FabVocabItem(
          wordEn: v.wordEn,
          wordVi: v.wordVi,
          pronunciation: v.pronunciation,
          partOfSpeech: v.partOfSpeech,
        ),
      )
      .toList();

  static List<FabPhraseItem> get shortTalk2Phrases => [
    const FabPhraseItem(
      phrase: 'Keep in mind (that)',
      meaning: 'Ghi nhớ, hãy lưu tâm (rằng)',
    ),
    const FabPhraseItem(
      phrase: 'Attract new customers',
      meaning: 'Thu hút khách hàng mới',
    ),
    const FabPhraseItem(
      phrase: 'Offer something worthwhile',
      meaning: 'Mang lại điều gì đó đáng giá',
    ),
    const FabPhraseItem(
      phrase: 'Make their own comparison',
      meaning: 'Tự đưa ra so sánh của riêng họ',
    ),
    const FabPhraseItem(
      phrase: 'Best representation possible',
      meaning: 'Bài giới thiệu tốt nhất có thể',
    ),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => const [
    FabAnswerItem(vi: 'ghi nhớ', en: 'keep in mind'),
    FabAnswerItem(
      vi: 'để thu hút khách hàng mới',
      en: 'to attract new customers',
    ),
    FabAnswerItem(
      vi: 'mang lại điều gì đó đáng giá',
      en: 'offer something worthwhile',
    ),
    FabAnswerItem(vi: 'cần phải truyền cảm hứng', en: 'need to inspire'),
    FabAnswerItem(
      vi: 'thử những sản phẩm hay dịch vụ của chúng ta',
      en: 'try our products or services',
    ),
    FabAnswerItem(
      vi: 'tự đưa ra so sánh của riêng họ',
      en: 'make their own comparison',
    ),
    FabAnswerItem(vi: 'sẽ thuyết phục', en: 'will persuade'),
    FabAnswerItem(
      vi: 'những đối thủ cạnh tranh của chúng ta',
      en: 'our competitors',
    ),
    FabAnswerItem(
      vi: 'khiến chúng ta trở nên khác biệt',
      en: 'makes us unique',
    ),
    FabAnswerItem(
      vi: 'trong suốt buổi hội thảo của chúng ta',
      en: 'during our workshop',
    ),
    FabAnswerItem(vi: 'không dừng lại ở đó', en: 'doesn\'t stop there'),
    FabAnswerItem(vi: 'nghĩ về', en: 'think about'),
    FabAnswerItem(
      vi: 'quảng bá các sản phẩm của chúng ta tốt nhất',
      en: 'best promote our products',
    ),
    FabAnswerItem(vi: 'các khách hàng ở cửa hàng', en: 'store clients'),
    FabAnswerItem(
      vi: 'bài giới thiệu tốt nhất có thể',
      en: 'the best representation possible',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme10_day1',
    dayNumber: 1,
    themeId: 'theme_10_corporate_development',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      LessonPhase(
        id: 'theme10_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_39',
        contentEn:
            '''This theme includes language structures used to describe research into products, customer feedback, marketing strategy and the development of existing or new products. Note that Corporate Development also applies to companies that supply a 'service' instead of a manufactured product.

Key lexicon for this theme will include words related to research and development such as: (nouns) advertising campaign, component, procedure, requirement, schedule, upgrade, warranty, customer feedback questionnaire, competitor; (verbs) initiate, design, survey, modify, poll, introduce, respond.

The student will also need to understand the concept of how a company goes about developing or improving a service or product and why this is important. In the listening, conversations will often be in meetings but usually only two speakers are involved so it will be easier to follow what is being said. In the reading, there will be either single or double passages and these are commonly emails or memos.

Corporate Development is not a major theme of the TOEIC test but each test will certainly include three or four references to it.''',
        contentVi:
            '''Chuyên đề này bao gồm các cấu trúc ngôn ngữ được sử dụng để miêu tả các nghiên cứu về sản phẩm, phản hồi của khách hàng, chiến lược marketing và sự phát triển các sản phẩm hiện có hoặc sản phẩm mới. Cần chú ý rằng phát triển sản phẩm trong doanh nghiệp cũng áp dụng cho các công ty cung cấp 'dịch vụ' thay vì những sản phẩm sản xuất.

Từ vựng chủ yếu cho chuyên đề này gồm các từ liên quan tới nghiên cứu và phát triển như là: (danh từ) chiến dịch quảng cáo, cấu kiện sản phẩm, quy trình, yêu cầu, lịch trình, nâng cấp, bảo hành, bản câu hỏi khảo sát phản hồi khách hàng, đối thủ cạnh tranh; (động từ) khởi xướng, thiết kế, khảo sát, sửa đổi, thăm dò ý kiến, giới thiệu, phản hồi.

Học viên cũng cần hiểu khái niệm về cách mà một công ty thực hiện việc phát triển hay cải tiến một sản phẩm hoặc dịch vụ và vì sao điều này lại quan trọng. Trong phần nghe, các đoạn hội thoại thường là trong bối cảnh của các cuộc họp nhưng chỉ hai người nói tham gia vào và vì vậy cũng sẽ dễ dàng hơn khi theo dõi những gì đang được trao đổi. Trong phần đọc, sẽ có cả loại bài đọc một đoạn văn và bài đọc hai đoạn văn và thường là các bức thư điện tử và các thông báo nội bộ.

Phát triển sản phẩm trong doanh nghiệp không phải là một chuyên đề chính của bài thi TOEIC, nhưng mỗi bài thi chắc chắn sẽ có khoảng ba đến bốn câu liên quan đến chuyên đề này.''',
        fabVocab: Theme10Content.readingVocab,
        fabPhrases: Theme10Content.readingPhrases,
      ),
      LessonPhase(
        id: 'theme10_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_39',
        contentEn:
            '''This theme includes language structures used to describe research into products, customer feedback, marketing strategy and the development of existing or new products. Note that Corporate Development also applies to companies that supply a 'service' instead of a manufactured product.

        Key lexicon for this theme will include words related to research and development such as: (nouns) advertising campaign, component, procedure, requirement, schedule, upgrade, warranty, customer feedback questionnaire, competitor; (verbs) initiate, design, survey, modify, poll, introduce, respond.

        The student will also need to understand the concept of how a company goes about developing or improving a service or product and why this is important. In the listening, conversations will often be in meetings but usually only two speakers are involved so it will be easier to follow what is being said. In the reading, there will be either single or double passages and these are commonly emails or memos.

        Corporate Development is not a major theme of the TOEIC test but each test will certainly include three or four references to it.''',
        contentVi:
            '''Chuyên đề này bao gồm các cấu trúc ngôn ngữ được sử dụng để miêu tả các nghiên cứu về sản phẩm, phản hồi của khách hàng, chiến lược marketing và sự phát triển các sản phẩm hiện có hoặc sản phẩm mới. Cần chú ý rằng phát triển sản phẩm trong doanh nghiệp cũng áp dụng cho các công ty cung cấp 'dịch vụ' thay vì những sản phẩm sản xuất.

        Từ vựng chủ yếu cho chuyên đề này gồm các từ liên quan tới nghiên cứu và phát triển như là: (danh từ) chiến dịch quảng cáo, cấu kiện sản phẩm, quy trình, yêu cầu, lịch trình, nâng cấp, bảo hành, bản câu hỏi khảo sát phản hồi khách hàng, đối thủ cạnh tranh; (động từ) khởi xướng, thiết kế, khảo sát, sửa đổi, thăm dò ý kiến, giới thiệu, phản hồi.

        Học viên cũng cần hiểu khái niệm về cách mà một công ty thực hiện việc phát triển hay cải tiến một sản phẩm hoặc dịch vụ và vì sao điều này lại quan trọng. Trong phần nghe, các đoạn hội thoại thường là trong bối cảnh của các cuộc họp nhưng chỉ hai người nói tham gia vào và vì vậy cũng sẽ dễ dàng hơn khi theo dõi những gì đang được trao đổi. Trong phần đọc, sẽ có cả loại bài đọc một đoạn văn và bài đọc hai đoạn văn và thường là các bức thư điện tử và các thông báo nội bộ.

        Phát triển sản phẩm trong doanh nghiệp không phải là một chuyên đề chính của bài thi TOEIC, nhưng mỗi bài thi chắc chắn sẽ có khoảng ba đến bốn câu liên quan đến chuyên đề này.''',
      ),
      LessonPhase(
        id: 'theme10_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme10Content.readingAnswers,
      ),
      LessonPhase(
        id: 'theme10_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('This theme includes '),
    const MixedSegment.vietnamese(
      'các cấu trúc ngôn ngữ',
      'language structures',
    ),
    const MixedSegment.english(' used to describe '),
    const MixedSegment.vietnamese('việc nghiên cứu', 'research'),
    const MixedSegment.english(' into products, '),
    const MixedSegment.vietnamese(
      'phản hồi của khách hàng',
      'customer feedback',
    ),
    const MixedSegment.english(', marketing strategy and the development of '),
    const MixedSegment.vietnamese(
      'các sản phẩm hiện có hay sản phẩm mới',
      'existing or new products',
    ),
    const MixedSegment.english('. Note that Corporate Development '),
    const MixedSegment.vietnamese('cũng áp dụng với', 'also applies to'),
    const MixedSegment.english(
      ' companies that supply a \'service\' instead of ',
    ),
    const MixedSegment.vietnamese(
      'một sản phẩm được sản xuất',
      'a manufactured product',
    ),
    const MixedSegment.english(
      '. Key lexicon for this theme will include words related to ',
    ),
    const MixedSegment.vietnamese(
      'nghiên cứu và phát triển',
      'research and development',
    ),
    const MixedSegment.english(' such as: (nouns) '),
    const MixedSegment.vietnamese(
      'chiến dịch quảng cáo',
      'advertising campaign',
    ),
    const MixedSegment.english(
      ', component, procedure, requirement, schedule, ',
    ),
    const MixedSegment.vietnamese('việc nâng cấp', 'upgrade'),
    const MixedSegment.english(', warranty, customer feedback questionnaire, '),
    const MixedSegment.vietnamese('đối thủ cạnh tranh', 'competitor'),
    const MixedSegment.english('; (verbs) initiate, '),
    const MixedSegment.vietnamese('thiết kế', 'design'),
    const MixedSegment.english(', survey, '),
    const MixedSegment.vietnamese('sửa đổi', 'modify'),
    const MixedSegment.english(', poll, '),
    const MixedSegment.vietnamese('giới thiệu', 'introduce'),
    const MixedSegment.english(
      ', respond. The student will also need to understand the ',
    ),
    const MixedSegment.vietnamese('khái niệm', 'concept'),
    const MixedSegment.english(' of how a company goes about '),
    const MixedSegment.vietnamese(
      'việc phát triển hoặc cải tiến',
      'developing or improving',
    ),
    const MixedSegment.english(' a service or product and '),
    const MixedSegment.vietnamese(
      'tại sao điều này lại quan trọng',
      'why this is important',
    ),
    const MixedSegment.english(
      '. In the listening, conversations will often be ',
    ),
    const MixedSegment.vietnamese('trong các buổi họp', 'in meetings'),
    const MixedSegment.english(' but usually only '),
    const MixedSegment.vietnamese('hai người nói', 'two speakers'),
    const MixedSegment.english(' are involved so it '),
    const MixedSegment.vietnamese('sẽ dễ dàng hơn', 'will be easier'),
    const MixedSegment.english(
      ' to follow what is being said. In the reading, there will be either single or ',
    ),
    const MixedSegment.vietnamese('những bài đọc kép', 'double passages'),
    const MixedSegment.english(' and these are '),
    const MixedSegment.vietnamese('thường là', 'commonly'),
    const MixedSegment.english(
      ' emails or memos. Corporate Development is not ',
    ),
    const MixedSegment.vietnamese('một chuyên đề chính', 'a major theme'),
    const MixedSegment.english(
      ' of the TOEIC test but each test will certainly include three or four references to it.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme10_day2',
    dayNumber: 2,
    themeId: 'theme_10_corporate_development',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      // ── Phase 1: Listening Quiz (Practice 1 - Conversation) ──
      LessonPhase(
        id: 'theme10_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation - Marketing Strategy',
        titleVi: 'Luyện tập 1: Hội thoại - Chiến lược tiếp thị',
        audioTrackKey: 'track_40',
        contentEn:
            '''M: We all see that our products are of a higher quality than others in the market. However, our biggest competitors still outperform us every year. There must be something that we have been doing wrong.
W: For the last few years, our marketing campaigns have been focusing on prices, but our prices are always going to be higher than our competitors. That is definitely not the reason why customers choose our products.
M: In my opinion, we should focus more on the fact that we offer much better quality products than our competitors. We have to promote our strong point, which is quality.
W: Then we should have the marketing team start developing advertisements emphasizing the quality of our products.''',
        contentVi:
            '''M: Chúng ta đều thấy rằng các sản phẩm của chúng ta có chất lượng cao hơn các sản phẩm khác trên thị trường. Tuy nhiên, những đối thủ cạnh tranh lớn nhất của chúng ta vẫn vượt mặt chúng ta mỗi năm. Chắc phải có điều gì đó mà chúng ta chưa làm đúng.
W: Trong vài năm vừa qua, các chiến dịch tiếp thị của chúng ta vẫn đang tập trung vào giá cả, nhưng giá của chúng ta sẽ luôn cao hơn so với các đối thủ cạnh tranh. Điều đó rõ ràng không phải là lý do để khách hàng lựa chọn sản phẩm của chúng ta.
M: Theo ý kiến của tôi, chúng ta nên tập trung nhiều hơn vào thực tế rằng chúng ta đang cung cấp những sản phẩm chất lượng cao hơn nhiều so với đối thủ cạnh tranh. Chúng ta phải quảng bá điểm mạnh của chúng ta, đó là chất lượng.
W: Vậy thì chúng ta nên yêu cầu nhóm tiếp thị bắt đầu phát triển những bài quảng cáo nhấn mạnh vào chất lượng của sản phẩm của chúng ta.''',
        questions: _practice1Questions,
        fabVocab: Theme10Content.conversationVocab,
        fabPhrases: Theme10Content.conversationPhrases,
        fabAnswers: const [
          FabAnswerItem(
            vi: 'Câu 1 (C): Họ đang nói về việc theo kịp cạnh tranh - M nói đối thủ vẫn "outperform us every year".',
            en: 'Q1 (C): They discuss keeping up with competitors - M says rivals "outperform us every year".',
          ),
          FabAnswerItem(
            vi: 'Câu 2 (C): W nói "our marketing campaigns have been focusing on prices" = Dựa trên giá cả.',
            en: 'Q2 (C): W says "our marketing campaigns have been focusing on prices" = Based on price.',
          ),
          FabAnswerItem(
            vi: 'Câu 3 (D): M đề nghị "focus more on quality" và W đồng ý phát triển quảng cáo nhấn mạnh chất lượng.',
            en: 'Q3 (D): M suggests "focus more on quality" and W agrees to develop ads emphasizing quality.',
          ),
        ],
      ),

      // ── Phase 2: Mind Game (Practice 1) ──
      LessonPhase(
        id: 'theme10_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Marketing Strategy',
        titleVi: 'Huấn luyện Trí nhớ: Chiến lược tiếp thị',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme10Content.conversationVocab,
        fabPhrases: Theme10Content.conversationPhrases,
        fabAnswers: Theme10Content.conversationAnswers,
      ),

      // ── Phase 3: Listening Quiz (Practice 2 - Short Talk 1) ──
      LessonPhase(
        id: 'theme10_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Planet Pizza Franchise',
        titleVi: 'Luyện tập 2: Bài ngắn - Nhượng quyền Planet Pizza',
        audioTrackKey: 'track_41',
        contentEn:
            '''Good morning, everybody. I'm Elizabeth Harris, director of marketing for Planet Pizza, one of the nation's most successful pizza chains in recent years. In the last 3 years we have opened more than 200 new pizza restaurants in the Northern region of the country. Now we are planning to expand nationwide. We have set a goal to move South and have a Planet Pizza restaurant in every shopping mall in the Southern cities of the country by the end of the decade. This should give pizza lovers all over the country the chance to taste our delicious pizzas. You're here today because you are interested in becoming a franchise owner of our rapidly-expanding business. We are all here today because we want to make money. Now, let's get into detail.''',
        contentVi:
            '''Xin chào tất cả mọi người. Tôi là Elizabeth Harris, giám đốc tiếp thị của Planet Pizza, một trong những chuỗi cửa hàng pizza thành công nhất cả nước trong những năm gần đây. Trong 3 năm qua chúng tôi đã mở hơn 200 nhà hàng pizza mới ở khu vực phía Bắc của đất nước. Hiện tại chúng tôi đang lên kế hoạch mở rộng ra quy mô cả nước. Chúng tôi đã đặt mục tiêu di chuyển xuống phía Nam và có một nhà hàng Planet Pizza trong mỗi khu mua sắm ở các thành phố phía Nam tính đến cuối thập kỷ này. Điều này sẽ cho những người yêu thích bánh pizza trên khắp cả nước cơ hội được nếm thử những chiếc bánh pizza thơm ngon của chúng tôi. Quý vị có mặt ở đây ngày hôm nay vì quý vị quan tâm tới việc trở thành chủ sở hữu đại lý nhượng quyền của công việc kinh doanh đang phát triển nhanh chóng của chúng tôi. Tất cả chúng ta ở đây hôm nay vì chúng ta muốn kiếm tiền. Bây giờ, chúng ta hãy cùng đi vào chi tiết.''',
        questions: _practice2Questions,
        fabVocab: Theme10Content.shortTalk1Vocab,
        fabPhrases: Theme10Content.shortTalk1Phrases,
        fabAnswers: const [
          FabAnswerItem(
            vi: 'Câu 4 (C): Bài nói hướng đến người muốn trở thành "franchise owner" = Chủ nhượng quyền tiềm năng.',
            en: 'Q4 (C): The talk targets people interested in becoming "franchise owner" = Potential franchisees.',
          ),
          FabAnswerItem(
            vi: 'Câu 5 (C): Elizabeth Harris nói Planet Pizza là "one of the nation\'s most successful pizza chains" = Chuỗi nhà hàng.',
            en: 'Q5 (C): Elizabeth Harris says Planet Pizza is "one of the nation\'s most successful pizza chains" = A restaurant chain.',
          ),
          FabAnswerItem(
            vi: 'Câu 6 (B): "I\'m Elizabeth Harris, director of marketing" = Giám đốc tiếp thị.',
            en: 'Q6 (B): "I\'m Elizabeth Harris, director of marketing" = Marketing Director.',
          ),
        ],
      ),

      // ── Phase 4: Mind Game (Practice 2) ──
      LessonPhase(
        id: 'theme10_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Planet Pizza Franchise',
        titleVi: 'Huấn luyện Trí nhớ: Nhượng quyền Planet Pizza',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme10Content.shortTalk1Vocab,
        fabPhrases: Theme10Content.shortTalk1Phrases,
        fabAnswers: Theme10Content.shortTalk1Answers,
      ),

      // ── Phase 5: Listening Quiz (Practice 3 - Short Talk 2) ──
      LessonPhase(
        id: 'theme10_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Sales Strategy Workshop',
        titleVi: 'Luyện tập 3: Bài ngắn - Hội thảo chiến lược kinh doanh',
        audioTrackKey: 'track_42',
        contentEn:
            '''Ladies and gentlemen, please keep in mind that the very first thing we have to do to attract new customers is to convince them that we offer something worthwhile. We need to inspire them to try our products or services, just once, so that they can make their own comparison. Their own experience will persuade them that we are better than our competitors. We also have to offer them something that makes us unique. So, what do you think we offer that the competition does not? We will discuss this question during our workshop tomorrow morning. However, our task doesn't stop there. When you go home tonight, I want each of you to think about how you can best promote our products, so that when you meet with our store clients you give them the best representation possible. Thank you.''',
        contentVi:
            '''Thưa quý vị, xin ghi nhớ rằng điều đầu tiên chúng ta phải làm để thu hút khách hàng mới là thuyết phục họ rằng chúng ta mang lại những gì đáng giá. Chúng ta cần truyền cảm hứng cho họ để thử các sản phẩm hoặc dịch vụ của chúng ta, chỉ cần một lần duy nhất thôi, để họ có thể đưa ra sự so sánh của riêng mình. Kinh nghiệm của chính họ sẽ thuyết phục họ rằng chúng ta vượt trội hơn các đối thủ cạnh tranh. Chúng ta cũng phải đem lại cho họ một điều gì đó khiến cho chúng ta trở độc nhất vô nhị. Vậy, theo quý vị thì chúng ta nên mang lại cho khách hàng điều gì mà đối thủ của chúng ta không có? Chúng ta vẫn sẽ thảo luận vấn đề này trong buổi hội thảo vào sáng mai. Tuy nhiên, nhiệm vụ của chúng ta không chỉ dừng lại ở đó. Tối nay khi quý vị về nhà, tôi muốn từng người trong số các vị suy nghĩ làm thế nào có thể quảng bá sản phẩm của chúng ta một cách tốt nhất, để khi quý vị gặp gỡ các khách hàng ở cửa hàng của chúng ta, quý vị sẽ trình bày một cách xuất sắc nhất có thể. Cảm ơn quý vị.''',
        questions: _practice3Questions,
        fabVocab: Theme10Content.shortTalk2Vocab,
        fabPhrases: Theme10Content.shortTalk2Phrases,
        fabAnswers: const [
          FabAnswerItem(
            vi: 'Câu 7 (D): Bài nói về cách promote products khi gặp "store clients" = Nhân viên bán hàng.',
            en: 'Q7 (D): The talk discusses promoting products when meeting "store clients" = Salespeople.',
          ),
          FabAnswerItem(
            vi: 'Câu 8 (C): "what do you think we offer that the competition does not?" = Xác định điểm mạnh/lợi thế độc đáo.',
            en: 'Q8 (C): "what do you think we offer that the competition does not?" = Identifying their strong points.',
          ),
          FabAnswerItem(
            vi: 'Câu 9 (B): "We will discuss this question during our workshop tomorrow morning" = Tham dự hội thảo.',
            en: 'Q9 (B): "We will discuss this question during our workshop tomorrow morning" = Attending a workshop.',
          ),
        ],
      ),

      // ── Phase 6: Mind Game (Practice 3) ──
      LessonPhase(
        id: 'theme10_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Sales Strategy',
        titleVi: 'Huấn luyện Trí nhớ: Chiến lược kinh doanh',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme10Content.shortTalk2Vocab,
        fabPhrases: Theme10Content.shortTalk2Phrases,
        fabAnswers: Theme10Content.shortTalk2Answers,
      ),
    ],
  );

  // ═══════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ═══════════════════════════════════════════════════════════════
  static List<QuizQuestion> get _practice1Questions => [
    const QuizQuestion(
      id: 'theme10_q01',
      questionText: 'What are the speakers talking about?',
      options: [
        '(A) Lowering their prices',
        '(B) Developing new products',
        '(C) Keeping up with the competition',
        '(D) Improving their customer service',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_40',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme10_q02',
      questionText: 'How has the company marketed their products in the past?',
      options: [
        '(A) Based on quality',
        '(B) Based on sales',
        '(C) Based on price',
        '(D) Based on service',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_40',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme10_q03',
      questionText: 'What does the man suggest?',
      options: [
        '(A) Replacing the sales manager',
        '(B) Increasing prices',
        '(C) Following their competitor\'s strategies',
        '(D) Changing their advertising strategies',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_40',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    const QuizQuestion(
      id: 'theme10_q04',
      questionText: 'Who are most likely the audience of this talk?',
      options: [
        '(A) Marketing students',
        '(B) Pizza lovers',
        '(C) Potential franchisees',
        '(D) Shopping mall employees',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_41',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme10_q05',
      questionText: 'What kind of business is Planet Pizza?',
      options: [
        '(A) A space caterer',
        '(B) A marketing agency',
        '(C) A restaurant chain',
        '(D) A shopping mall',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_41',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme10_q06',
      questionText: 'What is Elizabeth Harris\' position in the company?',
      options: [
        '(A) Head of Sales',
        '(B) Marketing Director',
        '(C) Franchising Manager',
        '(D) Chief Executive Officer',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_41',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
      id: 'theme10_q07',
      questionText: 'Who is this talk aimed at?',
      options: [
        '(A) Customers',
        '(B) Competitors',
        '(C) Meeting planners',
        '(D) Salespeople',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_42',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme10_q08',
      questionText: 'What are they trying to identify?',
      options: [
        '(A) Their potential customers',
        '(B) Their potential competitors',
        '(C) Their strong points',
        '(D) How to price their service',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_42',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme10_q09',
      questionText: 'What will the listeners be doing tomorrow morning?',
      options: [
        '(A) Staying at home',
        '(B) Attending a workshop',
        '(C) Visiting some stores',
        '(D) Meeting with clients',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_42',
      practiceNumber: 'practice3',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // MIND GAME SEGMENTS
  // ═══════════════════════════════════════════════════════════════
  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('M: We all see that '),
    const MixedSegment.vietnamese('các sản phẩm của chúng ta', 'our products'),
    const MixedSegment.english(' are of '),
    const MixedSegment.vietnamese('một chất lượng cao hơn', 'a higher quality'),
    const MixedSegment.english(' than others '),
    const MixedSegment.vietnamese('trên thị trường', 'in the market'),
    const MixedSegment.english('. However, '),
    const MixedSegment.vietnamese(
      'những đối thủ cạnh tranh lớn nhất của chúng ta',
      'our biggest competitors',
    ),
    const MixedSegment.english(' still '),
    const MixedSegment.vietnamese('vượt mặt chúng ta', 'outperform us'),
    const MixedSegment.english(' every year. '),
    const MixedSegment.vietnamese(
      'Chắc phải có điều gì đó',
      'There must be something',
    ),
    const MixedSegment.english(' that we '),
    const MixedSegment.vietnamese(
      'đã và đang làm sai',
      'have been doing wrong',
    ),
    const MixedSegment.english('.\nW: For the last few years, '),
    const MixedSegment.vietnamese(
      'các chiến dịch tiếp thị của chúng ta',
      'our marketing campaigns',
    ),
    const MixedSegment.english(' have been focusing on '),
    const MixedSegment.vietnamese('giá cả', 'prices'),
    const MixedSegment.english(', but our prices '),
    const MixedSegment.vietnamese(
      'sẽ luôn cao hơn so với',
      'are always going to be higher than',
    ),
    const MixedSegment.english(' our competitors. That is definitely not '),
    const MixedSegment.vietnamese('lý do tại sao', 'the reason why'),
    const MixedSegment.english(' customers '),
    const MixedSegment.vietnamese(
      'chọn các sản phẩm của chúng ta',
      'choose our products',
    ),
    const MixedSegment.english('.\nM: In my opinion, we '),
    const MixedSegment.vietnamese(
      'nên tập trung nhiều hơn vào',
      'should focus more on',
    ),
    const MixedSegment.english(' the fact that we offer '),
    const MixedSegment.vietnamese(
      'những sản phẩm chất lượng tốt hơn nhiều',
      'much better quality products',
    ),
    const MixedSegment.english(' than our competitors. We '),
    const MixedSegment.vietnamese('phải quảng bá', 'have to promote'),
    const MixedSegment.english(
      ' our strong point, which is quality.\nW: Then we should have the marketing team ',
    ),
    const MixedSegment.vietnamese('bắt đầu phát triển', 'start developing'),
    const MixedSegment.english(
      ' advertisements emphasizing the quality of our products.',
    ),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english(
      'Good morning, everybody. I\'m Elizabeth Harris, ',
    ),
    const MixedSegment.vietnamese('giám đốc tiếp thị', 'director of marketing'),
    const MixedSegment.english(' for Planet Pizza, one of the nation\'s '),
    const MixedSegment.vietnamese(
      'những chuỗi pizza thành công nhất',
      'most successful pizza chains',
    ),
    const MixedSegment.english(' in recent years. In the last 3 years we '),
    const MixedSegment.vietnamese('đã mở được', 'have opened'),
    const MixedSegment.english(' more than 200 new pizza restaurants '),
    const MixedSegment.vietnamese(
      'ở khu vực phía Bắc',
      'in the Northern region',
    ),
    const MixedSegment.english(' of the country. Now we are planning to '),
    const MixedSegment.vietnamese('mở rộng ra toàn quốc', 'expand nationwide'),
    const MixedSegment.english('. We have '),
    const MixedSegment.vietnamese('đặt một mục tiêu', 'set a goal'),
    const MixedSegment.english(
      ' to move South and have a Planet Pizza restaurant ',
    ),
    const MixedSegment.vietnamese(
      'ở mọi trung tâm thương mại',
      'in every shopping mall',
    ),
    const MixedSegment.english(' in the Southern cities of the country '),
    const MixedSegment.vietnamese(
      'tính đến cuối thập kỷ này',
      'by the end of the decade',
    ),
    const MixedSegment.english('. This should give pizza lovers '),
    const MixedSegment.vietnamese('trên khắp đất nước', 'all over the country'),
    const MixedSegment.english(
      ' the chance to taste our delicious pizzas. You\'re here today because you ',
    ),
    const MixedSegment.vietnamese('có hứng thú với', 'are interested in'),
    const MixedSegment.english(' becoming '),
    const MixedSegment.vietnamese(
      'một người sở hữu cửa hàng nhượng quyền',
      'a franchise owner',
    ),
    const MixedSegment.english(' of our '),
    const MixedSegment.vietnamese(
      'công việc kinh doanh phát triển nhanh chóng',
      'rapidly-expanding business',
    ),
    const MixedSegment.english('. We are all here today because we want to '),
    const MixedSegment.vietnamese('kiếm tiền', 'make money'),
    const MixedSegment.english('. Now, let\'s '),
    const MixedSegment.vietnamese('đi vào chi tiết', 'get into detail'),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english('Ladies and gentlemen, please '),
    const MixedSegment.vietnamese('ghi nhớ', 'keep in mind'),
    const MixedSegment.english(' that the very first thing we have to do '),
    const MixedSegment.vietnamese(
      'để thu hút khách hàng mới',
      'to attract new customers',
    ),
    const MixedSegment.english(' is to convince them that we '),
    const MixedSegment.vietnamese(
      'mang lại điều gì đó đáng giá',
      'offer something worthwhile',
    ),
    const MixedSegment.english('. We '),
    const MixedSegment.vietnamese(
      'cần phải truyền cảm hứng',
      'need to inspire',
    ),
    const MixedSegment.english(' them to '),
    const MixedSegment.vietnamese(
      'thử những sản phẩm hay dịch vụ của chúng ta',
      'try our products or services',
    ),
    const MixedSegment.english(', just once, so that they can '),
    const MixedSegment.vietnamese(
      'tự đưa ra so sánh của riêng họ',
      'make their own comparison',
    ),
    const MixedSegment.english('. Their own experience '),
    const MixedSegment.vietnamese('sẽ thuyết phục', 'will persuade'),
    const MixedSegment.english(' them that we are better than '),
    const MixedSegment.vietnamese(
      'những đối thủ cạnh tranh của chúng ta',
      'our competitors',
    ),
    const MixedSegment.english('. We also have to offer them something that '),
    const MixedSegment.vietnamese(
      'khiến chúng ta trở nên khác biệt',
      'makes us unique',
    ),
    const MixedSegment.english(
      '. So, what do you think we offer that the competition does not? We will discuss this question ',
    ),
    const MixedSegment.vietnamese(
      'trong suốt buổi hội thảo của chúng ta',
      'during our workshop',
    ),
    const MixedSegment.english(' tomorrow morning. However, our task '),
    const MixedSegment.vietnamese('không dừng lại ở đó', 'doesn\'t stop there'),
    const MixedSegment.english(
      '. When you go home tonight, I want each of you to ',
    ),
    const MixedSegment.vietnamese('nghĩ về', 'think about'),
    const MixedSegment.english(' how you can '),
    const MixedSegment.vietnamese(
      'quảng bá các sản phẩm của chúng ta tốt nhất',
      'best promote our products',
    ),
    const MixedSegment.english(', so that when you meet with our '),
    const MixedSegment.vietnamese('các khách hàng ở cửa hàng', 'store clients'),
    const MixedSegment.english(' you give them '),
    const MixedSegment.vietnamese(
      'bài giới thiệu tốt nhất có thể',
      'the best representation possible',
    ),
    const MixedSegment.english('. Thank you.'),
  ];
}

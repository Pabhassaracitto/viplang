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
  // VOCABULARY (30 từ)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v10_01',
      wordEn: 'corporate development',
      wordVi: 'phát triển sản phẩm trong doanh nghiệp',
      pronunciation: '/ˈkɔːrpərət dɪˈveləpmənt/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'Corporate development focuses on growing the company through new products and markets.',
      exampleVi:
          'Phát triển doanh nghiệp tập trung vào tăng trưởng thông qua sản phẩm và thị trường mới.',
    ),
    VocabModel(
      id: 'v10_02',
      wordEn: 'advertising campaign',
      wordVi: 'chiến dịch quảng cáo',
      pronunciation: '/ˈædvərtaɪzɪŋ kæmˈpeɪn/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'The new advertising campaign increased brand awareness by 40%.',
      exampleVi:
          'Chiến dịch quảng cáo mới đã tăng nhận thức thương hiệu lên 40%.',
    ),
    VocabModel(
      id: 'v10_03',
      wordEn: 'component',
      wordVi: 'cấu kiện sản phẩm',
      pronunciation: '/kəmˈpoʊnənt/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Each component of the product must meet quality standards.',
      exampleVi:
          'Mỗi cấu kiện của sản phẩm phải đáp ứng tiêu chuẩn chất lượng.',
    ),
    VocabModel(
      id: 'v10_04',
      wordEn: 'procedure',
      wordVi: 'quy trình',
      pronunciation: '/prəˈsiːdʒər/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Follow the correct procedure when launching a new product.',
      exampleVi: 'Hãy tuân theo đúng quy trình khi tung ra sản phẩm mới.',
    ),
    VocabModel(
      id: 'v10_05',
      wordEn: 'requirement',
      wordVi: 'yêu cầu',
      pronunciation: '/rɪˈkwaɪərmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The product must meet all customer requirements.',
      exampleVi: 'Sản phẩm phải đáp ứng tất cả các yêu cầu của khách hàng.',
    ),
    VocabModel(
      id: 'v10_06',
      wordEn: 'schedule',
      wordVi: 'lịch trình',
      pronunciation: '/ˈskedʒuːl/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The product launch schedule has been moved up by two weeks.',
      exampleVi: 'Lịch trình ra mắt sản phẩm đã được chuyển lên hai tuần.',
    ),
    VocabModel(
      id: 'v10_07',
      wordEn: 'upgrade',
      wordVi: 'sự nâng cấp',
      pronunciation: '/ˈʌpɡreɪd/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'The software upgrade improved system performance significantly.',
      exampleVi:
          'Việc nâng cấp phần mềm đã cải thiện đáng kể hiệu suất hệ thống.',
    ),
    VocabModel(
      id: 'v10_08',
      wordEn: 'warranty',
      wordVi: 'việc bảo hành',
      pronunciation: '/ˈwɔːrənti/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The product comes with a two-year warranty.',
      exampleVi: 'Sản phẩm đi kèm với bảo hành hai năm.',
    ),
    VocabModel(
      id: 'v10_09',
      wordEn: 'questionnaire',
      wordVi: 'bản câu hỏi khảo sát',
      pronunciation: '/ˌkwestʃəˈner/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'Customers were asked to complete a questionnaire about the new product.',
      exampleVi:
          'Khách hàng được yêu cầu điền vào bản câu hỏi khảo sát về sản phẩm mới.',
    ),
    VocabModel(
      id: 'v10_10',
      wordEn: 'competitor',
      wordVi: 'đối thủ cạnh tranh',
      pronunciation: '/kəmˈpetɪtər/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'We must monitor our competitors to stay ahead in the market.',
      exampleVi:
          'Chúng ta phải theo dõi các đối thủ cạnh tranh để dẫn đầu thị trường.',
    ),
    VocabModel(
      id: 'v10_11',
      wordEn: 'initiate',
      wordVi: 'khởi xướng',
      pronunciation: '/ɪˈnɪʃieɪt/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'The CEO decided to initiate a new product development program.',
      exampleVi:
          'Giám đốc điều hành quyết định khởi xướng chương trình phát triển sản phẩm mới.',
    ),
    VocabModel(
      id: 'v10_12',
      wordEn: 'design',
      wordVi: 'thiết kế',
      pronunciation: '/dɪˈzaɪn/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The team worked hard to design an innovative new product.',
      exampleVi:
          'Nhóm làm việc chăm chỉ để thiết kế một sản phẩm mới sáng tạo.',
    ),
    VocabModel(
      id: 'v10_13',
      wordEn: 'survey',
      wordVi: 'điều tra, khảo sát',
      pronunciation: '/ˈsɜːrveɪ/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'We surveyed 500 customers about their product preferences.',
      exampleVi:
          'Chúng tôi đã khảo sát 500 khách hàng về sở thích sản phẩm của họ.',
    ),
    VocabModel(
      id: 'v10_14',
      wordEn: 'modify',
      wordVi: 'sửa đổi',
      pronunciation: '/ˈmɑːdɪfaɪ/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'They had to modify the product based on customer feedback.',
      exampleVi: 'Họ phải sửa đổi sản phẩm dựa trên phản hồi của khách hàng.',
    ),
    VocabModel(
      id: 'v10_15',
      wordEn: 'poll',
      wordVi: 'thăm dò ý kiến',
      pronunciation: '/poʊl/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'The company polled its customers to find out their preferences.',
      exampleVi:
          'Công ty đã thăm dò ý kiến khách hàng để tìm hiểu sở thích của họ.',
    ),
    VocabModel(
      id: 'v10_16',
      wordEn: 'respond',
      wordVi: 'phản hồi',
      pronunciation: '/rɪˈspɑːnd/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Customers responded positively to the new product design.',
      exampleVi: 'Khách hàng phản hồi tích cực với thiết kế sản phẩm mới.',
    ),
    VocabModel(
      id: 'v10_17',
      wordEn: 'customer feedback',
      wordVi: 'phản hồi của khách hàng',
      pronunciation: '/ˈkʌstəmər ˈfiːdbæk/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Customer feedback is essential for improving our products.',
      exampleVi:
          'Phản hồi của khách hàng rất quan trọng để cải thiện sản phẩm của chúng tôi.',
    ),
    VocabModel(
      id: 'v10_18',
      wordEn: 'marketing strategy',
      wordVi: 'chiến lược tiếp thị',
      pronunciation: '/ˈmɑːrkɪtɪŋ ˈstrætədʒi/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The new marketing strategy focused on digital platforms.',
      exampleVi:
          'Chiến lược tiếp thị mới tập trung vào các nền tảng kỹ thuật số.',
    ),
    VocabModel(
      id: 'v10_19',
      wordEn: 'outperform',
      wordVi: 'vượt trội hơn',
      pronunciation: '/ˌaʊtpərˈfɔːrm/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Our new product outperformed all competitors in the market.',
      exampleVi:
          'Sản phẩm mới của chúng tôi vượt trội hơn tất cả đối thủ trên thị trường.',
    ),
    VocabModel(
      id: 'v10_20',
      wordEn: 'promote',
      wordVi: 'quảng bá',
      pronunciation: '/prəˈmoʊt/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'We need to promote our products more effectively.',
      exampleVi: 'Chúng ta cần quảng bá sản phẩm của mình hiệu quả hơn.',
    ),
    VocabModel(
      id: 'v10_21',
      wordEn: 'franchise owner',
      wordVi: 'chủ sở hữu cửa hàng nhượng quyền',
      pronunciation: '/ˈfræntʃaɪz ˈoʊnər/',
      partOfSpeech: 'np',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Becoming a franchise owner requires significant investment.',
      exampleVi:
          'Trở thành chủ sở hữu cửa hàng nhượng quyền đòi hỏi đầu tư đáng kể.',
    ),
    VocabModel(
      id: 'v10_22',
      wordEn: 'expand',
      wordVi: 'mở rộng',
      pronunciation: '/ɪkˈspænd/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The company plans to expand into new markets next year.',
      exampleVi:
          'Công ty có kế hoạch mở rộng sang các thị trường mới vào năm tới.',
    ),
    VocabModel(
      id: 'v10_23',
      wordEn: 'attract',
      wordVi: 'thu hút',
      pronunciation: '/əˈtrækt/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The discount offer attracted many new customers.',
      exampleVi: 'Ưu đãi giảm giá đã thu hút nhiều khách hàng mới.',
    ),
    VocabModel(
      id: 'v10_24',
      wordEn: 'convince',
      wordVi: 'thuyết phục',
      pronunciation: '/kənˈvɪns/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'It was hard to convince customers to switch to our brand.',
      exampleVi:
          'Thật khó để thuyết phục khách hàng chuyển sang thương hiệu của chúng tôi.',
    ),
    VocabModel(
      id: 'v10_25',
      wordEn: 'inspire',
      wordVi: 'truyền cảm hứng',
      pronunciation: '/ɪnˈspaɪər/',
      partOfSpeech: 'v',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'Good leadership can inspire teams to reach new heights.',
      exampleVi:
          'Lãnh đạo tốt có thể truyền cảm hứng cho nhóm đạt đến tầm cao mới.',
    ),
    VocabModel(
      id: 'v10_26',
      wordEn: 'unique',
      wordVi: 'độc đáo, duy nhất',
      pronunciation: '/juːˈniːk/',
      partOfSpeech: 'adj',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'Our product offers a unique solution that competitors cannot match.',
      exampleVi:
          'Sản phẩm của chúng tôi cung cấp giải pháp độc đáo mà đối thủ không thể sánh kịp.',
    ),
    VocabModel(
      id: 'v10_27',
      wordEn: 'workshop',
      wordVi: 'hội thảo',
      pronunciation: '/ˈwɜːrkʃɑːp/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'All sales staff must attend the marketing workshop on Friday.',
      exampleVi:
          'Tất cả nhân viên kinh doanh phải tham dự hội thảo marketing vào thứ Sáu.',
    ),
    VocabModel(
      id: 'v10_28',
      wordEn: 'nationwide',
      wordVi: 'trên toàn quốc',
      pronunciation: '/ˌneɪʃənˈwaɪd/',
      partOfSpeech: 'adv',
      themeId: 'theme_10_corporate_development',
      exampleEn: 'The company launched its new product nationwide last month.',
      exampleVi:
          'Công ty đã ra mắt sản phẩm mới trên toàn quốc vào tháng trước.',
    ),
    VocabModel(
      id: 'v10_29',
      wordEn: 'representation',
      wordVi: 'bài giới thiệu, sự trình bày',
      pronunciation: '/ˌreprɪzenˈteɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'The sales team gave an excellent representation of the product.',
      exampleVi: 'Nhóm kinh doanh đã có bài giới thiệu xuất sắc về sản phẩm.',
    ),
    VocabModel(
      id: 'v10_30',
      wordEn: 'worthwhile',
      wordVi: 'đáng giá, có giá trị',
      pronunciation: '/ˌwɜːrθˈwaɪl/',
      partOfSpeech: 'adj',
      themeId: 'theme_10_corporate_development',
      exampleEn:
          'Investing in quality customer service is worthwhile in the long run.',
      exampleVi:
          'Đầu tư vào dịch vụ khách hàng chất lượng là đáng giá về lâu dài.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 1 Reading
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => [
    FabVocabItem(
      wordEn: 'corporate development',
      wordVi: 'Phát triển sản phẩm trong doanh nghiệp',
      pronunciation: '/ˈkɔːrpərət dɪˈveləpmənt/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'customer feedback',
      wordVi: 'Phản hồi của khách hàng',
      pronunciation: '/ˈkʌstəmər ˈfiːdbæk/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'marketing strategy',
      wordVi: 'Chiến lược tiếp thị',
      pronunciation: '/ˈmɑːrkɪtɪŋ ˈstrætədʒi/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'advertising campaign',
      wordVi: 'Chiến dịch quảng cáo',
      pronunciation: '/ˈædvərtaɪzɪŋ kæmˈpeɪn/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'competitor',
      wordVi: 'Đối thủ cạnh tranh',
      pronunciation: '/kəmˈpetɪtər/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'upgrade',
      wordVi: 'Sự nâng cấp',
      pronunciation: '/ˈʌpɡreɪd/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'modify',
      wordVi: 'Sửa đổi',
      pronunciation: '/ˈmɑːdɪfaɪ/',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'initiate',
      wordVi: 'Khởi xướng',
      pronunciation: '/ɪˈnɪʃieɪt/',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'concept',
      wordVi: 'Khái niệm',
      pronunciation: '/ˈkɑːnsept/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'passage',
      wordVi: 'Đoạn văn',
      pronunciation: '/ˈpæsɪdʒ/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    FabPhraseItem(
      phrase: 'Apply to companies',
      meaning: 'Áp dụng đối với công ty',
    ),
    FabPhraseItem(
      phrase: 'Research and development',
      meaning: 'Nghiên cứu và phát triển',
    ),
    FabPhraseItem(
      phrase: 'It will be easier to follow',
      meaning: 'Sẽ dễ dàng hơn khi theo dõi',
    ),
    FabPhraseItem(phrase: 'Either...or', meaning: 'Hoặc...hoặc'),
    FabPhraseItem(
      phrase: 'Goes about developing',
      meaning: 'Thực hiện việc phát triển',
    ),
    FabPhraseItem(phrase: 'Double passages', meaning: 'Bài đọc hai đoạn văn'),
  ];

  static List<FabAnswerItem> get readingAnswers => [
    FabAnswerItem(vi: 'Các cấu trúc ngôn ngữ', en: 'language structures'),
    FabAnswerItem(vi: 'Việc nghiên cứu', en: 'research'),
    FabAnswerItem(vi: 'Phản hồi của khách hàng', en: 'customer feedback'),
    FabAnswerItem(
      vi: 'Các sản phẩm hiện có hay sản phẩm mới',
      en: 'existing or new products',
    ),
    FabAnswerItem(vi: 'Cũng áp dụng với', en: 'also applies to'),
    FabAnswerItem(
      vi: 'Một sản phẩm được sản xuất',
      en: 'a manufactured product',
    ),
    FabAnswerItem(
      vi: 'Nghiên cứu và phát triển',
      en: 'research and development',
    ),
    FabAnswerItem(vi: 'Chiến dịch quảng cáo', en: 'advertising campaign'),
    FabAnswerItem(vi: 'Việc nâng cấp', en: 'upgrade'),
    FabAnswerItem(vi: 'Đối thủ cạnh tranh', en: 'competitor'),
    FabAnswerItem(vi: 'Thiết kế', en: 'design'),
    FabAnswerItem(vi: 'Sửa đổi', en: 'modify'),
    FabAnswerItem(vi: 'Giới thiệu', en: 'introduce'),
    FabAnswerItem(vi: 'Khái niệm', en: 'concept'),
    FabAnswerItem(
      vi: 'Việc phát triển hoặc cải tiến',
      en: 'developing or improving',
    ),
    FabAnswerItem(
      vi: 'Tại sao điều này lại quan trọng',
      en: 'why this is important',
    ),
    FabAnswerItem(vi: 'Trong các buổi họp', en: 'in meetings'),
    FabAnswerItem(vi: 'Hai người nói', en: 'two speakers'),
    FabAnswerItem(vi: 'Sẽ dễ dàng hơn', en: 'will be easier'),
    FabAnswerItem(vi: 'Những bài đọc kép', en: 'double passages'),
    FabAnswerItem(vi: 'Thường là', en: 'commonly'),
    FabAnswerItem(vi: 'Một chuyên đề chính', en: 'a major theme'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Conversation
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get conversationVocab => [
    FabVocabItem(
      wordEn: 'outperform',
      wordVi: 'Vượt mặt, vượt trội hơn',
      pronunciation: '/ˌaʊtpərˈfɔːrm/',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'marketing campaign',
      wordVi: 'Chiến dịch tiếp thị',
      pronunciation: '/ˈmɑːrkɪtɪŋ kæmˈpeɪn/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'strong point',
      wordVi: 'Điểm mạnh',
      pronunciation: '/strɔːŋ pɔɪnt/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'emphasize',
      wordVi: 'Nhấn mạnh',
      pronunciation: '/ˈemfəsaɪz/',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'promote',
      wordVi: 'Quảng bá',
      pronunciation: '/prəˈmoʊt/',
      partOfSpeech: 'v',
    ),
  ];

  static List<FabPhraseItem> get conversationPhrases => [
    FabPhraseItem(
      phrase: 'Outperform competitors',
      meaning: 'Vượt mặt đối thủ cạnh tranh',
    ),
    FabPhraseItem(phrase: 'Focus on prices', meaning: 'Tập trung vào giá cả'),
    FabPhraseItem(
      phrase: 'Promote our strong point',
      meaning: 'Quảng bá điểm mạnh của chúng ta',
    ),
    FabPhraseItem(
      phrase: 'Start developing advertisements',
      meaning: 'Bắt đầu phát triển quảng cáo',
    ),
    FabPhraseItem(phrase: 'Focus more on', meaning: 'Tập trung nhiều hơn vào'),
  ];

  static List<FabAnswerItem> get conversationAnswers => [
    FabAnswerItem(vi: 'Các sản phẩm của chúng ta', en: 'our products'),
    FabAnswerItem(vi: 'Một chất lượng cao hơn', en: 'a higher quality'),
    FabAnswerItem(vi: 'Trên thị trường', en: 'in the market'),
    FabAnswerItem(
      vi: 'Những đối thủ cạnh tranh lớn nhất của chúng ta',
      en: 'our biggest competitors',
    ),
    FabAnswerItem(vi: 'Vượt mặt chúng ta', en: 'outperform us'),
    FabAnswerItem(vi: 'Chắc phải có điều gì đó', en: 'There must be something'),
    FabAnswerItem(vi: 'Đã và đang làm sai', en: 'have been doing wrong'),
    FabAnswerItem(
      vi: 'Các chiến dịch tiếp thị của chúng ta',
      en: 'our marketing campaigns',
    ),
    FabAnswerItem(vi: 'Giá cả', en: 'prices'),
    FabAnswerItem(
      vi: 'Sẽ luôn cao hơn so với',
      en: 'are always going to be higher than',
    ),
    FabAnswerItem(vi: 'Lý do tại sao', en: 'the reason why'),
    FabAnswerItem(
      vi: 'Chọn các sản phẩm của chúng ta',
      en: 'choose our products',
    ),
    FabAnswerItem(
      vi: 'Nên tập trung nhiều hơn vào',
      en: 'should focus more on',
    ),
    FabAnswerItem(
      vi: 'Những sản phẩm chất lượng tốt hơn nhiều',
      en: 'much better quality products',
    ),
    FabAnswerItem(vi: 'Phải quảng bá', en: 'have to promote'),
    FabAnswerItem(vi: 'Bắt đầu phát triển', en: 'start developing'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 1 (Planet Pizza)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk1Vocab => [
    FabVocabItem(
      wordEn: 'director of marketing',
      wordVi: 'Giám đốc tiếp thị',
      pronunciation: '/dɪˈrektər əv ˈmɑːrkɪtɪŋ/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'pizza chain',
      wordVi: 'Chuỗi cửa hàng pizza',
      pronunciation: '/ˈpiːtsə tʃeɪn/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'franchise owner',
      wordVi: 'Chủ sở hữu cửa hàng nhượng quyền',
      pronunciation: '/ˈfræntʃaɪz ˈoʊnər/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'shopping mall',
      wordVi: 'Trung tâm thương mại',
      pronunciation: '/ˈʃɑːpɪŋ mɔːl/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'decade',
      wordVi: 'Thập kỷ',
      pronunciation: '/ˈdekeɪd/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
    FabPhraseItem(
      phrase: 'Set a goal to do sth',
      meaning: 'Đặt ra mục tiêu làm gì',
    ),
    FabPhraseItem(
      phrase: 'By the end of the decade',
      meaning: 'Tính đến cuối thập kỷ này',
    ),
    FabPhraseItem(
      phrase: 'Be interested in',
      meaning: 'Quan tâm đến, có hứng thú với',
    ),
    FabPhraseItem(phrase: 'Get into detail', meaning: 'Đi vào chi tiết'),
    FabPhraseItem(phrase: 'Expand nationwide', meaning: 'Mở rộng ra toàn quốc'),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => [
    FabAnswerItem(vi: 'Giám đốc tiếp thị', en: 'director of marketing'),
    FabAnswerItem(
      vi: 'Những chuỗi pizza thành công nhất',
      en: 'most successful pizza chains',
    ),
    FabAnswerItem(vi: 'Đã mở được', en: 'have opened'),
    FabAnswerItem(vi: 'Ở khu vực phía Bắc', en: 'in the Northern region'),
    FabAnswerItem(vi: 'Mở rộng ra toàn quốc', en: 'expand nationwide'),
    FabAnswerItem(vi: 'Đặt một mục tiêu', en: 'set a goal'),
    FabAnswerItem(
      vi: 'Ở mọi trung tâm thương mại',
      en: 'in every shopping mall',
    ),
    FabAnswerItem(
      vi: 'Tính đến cuối thập kỷ này',
      en: 'by the end of the decade',
    ),
    FabAnswerItem(vi: 'Trên khắp đất nước', en: 'all over the country'),
    FabAnswerItem(vi: 'Có hứng thú với', en: 'are interested in'),
    FabAnswerItem(
      vi: 'Một người sở hữu cửa hàng nhượng quyền',
      en: 'a franchise owner',
    ),
    FabAnswerItem(
      vi: 'Công việc kinh doanh phát triển nhanh chóng',
      en: 'rapidly-expanding business',
    ),
    FabAnswerItem(vi: 'Kiếm tiền', en: 'make money'),
    FabAnswerItem(vi: 'Đi vào chi tiết', en: 'get into detail'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 2 (Sales Strategy)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk2Vocab => [
    FabVocabItem(
      wordEn: 'worthwhile',
      wordVi: 'Đáng giá, có giá trị',
      pronunciation: '/ˌwɜːrθˈwaɪl/',
      partOfSpeech: 'adj',
    ),
    FabVocabItem(
      wordEn: 'inspire',
      wordVi: 'Truyền cảm hứng',
      pronunciation: '/ɪnˈspaɪər/',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'unique',
      wordVi: 'Độc đáo, duy nhất',
      pronunciation: '/juːˈniːk/',
      partOfSpeech: 'adj',
    ),
    FabVocabItem(
      wordEn: 'representation',
      wordVi: 'Bài giới thiệu, sự trình bày',
      pronunciation: '/ˌreprɪzenˈteɪʃən/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'convince',
      wordVi: 'Thuyết phục',
      pronunciation: '/kənˈvɪns/',
      partOfSpeech: 'v',
    ),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
    FabPhraseItem(
      phrase: 'Keep in mind (that)',
      meaning: 'Ghi nhớ, hãy lưu tâm (rằng)',
    ),
    FabPhraseItem(
      phrase: 'Attract new customers',
      meaning: 'Thu hút khách hàng mới',
    ),
    FabPhraseItem(
      phrase: 'Offer something worthwhile',
      meaning: 'Mang lại điều gì đó đáng giá',
    ),
    FabPhraseItem(
      phrase: 'Make their own comparison',
      meaning: 'Tự đưa ra so sánh của riêng họ',
    ),
    FabPhraseItem(
      phrase: 'Best representation possible',
      meaning: 'Bài giới thiệu tốt nhất có thể',
    ),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => [
    FabAnswerItem(vi: 'Ghi nhớ', en: 'keep in mind'),
    FabAnswerItem(
      vi: 'Để thu hút khách hàng mới',
      en: 'to attract new customers',
    ),
    FabAnswerItem(
      vi: 'Mang lại điều gì đó đáng giá',
      en: 'offer something worthwhile',
    ),
    FabAnswerItem(vi: 'Cần phải truyền cảm hứng', en: 'need to inspire'),
    FabAnswerItem(
      vi: 'Thử những sản phẩm hay dịch vụ của chúng ta',
      en: 'try our products or services',
    ),
    FabAnswerItem(
      vi: 'Tự đưa ra so sánh của riêng họ',
      en: 'make their own comparison',
    ),
    FabAnswerItem(vi: 'Sẽ thuyết phục', en: 'will persuade'),
    FabAnswerItem(
      vi: 'Những đối thủ cạnh tranh của chúng ta',
      en: 'our competitors',
    ),
    FabAnswerItem(
      vi: 'Khiến chúng ta trở nên khác biệt',
      en: 'makes us unique',
    ),
    FabAnswerItem(
      vi: 'Trong suốt buổi hội thảo của chúng ta',
      en: 'during our workshop',
    ),
    FabAnswerItem(vi: 'Không dừng lại ở đó', en: 'doesn\'t stop there'),
    FabAnswerItem(vi: 'Nghĩ về', en: 'think about'),
    FabAnswerItem(
      vi: 'Quảng bá các sản phẩm của chúng ta tốt nhất',
      en: 'best promote our products',
    ),
    FabAnswerItem(vi: 'Các khách hàng ở cửa hàng', en: 'store clients'),
    FabAnswerItem(
      vi: 'Bài giới thiệu tốt nhất có thể',
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
        contentEn: null,
        contentVi: null,
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
        fabAnswers: [
          FabAnswerItem(
            questionNumber: '1',
            correctAnswer: 'C',
            explanation:
                'Họ đang nói về việc theo kịp cạnh tranh - M nói đối thủ vẫn outperform them.',
          ),
          FabAnswerItem(
            questionNumber: '2',
            correctAnswer: 'C',
            explanation:
                'W nói "our marketing campaigns have been focusing on prices" = dựa trên giá cả.',
          ),
          FabAnswerItem(
            questionNumber: '3',
            correctAnswer: 'D',
            explanation:
                'M đề nghị "focus more on quality" và W đồng ý phát triển quảng cáo nhấn mạnh chất lượng.',
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
        fabAnswers: [
          FabAnswerItem(
            questionNumber: '4',
            correctAnswer: 'C',
            explanation:
                'Bài nói hướng đến người muốn trở thành "franchise owner" = Potential franchisees.',
          ),
          FabAnswerItem(
            questionNumber: '5',
            correctAnswer: 'C',
            explanation:
                'Elizabeth Harris nói Planet Pizza là "one of the nation\'s most successful pizza chains" = A restaurant chain.',
          ),
          FabAnswerItem(
            questionNumber: '6',
            correctAnswer: 'B',
            explanation:
                '"I\'m Elizabeth Harris, director of marketing" = Marketing Director.',
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
        fabAnswers: [
          FabAnswerItem(
            questionNumber: '7',
            correctAnswer: 'D',
            explanation:
                'Bài nói nói về cách promote products khi gặp "store clients" = Salespeople.',
          ),
          FabAnswerItem(
            questionNumber: '8',
            correctAnswer: 'A',
            explanation:
                '"what do you think we offer that the competition does not?" = identifying their potential customers - thực chất là tìm điểm khác biệt. Đáp án A gần nhất với nội dung "attract new customers".',
          ),
          FabAnswerItem(
            questionNumber: '9',
            correctAnswer: 'B',
            explanation:
                '"We will discuss this question during our workshop tomorrow morning" = Attending a workshop.',
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
    QuizQuestion(
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
    QuizQuestion(
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
    QuizQuestion(
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
    QuizQuestion(
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
    QuizQuestion(
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
    QuizQuestion(
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
    QuizQuestion(
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
    QuizQuestion(
      id: 'theme10_q08',
      questionText: 'What are they trying to identify?',
      options: [
        '(A) Their potential customers',
        '(B) Their potential competitors',
        '(C) Their strong points',
        '(D) How to price their service',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_42',
      practiceNumber: 'practice3',
    ),
    QuizQuestion(
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

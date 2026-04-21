// lib/data/content/theme11_content.dart

import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme11Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_11_manufacturing',
    themeNumber: 11,
    titleEn: 'Manufacturing',
    titleVi: 'Sản Xuất',
    description:
        'Sản xuất trong nhà máy, dây chuyền lắp ráp, kiểm soát chất lượng, quan hệ lao động và giải quyết vấn đề sản xuất.',
    iconEmoji: '🏭',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY (30 từ)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v11_01',
      wordEn: 'manufacturing',
      wordVi: 'sự sản xuất, sự chế tạo',
      pronunciation: '/ˌmænjuˈfæktʃərɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'Manufacturing cars requires a highly skilled workforce.',
      exampleVi: 'Sản xuất ô tô đòi hỏi lực lượng lao động có tay nghề cao.',
    ),
    VocabModel(
      id: 'v11_02',
      wordEn: 'assembly line',
      wordVi: 'dây chuyền lắp ráp',
      pronunciation: '/əˈsembli laɪn/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Workers on the assembly line put together the components efficiently.',
      exampleVi:
          'Công nhân trên dây chuyền lắp ráp ghép các bộ phận một cách hiệu quả.',
    ),
    VocabModel(
      id: 'v11_03',
      wordEn: 'plant management',
      wordVi: 'việc quản lý nhà máy',
      pronunciation: '/plænt ˈmænɪdʒmənt/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'Plant management is responsible for all factory operations.',
      exampleVi:
          'Ban quản lý nhà máy chịu trách nhiệm về tất cả các hoạt động của nhà máy.',
    ),
    VocabModel(
      id: 'v11_04',
      wordEn: 'quality control',
      wordVi: 'sự kiểm soát chất lượng',
      pronunciation: '/ˈkwɑːlɪti kənˈtroʊl/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Strict quality control ensures that no defective products reach customers.',
      exampleVi:
          'Kiểm soát chất lượng nghiêm ngặt đảm bảo không có sản phẩm lỗi đến tay khách hàng.',
    ),
    VocabModel(
      id: 'v11_05',
      wordEn: 'labour relations',
      wordVi: 'các mối quan hệ lao động',
      pronunciation: '/ˈleɪbər rɪˈleɪʃənz/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Good labour relations help maintain a productive work environment.',
      exampleVi:
          'Quan hệ lao động tốt giúp duy trì môi trường làm việc năng suất.',
    ),
    VocabModel(
      id: 'v11_06',
      wordEn: 'working shifts',
      wordVi: 'các ca làm việc',
      pronunciation: '/ˈwɜːrkɪŋ ʃɪfts/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'The factory operates three working shifts around the clock.',
      exampleVi: 'Nhà máy hoạt động ba ca làm việc suốt ngày đêm.',
    ),
    VocabModel(
      id: 'v11_07',
      wordEn: 'efficiency of operations',
      wordVi: 'hiệu quả hoạt động',
      pronunciation: '/ɪˈfɪʃənsi əv ˌɑːpəˈreɪʃən/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Automation has greatly improved the efficiency of operations.',
      exampleVi: 'Tự động hóa đã cải thiện đáng kể hiệu quả hoạt động.',
    ),
    VocabModel(
      id: 'v11_08',
      wordEn: 'defective',
      wordVi: 'có thiếu sót, có khiếm khuyết',
      pronunciation: '/dɪˈfektɪv/',
      partOfSpeech: 'adj',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'All defective products are removed before leaving the factory.',
      exampleVi: 'Tất cả sản phẩm bị lỗi đều bị loại bỏ trước khi rời nhà máy.',
    ),
    VocabModel(
      id: 'v11_09',
      wordEn: 'substandard',
      wordVi: 'không đạt tiêu chuẩn',
      pronunciation: '/ˌsʌbˈstændərd/',
      partOfSpeech: 'adj',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Substandard products must be discarded during the inspection phase.',
      exampleVi:
          'Sản phẩm không đạt tiêu chuẩn phải bị loại bỏ trong giai đoạn kiểm tra.',
    ),
    VocabModel(
      id: 'v11_10',
      wordEn: 'flaw',
      wordVi: 'sự thiếu sót, sai lầm',
      pronunciation: '/flɔː/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'The inspector found a flaw in the product\'s design.',
      exampleVi:
          'Người kiểm tra phát hiện ra một sai sót trong thiết kế sản phẩm.',
    ),
    VocabModel(
      id: 'v11_11',
      wordEn: 'disruption',
      wordVi: 'tình trạng trì trệ, sự gián đoạn',
      pronunciation: '/dɪsˈrʌpʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'The power outage caused a major disruption to production.',
      exampleVi: 'Mất điện gây ra sự gián đoạn lớn cho sản xuất.',
    ),
    VocabModel(
      id: 'v11_12',
      wordEn: 'skilled worker',
      wordVi: 'công nhân lành nghề',
      pronunciation: '/skɪld ˈwɜːrkər/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Skilled workers are essential for maintaining product quality.',
      exampleVi:
          'Công nhân lành nghề là yếu tố thiết yếu để duy trì chất lượng sản phẩm.',
    ),
    VocabModel(
      id: 'v11_13',
      wordEn: 'product testing',
      wordVi: 'việc thử nghiệm sản phẩm',
      pronunciation: '/ˈprɑːdʌkt ˈtestɪŋ/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Product testing is carried out before items are shipped to stores.',
      exampleVi:
          'Việc thử nghiệm sản phẩm được thực hiện trước khi hàng được giao đến cửa hàng.',
    ),
    VocabModel(
      id: 'v11_14',
      wordEn: 'packaging',
      wordVi: 'bao bì đóng gói',
      pronunciation: '/ˈpækɪdʒɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'The new packaging design attracted more customers.',
      exampleVi: 'Thiết kế bao bì mới thu hút được nhiều khách hàng hơn.',
    ),
    VocabModel(
      id: 'v11_15',
      wordEn: 'transportation',
      wordVi: 'phương tiện vận tải, sự vận chuyển',
      pronunciation: '/ˌtrænspərˈteɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'Transportation costs increased due to rising fuel prices.',
      exampleVi: 'Chi phí vận chuyển tăng do giá nhiên liệu tăng.',
    ),
    VocabModel(
      id: 'v11_16',
      wordEn: 'process',
      wordVi: 'quá trình, quy trình',
      pronunciation: '/ˈprɑːses/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'The manufacturing process involves several stages of quality checks.',
      exampleVi:
          'Quy trình sản xuất bao gồm nhiều giai đoạn kiểm tra chất lượng.',
    ),
    VocabModel(
      id: 'v11_17',
      wordEn: 'component',
      wordVi: 'bộ phận, chi tiết máy',
      pronunciation: '/kəmˈpoʊnənt/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'Each component must be inspected before assembly.',
      exampleVi: 'Mỗi bộ phận phải được kiểm tra trước khi lắp ráp.',
    ),
    VocabModel(
      id: 'v11_18',
      wordEn: 'assemble',
      wordVi: 'lắp ráp',
      pronunciation: '/əˈsembəl/',
      partOfSpeech: 'v',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'Workers assemble the parts on the production line.',
      exampleVi: 'Công nhân lắp ráp các bộ phận trên dây chuyền sản xuất.',
    ),
    VocabModel(
      id: 'v11_19',
      wordEn: 'automated',
      wordVi: 'mang tính tự động hoá',
      pronunciation: '/ˈɔːtəmeɪtɪd/',
      partOfSpeech: 'adj',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'The factory now uses an automated system to sort products.',
      exampleVi:
          'Nhà máy hiện sử dụng hệ thống tự động hóa để phân loại sản phẩm.',
    ),
    VocabModel(
      id: 'v11_20',
      wordEn: 'automation',
      wordVi: 'sự tự động hoá',
      pronunciation: '/ˌɔːtəˈmeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'Automation reduces human error and increases output.',
      exampleVi: 'Tự động hóa giảm thiểu lỗi của con người và tăng sản lượng.',
    ),
    VocabModel(
      id: 'v11_21',
      wordEn: 'delay',
      wordVi: 'sự trì hoãn, sự đình trệ',
      pronunciation: '/dɪˈleɪ/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'A machine breakdown caused a delay in production.',
      exampleVi: 'Máy móc hỏng hóc gây ra sự đình trệ trong sản xuất.',
    ),
    VocabModel(
      id: 'v11_22',
      wordEn: 'interruption',
      wordVi: 'sự gián đoạn',
      pronunciation: '/ˌɪntəˈrʌpʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Any interruption in the assembly line affects the daily output.',
      exampleVi:
          'Bất kỳ sự gián đoạn nào trên dây chuyền lắp ráp đều ảnh hưởng đến sản lượng hàng ngày.',
    ),
    VocabModel(
      id: 'v11_23',
      wordEn: 'maintenance',
      wordVi: 'sự bảo dưỡng, bảo trì',
      pronunciation: '/ˈmeɪntənəns/',
      partOfSpeech: 'n',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Regular maintenance of machines prevents unexpected breakdowns.',
      exampleVi:
          'Bảo trì máy móc thường xuyên giúp ngăn ngừa các hỏng hóc bất ngờ.',
    ),
    VocabModel(
      id: 'v11_24',
      wordEn: 'break down',
      wordVi: 'hỏng hóc',
      pronunciation: '/breɪk daʊn/',
      partOfSpeech: 'vp',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'The conveyor belt broke down and halted production for two hours.',
      exampleVi: 'Băng chuyền bị hỏng và ngừng sản xuất trong hai giờ.',
    ),
    VocabModel(
      id: 'v11_25',
      wordEn: 'severance package',
      wordVi: 'gói trợ cấp thôi việc',
      pronunciation: '/ˈsevərəns ˈpækɪdʒ/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Employees who were laid off received a generous severance package.',
      exampleVi:
          'Những nhân viên bị sa thải nhận được gói trợ cấp thôi việc hào phóng.',
    ),
    VocabModel(
      id: 'v11_26',
      wordEn: 'labor costs',
      wordVi: 'chi phí nhân công',
      pronunciation: '/ˈleɪbər kɔːsts/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Moving production overseas reduces labor costs significantly.',
      exampleVi:
          'Chuyển sản xuất ra nước ngoài làm giảm đáng kể chi phí nhân công.',
    ),
    VocabModel(
      id: 'v11_27',
      wordEn: 'creative thinking',
      wordVi: 'tư duy sáng tạo',
      pronunciation: '/kriˈeɪtɪv ˈθɪŋkɪŋ/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Creative thinking helps managers solve production problems quickly.',
      exampleVi:
          'Tư duy sáng tạo giúp các nhà quản lý giải quyết vấn đề sản xuất nhanh chóng.',
    ),
    VocabModel(
      id: 'v11_28',
      wordEn: 'come up with a solution',
      wordVi: 'nghĩ ra một giải pháp',
      pronunciation: '/kʌm ʌp wɪð ə səˈluːʃən/',
      partOfSpeech: 'vp',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'The engineering team came up with a solution to fix the machine.',
      exampleVi: 'Nhóm kỹ thuật đã nghĩ ra một giải pháp để sửa chữa máy móc.',
    ),
    VocabModel(
      id: 'v11_29',
      wordEn: 'conform to',
      wordVi: 'tuân theo, phù hợp với',
      pronunciation: '/kənˈfɔːrm tuː/',
      partOfSpeech: 'vp',
      themeId: 'theme_11_manufacturing',
      exampleEn: 'All products must conform to international safety standards.',
      exampleVi:
          'Tất cả sản phẩm phải tuân theo các tiêu chuẩn an toàn quốc tế.',
    ),
    VocabModel(
      id: 'v11_30',
      wordEn: 'problem solving',
      wordVi: 'sự giải quyết vấn đề',
      pronunciation: '/ˈprɑːbləm ˈsɑːlvɪŋ/',
      partOfSpeech: 'np',
      themeId: 'theme_11_manufacturing',
      exampleEn:
          'Problem solving is an essential skill for factory supervisors.',
      exampleVi:
          'Giải quyết vấn đề là kỹ năng thiết yếu đối với người giám sát nhà máy.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 1 Reading
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => [
    const FabVocabItem(
      wordEn: 'manufacturing',
      wordVi: 'Sản xuất',
      pronunciation: '/ˌmænjuˈfæktʃərɪŋ/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'assembly lines',
      wordVi: 'Các dây chuyền lắp ráp',
      pronunciation: '/əˈsembli laɪnz/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'quality control',
      wordVi: 'Sự kiểm soát chất lượng',
      pronunciation: '/ˈkwɑːlɪti kənˈtroʊl/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'defective',
      wordVi: 'Bị hỏng, bị lỗi',
      pronunciation: '/dɪˈfektɪv/',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'automation',
      wordVi: 'Sự tự động hoá',
      pronunciation: '/ˌɔːtəˈmeɪʃən/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'skilled worker',
      wordVi: 'Công nhân lành nghề',
      pronunciation: '/skɪld ˈwɜːrkər/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'maintenance',
      wordVi: 'Sự bảo dưỡng, bảo trì',
      pronunciation: '/ˈmeɪntənəns/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'creative thinking',
      wordVi: 'Tư duy sáng tạo',
      pronunciation: '/kriˈeɪtɪv ˈθɪŋkɪŋ/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'interruption',
      wordVi: 'Sự gián đoạn',
      pronunciation: '/ˌɪntəˈrʌpʃən/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'packaging',
      wordVi: 'Bao bì đóng gói',
      pronunciation: '/ˈpækɪdʒɪŋ/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    const FabPhraseItem(phrase: 'Be involved in', meaning: 'Tham gia vào'),
    const FabPhraseItem(
      phrase: 'Reference to sth',
      meaning: 'Sự nói đến, nhắc đến cái gì',
    ),
    const FabPhraseItem(
      phrase: 'Come up with solutions',
      meaning: 'Nghĩ ra các giải pháp',
    ),
    const FabPhraseItem(phrase: 'Break down', meaning: 'Bị hỏng hóc'),
    const FabPhraseItem(
      phrase: 'Deal with problem solving',
      meaning: 'Giải quyết các vấn đề',
    ),
    const FabPhraseItem(
      phrase: 'Pursue the Speaking/Writing test',
      meaning: 'Theo đuổi bài thi Nói/Viết',
    ),
  ];

  static List<FabAnswerItem> get readingAnswers => const [
    FabAnswerItem(vi: 'Sản xuất', en: 'Manufacturing'),
    FabAnswerItem(vi: 'trong một nhà máy', en: 'in a factory'),
    FabAnswerItem(vi: 'sẽ bao gồm', en: 'will include'),
    FabAnswerItem(vi: 'các dây chuyền lắp ráp', en: 'assembly lines'),
    FabAnswerItem(vi: 'sự kiểm soát chất lượng', en: 'quality control'),
    FabAnswerItem(vi: 'các mối quan hệ lao động', en: 'labour relations'),
    FabAnswerItem(vi: 'hiệu quả hoạt động', en: 'efficiency of operations'),
    FabAnswerItem(vi: 'tham gia vào', en: 'be involved in'),
    FabAnswerItem(vi: 'Sự khác biệt chính', en: 'The main difference'),
    FabAnswerItem(vi: 'một tòa nhà văn phòng', en: 'an office building'),
    FabAnswerItem(vi: 'bị hỏng/ bị lỗi', en: 'defective'),
    FabAnswerItem(vi: 'những lỗi', en: 'flaws'),
    FabAnswerItem(vi: 'công nhân lành nghề', en: 'skilled worker'),
    FabAnswerItem(vi: 'việc đóng gói hàng', en: 'packaging'),
    FabAnswerItem(vi: 'quá trình', en: 'process'),
    FabAnswerItem(vi: 'được lắp ráp', en: 'assembled'),
    FabAnswerItem(vi: 'sự tự động hoá', en: 'automation'),
    FabAnswerItem(vi: 'những sự gián đoạn', en: 'interruptions'),
    FabAnswerItem(vi: 'bị hỏng hóc', en: 'break down'),
    FabAnswerItem(vi: 'theo đuổi', en: 'pursue'),
    FabAnswerItem(vi: 'sự giải quyết vấn đề', en: 'problem solving'),
    FabAnswerItem(vi: 'tư duy sáng tạo', en: 'creative thinking'),
    FabAnswerItem(
      vi: 'một lời phàn nàn của khách hàng',
      en: 'a customer\'s complaint',
    ),
    FabAnswerItem(vi: 'các vấn đề về sản xuất', en: 'manufacturing problems'),
    FabAnswerItem(vi: 'nghĩ ra các giải pháp', en: 'come up with solutions'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Conversation (Factory Closure)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get conversationVocab => [
    const FabVocabItem(
      wordEn: 'shut down',
      wordVi: 'Đóng cửa (nhà máy)',
      pronunciation: '/ʃʌt daʊn/',
      partOfSpeech: 'vp',
    ),
    const FabVocabItem(
      wordEn: 'labor costs',
      wordVi: 'Chi phí nhân công',
      pronunciation: '/ˈleɪbər kɔːsts/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'transfer',
      wordVi: 'Chuyển đến',
      pronunciation: '/trænsˈfɜːr/',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'severance package',
      wordVi: 'Gói trợ cấp thôi việc',
      pronunciation: '/ˈsevərəns ˈpækɪdʒ/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'uproot',
      wordVi: 'Rời bỏ, nhổ rễ',
      pronunciation: '/ʌpˈruːt/',
      partOfSpeech: 'v',
    ),
  ];

  static List<FabPhraseItem> get conversationPhrases => const [
    FabPhraseItem(phrase: 'Shut down the factory', meaning: 'đóng cửa nhà máy'),
    FabPhraseItem(
      phrase: 'Made a final decision',
      meaning: 'Đã đưa ra quyết định cuối cùng',
    ),
    FabPhraseItem(phrase: 'On the bright side', meaning: 'về mặt tích cực'),
    FabPhraseItem(phrase: 'Come in handy', meaning: 'hữu ích, tiện dụng'),
    FabPhraseItem(phrase: 'In the long run', meaning: 'về lâu về dài'),
  ];

  static List<FabAnswerItem> get conversationAnswers => const [
    FabAnswerItem(vi: 'ban quản trị', en: 'the management'),
    FabAnswerItem(vi: 'đóng cửa nhà máy', en: 'shut down the factory'),
    FabAnswerItem(vi: 'nếu điều này xảy ra', en: 'if this happens'),
    FabAnswerItem(vi: 'phải rời công ty', en: 'have to leave the company'),
    FabAnswerItem(
      vi: 'tìm kiếm một công việc khác',
      en: 'look for another job',
    ),
    FabAnswerItem(vi: 'Thực ra', en: 'Actually'),
    FabAnswerItem(
      vi: 'đã đưa ra quyết định cuối cùng',
      en: 'made a final decision',
    ),
    FabAnswerItem(vi: 'sẽ đóng cửa nhà máy', en: 'will close the factory'),
    FabAnswerItem(vi: 'chi phí nhân công', en: 'the labor costs'),
    FabAnswerItem(vi: 'thấp hơn rất nhiều so với', en: 'much lower than'),
    FabAnswerItem(vi: 'trong 12 tháng nữa', en: 'for another 12 months'),
    FabAnswerItem(vi: 'có thể chuyển đến', en: 'can transfer to'),
    FabAnswerItem(
      vi: 'làm việc trong nhà máy mới',
      en: 'work in the new factory',
    ),
    FabAnswerItem(vi: 'rời bỏ cuộc sống của tôi', en: 'uproot my life'),
    FabAnswerItem(
      vi: 'Tất cả gia đình và bạn bè của tôi',
      en: 'All my family and friends',
    ),
    FabAnswerItem(vi: 'không có lựa chọn nào', en: 'have no choice'),
    FabAnswerItem(vi: 'Về mặt tích cực', en: 'On the bright side'),
    FabAnswerItem(vi: 'một gói trợ cấp thôi việc', en: 'a severance package'),
    FabAnswerItem(vi: 'hữu ích', en: 'come in handy'),
    FabAnswerItem(
      vi: 'trong vòng một hoặc hai tháng',
      en: 'within a month or two',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 1 (Quality Control)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk1Vocab => [
    const FabVocabItem(
      wordEn: 'strict quality control',
      wordVi: 'Kiểm soát chất lượng nghiêm ngặt',
      pronunciation: '/strɪkt ˈkwɑːlɪti kənˈtroʊl/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'defective products',
      wordVi: 'Những sản phẩm bị lỗi',
      pronunciation: '/dɪˈfektɪv ˈprɑːdʌkts/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'inspect',
      wordVi: 'Kiểm tra',
      pronunciation: '/ɪnˈspekt/',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'conform to',
      wordVi: 'Tuân theo, phù hợp với',
      pronunciation: '/kənˈfɔːrm tuː/',
      partOfSpeech: 'vp',
    ),
    const FabVocabItem(
      wordEn: 'refund',
      wordVi: 'Sự hoàn trả lại tiền',
      pronunciation: '/ˈriːfʌnd/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => const [
    FabPhraseItem(
      phrase: 'Go through strict quality control',
      meaning: 'Trải qua kiểm soát chất lượng nghiêm ngặt',
    ),
    FabPhraseItem(phrase: 'Be thrown out', meaning: 'bị loại bỏ, bị thải loại'),
    FabPhraseItem(
      phrase: 'Thoroughly inspected',
      meaning: 'Được kiểm tra tỉ mỉ',
    ),
    FabPhraseItem(
      phrase: 'Take it back to the store',
      meaning: 'Mang trả lại cửa hàng',
    ),
    FabPhraseItem(
      phrase: 'No questions asked',
      meaning: 'Không bị hỏi bất kỳ câu hỏi nào',
    ),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => const [
    FabAnswerItem(vi: 'cam kết', en: 'assure'),
    FabAnswerItem(vi: 'tất cả các sản phẩm', en: 'all the products'),
    FabAnswerItem(vi: 'sản xuất', en: 'produce'),
    FabAnswerItem(
      vi: 'việc kiểm soát chất lượng nghiêm ngặt',
      en: 'strict quality control',
    ),
    FabAnswerItem(
      vi: 'Tất cả các sản phẩm bị lỗi',
      en: 'All defective products',
    ),
    FabAnswerItem(vi: 'luôn luôn chắc chắn rằng', en: 'always be sure that'),
    FabAnswerItem(vi: 'đến với cửa hàng', en: 'reach the store'),
    FabAnswerItem(vi: 'tuân theo', en: 'conform to'),
    FabAnswerItem(vi: 'vì bất kỳ lí do nào', en: 'for any reason'),
    FabAnswerItem(vi: 'nhận thấy một sai sót', en: 'perceive a defect'),
    FabAnswerItem(
      vi: 'không hoàn toàn hài lòng với',
      en: 'are not totally satisfied with',
    ),
    FabAnswerItem(vi: 'mang nó trở lại', en: 'take it back'),
    FabAnswerItem(
      vi: 'mà không bị hỏi bất kỳ câu hỏi nào',
      en: 'no questions asked',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 2 (Return Policy)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk2Vocab => [
    const FabVocabItem(
      wordEn: 'purchase',
      wordVi: 'Hàng hoá đã mua',
      pronunciation: '/ˈpɜːrtʃəs/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'polite',
      wordVi: 'Lịch sự',
      pronunciation: '/pəˈlaɪt/',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'store credit',
      wordVi: 'Phiếu đổi hàng',
      pronunciation: '/stɔːr ˈkredɪt/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'returned goods',
      wordVi: 'Hàng hoá trả lại',
      pronunciation: '/rɪˈtɜːrnd ɡʊdz/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'assist',
      wordVi: 'Giúp đỡ, hỗ trợ',
      pronunciation: '/əˈsɪst/',
      partOfSpeech: 'v',
    ),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => const [
    FabPhraseItem(
      phrase: 'Deal with customers',
      meaning: 'Làm việc với khách hàng',
    ),
    FabPhraseItem(phrase: 'On their side', meaning: 'đứng về phía họ'),
    FabPhraseItem(
      phrase: 'In its original condition',
      meaning: 'Ở trong tình trạng ban đầu',
    ),
    FabPhraseItem(phrase: 'Offer cash back', meaning: 'hoàn trả lại tiền mặt'),
    FabPhraseItem(
      phrase: 'Rather than argue with them',
      meaning: 'Thay vì tranh cãi với họ',
    ),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => const [
    FabAnswerItem(vi: 'khi làm việc ở đây', en: 'while working here'),
    FabAnswerItem(vi: 'xử lý', en: 'deal with'),
    FabAnswerItem(vi: 'những hàng hoá đã mua của họ', en: 'their purchases'),
    FabAnswerItem(vi: 'mong muốn trả lại', en: 'wish to return'),
    FabAnswerItem(vi: 'lịch sự', en: 'polite'),
    FabAnswerItem(vi: 'trong mọi trường hợp', en: 'at all times'),
    FabAnswerItem(
      vi: 'khiến khách hàng cảm thấy rằng',
      en: 'make customers feel that',
    ),
    FabAnswerItem(vi: 'đứng về phía họ', en: 'on their side'),
    FabAnswerItem(vi: 'một mặt hàng quần áo', en: 'an item of clothing'),
    FabAnswerItem(vi: 'một cách kiên nhẫn', en: 'patiently'),
    FabAnswerItem(vi: 'tiến hành giải thích', en: 'proceed to explain'),
    FabAnswerItem(vi: 'Đó là', en: 'Namely'),
    FabAnswerItem(
      vi: 'trong tình trạng ban đầu của nó',
      en: 'in its original condition',
    ),
    FabAnswerItem(vi: 'hoàn trả lại tiền mặt', en: 'offer cash back'),
    FabAnswerItem(vi: 'các hàng hoá trả lại', en: 'returned goods'),
    FabAnswerItem(vi: 'trao cho họ phiếu đổi hàng', en: 'gives them credit'),
    FabAnswerItem(vi: 'có thể phản đối', en: 'may protest'),
    FabAnswerItem(vi: 'tranh cãi với', en: 'argue with'),
    FabAnswerItem(vi: 'giúp đỡ', en: 'assist'),
    FabAnswerItem(vi: 'về điểm này', en: 'at this point'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme11_day1',
    dayNumber: 1,
    themeId: 'theme_11_manufacturing',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      LessonPhase(
        id: 'theme11_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_43',
        contentEn:
            '''Manufacturing is about producing products in a factory and will include references to assembly lines, plant management, quality control, more labour relations, working shifts, efficiency of operations as well as some of the items described in Housing and Corporate property. Many of the same people described above will be involved in the conversations and reading. The main difference is that one group works in an office building while the other group works in a factory.

Common vocabulary: defective, sub-standard, flaws, flawed, disruption, supervisor, skilled worker, product testing, packaging, transportation, process, components, assembled, built, automated, automation, delays, delayed.

Many conversations in Listening and several passages in the Reading, deal with problem solving issues such as delays, interruptions, maintenance when things 'break down'. If a student has decided to pursue the Speaking test or the Writing test, this problem solving becomes quite important as creative thinking about how to resolve a customer's complaint is an essential task of both these tests. Therefore, carefully listening to and reading about manufacturing problems can be quite helpful in being able to come up with solutions in the Speaking and Writing tests.''',
        contentVi:
            '''Chuyên đề sản xuất là về việc sản xuất các sản phẩm trong nhà máy, và bao gồm các vấn đề liên quan đến các dây chuyền sản xuất, quản lý nhà máy, kiểm soát chất lượng, các mối quan hệ lao động, các ca làm việc, hiệu quả hoạt động cũng như một số nội dung được nhắc đến trong chuyên đề nhà đất và tài sản doanh nghiệp. Nhiều người xuất hiện trong các chuyên đề trước cũng sẽ tham gia vào các đoạn hội thoại và bài đọc của chuyên đề này. Điểm khác biệt chính ở đây là trong khi nhân sự trong chuyên đề trước làm việc trong một tòa nhà văn phòng thì nhóm nhân sự này lại làm việc trong một nhà máy.

Từ vựng thường gặp: có lỗi, không đạt tiêu chuẩn, lỗi, bị lỗi, sự gián đoạn, người giám sát, công nhân lành nghề, thử nghiệm sản phẩm, việc đóng gói hàng, phương tiện vận tải, quá trình, các cấu kiện sản phẩm, được lắp ráp, được xây dựng, được tự động hoá, sự tự động hoá, sự đình trệ, bị đình trệ.

Rất nhiều các đoạn hội thoại trong phần nghe và một vài đoạn văn trong phần đọc liên quan đến các tình huống giải quyết vấn đề như những sự đình trệ, gián đoạn, hay việc bảo trì khi máy móc bị hỏng. Nếu học viên đã quyết định sẽ tham gia vào bài thi kỹ năng nói hoặc viết thì kỹ năng giải quyết vấn đề là khá quan trọng bởi vì tư duy sáng tạo về cách giải quyết một phàn nàn của khách hàng là một yêu cầu rất quan trọng trong cả 2 bài thi nói trên. Do đó, việc nghe và đọc kỹ về các vấn đề trong chuyên đề sản xuất có thể sẽ khá hữu ích trong việc học viên có thể nghĩ ra các hướng giải quyết trong các bài thi kỹ năng nói và viết.''',
        fabVocab: Theme11Content.readingVocab,
        fabPhrases: Theme11Content.readingPhrases,
      ),
      LessonPhase(
        id: 'theme11_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_43',
        contentEn: null,
        contentVi: null,
      ),
      LessonPhase(
        id: 'theme11_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme11Content.readingAnswers,
      ),
      LessonPhase(
        id: 'theme11_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.vietnamese('Sản xuất', 'Manufacturing'),
    const MixedSegment.english(' is about producing products '),
    const MixedSegment.vietnamese('trong một nhà máy', 'in a factory'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('sẽ bao gồm', 'will include'),
    const MixedSegment.english(' references to '),
    const MixedSegment.vietnamese('các dây chuyền lắp ráp', 'assembly lines'),
    const MixedSegment.english(', plant management, '),
    const MixedSegment.vietnamese('sự kiểm soát chất lượng', 'quality control'),
    const MixedSegment.english(', more '),
    const MixedSegment.vietnamese(
      'các mối quan hệ lao động',
      'labour relations',
    ),
    const MixedSegment.english(', working shifts, '),
    const MixedSegment.vietnamese(
      'hiệu quả hoạt động',
      'efficiency of operations',
    ),
    const MixedSegment.english(
      ' as well as some of the items described in Housing and Corporate property. Many of the same people described above will ',
    ),
    const MixedSegment.vietnamese('tham gia vào', 'be involved in'),
    const MixedSegment.english(' the conversations and reading. '),
    const MixedSegment.vietnamese('Sự khác biệt chính', 'The main difference'),
    const MixedSegment.english(' is that one group works in '),
    const MixedSegment.vietnamese(
      'một tòa nhà văn phòng',
      'an office building',
    ),
    const MixedSegment.english(
      ' while the other group works in a factory. Common vocabulary: ',
    ),
    const MixedSegment.vietnamese('bị hỏng/ bị lỗi', 'defective'),
    const MixedSegment.english(', sub-standard, '),
    const MixedSegment.vietnamese('những lỗi', 'flaws'),
    const MixedSegment.english(', flawed, disruption, supervisor, '),
    const MixedSegment.vietnamese('công nhân lành nghề', 'skilled worker'),
    const MixedSegment.english(', products testing, '),
    const MixedSegment.vietnamese('việc đóng gói hàng', 'packaging'),
    const MixedSegment.english(', transportation, '),
    const MixedSegment.vietnamese('quá trình', 'process'),
    const MixedSegment.english(', components, '),
    const MixedSegment.vietnamese('được lắp ráp', 'assembled'),
    const MixedSegment.english(', built, automated, '),
    const MixedSegment.vietnamese('sự tự động hoá', 'automation'),
    const MixedSegment.english(
      ', delays, delayed. Many conversations in Listening and several passages in the Reading, deal with problem solving issues such as delays, ',
    ),
    const MixedSegment.vietnamese('những sự gián đoạn', 'interruptions'),
    const MixedSegment.english(', maintenance when things '),
    const MixedSegment.vietnamese('bị hỏng hóc', 'break down'),
    const MixedSegment.english('. If a student has decided to '),
    const MixedSegment.vietnamese('theo đuổi', 'pursue'),
    const MixedSegment.english(' the Speaking test or the Writing test, this '),
    const MixedSegment.vietnamese('sự giải quyết vấn đề', 'problem solving'),
    const MixedSegment.english(' becomes quite important as '),
    const MixedSegment.vietnamese('tư duy sáng tạo', 'creative thinking'),
    const MixedSegment.english(' about how to resolve '),
    const MixedSegment.vietnamese(
      'một lời phàn nàn của khách hàng',
      'a customer\'s complaint',
    ),
    const MixedSegment.english(
      ' is an essential task of both these tests. Therefore, carefully listening to and reading about ',
    ),
    const MixedSegment.vietnamese(
      'các vấn đề về sản xuất',
      'manufacturing problems',
    ),
    const MixedSegment.english(' can be quite helpful in being able to '),
    const MixedSegment.vietnamese(
      'nghĩ ra các giải pháp',
      'come up with solutions',
    ),
    const MixedSegment.english(' in the Speaking and Writing tests.'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme11_day2',
    dayNumber: 2,
    themeId: 'theme_11_manufacturing',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      // ── Phase 1: Listening Quiz (Practice 1 - Conversation) ──
      LessonPhase(
        id: 'theme11_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation - Factory Closure',
        titleVi: 'Luyện tập 1: Hội thoại - Đóng cửa nhà máy',
        audioTrackKey: 'track_44',
        contentEn:
            '''M: Did you know that the management was discussing plans to shut down the factory here? I mean, if this happens, it's likely that I will have to leave the company and look for another job.
W: I know. Actually, they already made a final decision on this. They will close the factory here and open a new one in Vietnam where the labor costs are much lower than in Japan. But that won't happen for another 12 months and if you want, you can transfer to Vietnam and work in the new factory.
M: I don't know about that. I don't want to uproot my life. All my family and friends are here.
W: Well, I guess you have no choice then. On the bright side, you would receive a severance package. That money would come in handy in the long run if you could find another position within a month or two.''',
        contentVi:
            '''M: Cô có biết rằng ban quản trị đang thảo luận các kế hoạch để đóng cửa nhà máy ở đây không? Ý tôi là, nếu điều này xảy ra, có khả năng tôi sẽ phải rời công ty và tìm kiếm một công việc khác.
W: Tôi biết. Thực ra, họ đã đưa ra quyết định cuối cùng về vấn đề này rồi. Họ sẽ đóng cửa nhà máy ở đây và mở một nhà máy mới ở Việt Nam, nơi mà giá nhân công thấp hơn rất nhiều so với ở Nhật Bản. Nhưng điều đó sẽ không xảy ra trong vòng 12 tháng nữa và nếu muốn, anh có thể chuyển đến Việt Nam và làm việc tại nhà máy mới đó.
M: Tôi không chắc về điều đó. Tôi không muốn rời bỏ cuộc sống của tôi ở đây. Tất cả gia đình và bạn bè tôi đều ở đây.
W: Ổ, vậy thì tôi đoán là anh không có lựa chọn nào rồi. Ở khía cạnh tích cực thì anh sẽ nhận được một gói trợ cấp thôi việc. Khoản tiền đó sẽ hữu ích về lâu về dài nếu anh có thể tìm được một vị trí khác trong vòng một hoặc hai tháng.''',
        questions: _practice1Questions,
        fabVocab: Theme11Content.conversationVocab,
        fabPhrases: Theme11Content.conversationPhrases,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 1 (D): M nói "discussing plans to shut down the factory" = Đóng cửa nhà máy.',
            en: 'Q1 (D): M says "discussing plans to shut down the factory" = Closing manufacturing facilities.',
          ),
          const FabAnswerItem(
            vi: 'Câu 2 (C): W nói "that won\'t happen for another 12 months" = Trong một năm nữa.',
            en: 'Q2 (C): W says "that won\'t happen for another 12 months" = In one year.',
          ),
          const FabAnswerItem(
            vi: 'Câu 3 (D): W nói "you would receive a severance package" = Nhận gói trợ cấp thôi việc.',
            en: 'Q3 (D): W says "you would receive a severance package" = Employees receive a severance package.',
          ),
        ],
      ),
      // ── Phase 2: Mind Game (Practice 1) ──
      LessonPhase(
        id: 'theme11_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Factory Closure',
        titleVi: 'Huấn luyện Trí nhớ: Đóng cửa nhà máy',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme11Content.conversationVocab,
        fabPhrases: Theme11Content.conversationPhrases,
        fabAnswers: Theme11Content.conversationAnswers,
      ),
      // ── Phase 3: Listening Quiz (Practice 2 - Short Talk 1) ──
      LessonPhase(
        id: 'theme11_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Product Quality Assurance',
        titleVi: 'Luyện tập 2: Bài ngắn - Đảm bảo chất lượng sản phẩm',
        audioTrackKey: 'track_45',
        contentEn:
            '''Ladies and gentlemen, we assure you that all the products that we produce here at our company go through strict quality control. All defective products are thrown out before they leave the factory. Therefore, you can always be sure that all our products that reach the store have been thoroughly inspected to make sure they conform to our high quality standards. If for any reason, however, you perceive a defect in one of our products or are not totally satisfied with it, you can take it back to the store for a one hundred percent refund, no questions asked.''',
        contentVi:
            '''Thưa các quý vị, chúng tôi khẳng định với quý vị rằng tất cả các sản phẩm mà chúng tôi sản xuất ở đây tại công ty của chúng tôi đều trải qua sự kiểm soát chất lượng nghiêm ngặt. Tất cả các sản phẩm bị lỗi đều bị loại bỏ trước khi rời nhà máy. Do đó, quý vị luôn có thể chắc chắn tất cả các sản phẩm của chúng tôi đến cửa hàng đều đã được kiểm tra tỉ mỉ để bảo đảm các sản phẩm đó tuân theo các tiêu chuẩn chất lượng cao của chúng tôi. Tuy nhiên nếu vì bất kỳ lý do nào mà quý vị nhận thấy có lỗi ở một trong các sản phẩm của chúng tôi hoặc không hoàn toàn hài lòng với sản phẩm đó, quý vị có thể mang trả lại cửa hàng và được hoàn lại số tiền 100% mà không bị hỏi bất kì câu hỏi nào.''',
        questions: _practice2Questions,
        fabVocab: Theme11Content.shortTalk1Vocab,
        fabPhrases: Theme11Content.shortTalk1Phrases,
        fabAnswers: const [
          FabAnswerItem(
            vi: 'Câu 4 (D): Bài nói hướng đến "Ladies and gentlemen" về chính sách hoàn tiền = Khách hàng.',
            en: 'Q4 (D): The talk addresses "Ladies and gentlemen" about refund policy = Customers.',
          ),
          FabAnswerItem(
            vi: 'Câu 5 (A): "All defective products are thrown out before they leave the factory" = Trước khi rời nhà máy.',
            en: 'Q5 (A): "All defective products are thrown out before they leave the factory" = Before they leave the factory.',
          ),
          FabAnswerItem(
            vi: 'Câu 6 (D): "you can take it back to the store for a one hundred percent refund" = Mang trả lại cửa hàng.',
            en: 'Q6 (D): "you can take it back to the store for a one hundred percent refund" = Return it to the store.',
          ),
        ],
      ),
      // ── Phase 4: Mind Game (Practice 2) ──
      LessonPhase(
        id: 'theme11_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Quality Assurance',
        titleVi: 'Huấn luyện Trí nhớ: Đảm bảo chất lượng',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme11Content.shortTalk1Vocab,
        fabPhrases: Theme11Content.shortTalk1Phrases,
        fabAnswers: Theme11Content.shortTalk1Answers,
      ),
      // ── Phase 5: Listening Quiz (Practice 3 - Short Talk 2) ──
      LessonPhase(
        id: 'theme11_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Store Return Policy',
        titleVi: 'Luyện tập 3: Bài ngắn - Chính sách trả hàng cửa hàng',
        audioTrackKey: 'track_46',
        contentEn:
            '''Now, while working here, you will sometimes have to deal with customers who are not satisfied with their purchases and wish to return them. It is most important to be polite and understanding at all times. You must always try to make customers feel that you are on their side and you are not defensive about them wanting to return an item of clothing. Listen to them patiently and then proceed to explain the store's policy. Namely, the customer returns the piece of clothing in its original condition and the store does not offer cash back on returned goods, but rather gives them credit they can use to buy something else in the store. Many customers may protest this, but rather than argue with them, try to assist them to find something else that they like instead. Okay, are there any questions at this point?''',
        contentVi:
            '''Vâng, trong khi làm việc ở đây, các bạn đôi khi sẽ phải làm việc với các khách hàng không hài lòng với sản phẩm mà họ đã mua và muốn trả lại chúng. Điều quan trọng nhất là phải luôn lịch sự và thấu hiểu trong mọi trường hợp. Các bạn phải luôn cố gắng làm cho khách hàng cảm thấy các bạn đứng về phía họ và không phải các bạn đang ngăn cản việc họ muốn trả lại mặt hàng quần áo nào đó. Hãy kiên nhẫn lắng nghe họ và sau đó tiến hành giải thích về chính sách của cửa hàng. Đó là, khách hàng trả lại các sản phẩm là quần áo đúng như tình trạng ban đầu và cửa hàng không hoàn lại tiền mặt cho các hàng hóa trả lại, nhưng thay vào đó, chúng ta trao cho họ phiếu đổi hàng mà họ có thể sử dụng để mua một sản phẩm khác trong cửa hàng. Nhiều khách hàng có thể phản đối điều này, nhưng thay vì tranh cãi với họ, hãy cố gắng giúp đỡ họ tìm ra sản phẩm khác mà họ thích. Vậy, có câu hỏi nào về điểm này không?''',
        questions: _practice3Questions,
        fabVocab: Theme11Content.shortTalk2Vocab,
        fabPhrases: Theme11Content.shortTalk2Phrases,
        fabAnswers: const [
          FabAnswerItem(
            vi: 'Câu 7 (D): Người nói đang giải thích chính sách xử lý hàng trả lại với nhân viên = Xử lý khiếu nại khách hàng.',
            en: 'Q7 (D): The speaker explains how to handle customer returns = Responding to a customer\'s complaint.',
          ),
          FabAnswerItem(
            vi: 'Câu 8 (A): "the customer returns the piece of clothing in its original condition" = Kiểm tra tình trạng ban đầu.',
            en: 'Q8 (A): "the customer returns the piece of clothing in its original condition" = Check that it hasn\'t been damaged.',
          ),
          FabAnswerItem(
            vi: 'Câu 9 (C): "the store...gives them credit they can use to buy something else" = Đổi sang sản phẩm khác cùng giá trị.',
            en: 'Q9 (C): "the store...gives them credit they can use to buy something else" = Customers can choose other items of the same value.',
          ),
        ],
      ),
      // ── Phase 6: Mind Game (Practice 3) ──
      LessonPhase(
        id: 'theme11_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Return Policy',
        titleVi: 'Huấn luyện Trí nhớ: Chính sách trả hàng',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme11Content.shortTalk2Vocab,
        fabPhrases: Theme11Content.shortTalk2Phrases,
        fabAnswers: Theme11Content.shortTalk2Answers,
      ),
    ],
  );

  // ═══════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ═══════════════════════════════════════════════════════════════
  static List<QuizQuestion> get _practice1Questions => [
    const QuizQuestion(
      id: 'theme11_q01',
      questionText: 'What are the speakers discussing?',
      options: [
        '(A) Hiring new workers',
        '(B) Maintaining their market shares',
        '(C) Relocating employees',
        '(D) Closing manufacturing facilities',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_44',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme11_q02',
      questionText: 'When will the factory be moving overseas?',
      options: [
        '(A) In 3 months',
        '(B) In 6 months',
        '(C) In one year',
        '(D) In 2 years',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_44',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme11_q03',
      questionText: 'What is the positive side of the management\'s decision?',
      options: [
        '(A) Employees receive a one-time payment for being let go.',
        '(B) Employees can choose to work in another factory in Japan.',
        '(C) Employees can retire early.',
        '(D) Employees receive employment assistance.',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_44',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    const QuizQuestion(
      id: 'theme11_q04',
      questionText: 'Who is this talk intended for?',
      options: [
        '(A) Store employees',
        '(B) Factory workers',
        '(C) Product inspectors',
        '(D) Customers',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_45',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme11_q05',
      questionText: 'When are the products inspected?',
      options: [
        '(A) Before they leave the factory',
        '(B) When they reach the store',
        '(C) Before customers take them home',
        '(D) After customers return them',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_45',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme11_q06',
      questionText: 'What can a customer do with a faulty product?',
      options: [
        '(A) Exchange it for another product',
        '(B) Take it back to the factory',
        '(C) Show it to an inspector',
        '(D) Return it to the store',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_45',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
      id: 'theme11_q07',
      questionText: 'What is the speaker doing?',
      options: [
        '(A) Complaining about a defective product',
        '(B) Training new sales clerks',
        '(C) Explaining how to pay for goods',
        '(D) Responding to a customer\'s complaint',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_46',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme11_q08',
      questionText:
          'What should a salesperson do first with a returned item of clothing?',
      options: [
        '(A) Check to see that it hasn\'t been damaged',
        '(B) Persuade the customer not to return it',
        '(C) Make sure the customer has paid for it',
        '(D) Explain that the store does not accept returned goods',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_46',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme11_q09',
      questionText: 'What is the store\'s policy for returned goods?',
      options: [
        '(A) Customers can get a 80% refund.',
        '(B) Customers can get a full refund.',
        '(C) Customers can choose other items of the same value.',
        '(D) Customers may not return goods after they have bought them.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_46',
      practiceNumber: 'practice3',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // MIND GAME SEGMENTS
  // ═══════════════════════════════════════════════════════════════
  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('M: Did you know that '),
    const MixedSegment.vietnamese('ban quản trị', 'the management'),
    const MixedSegment.english(' was discussing plans to '),
    const MixedSegment.vietnamese('đóng cửa nhà máy', 'shut down the factory'),
    const MixedSegment.english(' here? I mean, '),
    const MixedSegment.vietnamese('nếu điều này xảy ra', 'if this happens'),
    const MixedSegment.english(', it\'s likely that I will '),
    const MixedSegment.vietnamese(
      'phải rời công ty',
      'have to leave the company',
    ),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese(
      'tìm kiếm một công việc khác',
      'look for another job',
    ),
    const MixedSegment.english('.\nW: I know. '),
    const MixedSegment.vietnamese('Thực ra', 'Actually'),
    const MixedSegment.english(', they already '),
    const MixedSegment.vietnamese(
      'đã đưa ra quyết định cuối cùng',
      'made a final decision',
    ),
    const MixedSegment.english(' on this. They '),
    const MixedSegment.vietnamese(
      'sẽ đóng cửa nhà máy',
      'will close the factory',
    ),
    const MixedSegment.english(' here and open a new one in Vietnam where '),
    const MixedSegment.vietnamese('chi phí nhân công', 'the labor costs'),
    const MixedSegment.english(' are '),
    const MixedSegment.vietnamese(
      'thấp hơn rất nhiều so với',
      'much lower than',
    ),
    const MixedSegment.english(' in Japan. But that won\'t happen '),
    const MixedSegment.vietnamese(
      'trong 12 tháng nữa',
      'for another 12 months',
    ),
    const MixedSegment.english(' and if you want, you '),
    const MixedSegment.vietnamese('có thể chuyển đến', 'can transfer to'),
    const MixedSegment.english(' Vietnam and '),
    const MixedSegment.vietnamese(
      'làm việc trong nhà máy mới',
      'work in the new factory',
    ),
    const MixedSegment.english(
      '.\nM: I don\'t know about that. I don\'t want to ',
    ),
    const MixedSegment.vietnamese('rời bỏ cuộc sống của tôi', 'uproot my life'),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese(
      'Tất cả gia đình và bạn bè của tôi',
      'All my family and friends',
    ),
    const MixedSegment.english(' are here.\nW: Well, I guess you '),
    const MixedSegment.vietnamese('không có lựa chọn nào', 'have no choice'),
    const MixedSegment.english(' then. '),
    const MixedSegment.vietnamese('Về mặt tích cực', 'On the bright side'),
    const MixedSegment.english(', you would receive '),
    const MixedSegment.vietnamese(
      'một gói trợ cấp thôi việc',
      'a severance package',
    ),
    const MixedSegment.english('. That money would '),
    const MixedSegment.vietnamese('hữu ích', 'come in handy'),
    const MixedSegment.english(
      ' in the long run if you could find another position ',
    ),
    const MixedSegment.vietnamese(
      'trong vòng một hoặc hai tháng',
      'within a month or two',
    ),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Ladies and gentlemen, we '),
    const MixedSegment.vietnamese('cam kết', 'assure'),
    const MixedSegment.english(' you that '),
    const MixedSegment.vietnamese('tất cả các sản phẩm', 'all the products'),
    const MixedSegment.english(' that we '),
    const MixedSegment.vietnamese('sản xuất', 'produce'),
    const MixedSegment.english(' here at our company go through '),
    const MixedSegment.vietnamese(
      'việc kiểm soát chất lượng nghiêm ngặt',
      'strict quality control',
    ),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese(
      'Tất cả các sản phẩm bị lỗi',
      'All defective products',
    ),
    const MixedSegment.english(
      ' are thrown out before they leave the factory. Therefore, you can ',
    ),
    const MixedSegment.vietnamese(
      'luôn luôn chắc chắn rằng',
      'always be sure that',
    ),
    const MixedSegment.english(' all our products that '),
    const MixedSegment.vietnamese('đến với cửa hàng', 'reach the store'),
    const MixedSegment.english(
      ' have been thoroughly inspected to make sure they ',
    ),
    const MixedSegment.vietnamese('tuân theo', 'conform to'),
    const MixedSegment.english(' our high quality standards. If '),
    const MixedSegment.vietnamese('vì bất kỳ lí do nào', 'for any reason'),
    const MixedSegment.english(', however, you '),
    const MixedSegment.vietnamese('nhận thấy một sai sót', 'perceive a defect'),
    const MixedSegment.english(' in one of our products or '),
    const MixedSegment.vietnamese(
      'không hoàn toàn hài lòng với',
      'are not totally satisfied with',
    ),
    const MixedSegment.english(' it, you can '),
    const MixedSegment.vietnamese('mang nó trở lại', 'take it back'),
    const MixedSegment.english(
      ' to the store for a one hundred percent refund, ',
    ),
    const MixedSegment.vietnamese(
      'mà không bị hỏi bất kỳ câu hỏi nào',
      'no questions asked',
    ),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english('Now, '),
    const MixedSegment.vietnamese('khi làm việc ở đây', 'while working here'),
    const MixedSegment.english(', you will sometimes have to '),
    const MixedSegment.vietnamese('xử lý', 'deal with'),
    const MixedSegment.english(' customers who are not satisfied with '),
    const MixedSegment.vietnamese(
      'những hàng hoá đã mua của họ',
      'their purchases',
    ),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('mong muốn trả lại', 'wish to return'),
    const MixedSegment.english(' them. It is most important to be '),
    const MixedSegment.vietnamese('lịch sự', 'polite'),
    const MixedSegment.english(' and understanding '),
    const MixedSegment.vietnamese('trong mọi trường hợp', 'at all times'),
    const MixedSegment.english('. You must always try to '),
    const MixedSegment.vietnamese(
      'khiến khách hàng cảm thấy rằng',
      'make customers feel that',
    ),
    const MixedSegment.english(' you are '),
    const MixedSegment.vietnamese('đứng về phía họ', 'on their side'),
    const MixedSegment.english(
      ' and you are not defensive about them wanting to return ',
    ),
    const MixedSegment.vietnamese(
      'một mặt hàng quần áo',
      'an item of clothing',
    ),
    const MixedSegment.english('. Listen to them '),
    const MixedSegment.vietnamese('một cách kiên nhẫn', 'patiently'),
    const MixedSegment.english(' and then '),
    const MixedSegment.vietnamese('tiến hành giải thích', 'proceed to explain'),
    const MixedSegment.english(' the store\'s policy. '),
    const MixedSegment.vietnamese('Đó là', 'Namely'),
    const MixedSegment.english(', the customer returns the piece of clothing '),
    const MixedSegment.vietnamese(
      'trong tình trạng ban đầu của nó',
      'in its original condition',
    ),
    const MixedSegment.english(' and the store does not '),
    const MixedSegment.vietnamese('hoàn trả lại tiền mặt', 'offer cash back'),
    const MixedSegment.english(' on '),
    const MixedSegment.vietnamese('các hàng hoá trả lại', 'returned goods'),
    const MixedSegment.english(', but rather '),
    const MixedSegment.vietnamese(
      'trao cho họ phiếu đổi hàng',
      'gives them credit',
    ),
    const MixedSegment.english(
      ' they can use to buy something else in the store. Many customers ',
    ),
    const MixedSegment.vietnamese('có thể phản đối', 'may protest'),
    const MixedSegment.english(' this, but rather than '),
    const MixedSegment.vietnamese('tranh cãi với', 'argue with'),
    const MixedSegment.english(' them, try to '),
    const MixedSegment.vietnamese('giúp đỡ', 'assist'),
    const MixedSegment.english(
      ' them to find something else that they like instead. Okay, are there any questions ',
    ),
    const MixedSegment.vietnamese('về điểm này', 'at this point'),
    const MixedSegment.english('?'),
  ];
}

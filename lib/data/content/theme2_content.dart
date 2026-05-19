import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme2Content {
  // ─── THEME MODEL ──────────────────────────────────────────────
  static ThemeModel get theme => ThemeModel(
    id: 'theme_02_general_business',
    themeNumber: 2,
    titleEn: 'General Business',
    titleVi: 'Các Vấn Đề Thương Mại Tổng Quát',
    description:
        'Đàm phán, sáp nhập doanh nghiệp, hợp đồng pháp lý, chiến lược marketing, nhượng quyền thương mại và các vấn đề thương mại quốc tế.',
    iconEmoji: '💼',
    isUnlocked: false,
    totalDays: 2,
  );

  // ─── VOCABULARY ───────────────────────────────────────────────
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v02_01',
      wordEn: 'negotiation',
      wordVi: 'cuộc đàm phán',
      pronunciation: '/nɪˌɡoʊʃiˈeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'This theme will introduce negotiations and legal contracts.',
      exampleVi:
          'Chuyên đề này sẽ giới thiệu các cuộc đàm phán và hợp đồng pháp lý.',
    ),
    VocabModel(
      id: 'v02_02',
      wordEn: 'merger',
      wordVi: 'sáp nhập doanh nghiệp',
      pronunciation: '/ˈmɜːrdʒər/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'Mergers and acquisitions are common in corporate business.',
      exampleVi:
          'Mua bán và sáp nhập doanh nghiệp rất phổ biến trong kinh doanh tập đoàn.',
    ),
    VocabModel(
      id: 'v02_03',
      wordEn: 'franchise',
      wordVi: 'nhượng quyền thương mại',
      pronunciation: '/ˈfræntʃaɪz/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The company expanded through franchises across Asia.',
      exampleVi:
          'Công ty mở rộng thông qua nhượng quyền thương mại khắp châu Á.',
    ),
    VocabModel(
      id: 'v02_04',
      wordEn: 'subsidiary',
      wordVi: 'chi nhánh',
      pronunciation: '/səbˈsɪdiəri/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The subsidiary is located in Shanghai.',
      exampleVi: 'Chi nhánh đặt tại Thượng Hải.',
    ),
    VocabModel(
      id: 'v02_05',
      wordEn: 'headquarters',
      wordVi: 'trụ sở chính',
      pronunciation: '/ˈhedˌkwɔːrtərz/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'You will go to the head office every quarter.',
      exampleVi: 'Bạn sẽ đến trụ sở chính mỗi quý.',
    ),
    VocabModel(
      id: 'v02_06',
      wordEn: 'consultancy',
      wordVi: 'dịch vụ tư vấn',
      pronunciation: '/kənˈsʌltənsi/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'She works for a leading consulting firm in Tokyo.',
      exampleVi: 'Cô ấy làm việc cho một công ty tư vấn hàng đầu tại Tokyo.',
    ),
    VocabModel(
      id: 'v02_07',
      wordEn: 'warranty',
      wordVi: 'bảo hành',
      pronunciation: '/ˈwɔːrənti/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The contract includes guarantees and warranties.',
      exampleVi: 'Hợp đồng bao gồm các cam kết và bảo hành.',
    ),
    VocabModel(
      id: 'v02_08',
      wordEn: 'enterprise',
      wordVi: 'doanh nghiệp',
      pronunciation: '/ˈentərpraɪz/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'Students need to understand how a large enterprise works.',
      exampleVi: 'Người học cần hiểu cách một doanh nghiệp lớn hoạt động.',
    ),
    VocabModel(
      id: 'v02_09',
      wordEn: 'contract',
      wordVi: 'hợp đồng',
      pronunciation: '/ˈkɒntrækt/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'I have questions before I sign this contract.',
      exampleVi: 'Tôi có câu hỏi trước khi ký hợp đồng này.',
    ),
    VocabModel(
      id: 'v02_10',
      wordEn: 'compensation',
      wordVi: 'bồi thường',
      pronunciation: '/ˌkɒmpənˈseɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The other side may seek compensation.',
      exampleVi: 'Bên kia có thể đòi bồi thường.',
    ),
    VocabModel(
      id: 'v02_11',
      wordEn: 'performance',
      wordVi: 'thành tích, hiệu quả',
      pronunciation: '/pərˈfɔːrməns/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'Training will improve your sales performance.',
      exampleVi: 'Huấn luyện sẽ nâng cao thành tích bán hàng của bạn.',
    ),
    VocabModel(
      id: 'v02_12',
      wordEn: 'quarter',
      wordVi: 'quý (1/4 năm)',
      pronunciation: '/ˈkwɔːrtər/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn:
          'Training sessions are held at the beginning of every quarter.',
      exampleVi: 'Các buổi huấn luyện được tổ chức vào đầu mỗi quý.',
    ),
    VocabModel(
      id: 'v02_13',
      wordEn: 'keynote speaker',
      wordVi: 'diễn giả chính',
      pronunciation: '/ˈkiːnoʊt ˈspiːkər/',
      partOfSpeech: 'np',
      themeId: 'theme_02_general_business',
      exampleEn: 'Lee Kim will be our keynote speaker.',
      exampleVi: 'Bà Lee Kim sẽ là diễn giả chính của chúng ta.',
    ),
    VocabModel(
      id: 'v02_14',
      wordEn: 'penalty',
      wordVi: 'hình phạt',
      pronunciation: '/ˈpenəlti/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'Will there be any penalties imposed?',
      exampleVi: 'Sẽ có bất kỳ hình phạt nào được áp dụng hay không?',
    ),
    VocabModel(
      id: 'v02_15',
      wordEn: 'corporation',
      wordVi: 'tập đoàn, công ty lớn',
      pronunciation: '/ˌkɔːrpəˈreɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'She works for ADC Corporation, a leading consulting firm.',
      exampleVi:
          'Cô ấy làm việc cho tập đoàn ADC, một công ty tư vấn hàng đầu.',
    ),
    VocabModel(
      id: 'v02_16',
      wordEn: 'sign a contract',
      wordVi: 'ký hợp đồng',
      pronunciation: '/saɪn ə ˈkɒntrækt/',
      partOfSpeech: 'vp',
      themeId: 'theme_02_general_business',
      exampleEn: 'You should read carefully before you sign a contract.',
      exampleVi: 'Bạn nên đọc kỹ trước khi ký hợp đồng.',
    ),
    VocabModel(
      id: 'v02_17',
      wordEn: 'clear up',
      wordVi: 'làm rõ, giải quyết',
      pronunciation: '/klɪər ʌp/',
      partOfSpeech: 'vp',
      themeId: 'theme_02_general_business',
      exampleEn: 'We need to clear up some points in the agreement.',
      exampleVi: 'Chúng ta cần làm rõ một vài điểm trong bản thỏa thuận.',
    ),
    VocabModel(
      id: 'v02_18',
      wordEn: 'lawyer',
      wordVi: 'luật sư',
      pronunciation: '/ˈlɔːjər/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The company hired a lawyer to review the legal contract.',
      exampleVi: 'Công ty đã thuê một luật sư để xem xét hợp đồng pháp lý.',
    ),
    VocabModel(
      id: 'v02_19',
      wordEn: 'bond',
      wordVi: 'trái phiếu',
      pronunciation: '/bɑːnd/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'Investing in government bonds is generally considered safe.',
      exampleVi: 'Đầu tư vào trái phiếu chính phủ thường được coi là an toàn.',
    ),
    VocabModel(
      id: 'v02_20',
      wordEn: 'buy-out',
      wordVi: 'mua lại, thôn tính (doanh nghiệp)',
      pronunciation: '/ˈbaɪaʊt/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The management team led a successful buy-out of the company.',
      exampleVi: 'Nhóm quản lý đã dẫn dắt một cuộc thu mua công ty thành công.',
    ),
    VocabModel(
      id: 'v02_21',
      wordEn: 'legal counsel',
      wordVi: 'cố vấn pháp lý',
      pronunciation: '/ˈliːɡəl ˈkaʊnsl/',
      partOfSpeech: 'np',
      themeId: 'theme_02_general_business',
      exampleEn: 'Our legal counsel recommended revising the terms.',
      exampleVi:
          'Cố vấn pháp lý của chúng tôi khuyên nên sửa lại các điều khoản.',
    ),
    VocabModel(
      id: 'v02_22',
      wordEn: 'chief executive officer',
      wordVi: 'tổng giám đốc điều hành (CEO)',
      pronunciation: '/ˌtʃiːf ɪɡˈzekjətɪv ˈɑːfɪsər/',
      partOfSpeech: 'np',
      themeId: 'theme_02_general_business',
      exampleEn: 'The CEO announced a new strategic plan.',
      exampleVi:
          'Tổng giám đốc điều hành đã công bố một kế hoạch chiến lược mới.',
    ),
    VocabModel(
      id: 'v02_23',
      wordEn: 'board of directors',
      wordVi: 'ban giám đốc, hội đồng quản trị',
      pronunciation: '/bɔːrd əv dɪˈrektərz/',
      partOfSpeech: 'np',
      themeId: 'theme_02_general_business',
      exampleEn: 'The board of directors met to discuss the merger.',
      exampleVi: 'Hội đồng quản trị đã họp để thảo luận về việc sáp nhập.',
    ),
    VocabModel(
      id: 'v02_24',
      wordEn: 'stock option',
      wordVi: 'quyền chọn mua cổ phiếu',
      pronunciation: '/stɑːk ˈɑːpʃn/',
      partOfSpeech: 'np',
      themeId: 'theme_02_general_business',
      exampleEn: 'The company offers stock options to its senior employees.',
      exampleVi:
          'Công ty cung cấp quyền chọn mua cổ phiếu cho nhân viên cấp cao.',
    ),
    VocabModel(
      id: 'v02_25',
      wordEn: 'chain',
      wordVi: 'chuỗi (cửa hàng, hệ thống)',
      pronunciation: '/tʃeɪn/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'They own a large retail chain across the country.',
      exampleVi: 'Họ sở hữu một chuỗi bán lẻ lớn trên toàn quốc.',
    ),
    VocabModel(
      id: 'v02_26',
      wordEn: 'retailing',
      wordVi: 'việc bán lẻ, ngành bán lẻ',
      pronunciation: '/ˈriːteɪlɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'Innovation is key to success in modern retailing.',
      exampleVi: 'Đổi mới là chìa khóa thành công trong ngành bán lẻ hiện đại.',
    ),
    VocabModel(
      id: 'v02_27',
      wordEn: 'expert',
      wordVi: 'chuyên gia',
      pronunciation: '/ˈekspɜːrt/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn:
          'We consulted a financial expert before making the investment.',
      exampleVi:
          'Chúng tôi đã tham khảo ý kiến chuyên gia tài chính trước khi đầu tư.',
    ),
    VocabModel(
      id: 'v02_28',
      wordEn: 'workshop',
      wordVi: 'buổi hội thảo, buổi tập huấn',
      pronunciation: '/ˈwɜːrkʃɑːp/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The workshop focused on international communication.',
      exampleVi: 'Buổi tập huấn tập trung vào giao tiếp quốc tế.',
    ),
    VocabModel(
      id: 'v02_29',
      wordEn: 'specific',
      wordVi: 'cụ thể',
      pronunciation: '/spəˈsɪfɪk/',
      partOfSpeech: 'adj',
      themeId: 'theme_02_general_business',
      exampleEn: 'There are a lot of specific terms that need to be learned.',
      exampleVi: 'Có rất nhiều thuật ngữ cụ thể cần phải học.',
    ),
    VocabModel(
      id: 'v02_30',
      wordEn: 'entrepreneurial',
      wordVi: 'mang tính doanh nhân',
      pronunciation: '/ˌɒntrəprəˈnɜːriəl/',
      partOfSpeech: 'adj',
      themeId: 'theme_02_general_business',
      exampleEn: 'He has an entrepreneurial spirit.',
      exampleVi: 'Anh ấy có tinh thần doanh nhân.',
    ),
    VocabModel(
      id: 'v02_31',
      wordEn: 'mergers & acquisitions',
      wordVi: 'mua bán và sáp nhập doanh nghiệp',
      pronunciation: '/ˈmɜːrdʒərz ænd ˌækwɪˈzɪʃənz/',
      partOfSpeech: 'np',
      themeId: 'theme_02_general_business',
      exampleEn: 'The company specializes in mergers and acquisitions.',
      exampleVi: 'Công ty chuyên về mua bán và sáp nhập doanh nghiệp.',
    ),
    VocabModel(
      id: 'v02_32',
      wordEn: 'chief financial officer',
      wordVi: 'giám đốc tài chính (CFO)',
      pronunciation: '/tʃiːf faɪˈnæns ˈɒfɪsər/',
      partOfSpeech: 'np',
      themeId: 'theme_02_general_business',
      exampleEn:
          'The CFO is responsible for the company\'s financial planning.',
      exampleVi:
          'Giám đốc tài chính chịu trách nhiệm lập kế hoạch tài chính của công ty.',
    ),
    VocabModel(
      id: 'v02_33',
      wordEn: 'mutual fund',
      wordVi: 'quỹ tương hỗ',
      pronunciation: '/ˈmjuːtʃuəl fʌnd/',
      partOfSpeech: 'np',
      themeId: 'theme_02_general_business',
      exampleEn: 'They invested their savings in a mutual fund.',
      exampleVi: 'Họ đã đầu tư tiền tiết kiệm của mình vào một quỹ tương hỗ.',
    ),
    VocabModel(
      id: 'v02_34',
      wordEn: 'advertisement',
      wordVi: 'mục quảng cáo, sự quảng cáo',
      pronunciation: '/ədˈvɜːrtɪsmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn:
          'We saw an advertisement for the new product in the newspaper.',
      exampleVi: 'Chúng tôi thấy một mẩu quảng cáo cho sản phẩm mới trên báo.',
    ),
    VocabModel(
      id: 'v02_35',
      wordEn: 'labour',
      wordVi: 'lao động',
      pronunciation: '/ˈleɪbər/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The company is facing a shortage of skilled labour.',
      exampleVi:
          'Công ty đang đối mặt với tình trạng thiếu hụt lao động lành nghề.',
    ),
    VocabModel(
      id: 'v02_36',
      wordEn: 'strategy',
      wordVi: 'chiến lược',
      pronunciation: '/ˈstrætədʒi/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'Our marketing strategy focuses on social media.',
      exampleVi:
          'Chiến lược marketing của chúng tôi tập trung vào mạng xã hội.',
    ),
    VocabModel(
      id: 'v02_37',
      wordEn: 'division',
      wordVi: 'ban, bộ phận',
      pronunciation: '/dɪˈvɪʒən/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'He was promoted to head of the sales division.',
      exampleVi: 'Anh ấy được thăng chức lên đứng đầu bộ phận bán hàng.',
    ),
    VocabModel(
      id: 'v02_38',
      wordEn: 'stock',
      wordVi: 'cổ phiếu',
      pronunciation: '/stɒk/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The company\'s stock price increased significantly.',
      exampleVi: 'Giá cổ phiếu của công ty đã tăng đáng kể.',
    ),
    VocabModel(
      id: 'v02_39',
      wordEn: 'reference',
      wordVi: 'sự tham chiếu, sự nhắc đến',
      pronunciation: '/ˈrefrəns/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'Please include a reference to the previous report.',
      exampleVi: 'Vui lòng bao gồm một sự nhắc đến báo cáo trước đó.',
    ),
    VocabModel(
      id: 'v02_40',
      wordEn: 'solicitor',
      wordVi: 'luật sư đại diện, luật sư tư vấn',
      pronunciation: '/səˈlɪsɪtər/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'We need to consult a solicitor about this legal matter.',
      exampleVi: 'Chúng ta cần tham khảo ý kiến luật sư về vấn đề pháp lý này.',
    ),
  ];

  // ─── FAB DATA: Từ vựng cần nắm vững ────────────────────────────
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

  static List<FabPhraseItem> get readingPhrases => [
    const FabPhraseItem(phrase: 'Rather than sth', meaning: 'Hơn là cái gì'),
    const FabPhraseItem(
      phrase: 'Such as',
      meaning: 'Như là (dùng để liệt kê các danh từ sau nó)',
    ),
    const FabPhraseItem(
      phrase: 'Need doing sth',
      meaning:
          'Cần được làm gì (cấu trúc mang tính bị động) = need to be pp/done',
    ),
    const FabPhraseItem(
      phrase: 'Anything but',
      meaning: 'Bất cứ cái gì ngoại trừ',
    ),
    const FabPhraseItem(phrase: 'Related to', meaning: 'Liên quan tới'),
    const FabPhraseItem(
      phrase: 'Reference to',
      meaning: 'Nhắc đến, tham chiếu tới',
    ),
    const FabPhraseItem(
      phrase: 'Look after',
      meaning: 'Trông nom, chăm sóc, quan tâm',
    ),
  ];

  // ─── FAB ANSWERS DATA ─────────────────────────────────────────
  static List<FabAnswerItem> get day1Answers => [
    const FabAnswerItem(vi: 'là về bất cứ điều gì', en: 'is anything'),
    const FabAnswerItem(vi: 'trong lĩnh vực tài chính', en: 'in finance'),
    const FabAnswerItem(vi: 'các thuật ngữ đặc trưng', en: 'specific terms'),
    const FabAnswerItem(vi: 'cần được học', en: 'need to be learned'),
    const FabAnswerItem(vi: 'liên quan tới', en: 'related to'),
    const FabAnswerItem(vi: 'hơn là', en: 'rather than'),
    const FabAnswerItem(vi: 'các cuộc đàm phán', en: 'negotiations'),
    const FabAnswerItem(vi: 'các hợp đồng pháp lý', en: 'legal contracts'),
    const FabAnswerItem(vi: 'các vấn đề bảo hành', en: 'warranties'),
    const FabAnswerItem(vi: 'hiệu quả bán hàng', en: 'sales performance'),
    const FabAnswerItem(vi: 'việc nhượng quyền kinh doanh', en: 'franchises'),
    const FabAnswerItem(vi: 'thôn tính doanh nghiệp', en: 'buy-outs'),
    const FabAnswerItem(vi: 'nghề luật', en: 'legal profession'),
    const FabAnswerItem(vi: 'luật sư', en: 'lawyer'),
    const FabAnswerItem(vi: 'cố vấn pháp lý', en: 'legal counsel'),
    const FabAnswerItem(vi: 'chi nhánh', en: 'subsidiary'),
    const FabAnswerItem(
      vi: 'tổng giám đốc điều hành',
      en: 'chief executive officer',
    ),
    const FabAnswerItem(vi: 'ban giám đốc', en: 'board of directors'),
    const FabAnswerItem(vi: 'quyền mua cổ phiếu', en: 'stock options'),
    const FabAnswerItem(vi: 'Doanh nghiệp lớn', en: 'Corporate business'),
    const FabAnswerItem(vi: 'quốc tế', en: 'international'),
    const FabAnswerItem(vi: 'những thuật ngữ như là', en: 'such terms as'),
    const FabAnswerItem(vi: 'các phòng ban', en: 'departments'),
    const FabAnswerItem(vi: 'chuỗi', en: 'chain'),
    const FabAnswerItem(vi: 'một doanh nghiệp lớn', en: 'a large enterprise'),
    const FabAnswerItem(vi: 'cũng sẽ được nghe thấy', en: 'will also be heard'),
    const FabAnswerItem(vi: 'Bán lẻ', en: 'Retailing'),
    const FabAnswerItem(vi: 'Văn phòng', en: 'Offices'),
    const FabAnswerItem(
      vi: 'các doanh nghiệp địa phương',
      en: 'local businesses',
    ),
    const FabAnswerItem(vi: 'thường là về', en: 'are usually about'),
    const FabAnswerItem(vi: 'cần được sửa', en: 'need fixing'),
    const FabAnswerItem(vi: 'các tờ báo địa phương', en: 'local newspapers'),
    const FabAnswerItem(vi: 'các đồ dùng văn phòng', en: 'office supplies'),
    const FabAnswerItem(vi: 'tại các chợ địa phương', en: 'at local markets'),
    const FabAnswerItem(vi: 'các cửa hàng bán lẻ', en: 'retail shops'),
    const FabAnswerItem(vi: 'cần được sửa', en: 'need fixing'),
  ];

  static List<FabAnswerItem> get conversationAnswers => [
    const FabAnswerItem(vi: 'một vài câu hỏi', en: 'a few questions'),
    const FabAnswerItem(vi: 'ký hợp đồng này', en: 'sign this contract'),
    const FabAnswerItem(vi: 'làm rõ', en: 'clear up'),
    const FabAnswerItem(vi: 'vài điểm quan trọng', en: 'some important points'),
    const FabAnswerItem(vi: 'còn thiếu', en: 'missing'),
    const FabAnswerItem(vi: 'cần thiết', en: 'necessary'),
    const FabAnswerItem(vi: 'ký bất kỳ cái gì', en: 'sign anything'),
    const FabAnswerItem(vi: 'vấn đề', en: 'the problem'),
    const FabAnswerItem(vi: 'một bên', en: 'one party'),
    const FabAnswerItem(vi: 'đã đồng ý', en: 'has agreed'),
    const FabAnswerItem(vi: 'bất cứ hình phạt nào', en: 'any penalties'),
    const FabAnswerItem(vi: 'không tuân thủ', en: 'fails to uphold'),
    const FabAnswerItem(vi: 'bên còn lại', en: 'the other side'),
  ];

  // ─── SHORT TALK ANSWERS ───────────────────────────────────────

  static List<FabAnswerItem> get shortTalk1Answers => [
    const FabAnswerItem(
      vi: 'một thông báo quan trọng',
      en: 'an important announcement',
    ),
    const FabAnswerItem(vi: 'các nhà quản lý khác', en: 'the other managers'),
    const FabAnswerItem(vi: 'đã đi đến kết luận', en: 'came to the conclusion'),
    const FabAnswerItem(
      vi: 'tăng doanh số bán hàng của chúng ta',
      en: 'increase our sales',
    ),
    const FabAnswerItem(vi: 'một thực tế rõ ràng', en: 'a known fact'),
    const FabAnswerItem(
      vi: 'một đội ngũ bán hàng mạnh',
      en: 'a strong sales team',
    ),
    const FabAnswerItem(vi: 'sức mạnh', en: 'the force'),
    const FabAnswerItem(vi: 'những người bán hàng', en: 'the salespeople'),
    const FabAnswerItem(vi: 'xắn tay áo họ lên', en: 'roll up their sleeves'),
    const FabAnswerItem(vi: 'đã quyết định', en: 'decided'),
    const FabAnswerItem(vi: 'đạt doanh số bán hàng', en: 'get the sales'),
    const FabAnswerItem(vi: 'trụ sở chính', en: 'the head office'),
    const FabAnswerItem(
      vi: 'vào đầu mỗi quý',
      en: 'at the beginning of every quarter',
    ),
    const FabAnswerItem(
      vi: 'nhận được sự huấn luyện thích hợp',
      en: 'get the proper training',
    ),
    const FabAnswerItem(
      vi: 'thành tích bán hàng của bạn',
      en: 'your sales performance',
    ),
    const FabAnswerItem(
      vi: 'những chuyên gia bán hàng hàng đầu',
      en: 'the top sales experts',
    ),
    const FabAnswerItem(
      vi: 'tạo ra mọi sự khác biệt',
      en: 'make all the difference',
    ),
    const FabAnswerItem(
      vi: 'sẽ có thể đạt được mục tiêu',
      en: 'will be able to reach the goal',
    ),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => [
    const FabAnswerItem(
      vi: 'buổi hội thảo ngày hôm nay',
      en: "today's workshop",
    ),
    const FabAnswerItem(vi: 'muốn lưu ý', en: 'would like to remind'),
    const FabAnswerItem(vi: 'trong ba ngày tới', en: 'for the next three days'),
    const FabAnswerItem(
      vi: 'có được điều gì đó mới mẻ và hữu ích',
      en: 'have something new and useful',
    ),
    const FabAnswerItem(
      vi: 'nâng cao thành tích của bạn',
      en: 'improve your performance',
    ),
    const FabAnswerItem(
      vi: 'đàm phán các hợp đồng quốc tế',
      en: 'negotiating international contracts',
    ),
    const FabAnswerItem(
      vi: 'giao tiếp thương mại quốc tế',
      en: 'international business communications',
    ),
    const FabAnswerItem(
      vi: 'việc giao tiếp hiệu quả',
      en: 'effective communication',
    ),
    const FabAnswerItem(vi: 'đặc biệt là', en: 'especially'),
    const FabAnswerItem(
      vi: 'giao tiếp một cách hiệu quả',
      en: 'communicate effectively',
    ),
    const FabAnswerItem(vi: 'biết chắc chắn', en: 'know for sure'),
    const FabAnswerItem(vi: 'bị ngạc nhiên', en: 'be surprised'),
    const FabAnswerItem(vi: 'một chuyên gia về', en: 'an expert on'),
    const FabAnswerItem(
      vi: 'diễn giả chính của chúng ta',
      en: 'our keynote speaker',
    ),
    const FabAnswerItem(vi: 'kinh doanh quốc tế', en: 'international business'),
    const FabAnswerItem(vi: 'ở nhiều thành phố', en: 'in various cities'),
    const FabAnswerItem(vi: 'chỉ là vài ví dụ', en: 'just to name a few'),
    const FabAnswerItem(vi: 'đang làm việc cho', en: 'working for'),
    const FabAnswerItem(
      vi: 'một công ty tư vấn hàng đầu',
      en: 'a leading consulting firm',
    ),
  ];

  // ─── DAY 1 ────────────────────────────────────────────────────
  static LessonDay get day1 => LessonDay(
    id: 'theme_02_day1',
    dayNumber: 1,
    themeId: 'theme_02_general_business',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      // PHASE 1: READ & LISTEN
      LessonPhase(
        id: 'theme02_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_07',
        contentEn:
            '''This theme is anything but 'general'. As in finance, there are a lot of specific terms that need to be learned. The terms are related to 'corporate' business rather than small entrepreneurial businesses.

Corporate business tends to be national and international rather than local and students will need to understand such terms as divisions, departments, branches, chain, and how a large enterprise works.

This theme will introduce negotiations, corporate mergers, acquisitions, legal contracts, guarantees and warranties, marketing strategies, sales, human relations, franchises, consultancy services, compensation, buy-outs. We will also meet some people such as professional consultants, attorneys or lawyers, and legal counsel. Useful nouns would be: branch, headquarters, CEO (chief executive officer), CFO (chief financial officer), president, board of directors, mutual fund, stock options.''',
        contentVi:
            '''Chuyên đề này đề cập tới mọi chủ đề nhưng chỉ ở mức độ tổng quát. Như khi nói về tài chính, sẽ có rất nhiều các thuật ngữ cụ thể cần được học. Các thuật ngữ liên quan tới các doanh nghiệp lớn nhiều hơn là những doanh nghiệp nhỏ hay hộ kinh doanh. Chuyên đề này sẽ giới thiệu các nội dung về đàm phán, sáp nhập doanh nghiệp, mua bán doanh nghiệp, hợp đồng pháp lý, bảo hành và bảo dưỡng, chiến lược marketing, việc bán hàng, các quan hệ nhân sự, nhượng quyền thương mại, dịch vụ tư vấn, bồi thường hợp đồng lao động, thôn tính doanh nghiệp. Chúng ta cũng sẽ gặp những từ về nghề luật như luật sư, luật sư đại diện, cố vấn pháp lý. Những danh từ phổ biến hay dùng có thể là: chi nhánh, trụ sở chính, tổng giám đốc điều hành, tổng giám đốc tài chính, chủ tịch, ban giám đốc, quỹ tương hỗ, trái phiếu, quyền chọn cổ phiếu.

---
Các doanh nghiệp ở đây thường có phạm vi quốc gia và quốc tế hơn là các công ty địa phương, và người học sẽ cần phải hiểu những thuật ngữ như các ban, các phòng, chi nhánh, chuỗi, và cách mà một doanh nghiệp lớn hoạt động. Bạn cũng có thể nghe những hội thoại trong doanh nghiệp nhỏ nhưng những hội thoại này thường xuất hiện ở những chuyên đề khác như Bán lẻ hay Văn phòng mà có liên quan tới doanh nghiệp địa phương. Các hội thoại đó thường nói về các cuộc họp nhỏ, máy tính hay máy phô-tô mà cần sửa chữa, những mẩu quảng cáo nhỏ cho báo địa phương, tờ rơi, tờ giới thiệu, và mua sắm đồ văn phòng. Việc đi mua sắm cũng được nhắc đến, nhưng thường ở chợ địa phương hay siêu thị, cửa hàng bán lẻ nhỏ và cửa hàng bách hóa.''',
        fabVocab: Theme2Content.readingVocab,
        fabPhrases: Theme2Content.readingPhrases,
      ),

      // PHASE 2: TRANSLATE
      LessonPhase(
        id: 'theme02_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_07',
        contentEn:
            '''This theme is anything but 'general'. As in finance, there are a lot of specific terms that need to be learned. The terms are related to 'corporate' business rather than small entrepreneurial businesses.

Corporate business tends to be national and international rather than local and students will need to understand such terms as divisions, departments, branches, chain, and how a large enterprise works.

Small business conversations will also be heard but these usually come under different themes such as 'Retailing' or 'Offices' and relate to local businesses.''',
        contentVi:
            '''Chuyên đề này đề cập tới mọi chủ đề nhưng chỉ ở mức độ tổng quát. Như khi nói về tài chính, sẽ có rất nhiều các thuật ngữ cụ thể cần được học. Các thuật ngữ liên quan tới các doanh nghiệp lớn nhiều hơn là những doanh nghiệp nhỏ hay hộ kinh doanh.

Các doanh nghiệp ở đây thường có phạm vi quốc gia và quốc tế hơn là các công ty địa phương, và người học sẽ cần phải hiểu những thuật ngữ như các ban, các phòng, chi nhánh, chuỗi, và cách mà một doanh nghiệp lớn hoạt động.

Bạn cũng có thể nghe những hội thoại trong doanh nghiệp nhỏ nhưng những hội thoại này thường xuất hiện ở những chuyên đề khác như Bán lẻ hay Văn phòng mà có liên quan tới doanh nghiệp địa phương.''',
        fabVocab: Theme2Content.readingVocab,
        fabPhrases: Theme2Content.readingPhrases,
      ),

      // PHASE 3: MIND GAME
      LessonPhase(
        id: 'theme02_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game',
        titleVi: 'Bước 3: Trò chơi Tư duy',
        mixedSegments: _day1MindGameSegments,
        fabVocab: Theme2Content.readingVocab,
        fabPhrases: Theme2Content.readingPhrases,
        fabAnswers: Theme2Content.day1Answers,
      ),

      // PHASE 4: VOCABULARY
      LessonPhase(
        id: 'theme02_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
        fabVocab: Theme2Content.readingVocab,
        fabPhrases: Theme2Content.readingPhrases,
      ),
    ],
  );

  // ─── DAY 1 MIND GAME SEGMENTS ─────────────────────────────────
  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('This theme '),
    const MixedSegment.vietnamese('là về bất cứ điều gì', 'is anything'),
    const MixedSegment.english(" but 'general'. As "),
    const MixedSegment.vietnamese('trong lĩnh vực tài chính', 'in finance'),
    const MixedSegment.english(', there are a lot of '),
    const MixedSegment.vietnamese('các thuật ngữ đặc trưng', 'specific terms'),
    const MixedSegment.english(' that '),
    const MixedSegment.vietnamese('cần được học', 'need to be learned'),
    const MixedSegment.english('. The terms are '),
    const MixedSegment.vietnamese('liên quan tới', 'related to'),
    const MixedSegment.english(" 'corporate' business "),
    const MixedSegment.vietnamese('hơn là', 'rather than'),
    const MixedSegment.english(
      ' small entrepreneurial businesses. This theme will introduce ',
    ),
    const MixedSegment.vietnamese('các cuộc đàm phán', 'negotiations'),
    const MixedSegment.english(', mergers, acquisitions, '),
    const MixedSegment.vietnamese('các hợp đồng pháp lý', 'legal contracts'),
    const MixedSegment.english(', guarantees and '),
    const MixedSegment.vietnamese('các vấn đề bảo hành', 'warranties'),
    const MixedSegment.english(', marketing strategies, '),
    const MixedSegment.vietnamese('hiệu quả bán hàng', 'sales performance'),
    const MixedSegment.english(', labour relations, '),
    const MixedSegment.vietnamese('việc nhượng quyền kinh doanh', 'franchises'),
    const MixedSegment.english(', consultancy, '),
    const MixedSegment.vietnamese('thôn tính doanh nghiệp', 'buy-outs'),
    const MixedSegment.english(
      ', take-overs. There will often be references to the ',
    ),
    const MixedSegment.vietnamese('nghề luật', 'legal profession'),
    const MixedSegment.english(' such as '),
    const MixedSegment.vietnamese('luật sư', 'lawyer'),
    const MixedSegment.english(', solicitor, '),
    const MixedSegment.vietnamese('cố vấn pháp lý', 'legal counsel'),
    const MixedSegment.english('. Other common general nouns: '),
    const MixedSegment.vietnamese('chi nhánh', 'subsidiary'),
    const MixedSegment.english(', headquarters, '),
    const MixedSegment.vietnamese(
      'tổng giám đốc điều hành',
      'chief executive officer',
    ),
    const MixedSegment.english(', chief financial officer, chairman, '),
    const MixedSegment.vietnamese('ban giám đốc', 'board of directors'),
    const MixedSegment.english(', mutual funds, bonds, '),
    const MixedSegment.vietnamese('quyền mua cổ phiếu', 'stock options'),
    const MixedSegment.english('.\n\n'),
    const MixedSegment.vietnamese('Doanh nghiệp lớn', 'Corporate business'),
    const MixedSegment.english(' tends to be national and '),
    const MixedSegment.vietnamese('quốc tế', 'international'),
    const MixedSegment.english(
      ' rather than local and students will need to understand ',
    ),
    const MixedSegment.vietnamese('những thuật ngữ như là', 'such terms as'),
    const MixedSegment.english(' divisions, '),
    const MixedSegment.vietnamese('các phòng ban', 'departments'),
    const MixedSegment.english(', branches, '),
    const MixedSegment.vietnamese('chuỗi', 'chain'),
    const MixedSegment.english(', and how '),
    const MixedSegment.vietnamese('một doanh nghiệp lớn', 'a large enterprise'),
    const MixedSegment.english(' works. Small business conversations '),
    const MixedSegment.vietnamese(
      'cũng sẽ được nghe thấy',
      'will also be heard',
    ),
    const MixedSegment.english(
      " but these usually come under different themes such as '",
    ),
    const MixedSegment.vietnamese('Bán lẻ', 'Retailing'),
    const MixedSegment.english("' or '"),
    const MixedSegment.vietnamese('Văn phòng', 'Offices'),
    const MixedSegment.english("' and relate to "),
    const MixedSegment.vietnamese(
      'các doanh nghiệp địa phương',
      'local businesses',
    ),
    const MixedSegment.english('. Conversations here '),
    const MixedSegment.vietnamese('thường là về', 'are usually about'),
    const MixedSegment.english(
      ' small meetings, computers or photocopiers that ',
    ),
    const MixedSegment.vietnamese('cần được sửa', 'need fixing'),
    const MixedSegment.english(', small advertisements for '),
    const MixedSegment.vietnamese('các tờ báo địa phương', 'local newspapers'),
    const MixedSegment.english(', flyers and brochures, and buying '),
    const MixedSegment.vietnamese('các đồ dùng văn phòng', 'office supplies'),
    const MixedSegment.english('. Shopping is involved, usually '),
    const MixedSegment.vietnamese('tại các chợ địa phương', 'at local markets'),
    const MixedSegment.english(', supermarkets, small '),
    const MixedSegment.vietnamese('các cửa hàng bán lẻ', 'retail shops'),
    const MixedSegment.english(' as well as department stores.'),
  ];

  // ─── DAY 2 ────────────────────────────────────────────────────
  static LessonDay get day2 => LessonDay(
    id: 'theme02_day2',
    dayNumber: 2,
    themeId: 'theme_02_general_business',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      // PHASE 1: Quiz Practice 1 - Conversation
      LessonPhase(
        id: 'theme02_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation - Contract Clarification',
        titleVi: 'Luyện tập 1: Hội thoại - Làm rõ hợp đồng',
        audioTrackKey: 'track_08',
        questions: _practice1Questions,
        fabVocab: Theme2Content.conversationVocab,
        fabPhrases: Theme2Content.readingPhrases,
      ),

      // PHASE 2: Quiz Practice 2 - Short Talk 1
      LessonPhase(
        id: 'theme02_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Sales Training Announcement',
        titleVi: 'Luyện tập 2: Bài ngắn - Thông báo huấn luyện bán hàng',
        audioTrackKey: 'track_09',
        questions: _practice2Questions,
        fabVocab: Theme2Content.shortTalk1Vocab,
        fabPhrases: Theme2Content.readingPhrases,
      ),

      // PHASE 3: Quiz Practice 3 - Short Talk 2
      LessonPhase(
        id: 'theme02_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - International Business Workshop',
        titleVi: 'Luyện tập 3: Bài ngắn - Hội thảo thương mại quốc tế',
        audioTrackKey: 'track_10',
        questions: _practice3Questions,
        fabVocab: Theme2Content.shortTalk2Vocab,
        fabPhrases: Theme2Content.readingPhrases,
      ),

      // PHASE 4: Mind Game - Conversation
      LessonPhase(
        id: 'theme02_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Contract Conversation',
        titleVi: 'Huấn luyện Trí nhớ: Hội thoại Hợp đồng',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme2Content.conversationVocab,
        fabPhrases: Theme2Content.readingPhrases,
        fabAnswers: Theme2Content.conversationAnswers,
      ),

      // PHASE 5: Mind Game - Short Talk 1
      LessonPhase(
        id: 'theme02_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Sales Announcement',
        titleVi: 'Huấn luyện Trí nhớ: Thông báo Bán hàng',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme2Content.shortTalk1Vocab,
        fabPhrases: Theme2Content.readingPhrases,
        fabAnswers: Theme2Content.shortTalk1Answers,
      ),

      // PHASE 6: Mind Game - Short Talk 2
      LessonPhase(
        id: 'theme02_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Workshop Speech',
        titleVi: 'Huấn luyện Trí nhớ: Bài phát biểu Hội thảo',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme2Content.shortTalk2Vocab,
        fabPhrases: Theme2Content.readingPhrases,
        fabAnswers: Theme2Content.shortTalk2Answers,
      ),
    ],
  );

  // ─── PRACTICE 1 QUESTIONS ─────────────────────────────────────
  static List<QuizQuestion> get _practice1Questions => [
    const QuizQuestion(
      id: 'theme02_q01',
      questionText: 'What is this conversation about?',
      options: [
        'A clarification of the terms of the contract',
        'A fight about a contract in a court of law',
        'A desire to cancel a contract',
        'A discussion to terminate a contract',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_08',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme02_q02',
      questionText: 'What does the woman want to know?',
      options: [
        'The duration of the contract',
        'The consequences of breaking the contract',
        'The procedure of making changes',
        'The probability of cancelling the contract',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_08',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme02_q03',
      questionText: 'What is true about the contract?',
      options: [
        'It can be cancelled given 30 days of prior notice.',
        'A breach of terms will result in a penalty.',
        'It will be renewed next year.',
        'It has been missing for a week.',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_08',
      practiceNumber: 'practice1',
    ),
  ];

  // ─── PRACTICE 2 QUESTIONS ─────────────────────────────────────
  static List<QuizQuestion> get _practice2Questions => [
    const QuizQuestion(
      id: 'theme02_q04',
      questionText: 'What will the company do to improve their sales?',
      options: [
        'Produce better quality products',
        'Train their staff to do a better job',
        'Hold a sales event every three months',
        'Hire more sales staff',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_09',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme02_q05',
      questionText: 'How often will the training sessions be held?',
      options: [
        'Once a week',
        'Once a month',
        'Once every three months',
        'Once a year',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_09',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme02_q06',
      questionText: 'When do they hope to obtain their sales target?',
      options: [
        'By the end of the month',
        'In three months',
        'In six months',
        'By the end of the year',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_09',
      practiceNumber: 'practice2',
    ),
  ];

  // ─── PRACTICE 3 QUESTIONS ─────────────────────────────────────
  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
      id: 'theme02_q07',
      questionText: 'Who is most likely the audience of this speech?',
      options: [
        'School teachers',
        'Shopkeepers',
        'Corporation employees',
        'New immigrants',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_10',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme02_q08',
      questionText: 'What is the subject of the workshop?',
      options: [
        'How to travel in Asian countries',
        'How to break into the Chinese market',
        'How to learn Asian languages',
        'How to converse with Asians',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_10',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme02_q09',
      questionText: 'According to the talk, what is true about Lee Kim?',
      options: [
        'She is from Korea.',
        'She speaks many languages.',
        'She spent many years abroad.',
        'She is now running an auditing company.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_10',
      practiceNumber: 'practice3',
    ),
  ];

  // ─── DAY 2 MIND GAME: CONVERSATION ───────────────────────────
  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('W: Excuse me, Mr. Luis. I have '),
    const MixedSegment.vietnamese('một vài câu hỏi', 'a few questions'),
    const MixedSegment.english(' I need to ask before I '),
    const MixedSegment.vietnamese('ký hợp đồng này', 'sign this contract'),
    const MixedSegment.english('. Can you help me '),
    const MixedSegment.vietnamese('làm rõ', 'clear up'),
    const MixedSegment.english(' a few things? There are '),
    const MixedSegment.vietnamese(
      'vài điểm quan trọng',
      'some important points',
    ),
    const MixedSegment.english(' that seem to be '),
    const MixedSegment.vietnamese('còn thiếu', 'missing'),
    const MixedSegment.english('.\n\nM: Sure. It is '),
    const MixedSegment.vietnamese('cần thiết', 'necessary'),
    const MixedSegment.english(' to know what we are agreeing to before we '),
    const MixedSegment.vietnamese('ký bất kỳ cái gì', 'sign anything'),
    const MixedSegment.english('. So, what seems to be '),
    const MixedSegment.vietnamese('vấn đề', 'the problem'),
    const MixedSegment.english('?\n\nW: Well. I just want to know if '),
    const MixedSegment.vietnamese('một bên', 'one party'),
    const MixedSegment.english(' fails to do what it '),
    const MixedSegment.vietnamese('đã đồng ý', 'has agreed'),
    const MixedSegment.english(' to do, will there be '),
    const MixedSegment.vietnamese('bất cứ hình phạt nào', 'any penalties'),
    const MixedSegment.english(
      ' imposed?\n\nM: Of course there are. It says here that if one side ',
    ),
    const MixedSegment.vietnamese('không tuân thủ', 'fails to uphold'),
    const MixedSegment.english(' the contract, '),
    const MixedSegment.vietnamese('bên còn lại', 'the other side'),
    const MixedSegment.english(' may seek compensation.'),
  ];

  // ─── DAY 2 MIND GAME: SHORT TALK 1 ───────────────────────────
  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Attention everybody. I have '),
    const MixedSegment.vietnamese(
      'một thông báo quan trọng',
      'an important announcement',
    ),
    const MixedSegment.english(' to make. In a meeting with '),
    const MixedSegment.vietnamese('các nhà quản lý khác', 'the other managers'),
    const MixedSegment.english(' yesterday, we '),
    const MixedSegment.vietnamese(
      'đã đi đến kết luận',
      'came to the conclusion',
    ),
    const MixedSegment.english(' that we must do everything to '),
    const MixedSegment.vietnamese(
      'tăng doanh số bán hàng của chúng ta',
      'increase our sales',
    ),
    const MixedSegment.english(' this year. It is '),
    const MixedSegment.vietnamese('một thực tế rõ ràng', 'a known fact'),
    const MixedSegment.english(' that '),
    const MixedSegment.vietnamese(
      'một đội ngũ bán hàng mạnh',
      'a strong sales team',
    ),
    const MixedSegment.english(' is '),
    const MixedSegment.vietnamese('sức mạnh', 'the force'),
    const MixedSegment.english(
      ' behind any successful company, especially companies like us. What good is a great product if ',
    ),
    const MixedSegment.vietnamese('những người bán hàng', 'the salespeople'),
    const MixedSegment.english(' do not '),
    const MixedSegment.vietnamese('xắn tay áo họ lên', 'roll up their sleeves'),
    const MixedSegment.english(' and sell it? Therefore, we have '),
    const MixedSegment.vietnamese('đã quyết định', 'decided'),
    const MixedSegment.english(' to do something to help you '),
    const MixedSegment.vietnamese('đạt doanh số bán hàng', 'get the sales'),
    const MixedSegment.english(
      ' you want. From now to the end of the year, you will be going to ',
    ),
    const MixedSegment.vietnamese('trụ sở chính', 'the head office'),
    const MixedSegment.english(' for a week '),
    const MixedSegment.vietnamese(
      'vào đầu mỗi quý',
      'at the beginning of every quarter',
    ),
    const MixedSegment.english(' to '),
    const MixedSegment.vietnamese(
      'nhận được sự huấn luyện thích hợp',
      'get the proper training',
    ),
    const MixedSegment.english(' you need to improve '),
    const MixedSegment.vietnamese(
      'thành tích bán hàng của bạn',
      'your sales performance',
    ),
    const MixedSegment.english('. You will be trained by '),
    const MixedSegment.vietnamese(
      'những chuyên gia bán hàng hàng đầu',
      'the top sales experts',
    ),
    const MixedSegment.english(
      ' in the industry to get the skills you need, and I believe that will ',
    ),
    const MixedSegment.vietnamese(
      'tạo ra mọi sự khác biệt',
      'make all the difference',
    ),
    const MixedSegment.english(
      '. We are hoping that by December of this year, we ',
    ),
    const MixedSegment.vietnamese(
      'sẽ có thể đạt được mục tiêu',
      'will be able to reach the goal',
    ),
    const MixedSegment.english(
      ' we set for ourselves at the beginning of this year.',
    ),
  ];

  // ─── DAY 2 MIND GAME: SHORT TALK 2 ───────────────────────────
  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english(
      'Good morning, everybody and welcome all of you to ',
    ),
    const MixedSegment.vietnamese(
      'buổi hội thảo ngày hôm nay',
      "today's workshop",
    ),
    const MixedSegment.english('. Before we start, I '),
    const MixedSegment.vietnamese('muốn lưu ý', 'would like to remind'),
    const MixedSegment.english(' you that we are going to be busy '),
    const MixedSegment.vietnamese(
      'trong ba ngày tới',
      'for the next three days',
    ),
    const MixedSegment.english(' and I hope everyone will '),
    const MixedSegment.vietnamese(
      'có được điều gì đó mới mẻ và hữu ích',
      'have something new and useful',
    ),
    const MixedSegment.english(' to take away to '),
    const MixedSegment.vietnamese(
      'nâng cao thành tích của bạn',
      'improve your performance',
    ),
    const MixedSegment.english(' in '),
    const MixedSegment.vietnamese(
      'đàm phán các hợp đồng quốc tế',
      'negotiating international contracts',
    ),
    const MixedSegment.english(
      '. Over the next three days, we will be working on ',
    ),
    const MixedSegment.vietnamese(
      'giao tiếp thương mại quốc tế',
      'international business communications',
    ),
    const MixedSegment.english(', and will be focusing on '),
    const MixedSegment.vietnamese(
      'việc giao tiếp hiệu quả',
      'effective communication',
    ),
    const MixedSegment.english(' with business people in Asia, '),
    const MixedSegment.vietnamese('đặc biệt là', 'especially'),
    const MixedSegment.english(
      ' those who come from Japan, India, and China. Some of you might think you already know how to ',
    ),
    const MixedSegment.vietnamese(
      'giao tiếp một cách hiệu quả',
      'communicate effectively',
    ),
    const MixedSegment.english(' in whatever situation you are in, but I '),
    const MixedSegment.vietnamese('biết chắc chắn', 'know for sure'),
    const MixedSegment.english(', everyone will '),
    const MixedSegment.vietnamese('bị ngạc nhiên', 'be surprised'),
    const MixedSegment.english(
      ' by something we learn over the next few days. Lee Kim, ',
    ),
    const MixedSegment.vietnamese('một chuyên gia về', 'an expert on'),
    const MixedSegment.english(
      ' international business communication will be ',
    ),
    const MixedSegment.vietnamese(
      'diễn giả chính của chúng ta',
      'our keynote speaker',
    ),
    const MixedSegment.english(
      ' and trainer in this workshop. Ms. Kim has more than 15 years of experience in ',
    ),
    const MixedSegment.vietnamese(
      'kinh doanh quốc tế',
      'international business',
    ),
    const MixedSegment.english(' and has worked '),
    const MixedSegment.vietnamese('ở nhiều thành phố', 'in various cities'),
    const MixedSegment.english(
      ' including Beijing, Jakarta, Adelaide, Seoul and Hiroshima ',
    ),
    const MixedSegment.vietnamese('chỉ là vài ví dụ', 'just to name a few'),
    const MixedSegment.english('. She is now '),
    const MixedSegment.vietnamese('đang làm việc cho', 'working for'),
    const MixedSegment.english(' ADC Corporation, '),
    const MixedSegment.vietnamese(
      'một công ty tư vấn hàng đầu',
      'a leading consulting firm',
    ),
    const MixedSegment.english(' located in Tokyo.'),
  ];
}

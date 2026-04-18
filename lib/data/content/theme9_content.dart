import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme9Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_09_finance_budgeting',
    themeNumber: 9,
    titleEn: 'Finance and Budgeting',
    titleVi: 'Tài Chính và Dự Thảo Ngân Sách',
    description:
        'Tài chính, ngân hàng, kế toán, lập hoá đơn, đầu tư, cổ phiếu, thuế, báo cáo tài chính.',
    iconEmoji: '💰',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY (30 từ)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v09_01',
      wordEn: 'finance',
      wordVi: 'tài chính',
      pronunciation: '/ˈfaɪnæns/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Finance is important for managing money and investments.',
      exampleVi: 'Tài chính rất quan trọng để quản lý tiền bạc và đầu tư.',
    ),
    VocabModel(
      id: 'v09_02',
      wordEn: 'budgeting',
      wordVi: 'dự thảo ngân sách',
      pronunciation: '/ˈbʌdʒɪtɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Budgeting helps companies plan their expenses.',
      exampleVi: 'Dự thảo ngân sách giúp công ty lên kế hoạch chi phí.',
    ),
    VocabModel(
      id: 'v09_03',
      wordEn: 'banking',
      wordVi: 'ngành ngân hàng',
      pronunciation: '/ˈbæŋkɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Banking services include deposits and loans.',
      exampleVi: 'Dịch vụ ngân hàng bao gồm gửi tiền và cho vay.',
    ),
    VocabModel(
      id: 'v09_04',
      wordEn: 'accounting',
      wordVi: 'ngành kế toán',
      pronunciation: '/əˈkaʊntɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Accounting records all financial transactions.',
      exampleVi: 'Kế toán ghi lại tất cả các giao dịch tài chính.',
    ),
    VocabModel(
      id: 'v09_05',
      wordEn: 'investment',
      wordVi: 'sự đầu tư',
      pronunciation: '/ɪnˈvestmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Investing in stocks can help grow your money.',
      exampleVi: 'Đầu tư vào cổ phiếu có thể giúp tăng tiền của bạn.',
    ),
    VocabModel(
      id: 'v09_06',
      wordEn: 'stocks',
      wordVi: 'cổ phiếu',
      pronunciation: '/stɑːks/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Stock prices change every day.',
      exampleVi: 'Giá cổ phiếu thay đổi mỗi ngày.',
    ),
    VocabModel(
      id: 'v09_07',
      wordEn: 'tax',
      wordVi: 'thuế',
      pronunciation: '/tæks/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Income tax is required by law.',
      exampleVi: 'Thuế thu nhập là bắt buộc theo luật pháp.',
    ),
    VocabModel(
      id: 'v09_08',
      wordEn: 'profit',
      wordVi: 'lợi nhuận',
      pronunciation: '/ˈprɑːfɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The company made a profit of 5 million dollars.',
      exampleVi: 'Công ty đã kiếm được lợi nhuận 5 triệu đô la.',
    ),
    VocabModel(
      id: 'v09_09',
      wordEn: 'loss',
      wordVi: 'thua lỗ',
      pronunciation: '/lɔːs/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The business suffered a loss last quarter.',
      exampleVi: 'Doanh nghiệp chịu thua lỗ vào quý trước.',
    ),
    VocabModel(
      id: 'v09_10',
      wordEn: 'financial statement',
      wordVi: 'báo cáo tài chính',
      pronunciation: '/faɪˈnænʃəl ˈsteɪtmənt/',
      partOfSpeech: 'np',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The financial statement shows all income and expenses.',
      exampleVi: 'Báo cáo tài chính cho thấy tất cả thu nhập và chi phí.',
    ),
    VocabModel(
      id: 'v09_11',
      wordEn: 'credit',
      wordVi: 'tín dụng',
      pronunciation: '/ˈkredɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Credit allows you to buy now and pay later.',
      exampleVi: 'Tín dụng cho phép bạn mua bây giờ và trả tiền sau.',
    ),
    VocabModel(
      id: 'v09_12',
      wordEn: 'debit',
      wordVi: 'ghi nợ',
      pronunciation: '/ˈdebɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'A debit decreases your account balance.',
      exampleVi: 'Ghi nợ làm giảm số dư tài khoản của bạn.',
    ),
    VocabModel(
      id: 'v09_13',
      wordEn: 'bill',
      wordVi: 'hoá đơn',
      pronunciation: '/bɪl/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Please pay your electricity bill on time.',
      exampleVi: 'Vui lòng thanh toán hoá đơn điện của bạn đúng hạn.',
    ),
    VocabModel(
      id: 'v09_14',
      wordEn: 'balance',
      wordVi: 'số dư tài khoản',
      pronunciation: '/ˈbæləns/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Your account balance is \$5000.',
      exampleVi: 'Số dư tài khoản của bạn là 5000 đô la.',
    ),
    VocabModel(
      id: 'v09_15',
      wordEn: 'accountant',
      wordVi: 'nhân viên kế toán',
      pronunciation: '/əˈkaʊntənt/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The accountant reviewed all financial records.',
      exampleVi: 'Nhân viên kế toán đã xem xét tất cả các bản ghi tài chính.',
    ),
    VocabModel(
      id: 'v09_16',
      wordEn: 'audit',
      wordVi: 'kiểm toán',
      pronunciation: '/ˈɔːdɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The company undergoes an audit every year.',
      exampleVi: 'Công ty được kiểm toán mỗi năm.',
    ),
    VocabModel(
      id: 'v09_17',
      wordEn: 'auditor',
      wordVi: 'kiểm toán viên',
      pronunciation: '/ˈɔːdɪtər/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The auditor found no errors in the accounts.',
      exampleVi: 'Kiểm toán viên không tìm thấy lỗi nào trong tài khoản.',
    ),
    VocabModel(
      id: 'v09_18',
      wordEn: 'deposit',
      wordVi: 'gửi tiền',
      pronunciation: '/dɪˈpɑːzɪt/',
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'I deposit \$500 into my savings account.',
      exampleVi: 'Tôi gửi 500 đô la vào tài khoản tiết kiệm của tôi.',
    ),
    VocabModel(
      id: 'v09_19',
      wordEn: 'withdraw',
      wordVi: 'rút tiền',
      pronunciation: '/wɪðˈdrɔː/',
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'I need to withdraw cash from the ATM.',
      exampleVi: 'Tôi cần rút tiền mặt từ cây ATM.',
    ),
    VocabModel(
      id: 'v09_20',
      wordEn: 'mortgage',
      wordVi: 'khoản vay thế chấp',
      pronunciation: '/ˈmɔːrɡɪdʒ/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'A home mortgage is a long-term loan.',
      exampleVi: 'Khoản vay thế chấp nhà là một khoản vay dài hạn.',
    ),
    VocabModel(
      id: 'v09_21',
      wordEn: 'calculate',
      wordVi: 'tính toán',
      pronunciation: '/ˈkælkjuleɪt/',
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The accountant calculated the total revenue.',
      exampleVi: 'Nhân viên kế toán đã tính tổng doanh thu.',
    ),
    VocabModel(
      id: 'v09_22',
      wordEn: 'invoice',
      wordVi: 'hoá đơn',
      pronunciation: '/ˈɪnvɔɪs/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The invoice shows all charges and taxes.',
      exampleVi: 'Hoá đơn cho thấy tất cả chi phí và thuế.',
    ),
    VocabModel(
      id: 'v09_23',
      wordEn: 'revenue',
      wordVi: 'doanh thu',
      pronunciation: '/ˈrevənuː/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The company\'s revenue increased by 20%.',
      exampleVi: 'Doanh thu của công ty tăng 20%.',
    ),
    VocabModel(
      id: 'v09_24',
      wordEn: 'expense',
      wordVi: 'chi phí',
      pronunciation: '/ɪkˈspens/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Operating expenses are high this quarter.',
      exampleVi: 'Chi phí hoạt động cao vào quý này.',
    ),
    VocabModel(
      id: 'v09_25',
      wordEn: 'payment',
      wordVi: 'thanh toán',
      pronunciation: '/ˈpeɪmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The payment is due on the 15th.',
      exampleVi: 'Thanh toán đến hạn vào ngày 15.',
    ),
    VocabModel(
      id: 'v09_26',
      wordEn: 'interest',
      wordVi: 'lãi suất',
      pronunciation: '/ˈɪntrəst/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The interest rate is 5% per year.',
      exampleVi: 'Lãi suất là 5% mỗi năm.',
    ),
    VocabModel(
      id: 'v09_27',
      wordEn: 'loan',
      wordVi: 'khoản vay',
      pronunciation: '/loʊn/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'I applied for a personal loan.',
      exampleVi: 'Tôi đã nộp đơn xin khoản vay cá nhân.',
    ),
    VocabModel(
      id: 'v09_28',
      wordEn: 'budget',
      wordVi: 'ngân sách',
      pronunciation: '/ˈbʌdʒɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The marketing budget is \$100,000.',
      exampleVi: 'Ngân sách tiếp thị là 100,000 đô la.',
    ),
    VocabModel(
      id: 'v09_29',
      wordEn: 'return on investment',
      wordVi: 'tỷ suất hoàn vốn',
      pronunciation: '/rɪˈtɜːrn ɑːn ɪnˈvestmənt/',
      partOfSpeech: 'np',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The ROI for this project is 25%.',
      exampleVi: 'Tỷ suất hoàn vốn cho dự án này là 25%.',
    ),
    VocabModel(
      id: 'v09_30',
      wordEn: 'share price',
      wordVi: 'giá cổ phiếu',
      pronunciation: '/ʃer praɪs/',
      partOfSpeech: 'np',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The share price dropped by 10%.',
      exampleVi: 'Giá cổ phiếu giảm 10%.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 1 Reading Vocabulary
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => [
    FabVocabItem(
      wordEn: 'finance',
      wordVi: 'Tài chính',
      pronunciation: '/ˈfaɪnæns/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'accounting',
      wordVi: 'Kế toán',
      pronunciation: '/əˈkaʊntɪŋ/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'profit',
      wordVi: 'Lợi nhuận',
      pronunciation: '/ˈprɑːfɪt/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'loss',
      wordVi: 'Thua lỗ',
      pronunciation: '/lɔːs/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'revenue',
      wordVi: 'Doanh thu',
      pronunciation: '/ˈrevənuː/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'calculate',
      wordVi: 'Tính toán',
      pronunciation: '/ˈkælkjuleɪt/',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'figure',
      wordVi: 'Số liệu',
      pronunciation: '/ˈfɪɡər/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'report',
      wordVi: 'Báo cáo',
      pronunciation: '/rɪˈpɔːrt/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'accountant',
      wordVi: 'Nhân viên kế toán',
      pronunciation: '/əˈkaʊntənt/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'statement',
      wordVi: 'Báo cáo',
      pronunciation: '/ˈsteɪtmənt/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    FabPhraseItem(phrase: 'Make calculations', meaning: 'Tính toán'),
    FabPhraseItem(
      phrase: 'Play a significant role',
      meaning: 'Đóng vai trò quan trọng',
    ),
    FabPhraseItem(phrase: 'Differentiate between', meaning: 'Phân biệt giữa'),
    FabPhraseItem(phrase: 'Be engaged in', meaning: 'Tham gia vào'),
    FabPhraseItem(phrase: 'Get used to', meaning: 'Làm quen với'),
    FabPhraseItem(phrase: 'Analyze a report', meaning: 'Phân tích báo cáo'),
    FabPhraseItem(phrase: 'Facts and figures', meaning: 'Dữ kiện và số liệu'),
  ];

  static List<FabAnswerItem> get readingAnswers => [
    FabAnswerItem(vi: 'Từ vựng', en: 'Lexicon'),
    FabAnswerItem(vi: 'Rất quan trọng', en: 'very important'),
    FabAnswerItem(vi: 'Liên quan trực tiếp đến', en: 'related directly to'),
    FabAnswerItem(vi: 'Tài chính', en: 'finance'),
    FabAnswerItem(vi: 'Ngân hàng', en: 'banking'),
    FabAnswerItem(vi: 'Kế toán', en: 'accounting'),
    FabAnswerItem(vi: 'Lập hoá đơn', en: 'invoicing'),
    FabAnswerItem(vi: 'Đầu tư', en: 'investments'),
    FabAnswerItem(vi: 'Cổ phiếu', en: 'stocks'),
    FabAnswerItem(vi: 'Thuế', en: 'taxes'),
    FabAnswerItem(vi: 'Phải tính toán', en: 'may have to make calculations'),
    FabAnswerItem(vi: 'Đóng vai trò quan trọng', en: 'play a significant role'),
    FabAnswerItem(vi: 'Có khả năng phân biệt', en: 'be able to differentiate'),
    FabAnswerItem(vi: 'Bảy mươi', en: 'seventy'),
    FabAnswerItem(vi: 'Mười bảy', en: 'seventeen'),
    FabAnswerItem(vi: 'Trong các bản ghi âm', en: 'on the recordings'),
    FabAnswerItem(vi: 'Sự khác biệt', en: 'the difference'),
    FabAnswerItem(vi: 'Tham gia vào', en: 'are engaged in'),
    FabAnswerItem(vi: 'Tốc độ hội thoại', en: 'conversational rate of speech'),
    FabAnswerItem(vi: 'Cao tương đương với', en: 'as high as'),
    FabAnswerItem(vi: 'Làm quen với', en: 'get used to'),
    FabAnswerItem(vi: 'Đạt mức trung bình', en: 'averages'),
    FabAnswerItem(vi: 'Các số liệu', en: 'figures'),
    FabAnswerItem(vi: 'Cột', en: 'column'),
    FabAnswerItem(vi: 'Lợi nhuận', en: 'profit'),
    FabAnswerItem(vi: 'Thua lỗ', en: 'loss'),
    FabAnswerItem(vi: 'Báo cáo tài chính', en: 'financial statement'),
    FabAnswerItem(vi: 'Tín dụng', en: 'credit'),
    FabAnswerItem(vi: 'Ghi nợ', en: 'debit'),
    FabAnswerItem(vi: 'Hoá đơn', en: 'bill'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Conversation Vocabulary
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get conversationVocab => [
    FabVocabItem(
      wordEn: 'copies',
      wordVi: 'Bản sao',
      pronunciation: '/ˈkɑːpiz/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'alterations',
      wordVi: 'Thay đổi',
      pronunciation: '/ˌɔːltəˈreɪʃənz/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'shareholders',
      wordVi: 'Cổ đông',
      pronunciation: '/ˈʃeərhoʊldərz/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'mistake',
      wordVi: 'Sai sót',
      pronunciation: '/mɪˈsteɪk/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'corrections',
      wordVi: 'Chỉnh sửa',
      pronunciation: '/kəˈrekʃənz/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get conversationPhrases => [
    FabPhraseItem(phrase: 'Make copies', meaning: 'Phô-tô bản'),
    FabPhraseItem(phrase: 'Financial report', meaning: 'Báo cáo tài chính'),
    FabPhraseItem(phrase: 'Make alterations', meaning: 'Thực hiện thay đổi'),
    FabPhraseItem(
      phrase: 'Deliver to shareholders',
      meaning: 'Chuyển tới cổ đông',
    ),
    FabPhraseItem(phrase: 'Make a mistake', meaning: 'Mắc sai sót'),
  ];

  static List<FabAnswerItem> get conversationAnswers => [
    FabAnswerItem(
      vi: 'Bản báo cáo tài chính quý trước',
      en: 'the last quarter financial report',
    ),
    FabAnswerItem(vi: 'Cuộc họp', en: 'our meeting'),
    FabAnswerItem(vi: 'Thực hiện thay đổi', en: 'make a few alterations'),
    FabAnswerItem(
      vi: 'Chuyển tới cổ đông',
      en: 'is delivered to the shareholders',
    ),
    FabAnswerItem(vi: 'Sẵn sàng', en: 'ready'),
    FabAnswerItem(vi: 'Chưa phô-tô', en: 'haven\'t made any copies'),
    FabAnswerItem(vi: 'Thực hiện bất kỳ thay đổi', en: 'make any changes'),
    FabAnswerItem(vi: 'Nên thực hiện ngay', en: 'we\'d better do it now'),
    FabAnswerItem(vi: 'Mắc sai sót', en: 'made a mistake'),
    FabAnswerItem(vi: 'Tổng doanh thu', en: 'the total revenue'),
    FabAnswerItem(vi: 'Dẫn đến', en: 'resulted in'),
    FabAnswerItem(vi: 'Đưa lại báo cáo', en: 'giving back the report'),
    FabAnswerItem(vi: 'Phòng kế toán', en: 'the accounting department'),
    FabAnswerItem(vi: 'Chỉnh sửa', en: 'make the corrections'),
    FabAnswerItem(vi: 'Làm ngay', en: 'do it right away'),
    FabAnswerItem(vi: 'Gửi bản sao', en: 'send you a copy of the report'),
    FabAnswerItem(vi: 'Hoàn thành', en: 'is finished'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 1 Vocabulary (Stock Market)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk1Vocab => [
    FabVocabItem(
      wordEn: 'stock market',
      wordVi: 'Thị trường chứng khoán',
      pronunciation: '/ˈstɑːk ˈmɑːrkɪt/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'shares dropped',
      wordVi: 'Giá giảm',
      pronunciation: '/ʃerz drɑːpt/',
      partOfSpeech: 'vp',
    ),
    FabVocabItem(
      wordEn: 'revenue expectations',
      wordVi: 'Kỳ vọng doanh thu',
      pronunciation: '/ˈrevənuː ɪkˌspektˈeɪʃənz/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'percentage',
      wordVi: 'Phần trăm',
      pronunciation: '/pərˈsentɪdʒ/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'decline',
      wordVi: 'Sụt giảm',
      pronunciation: '/dɪˈklaɪn/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
    FabPhraseItem(phrase: 'Stock prices dropped', meaning: 'Giá cổ phiếu giảm'),
    FabPhraseItem(
      phrase: 'Miss revenue expectations',
      meaning: 'Không đạt kỳ vọng doanh thu',
    ),
    FabPhraseItem(phrase: 'Cut back prediction', meaning: 'Cắt giảm dự báo'),
    FabPhraseItem(phrase: 'Close at a price', meaning: 'Chốt phiên ở mức giá'),
    FabPhraseItem(phrase: 'Previous low', meaning: 'Mức thấp trước'),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => [
    FabAnswerItem(vi: 'Đài phát thanh', en: 'radio station'),
    FabAnswerItem(vi: 'Tin tức mới nhất', en: 'the latest news'),
    FabAnswerItem(vi: 'Thị trường chứng khoán', en: 'the stock market'),
    FabAnswerItem(vi: 'Cổ phiếu', en: 'shares'),
    FabAnswerItem(vi: 'Mức giá thấp nhất', en: 'their lowest price'),
    FabAnswerItem(vi: 'Không đạt kỳ vọng', en: 'missed revenue expectations'),
    FabAnswerItem(vi: 'Cắt giảm dự báo', en: 'cut back its prediction'),
    FabAnswerItem(vi: 'Giảm xuống', en: 'dropped'),
    FabAnswerItem(vi: 'Chốt phiên', en: 'to close at'),
    FabAnswerItem(vi: 'Mức thấp trước', en: 'previous low'),
    FabAnswerItem(vi: 'Giảm xuống', en: 'have gone down'),
    FabAnswerItem(vi: 'Báo cáo sụt giảm', en: 'reported a decline'),
    FabAnswerItem(vi: 'Doanh thu quý 2', en: 'second-quarter revenue'),
    FabAnswerItem(vi: 'Hạ thấp mục tiêu', en: 'reduce its target'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 2 Vocabulary (Mortgage)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk2Vocab => [
    FabVocabItem(
      wordEn: 'mortgage',
      wordVi: 'Khoản vay thế chấp',
      pronunciation: '/ˈmɔːrɡɪdʒ/',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'down payment',
      wordVi: 'Thanh toán trước',
      pronunciation: '/ˈdaʊn ˈpeɪmənt/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'savings account',
      wordVi: 'Tài khoản tiết kiệm',
      pronunciation: '/ˈseɪvɪŋz əˈkaʊnt/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'monthly income',
      wordVi: 'Thu nhập hàng tháng',
      pronunciation: '/ˈmʌnθli ˈɪŋkəm/',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'lender',
      wordVi: 'Bên cho vay',
      pronunciation: '/ˈlendər/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
    FabPhraseItem(
      phrase: 'Qualify for a mortgage',
      meaning: 'Đủ tiêu chuẩn vay thế chấp',
    ),
    FabPhraseItem(phrase: 'Meet requirements', meaning: 'Đáp ứng yêu cầu'),
    FabPhraseItem(phrase: 'Make a down payment', meaning: 'Thanh toán trước'),
    FabPhraseItem(
      phrase: 'Show proof of income',
      meaning: 'Chứng minh thu nhập',
    ),
    FabPhraseItem(phrase: 'In a timely manner', meaning: 'Đúng hạn'),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => [
    FabAnswerItem(vi: 'Khoản vay thế chấp mua nhà', en: 'a home mortgage'),
    FabAnswerItem(vi: 'Đáp ứng yêu cầu', en: 'meet a few requirements'),
    FabAnswerItem(vi: 'Thanh toán trước', en: 'make a down payment'),
    FabAnswerItem(vi: 'Chứng minh', en: 'show that'),
    FabAnswerItem(vi: 'Công việc hiện tại', en: 'your current job'),
    FabAnswerItem(vi: 'Ít nhất', en: 'at least'),
    FabAnswerItem(vi: 'Địa chỉ hiện tại', en: 'your current address'),
    FabAnswerItem(vi: 'Tài khoản tiết kiệm', en: 'a savings account'),
    FabAnswerItem(vi: 'Số dư', en: 'a balance'),
    FabAnswerItem(vi: 'Thu nhập hàng tháng', en: 'your monthly income'),
    FabAnswerItem(vi: 'Đảm bảo', en: 'assure the lender'),
    FabAnswerItem(
      vi: 'Thanh toán hàng tháng',
      en: 'make your monthly mortgage payments',
    ),
    FabAnswerItem(vi: 'Đúng hạn', en: 'in a timely manner'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme09_day1',
    dayNumber: 1,
    themeId: 'theme_09_finance_budgeting',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      LessonPhase(
        id: 'theme09_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_35',
        contentEn:
            '''Lexicon is very important for this theme as the student will hear many words related directly to finance, banking, accounting, invoicing, investments, stocks and taxes. In some questions in the reading passages, the student may have to make calculations to arrive at the correct answer. Numbers play a significant role and students must be able to differentiate between numbers such as 'seventy' and 'seventeen' because on the recordings it can be quite difficult to hear the difference when the speakers are engaged in a conversational rate of speech. Although conversational rate of speech can be as high as 250 or even 300 words per minute, students will need to get used to listening to tape scripts in which the rate of speech averages just over 200 words per minute.

Nouns: figures, numbers, column, profit, loss, financial statement, credit, debit, bill, return (on investment), balance, accountant, audit, auditor, due date, personal income tax, percentage. Verbs: add, subtract, multiply, divide, deposit, withdraw, submit, invest, calculate.

Conversations will often be between a supervisor or manager and an employee in which a report of facts and figures needs to be analyzed or made. Sometimes the conversation will be about customer service such as solving a problem with a customer's account.''',
        contentVi:
            '''Từ vựng là vô cùng quan trọng đối với chuyên đề này vì học viên sẽ nghe thấy rất nhiều từ liên quan trực tiếp tới tài chính, ngân hàng, kế toán, việc lập hoá đơn, các khoản đầu tư, cổ phiếu, và các loại thuế. Trong một số câu hỏi ở phần bài đọc, người học có thể phải tính toán để đi đến câu trả lời đúng. Các con số đóng vai trò đáng kể và người học phải có khả năng phân biệt giữa các số như "70" và "17" bởi vì trong các bản ghi âm khó có thể nghe được sự khác nhau đó khi những người đối thoại đang nói với tốc độ hội thoại. Mặc dù tốc độ hội thoại có thể cao tương đương với 250 từ hoặc thậm chí là 300 từ một phút, học viên sẽ cần phải làm quen với việc nghe các đoạn ghi âm với tốc độ trung bình trên 200 từ một phút.

Các danh từ: các số liệu, các con số, cột, lợi nhuận, thua lỗ, báo cáo tài chính, tín dụng, ghi nợ, hoá đơn, hoàn vốn (trong đầu tư), số dư tài khoản, kế toán viên, kiểm toán, kiểm toán viên, ngày đáo hạn, thuế thu nhập cá nhân, tỉ lệ phần trăm. Các động từ: cộng, trừ, nhân, chia, gửi tiền, rút tiền, nộp, đầu tư, tính toán.

Các bài hội thoại thường là giữa một người giám sát hoặc người quản lý với một nhân viên với nội dung về một báo cáo các số liệu, con số cần được phân tích hoặc được thực hiện. Đôi khi, các cuộc hội thoại tập trung vào vấn đề dịch vụ chăm sóc khách hàng như việc giải quyết một vấn đề liên quan tới tài khoản của khách hàng.''',
        fabVocab: Theme9Content.readingVocab,
        fabPhrases: Theme9Content.readingPhrases,
      ),
      LessonPhase(
        id: 'theme09_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_35',
        contentEn: null,
        contentVi: null,
      ),
      LessonPhase(
        id: 'theme09_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme9Content.readingAnswers,
      ),
      LessonPhase(
        id: 'theme09_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('Lexicon is very important for '),
    const MixedSegment.vietnamese('chuyên đề này', 'this theme'),
    const MixedSegment.english(' as the student '),
    const MixedSegment.vietnamese('sẽ nghe thấy', 'will hear'),
    const MixedSegment.english(' many words '),
    const MixedSegment.vietnamese(
      'liên quan trực tiếp đến',
      'related directly to',
    ),
    const MixedSegment.english(' finance, '),
    const MixedSegment.vietnamese('ngân hàng', 'banking'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('kế toán', 'accounting'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('việc lập hoá đơn', 'invoicing'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('đầu tư', 'investments'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('cổ phiếu', 'stocks'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('thuế', 'taxes'),
    const MixedSegment.english(
      '. In some questions in the reading passages, the student ',
    ),
    const MixedSegment.vietnamese(
      'phải tính toán',
      'may have to make calculations',
    ),
    const MixedSegment.english(' to arrive at the correct answer. Numbers '),
    const MixedSegment.vietnamese(
      'đóng vai trò đáng kể',
      'play a significant role',
    ),
    const MixedSegment.english(' and students must '),
    const MixedSegment.vietnamese(
      'có khả năng phân biệt',
      'be able to differentiate',
    ),
    const MixedSegment.english(' between numbers such as \''),
    const MixedSegment.vietnamese('bảy mươi', 'seventy'),
    const MixedSegment.english('\' and \''),
    const MixedSegment.vietnamese('mười bảy', 'seventeen'),
    const MixedSegment.english('\' because '),
    const MixedSegment.vietnamese('trong các bản ghi âm', 'on the recordings'),
    const MixedSegment.english(' it can be quite difficult to hear '),
    const MixedSegment.vietnamese('sự khác biệt', 'the difference'),
    const MixedSegment.english(' when the speakers '),
    const MixedSegment.vietnamese('tham gia vào', 'are engaged in'),
    const MixedSegment.english(' a conversational rate of speech. Although '),
    const MixedSegment.vietnamese(
      'tốc độ hội thoại',
      'conversational rate of speech',
    ),
    const MixedSegment.english(' can be '),
    const MixedSegment.vietnamese('cao tương đương với', 'as high as'),
    const MixedSegment.english(
      ' 250 or even 300 words per minute, students will ',
    ),
    const MixedSegment.vietnamese('cẩn làm quen với', 'need to get used to'),
    const MixedSegment.english(
      ' listening to tape scripts in which the rate of speech ',
    ),
    const MixedSegment.vietnamese('đạt mức trung bình là', 'averages'),
    const MixedSegment.english(' just over 200 words per minute.'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme09_day2',
    dayNumber: 2,
    themeId: 'theme_09_finance_budgeting',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      LessonPhase(
        id: 'theme09_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation - Financial Report',
        titleVi: 'Luyện tập 1: Hội thoại - Báo cáo tài chính',
        audioTrackKey: 'track_36',
        questions: _practice1Questions,
      ),
      LessonPhase(
        id: 'theme09_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Stock Market News',
        titleVi: 'Luyện tập 2: Bài ngắn - Tin thị trường chứng khoán',
        audioTrackKey: 'track_37',
        questions: _practice2Questions,
      ),
      LessonPhase(
        id: 'theme09_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Mortgage Requirements',
        titleVi: 'Luyện tập 3: Bài ngắn - Yêu cầu khoản vay thế chấp',
        audioTrackKey: 'track_38',
        questions: _practice3Questions,
      ),
      LessonPhase(
        id: 'theme09_day2_translate1',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Conversation',
        titleVi: 'Nghe và Dịch: Hội thoại',
        audioTrackKey: 'track_36',
        contentEn:
            '''M: Julie, did you make the copies of the last quarter financial report for our meeting tomorrow? I'd like to make a few alterations to the document before it is delivered to the shareholders.
W: The report is ready, sir, but I haven't made any copies yet. I'm planning to do it after lunch. So, if we want to make any changes to the document, we'd better do it now. What did you have in mind?
M: Great. The accountant made a mistake when she calculated the total revenue, which resulted in several incorrect numbers and ratios in the report. So, would you mind giving back the report to the accounting department so they can make the corrections?
W: Not at all. I'll do it right away and send you a copy of the report when it is finished.''',
        contentVi:
            '''M: Julie, cô đã phô-tô bản báo cáo tài chính quý trước cho cuộc họp của chúng ta vào ngày mai chưa? Tôi muốn điều chỉnh tài liệu này một chút trước khi nó được chuyển đến các cổ đông.
W: Bản báo cáo đã sẵn sàng thưa ông, nhưng tôi vẫn chưa phô-tô. Tôi định sẽ làm việc đó sau bữa trưa. Vì vậy, nếu chúng ta muốn thay đổi gì tài liệu này, chúng ta nên làm việc đó ngay bây giờ. Ông định thay đổi gì ạ?
M: Tốt quá. Nhân viên kế toán đã sai sót khi cô ấy tính tổng doanh thu, điều này đã dẫn đến một vài con số và tỉ lệ không chính xác trong bản báo cáo. Vì vậy, phiền cô đưa lại bản báo cáo cho phòng kế toán để họ có thể chỉnh sửa lại.
W: Vâng, được ạ. Tôi sẽ làm ngay và sẽ gửi ông bản sao của báo cáo này khi nó được hoàn thành.''',
      ),
      LessonPhase(
        id: 'theme09_day2_translate2',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Stock Market',
        titleVi: 'Nghe và Dịch: Thị trường chứng khoán',
        audioTrackKey: 'track_37',
        contentEn:
            '''Good morning everybody. This is NCC radio station. I'm Ann Murphy with the latest news about the stock market. Unfortunately, shares of AAS Technologies dropped to their lowest price in two years on Wednesday, nearly four weeks after the company missed revenue expectations and cut back its prediction for the current third quarter. AAS Technologies shares dropped 75 cents, nearly one point seven percent to close at forty-five dollar and fifty cents. Its previous 104-week low was forty six dollar and fifteen cents. The company's shares have gone down about fifteen percent since it reported a decline in its second-quarter revenue and had to reduce its target for the third quarter.''',
        contentVi:
            '''Chào các bạn. Đây là đài phát thanh NCC. Tôi là Ann Murphy với bản tin mới nhất về thị trường chứng khoán. Thật không may, giá cổ phiếu của hãng AAS Technologies đã giảm xuống mức thấp nhất trong hai năm qua vào thứ Tư, gần bốn tuần sau khi công ty này không đạt được doanh thu dự kiến và cắt giảm dự báo trong quý 3 này. Cổ phiếu AAS Technologies đã giảm 75 xu, tương đương gần 1,7%, chốt phiên ở mức giá 45,50 đô-la một cổ phiếu. Mức giá thấp nhất trong 104 tuần trước đó là 46,15 đô-la một cổ phiếu. Giá cổ phiếu của công ty đã giảm khoảng 15% kể từ khi công ty thông báo sụt giảm doanh thu trong quý 2 và phải hạ thấp mục tiêu trong quý 3.''',
      ),
      LessonPhase(
        id: 'theme09_day2_translate3',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Mortgage',
        titleVi: 'Nghe và Dịch: Khoản vay thế chấp',
        audioTrackKey: 'track_38',
        contentEn:
            '''Now, in order to qualify for a home mortgage, you need to meet a few requirements. First of all, you have to be able to make a down payment of 20 percent. You also have to show that you have been at your current job for at least 2 years and have been living at your current address for over five years. You should also have a savings account with a balance equivalent to about 6 months or more of your monthly income. All these things assure the lender that you will be able to make your monthly mortgage payments in a timely manner.''',
        contentVi:
            '''Vào thời điểm này, để đủ tiêu chuẩn vay một khoản vay thế chấp mua nhà, bạn cần đáp ứng một số yêu cầu. Trước tiên, bạn phải có khả năng thanh toán trước 20% giá trị khoản vay. Bạn cũng phải chứng minh được rằng bạn đã làm công việc hiện thời được ít nhất 2 năm và đã sống tại địa chỉ hiện tại trên 5 năm. Bạn cũng nên có một tài khoản tiết kiệm với số dư duy trì tương đương ít nhất khoảng 6 tháng thu nhập hàng tháng của mình. Tất cả các điều kiện này bảo đảm với bên cho vay là bạn sẽ có khả năng thực hiện các khoản thanh toán hàng tháng đối với khoản vay thế chấp đúng kỳ hạn.''',
      ),
      LessonPhase(
        id: 'theme09_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Financial Report',
        titleVi: 'Huấn luyện Trí nhớ: Báo cáo tài chính',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme9Content.conversationVocab,
        fabPhrases: Theme9Content.conversationPhrases,
        fabAnswers: Theme9Content.conversationAnswers,
      ),
      LessonPhase(
        id: 'theme09_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Stock Market',
        titleVi: 'Huấn luyện Trí nhớ: Thị trường chứng khoán',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme9Content.shortTalk1Vocab,
        fabPhrases: Theme9Content.shortTalk1Phrases,
        fabAnswers: Theme9Content.shortTalk1Answers,
      ),
      LessonPhase(
        id: 'theme09_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Mortgage Requirements',
        titleVi: 'Huấn luyện Trí nhớ: Yêu cầu thế chấp',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme9Content.shortTalk2Vocab,
        fabPhrases: Theme9Content.shortTalk2Phrases,
        fabAnswers: Theme9Content.shortTalk2Answers,
      ),
    ],
  );

  // ═══════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ═══════════════════════════════════════════════════════════════
  static List<QuizQuestion> get _practice1Questions => [
    QuizQuestion(
      id: 'theme09_q01',
      questionText: 'Where is this conversation taking place?',
      options: [
        '(A) In an office',
        '(B) In a restaurant',
        '(C) In a photocopy store',
        '(D) In a stock exchange',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_36',
      practiceNumber: 'practice1',
    ),
    QuizQuestion(
      id: 'theme09_q02',
      questionText: 'Why do they need to make changes to the report?',
      options: [
        '(A) Because it hasn\'t been copied yet',
        '(B) Because it was prepared a long time ago',
        '(C) Because there are errors in it',
        '(D) Because it\'s too long',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_36',
      practiceNumber: 'practice1',
    ),
    QuizQuestion(
      id: 'theme09_q03',
      questionText: 'What is the woman going to do next?',
      options: [
        '(A) Check to see whether the copies are ready',
        '(B) Go to a meeting',
        '(C) Go to lunch with the man',
        '(D) Bring the report to the accounting department',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_36',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    QuizQuestion(
      id: 'theme09_q04',
      questionText: 'What is true about AAS Technologies share prices?',
      options: [
        '(A) They are at their lowest level in two years.',
        '(B) They have been no movements for the last two years.',
        '(C) They have been rising steadily.',
        '(D) They are increasing more slowly than expected.',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_37',
      practiceNumber: 'practice2',
    ),
    QuizQuestion(
      id: 'theme09_q05',
      questionText: 'What did AAS Technologies announce?',
      options: [
        '(A) They are going to introduce a new product in the third quarter.',
        '(B) They will keep their share price at a low level.',
        '(C) They will replace several members of the board.',
        '(D) Their revenues for the third quarter will be lower than previously expected.',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_37',
      practiceNumber: 'practice2',
    ),
    QuizQuestion(
      id: 'theme09_q06',
      questionText: 'What was the final price for shares of AAS Technologies?',
      options: ['(A) \$0.75', '(B) \$1.70', '(C) \$45.50', '(D) \$46.15'],
      correctIndex: 2,
      audioTrackKey: 'track_37',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    QuizQuestion(
      id: 'theme09_q07',
      questionText: 'Who is this talk intended for?',
      options: [
        '(A) People who want to open a savings account',
        '(B) People who want to borrow money',
        '(C) People who are looking for a job',
        '(D) People who work in a bank',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_38',
      practiceNumber: 'practice3',
    ),
    QuizQuestion(
      id: 'theme09_q08',
      questionText: 'How big a down payment is required?',
      options: [
        '(A) 2 percent',
        '(B) 5 percent',
        '(C) 6 percent',
        '(D) 20 percent',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_38',
      practiceNumber: 'practice3',
    ),
    QuizQuestion(
      id: 'theme09_q09',
      questionText: 'Which of the following is a requirement?',
      options: [
        '(A) Money in the bank',
        '(B) A current address',
        '(C) A new job',
        '(D) A house as collateral',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_38',
      practiceNumber: 'practice3',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // MIND GAME SEGMENTS
  // ═══════════════════════════════════════════════════════════════
  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('M: Julie, did you make '),
    const MixedSegment.vietnamese('bản sao', 'the copies'),
    const MixedSegment.english(' of '),
    const MixedSegment.vietnamese(
      'bản báo cáo tài chính quý trước',
      'the last quarter financial report',
    ),
    const MixedSegment.english(' for '),
    const MixedSegment.vietnamese('cuộc họp', 'our meeting'),
    const MixedSegment.english(
      ' tomorrow?\nW: The report is ready, sir, but I ',
    ),
    const MixedSegment.vietnamese('chưa phô-tô', 'haven\'t made any copies'),
    const MixedSegment.english(' yet. So, if we want to '),
    const MixedSegment.vietnamese('thực hiện thay đổi', 'make any changes'),
    const MixedSegment.english(
      ', we\'d better do it now.\nM: Great. The accountant ',
    ),
    const MixedSegment.vietnamese('mắc sai sót', 'made a mistake'),
    const MixedSegment.english(' when she calculated '),
    const MixedSegment.vietnamese('tổng doanh thu', 'the total revenue'),
    const MixedSegment.english('. So, would you mind '),
    const MixedSegment.vietnamese('đưa lại báo cáo', 'giving back the report'),
    const MixedSegment.english(' to the accounting department so they can '),
    const MixedSegment.vietnamese('chỉnh sửa', 'make the corrections'),
    const MixedSegment.english('?\nW: Not at all. I\'ll '),
    const MixedSegment.vietnamese('làm ngay', 'do it right away'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese(
      'gửi bản sao',
      'send you a copy of the report',
    ),
    const MixedSegment.english(' when it is '),
    const MixedSegment.vietnamese('hoàn thành', 'finished'),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Good morning everybody. This is '),
    const MixedSegment.vietnamese('đài phát thanh NCC', 'NCC radio station'),
    const MixedSegment.english('. I\'m Ann Murphy with '),
    const MixedSegment.vietnamese('bản tin mới nhất', 'the latest news'),
    const MixedSegment.english(' about '),
    const MixedSegment.vietnamese('thị trường chứng khoán', 'the stock market'),
    const MixedSegment.english('. Unfortunately, '),
    const MixedSegment.vietnamese('cổ phiếu', 'shares'),
    const MixedSegment.english(' of AAS Technologies '),
    const MixedSegment.vietnamese('giảm xuống', 'dropped'),
    const MixedSegment.english(' to '),
    const MixedSegment.vietnamese('mức giá thấp nhất', 'their lowest price'),
    const MixedSegment.english(
      ' in two years on Wednesday, nearly four weeks after the company ',
    ),
    const MixedSegment.vietnamese(
      'không đạt kỳ vọng doanh thu',
      'missed revenue expectations',
    ),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('cắt giảm dự báo', 'cut back its prediction'),
    const MixedSegment.english(
      ' for the current third quarter. AAS Technologies shares ',
    ),
    const MixedSegment.vietnamese('giảm', 'dropped'),
    const MixedSegment.english(' 75 cents to '),
    const MixedSegment.vietnamese('chốt ở mức', 'close at'),
    const MixedSegment.english(
      ' forty-five dollar and fifty cents. Its previous 104-week ',
    ),
    const MixedSegment.vietnamese('mức thấp', 'low'),
    const MixedSegment.english(
      ' was forty six dollar and fifteen cents. The company\'s shares ',
    ),
    const MixedSegment.vietnamese('giảm xuống', 'have gone down'),
    const MixedSegment.english(' about fifteen percent since it '),
    const MixedSegment.vietnamese('báo cáo sụt giảm', 'reported a decline'),
    const MixedSegment.english(' in its '),
    const MixedSegment.vietnamese('doanh thu quý 2', 'second-quarter revenue'),
    const MixedSegment.english(' and had to '),
    const MixedSegment.vietnamese('hạ thấp mục tiêu', 'reduce its target'),
    const MixedSegment.english(' for the third quarter.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english('Now, in order to qualify for '),
    const MixedSegment.vietnamese(
      'một khoản vay thế chấp mua nhà',
      'a home mortgage',
    ),
    const MixedSegment.english(', you need to '),
    const MixedSegment.vietnamese('đáp ứng yêu cầu', 'meet a few requirements'),
    const MixedSegment.english('. First of all, you have to be able to '),
    const MixedSegment.vietnamese('thanh toán trước', 'make a down payment'),
    const MixedSegment.english(' of 20 percent. You also have to '),
    const MixedSegment.vietnamese('chứng minh', 'show that'),
    const MixedSegment.english(' you have been at your '),
    const MixedSegment.vietnamese('công việc hiện tại', 'current job'),
    const MixedSegment.english(' for '),
    const MixedSegment.vietnamese('ít nhất', 'at least'),
    const MixedSegment.english(' 2 years and have been living at your '),
    const MixedSegment.vietnamese('địa chỉ hiện tại', 'current address'),
    const MixedSegment.english(' for over five years. You should also have '),
    const MixedSegment.vietnamese(
      'một tài khoản tiết kiệm',
      'a savings account',
    ),
    const MixedSegment.english(' with '),
    const MixedSegment.vietnamese('một số dư', 'a balance'),
    const MixedSegment.english(
      ' equivalent to about 6 months or more of your ',
    ),
    const MixedSegment.vietnamese('thu nhập hàng tháng', 'monthly income'),
    const MixedSegment.english('. All these things '),
    const MixedSegment.vietnamese('đảm bảo', 'assure'),
    const MixedSegment.english(
      ' the lender that you will be able to make your ',
    ),
    const MixedSegment.vietnamese(
      'thanh toán hàng tháng',
      'monthly mortgage payments',
    ),
    const MixedSegment.english(' in '),
    const MixedSegment.vietnamese('đúng hạn', 'a timely manner'),
    const MixedSegment.english('.'),
  ];
}

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
      wordVi: 'Tài chính, lĩnh vực tài chính',
      pronunciation: "/’faûnæns/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'He works in the finance department of a large corporation.',
      exampleVi:
          'Anh ấy làm việc trong bộ phận tài chính của một tập đoàn lớn.',
    ),
    VocabModel(
      id: 'v09_02',
      wordEn: 'budgeting',
      wordVi: 'Việc dự thảo ngân sách',
      pronunciation: "/’bšdžÂtûÅ/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Careful budgeting is essential for a successful project.',
      exampleVi:
          'Việc dự thảo ngân sách cẩn thận là thiết yếu cho một dự án thành công.',
    ),
    VocabModel(
      id: 'v09_03',
      wordEn: 'lexicon',
      wordVi: 'Từ vựng, vốn từ',
      pronunciation: "/’leksûkën/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'This theme uses a specialized lexicon related to money.',
      exampleVi:
          'Chủ đề này sử dụng một vốn từ chuyên ngành liên quan đến tiền bạc.',
    ),
    VocabModel(
      id: 'v09_04',
      wordEn: 'Be related to',
      wordVi: 'Liên quan tới',
      pronunciation: "/bi rû ’leûtÂd tu:/",
      partOfSpeech: 'vp',
      themeId: 'theme_09_finance_budgeting',
      exampleEn:
          'The report is directly related to our first-quarter earnings.',
      exampleVi:
          'Bản báo cáo liên quan trực tiếp đến thu nhập quý đầu tiên của chúng tôi.',
    ),
    VocabModel(
      id: 'v09_05',
      wordEn: 'banking',
      wordVi: 'Ngành ngân hàng, lĩnh vực ngân hàng',
      pronunciation: "/’bæÅkûÅ/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Online banking has become very popular in recent years.',
      exampleVi:
          'Ngân hàng trực tuyến đã trở nên rất phổ biến trong những năm gần đây.',
    ),
    VocabModel(
      id: 'v09_06',
      wordEn: 'accounting',
      wordVi: 'Ngành kế toán, lĩnh vực kế toán',
      pronunciation: "/ë ’ka|ntûÅ/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'She decided to pursue a career in accounting.',
      exampleVi: 'Cô ấy quyết định theo đuổi sự nghiệp trong ngành kế toán.',
    ),
    VocabModel(
      id: 'v09_07',
      wordEn: 'invoicing',
      wordVi: 'Việc lập hoá đơn',
      pronunciation: "/’ûnvéûsûÅ/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The system automates the invoicing process.',
      exampleVi: 'Hệ thống tự động hóa quá trình lập hóa đơn.',
    ),
    VocabModel(
      id: 'v09_08',
      wordEn: 'investment',
      wordVi: 'Sự đầu tư, khoản đầu tư',
      pronunciation: "/ûn ’vestmënt/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Buying real estate can be a good long-term investment.',
      exampleVi: 'Mua bất động sản có thể là một khoản đầu tư dài hạn tốt.',
    ),
    VocabModel(
      id: 'v09_09',
      wordEn: 'stocks',
      wordVi: 'Cổ phiếu',
      pronunciation: "/stä:ks/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The price of stocks fluctuates based on market demand.',
      exampleVi: 'Giá cổ phiếu biến động dựa trên nhu cầu thị trường.',
    ),
    VocabModel(
      id: 'v09_10',
      wordEn: 'tax',
      wordVi: 'Thuế',
      pronunciation: "/tæks/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The government recently introduced a new sales tax.',
      exampleVi: 'Chính phủ vừa mới áp dụng một loại thuế bán hàng mới.',
    ),
    VocabModel(
      id: 'v09_11',
      wordEn: 'differentiate',
      wordVi: 'Phân biệt sự khác nhau',
      pronunciation: "/;dûfë ’renÐieût/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn:
          'It can be difficult to differentiate between the two numbers.',
      exampleVi: 'Có thể khó để phân biệt sự khác nhau giữa hai con số đó.',
    ),
    VocabModel(
      id: 'v09_12',
      wordEn: 'recording',
      wordVi: 'Bản ghi âm, băng thu âm',
      pronunciation: "/rû ’ké:rdûÅ/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn:
          'Please listen carefully to the recording and answer the questions.',
      exampleVi: 'Vui lòng nghe kỹ bản ghi âm và trả lời câu hỏi.',
    ),
    VocabModel(
      id: 'v09_13',
      wordEn: 'A conversational rate of speech',
      wordVi: 'Tốc độ hội thoại',
      pronunciation: "/ë ;kä:nvër’seûÐÊnël reût ëv spi:tÐ/",
      partOfSpeech: 'np',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The speakers are using a conversational rate of speech.',
      exampleVi: 'Những người nói đang sử dụng tốc độ hội thoại.',
    ),
    VocabModel(
      id: 'v09_14',
      wordEn: 'tape script',
      wordVi: 'Nội dung băng thu âm',
      pronunciation: "/teûp skrûpt/",
      partOfSpeech: 'np',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'You can read along with the tape script.',
      exampleVi: 'Bạn có thể đọc theo nội dung băng thu âm.',
    ),
    VocabModel(
      id: 'v09_15',
      wordEn: 'average',
      wordVi: 'Đạt trung bình là',
      pronunciation: "/’ævÊrûdž/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The rate of speech averages 200 words per minute.',
      exampleVi: 'Tốc độ nói đạt trung bình là 200 từ mỗi phút.',
    ),
    VocabModel(
      id: 'v09_16',
      wordEn: 'figure',
      wordVi: 'Số liệu',
      pronunciation: "/’fûgjër/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'We need to update the sales figures for this month.',
      exampleVi: 'Chúng ta cần cập nhật số liệu bán hàng cho tháng này.',
    ),
    VocabModel(
      id: 'v09_17',
      wordEn: 'column',
      wordVi: 'Cột số, hàng dọc, mục',
      pronunciation: "/’kä:lëm/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Please look at the third column of the table.',
      exampleVi: 'Vui lòng nhìn vào cột thứ ba của bảng.',
    ),
    VocabModel(
      id: 'v09_18',
      wordEn: 'profit',
      wordVi: 'Lợi nhuận',
      pronunciation: "/’prä:fÂt/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The company reported a record profit this year.',
      exampleVi: 'Công ty đã báo cáo lợi nhuận kỷ lục trong năm nay.',
    ),
    VocabModel(
      id: 'v09_19',
      wordEn: 'loss',
      wordVi: 'Thua lỗ',
      pronunciation: "/lã:s/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'They had to close some stores due to financial loss.',
      exampleVi: 'Họ đã phải đóng cửa một số cửa hàng do thua lỗ tài chính.',
    ),
    VocabModel(
      id: 'v09_20',
      wordEn: 'financial statement',
      wordVi: 'Báo cáo tài chính',
      pronunciation: "/faû ’nænÐÊl ’steûtmënt/",
      partOfSpeech: 'np',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Shareholders reviewed the annual financial statement.',
      exampleVi: 'Các cổ đông đã xem xét báo cáo tài chính hàng năm.',
    ),
    VocabModel(
      id: 'v09_21',
      wordEn: 'credit',
      wordVi: 'Tín dụng',
      pronunciation: "/’kredÂt/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Having a good credit score is important for loans.',
      exampleVi: 'Có điểm tín dụng tốt là quan trọng cho các khoản vay.',
    ),
    VocabModel(
      id: 'v09_22',
      wordEn: 'debit',
      wordVi: 'Sự ghi nợ',
      pronunciation: "/’debÂt/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'A debit transaction will reduce your account balance.',
      exampleVi: 'Một giao dịch ghi nợ sẽ làm giảm số dư tài khoản của bạn.',
    ),
    VocabModel(
      id: 'v09_23',
      wordEn: 'bill',
      wordVi: 'Hoá đơn',
      pronunciation: "/bûl/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'He forgot to pay the electricity bill last month.',
      exampleVi: 'Anh ấy đã quên thanh toán hóa đơn điện tháng trước.',
    ),
    VocabModel(
      id: 'v09_24',
      wordEn: 'return',
      wordVi: 'Tỷ suất hoàn vốn, lợi tức (trong đầu tư)',
      pronunciation: "/rû ’tî:rn/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The investment offered a high rate of return.',
      exampleVi: 'Khoản đầu tư đã mang lại tỷ suất lợi tức cao.',
    ),
    VocabModel(
      id: 'v09_25',
      wordEn: 'balance',
      wordVi: 'Số dư tài khoản',
      pronunciation: "/’bælëns/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'You can check your account balance at the ATM.',
      exampleVi: 'Bạn có thể kiểm tra số dư tài khoản của mình tại cây ATM.',
    ),
    VocabModel(
      id: 'v09_26',
      wordEn: 'accountant',
      wordVi: 'Nhân viên kế toán',
      pronunciation: "/ë ’ka|ntÊnt/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The accountant is preparing our tax returns.',
      exampleVi: 'Nhân viên kế toán đang chuẩn bị tờ khai thuế cho chúng tôi.',
    ),
    VocabModel(
      id: 'v09_27',
      wordEn: 'audit',
      wordVi: 'Sự kiểm toán',
      pronunciation: "/’ã:dÂt/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The internal audit revealed some inconsistencies.',
      exampleVi:
          'Cuộc kiểm toán nội bộ đã tiết lộ một số điểm không nhất quán.',
    ),
    VocabModel(
      id: 'v09_28',
      wordEn: 'auditor',
      wordVi: 'Kiểm toán viên',
      pronunciation: "/’ã:dÂtër/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The outside auditor will arrive on Monday.',
      exampleVi: 'Kiểm toán viên bên ngoài sẽ đến vào thứ Hai.',
    ),
    VocabModel(
      id: 'v09_29',
      wordEn: 'due date',
      wordVi: 'Ngày đáo hạn',
      pronunciation: "/du: deût/",
      partOfSpeech: 'np',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Make sure to pay before the due date.',
      exampleVi: 'Hãy chắc chắn thanh toán trước ngày đáo hạn.',
    ),
    VocabModel(
      id: 'v09_30',
      wordEn: 'personal income tax',
      wordVi: 'Thuế thu nhập cá nhân',
      pronunciation: "/’pî:rsÊnël ’ûnkšm tæks/",
      partOfSpeech: 'np',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The deadline for filing personal income tax is mid-April.',
      exampleVi: 'Hạn chót để nộp thuế thu nhập cá nhân là giữa tháng Tư.',
    ),
    VocabModel(
      id: 'v09_31',
      wordEn: 'add',
      wordVi: 'Cộng',
      pronunciation: "/;æd/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Add these numbers together to get the total.',
      exampleVi: 'Cộng các con số này lại với nhau để có kết quả tổng.',
    ),
    VocabModel(
      id: 'v09_32',
      wordEn: 'subtract',
      wordVi: 'Trừ',
      pronunciation: "/sëb’trækt/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'You need to subtract the expenses from the gross income.',
      exampleVi: 'Bạn cần trừ đi các chi phí từ tổng thu nhập.',
    ),
    VocabModel(
      id: 'v09_33',
      wordEn: 'multiply',
      wordVi: 'Nhân',
      pronunciation: "/’mšltÂplaû/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Multiply the quantity by the price per unit.',
      exampleVi: 'Nhân số lượng với giá mỗi đơn vị.',
    ),
    VocabModel(
      id: 'v09_34',
      wordEn: 'divide',
      wordVi: 'Chia',
      pronunciation: "/dÂ ’vaûd/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'We will divide the profits equally among the partners.',
      exampleVi: 'Chúng tôi sẽ chia lợi nhuận đều cho các đối tác.',
    ),
    VocabModel(
      id: 'v09_35',
      wordEn: 'deposit',
      wordVi: 'Gửi tiền (vào ngân hàng)',
      pronunciation: "/dû ’pä:zÂt/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'I want to deposit this check into my account.',
      exampleVi: 'Tôi muốn gửi tấm séc này vào tài khoản của mình.',
    ),
    VocabModel(
      id: 'v09_36',
      wordEn: 'withdraw',
      wordVi: 'Rút (tiền)',
      pronunciation: "/wûØ’drã:/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'How much money do you want to withdraw?',
      exampleVi: 'Bạn muốn rút bao nhiêu tiền?',
    ),
    VocabModel(
      id: 'v09_37',
      wordEn: 'submit',
      wordVi: 'Nộp, đệ trình',
      pronunciation: "/sëb’mût/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Please submit your expense report by Friday.',
      exampleVi: 'Vui lòng nộp báo cáo chi phí của bạn trước thứ Sáu.',
    ),
    VocabModel(
      id: 'v09_38',
      wordEn: 'invest',
      wordVi: 'Đầu tư',
      pronunciation: "/ûn ’vest/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The company plans to invest in new technology.',
      exampleVi: 'Công ty có kế hoạch đầu tư vào công nghệ mới.',
    ),
    VocabModel(
      id: 'v09_39',
      wordEn: 'calculate',
      wordVi: 'Tính toán',
      pronunciation: "/’kælkjÁleût/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'We need to calculate the estimated cost of repairs.',
      exampleVi: 'Chúng ta cần tính toán chi phí sửa chữa ước tính.',
    ),
    VocabModel(
      id: 'v09_40',
      wordEn: 'supervisor',
      wordVi: 'Người giám sát, cấp trên',
      pronunciation: "/’su:përvaûzër/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'You should discuss the issue with your supervisor.',
      exampleVi: 'Bạn nên thảo luận vấn đề này với người giám sát của mình.',
    ),
    VocabModel(
      id: 'v09_41',
      wordEn: 'manager',
      wordVi: 'Người quản lí',
      pronunciation: "/’mænûdžër/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The project manager is responsible for the timeline.',
      exampleVi: 'Người quản lý dự án có trách nhiệm về tiến độ thời gian.',
    ),
    VocabModel(
      id: 'v09_42',
      wordEn: 'employee',
      wordVi: 'Nhân viên, người lao động',
      pronunciation: "/;empléû ’i:/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'The company values its employees\' health.',
      exampleVi: 'Công ty coi trọng sức khỏe của nhân viên.',
    ),
    VocabModel(
      id: 'v09_43',
      wordEn: 'report',
      wordVi: 'Báo cáo, bản báo cáo',
      pronunciation: "/rû ’pé:rt/",
      partOfSpeech: 'v, n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'I need to finalize the quarterly report.',
      exampleVi: 'Tôi cần hoàn thiện bản báo cáo hàng quý.',
    ),
    VocabModel(
      id: 'v09_44',
      wordEn: 'facts and figures',
      wordVi: 'Dữ kiện và số liệu',
      pronunciation: "/fækts ænd ’fûgjërz/",
      partOfSpeech: 'idiom',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Please present the facts and figures during the meeting.',
      exampleVi: 'Vui lòng trình bày các dữ kiện và số liệu trong cuộc họp.',
    ),
    VocabModel(
      id: 'v09_45',
      wordEn: 'analyze',
      wordVi: 'Phân tích',
      pronunciation: "/’ænÊlaûz/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'We need to analyze the results of the survey.',
      exampleVi: 'Chúng ta cần phân tích kết quả của cuộc khảo sát.',
    ),
    VocabModel(
      id: 'v09_46',
      wordEn: 'customer service',
      wordVi: 'Dịch vụ chăm sóc khách hàng',
      pronunciation: "/’kšstëmër ’sî:rvÂs/",
      partOfSpeech: 'np',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'Good customer service can improve brand loyalty.',
      exampleVi:
          'Dịch vụ chăm sóc khách hàng tốt có thể nâng cao sự trung thành với thương hiệu.',
    ),
    VocabModel(
      id: 'v09_47',
      wordEn: 'solve',
      wordVi: 'Giải quyết (vấn đề)',
      pronunciation: "/sä:lv/",
      partOfSpeech: 'v',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'We need to find a way to solve this financial problem.',
      exampleVi: 'Chúng ta cần tìm cách giải quyết vấn đề tài chính này.',
    ),
    VocabModel(
      id: 'v09_48',
      wordEn: 'account',
      wordVi: 'Tài khoản',
      pronunciation: "/ë ’kant/",
      partOfSpeech: 'n',
      themeId: 'theme_09_finance_budgeting',
      exampleEn: 'He opened a new checking account at the bank.',
      exampleVi: 'Anh ấy đã mở một tài khoản thanh toán mới tại ngân hàng.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 1 Reading Vocabulary
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => [
    const FabVocabItem(
      wordEn: 'finance',
      wordVi: 'Tài chính',
      pronunciation: "/’faûnæns/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'budgeting',
      wordVi: 'Việc dự thảo ngân sách',
      pronunciation: "/’bšdžÂtûÅ/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'lexicon',
      wordVi: 'Từ vựng, vốn từ',
      pronunciation: "/’leksûkën/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'banking',
      wordVi: 'Ngành ngân hàng',
      pronunciation: "/’bæÅkûÅ/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'accounting',
      wordVi: 'Ngành kế toán',
      pronunciation: "/ë ’ka|ntûÅ/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'invoicing',
      wordVi: 'Việc lập hoá đơn',
      pronunciation: "/’ûnvéûsûÅ/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'investment',
      wordVi: 'Sự đầu tư, khoản đầu tư',
      pronunciation: "/ûn ’vestmënt/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'stocks',
      wordVi: 'Cổ phiếu',
      pronunciation: "/stä:ks/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'tax',
      wordVi: 'Thuế',
      pronunciation: "/tæks/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'profit',
      wordVi: 'Lợi nhuận',
      pronunciation: "/’prä:fÂt/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'loss',
      wordVi: 'Thua lỗ',
      pronunciation: "/lã:s/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'figure',
      wordVi: 'Số liệu',
      pronunciation: "/’fûgjër/",
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    const FabPhraseItem(phrase: 'Make calculations', meaning: 'Tính toán'),
    const FabPhraseItem(
      phrase: 'Play a significant role',
      meaning: 'Đóng một vai trò quan trọng/ đáng kể',
    ),
    const FabPhraseItem(
      phrase: 'Differentiate between',
      meaning: 'Phân biệt sự khác nhau giữa',
    ),
    const FabPhraseItem(phrase: 'Be engaged in', meaning: 'Tham gia vào'),
    const FabPhraseItem(
      phrase: 'Get used to (doing) sth',
      meaning: 'Tập quen với điều gì/ làm gì',
    ),
    const FabPhraseItem(phrase: 'Be related to', meaning: 'Liên quan tới'),
    const FabPhraseItem(
      phrase: 'Facts and figures',
      meaning: 'Dữ kiện và số liệu',
    ),
  ];

  static List<FabAnswerItem> get readingAnswers => const [
    FabAnswerItem(vi: 'chuyên đề này', en: 'this theme'),
    FabAnswerItem(vi: 'sẽ nghe thấy', en: 'will hear'),
    FabAnswerItem(vi: 'liên quan trực tiếp đến', en: 'related directly to'),
    FabAnswerItem(vi: 'ngân hàng', en: 'banking'),
    FabAnswerItem(vi: 'kế toán', en: 'accounting'),
    FabAnswerItem(vi: 'việc lập hoá đơn', en: 'invoicing'),
    FabAnswerItem(vi: 'đầu tư', en: 'investments'),
    FabAnswerItem(vi: 'cổ phiếu', en: 'stocks'),
    FabAnswerItem(vi: 'thuế', en: 'taxes'),
    FabAnswerItem(vi: 'phải tính toán', en: 'may have to make calculations'),
    FabAnswerItem(vi: 'đóng vai trò đáng kể', en: 'play a significant role'),
    FabAnswerItem(vi: 'có khả năng phân biệt', en: 'be able to differentiate'),
    FabAnswerItem(vi: 'bảy mươi', en: 'seventy'),
    FabAnswerItem(vi: 'mười bảy', en: 'seventeen'),
    FabAnswerItem(vi: 'trong các bản ghi âm', en: 'on the recordings'),
    FabAnswerItem(vi: 'sự khác biệt', en: 'the difference'),
    FabAnswerItem(vi: 'tham gia vào', en: 'are engaged in'),
    FabAnswerItem(vi: 'tốc độ hội thoại', en: 'conversational rate of speech'),
    FabAnswerItem(vi: 'cao tương đương với', en: 'as high as'),
    FabAnswerItem(vi: 'cần làm quen với', en: 'need to get used to'),
    FabAnswerItem(vi: 'đạt mức trung bình là', en: 'averages'),
    FabAnswerItem(vi: 'Liên quan tới', en: 'Be related to'),
    FabAnswerItem(
      vi: 'Đóng một vai trò quan trọng',
      en: 'Play a significant role',
    ),
    FabAnswerItem(
      vi: 'Tập quen với điều gì',
      en: 'Get used to doing something',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Conversation Vocabulary
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get conversationVocab => [
    const FabVocabItem(
      wordEn: 'copies',
      wordVi: 'Bản sao',
      pronunciation: '/ˈkɑːpiz/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'alterations',
      wordVi: 'Thay đổi',
      pronunciation: '/ˌɔːltəˈreɪʃənz/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'shareholders',
      wordVi: 'Cổ đông',
      pronunciation: '/ˈʃeərhoʊldərz/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'mistake',
      wordVi: 'Sai sót',
      pronunciation: '/mɪˈsteɪk/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'corrections',
      wordVi: 'Chỉnh sửa',
      pronunciation: '/kəˈrekʃənz/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get conversationPhrases => [
    const FabPhraseItem(phrase: 'Make copies', meaning: 'Phô-tô bản'),
    const FabPhraseItem(
      phrase: 'Financial report',
      meaning: 'Báo cáo tài chính',
    ),
    const FabPhraseItem(
      phrase: 'Make alterations',
      meaning: 'Thực hiện thay đổi',
    ),
    const FabPhraseItem(
      phrase: 'Deliver to shareholders',
      meaning: 'Chuyển tới cổ đông',
    ),
    const FabPhraseItem(phrase: 'Make a mistake', meaning: 'Mắc sai sót'),
  ];

  static List<FabAnswerItem> get conversationAnswers => const [
    FabAnswerItem(vi: 'bản sao', en: 'the copies'),
    FabAnswerItem(
      vi: 'bản báo cáo tài chính quý trước',
      en: 'the last quarter financial report',
    ),
    FabAnswerItem(vi: 'cuộc họp', en: 'our meeting'),
    FabAnswerItem(vi: 'chưa phô-tô', en: 'haven\'t made any copies'),
    FabAnswerItem(vi: 'thực hiện thay đổi', en: 'make any changes'),
    FabAnswerItem(vi: 'mắc sai sót', en: 'made a mistake'),
    FabAnswerItem(vi: 'tổng doanh thu', en: 'the total revenue'),
    FabAnswerItem(vi: 'đưa lại báo cáo', en: 'giving back the report'),
    FabAnswerItem(vi: 'chỉnh sửa', en: 'make the corrections'),
    FabAnswerItem(vi: 'làm ngay', en: 'do it right away'),
    FabAnswerItem(vi: 'gửi bản sao', en: 'send you a copy of the report'),
    FabAnswerItem(vi: 'hoàn thành', en: 'finished'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 1 Vocabulary (Stock Market)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk1Vocab => [
    const FabVocabItem(
      wordEn: 'stock market',
      wordVi: 'Thị trường chứng khoán',
      pronunciation: '/ˈstɑːk ˈmɑːrkɪt/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'shares dropped',
      wordVi: 'Giá giảm',
      pronunciation: '/ʃerz drɑːpt/',
      partOfSpeech: 'vp',
    ),
    const FabVocabItem(
      wordEn: 'revenue expectations',
      wordVi: 'Kỳ vọng doanh thu',
      pronunciation: '/ˈrevənuː ɪkˌspektˈeɪʃənz/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'percentage',
      wordVi: 'Phần trăm',
      pronunciation: '/pərˈsentɪdʒ/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'decline',
      wordVi: 'Sụt giảm',
      pronunciation: '/dɪˈklaɪn/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
    const FabPhraseItem(
      phrase: 'Stock prices dropped',
      meaning: 'Giá cổ phiếu giảm',
    ),
    const FabPhraseItem(
      phrase: 'Miss revenue expectations',
      meaning: 'Không đạt kỳ vọng doanh thu',
    ),
    const FabPhraseItem(
      phrase: 'Cut back prediction',
      meaning: 'Cắt giảm dự báo',
    ),
    const FabPhraseItem(
      phrase: 'Close at a price',
      meaning: 'Chốt phiên ở mức giá',
    ),
    const FabPhraseItem(phrase: 'Previous low', meaning: 'Mức thấp trước'),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => const [
    FabAnswerItem(vi: 'đài phát thanh NCC', en: 'NCC radio station'),
    FabAnswerItem(vi: 'bản tin mới nhất', en: 'the latest news'),
    FabAnswerItem(vi: 'thị trường chứng khoán', en: 'the stock market'),
    FabAnswerItem(vi: 'cổ phiếu', en: 'shares'),
    FabAnswerItem(vi: 'giảm xuống', en: 'dropped'),
    FabAnswerItem(vi: 'mức giá thấp nhất', en: 'their lowest price'),
    FabAnswerItem(
      vi: 'không đạt kỳ vọng doanh thu',
      en: 'missed revenue expectations',
    ),
    FabAnswerItem(vi: 'cắt giảm dự báo', en: 'cut back its prediction'),
    FabAnswerItem(vi: 'giảm', en: 'dropped'),
    FabAnswerItem(vi: 'chốt ở mức', en: 'close at'),
    FabAnswerItem(vi: 'mức thấp', en: 'low'),
    FabAnswerItem(vi: 'giảm xuống', en: 'have gone down'),
    FabAnswerItem(vi: 'báo cáo sụt giảm', en: 'reported a decline'),
    FabAnswerItem(vi: 'doanh thu quý 2', en: 'second-quarter revenue'),
    FabAnswerItem(vi: 'hạ thấp mục tiêu', en: 'reduce its target'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 2 Vocabulary (Mortgage)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk2Vocab => [
    const FabVocabItem(
      wordEn: 'mortgage',
      wordVi: 'Khoản vay thế chấp',
      pronunciation: '/ˈmɔːrɡɪdʒ/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'down payment',
      wordVi: 'Thanh toán trước',
      pronunciation: '/ˈdaʊn ˈpeɪmənt/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'savings account',
      wordVi: 'Tài khoản tiết kiệm',
      pronunciation: '/ˈseɪvɪŋz əˈkaʊnt/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'monthly income',
      wordVi: 'Thu nhập hàng tháng',
      pronunciation: '/ˈmʌnθli ˈɪŋkəm/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'lender',
      wordVi: 'Bên cho vay',
      pronunciation: '/ˈlendər/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
    const FabPhraseItem(
      phrase: 'Qualify for a mortgage',
      meaning: 'Đủ tiêu chuẩn vay thế chấp',
    ),
    const FabPhraseItem(
      phrase: 'Meet requirements',
      meaning: 'Đáp ứng yêu cầu',
    ),
    const FabPhraseItem(
      phrase: 'Make a down payment',
      meaning: 'Thanh toán trước',
    ),
    const FabPhraseItem(
      phrase: 'Show proof of income',
      meaning: 'Chứng minh thu nhập',
    ),
    const FabPhraseItem(phrase: 'In a timely manner', meaning: 'Đúng hạn'),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => const [
    FabAnswerItem(vi: 'một khoản vay thế chấp mua nhà', en: 'a home mortgage'),
    FabAnswerItem(vi: 'đáp ứng yêu cầu', en: 'meet a few requirements'),
    FabAnswerItem(vi: 'thanh toán trước', en: 'make a down payment'),
    FabAnswerItem(vi: 'chứng minh', en: 'show that'),
    FabAnswerItem(vi: 'công việc hiện tại', en: 'current job'),
    FabAnswerItem(vi: 'ít nhất', en: 'at least'),
    FabAnswerItem(vi: 'địa chỉ hiện tại', en: 'current address'),
    FabAnswerItem(vi: 'một tài khoản tiết kiệm', en: 'a savings account'),
    FabAnswerItem(vi: 'một số dư', en: 'a balance'),
    FabAnswerItem(vi: 'thu nhập hàng tháng', en: 'monthly income'),
    FabAnswerItem(vi: 'đảm bảo', en: 'assure'),
    FabAnswerItem(vi: 'thanh toán hàng tháng', en: 'monthly mortgage payments'),
    FabAnswerItem(vi: 'đúng hạn', en: 'a timely manner'),
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
    const MixedSegment.vietnamese('cần làm quen với', 'need to get used to'),
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
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 1 (A): M nói "copies... for our meeting tomorrow" = Trong một văn phòng.',
            en: 'Q1 (A): M says "copies... for our meeting tomorrow" = In an office.',
          ),
          const FabAnswerItem(
            vi: 'Câu 2 (C): M nói "accountant made a mistake when she calculated... resulted in several incorrect numbers" = Có sai sót trong báo cáo.',
            en: 'Q2 (C): M says "accountant made a mistake when she calculated... resulted in several incorrect numbers" = There are errors in it.',
          ),
          const FabAnswerItem(
            vi: 'Câu 3 (D): M đề nghị "giving back the report to the accounting department" = Đưa báo cáo lại phòng kế toán.',
            en: 'Q3 (D): M suggests "giving back the report to the accounting department" = Bring the report to the accounting department.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme09_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Stock Market News',
        titleVi: 'Luyện tập 2: Bài ngắn - Tin thị trường chứng khoán',
        audioTrackKey: 'track_37',
        questions: _practice2Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 4 (A): "shares of AAS Technologies dropped to their lowest price in two years" = Mức thấp nhất trong 2 năm.',
            en: 'Q4 (A): "shares of AAS Technologies dropped to their lowest price in two years" = They are at their lowest level in two years.',
          ),
          const FabAnswerItem(
            vi: 'Câu 5 (D): "company missed revenue expectations and cut back its prediction" = Doanh thu thấp hơn dự đoán.',
            en: 'Q5 (D): "company missed revenue expectations and cut back its prediction" = Their revenues will be lower than expected.',
          ),
          const FabAnswerItem(
            vi: 'Câu 6 (C): "close at forty-five dollar and fifty cents" = 45.50 đô-la.',
            en: 'Q6 (C): "close at forty-five dollar and fifty cents" = \$45.50.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme09_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Mortgage Requirements',
        titleVi: 'Luyện tập 3: Bài ngắn - Yêu cầu khoản vay thế chấp',
        audioTrackKey: 'track_38',
        questions: _practice3Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 7 (B): Bài nói về quy trình "qualify for a home mortgage" = Những người muốn vay tiền mua nhà.',
            en: 'Q7 (B): The talk discusses how to "qualify for a home mortgage" = People who want to borrow money.',
          ),
          const FabAnswerItem(
            vi: 'Câu 8 (D): "you have to be able to make a down payment of 20 percent" = 20 phần trăm.',
            en: 'Q8 (D): "you have to be able to make a down payment of 20 percent" = 20 percent.',
          ),
          const FabAnswerItem(
            vi: 'Câu 9 (B): "living at your current address for over five years" = Một địa chỉ hiện tại (ổn định).',
            en: 'Q9 (B): "living at your current address for over five years" = A current address.',
          ),
        ],
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
    const QuizQuestion(
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
    const QuizQuestion(
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
    const QuizQuestion(
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
    const QuizQuestion(
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
    const QuizQuestion(
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
    const QuizQuestion(
      id: 'theme09_q06',
      questionText: 'What was the final price for shares of AAS Technologies?',
      options: ['(A) \$0.75', '(B) \$1.70', '(C) \$45.50', '(D) \$46.15'],
      correctIndex: 2,
      audioTrackKey: 'track_37',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
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
    const QuizQuestion(
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
    const QuizQuestion(
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

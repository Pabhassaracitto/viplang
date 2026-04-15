import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme1Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_01_offices',
    themeNumber: 1,
    titleEn: 'Offices',
    titleVi: '"Trong" Văn Phòng',
    description:
        'Nói về những cuộc họp, gọi điện thoại, gửi fax, tin nhắn, trang thiết bị văn phòng, thư điện tử và các giao tiếp chung trong văn phòng.',
    iconEmoji: '🏢',
    isUnlocked: true,
    totalDays: 2,
  );

  // ─── VOCABULARY LIST (ĐẦY ĐỦ) ────────────────────────────────
  static List<VocabModel> get vocabulary => [
    // ── Từ vựng chính bài đọc ──
    VocabModel(
      id: 'v01_01', wordEn: 'familiar', wordVi: 'quen thuộc',
      pronunciation: '/fəˈmɪliər/', partOfSpeech: 'adj',
      themeId: 'theme_01_offices',
      exampleEn: 'This familiar theme will occur in all seven sections.',
      exampleVi: 'Chủ đề quen thuộc này sẽ xuất hiện ở tất cả bảy phần.',
    ),
    VocabModel(
      id: 'v01_02', wordEn: 'occur', wordVi: 'xuất hiện',
      pronunciation: '/əˈkɜːr/', partOfSpeech: 'v',
      themeId: 'theme_01_offices',
      exampleEn: 'Problems may occur during the meeting.',
      exampleVi: 'Các vấn đề có thể xuất hiện trong cuộc họp.',
    ),
    VocabModel(
      id: 'v01_03', wordEn: 'memo', wordVi: 'thông báo nội bộ',
      pronunciation: '/ˈmemoʊ/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'Please read the memo about the new policy.',
      exampleVi: 'Vui lòng đọc thông báo nội bộ về chính sách mới.',
    ),
    VocabModel(
      id: 'v01_04', wordEn: 'conference', wordVi: 'hội nghị',
      pronunciation: '/ˈkɒnfərəns/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'We have an annual conference every December.',
      exampleVi: 'Chúng tôi có hội nghị thường niên vào tháng 12 hàng năm.',
    ),
    VocabModel(
      id: 'v01_05', wordEn: 'equipment', wordVi: 'trang thiết bị',
      pronunciation: '/ɪˈkwɪpmənt/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'All office equipment must be checked monthly.',
      exampleVi: 'Tất cả trang thiết bị văn phòng phải được kiểm tra hàng tháng.',
    ),
    VocabModel(
      id: 'v01_06', wordEn: 'policy', wordVi: 'chính sách',
      pronunciation: '/ˈpɒlɪsi/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'The company has a strict no-smoking policy.',
      exampleVi: 'Công ty có chính sách nghiêm cấm hút thuốc.',
    ),
    VocabModel(
      id: 'v01_07', wordEn: 'procedure', wordVi: 'quy trình',
      pronunciation: '/prəˈsiːdʒər/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'Follow the standard procedure for filing documents.',
      exampleVi: 'Hãy tuân thủ quy trình tiêu chuẩn để lưu trữ tài liệu.',
    ),
    VocabModel(
      id: 'v01_08', wordEn: 'department', wordVi: 'phòng ban',
      pronunciation: '/dɪˈpɑːrtmənt/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'The marketing department needs five new members.',
      exampleVi: 'Phòng ban marketing cần thêm năm thành viên mới.',
    ),
    VocabModel(
      id: 'v01_09', wordEn: 'photocopier', wordVi: 'máy photocopy',
      pronunciation: '/ˈfoʊtoʊˌkɒpiər/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'The photocopier on the 6th floor is broken.',
      exampleVi: 'Máy photocopy ở tầng 6 bị hỏng.',
    ),
    VocabModel(
      id: 'v01_10', wordEn: 'terminate', wordVi: 'chấm dứt, sa thải',
      pronunciation: '/ˈtɜːrmɪneɪt/', partOfSpeech: 'v',
      themeId: 'theme_01_offices',
      exampleEn: 'The manager decided to terminate his employment.',
      exampleVi: 'Quản lý quyết định chấm dứt hợp đồng lao động của anh ấy.',
    ),
    VocabModel(
      id: 'v01_11', wordEn: 'collocation', wordVi: 'cách kết hợp từ',
      pronunciation: '/ˌkɒləˈkeɪʃən/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: '"Hold a meeting" is a common collocation.',
      exampleVi: '"Hold a meeting" là cách kết hợp từ phổ biến.',
    ),
    VocabModel(
      id: 'v01_12', wordEn: 'comprehend', wordVi: 'hiểu',
      pronunciation: '/ˌkɒmprɪˈhend/', partOfSpeech: 'v',
      themeId: 'theme_01_offices',
      exampleEn: 'It is difficult to comprehend complex instructions.',
      exampleVi: 'Rất khó để hiểu các hướng dẫn phức tạp.',
    ),
    VocabModel(
      id: 'v01_13', wordEn: 'personnel', wordVi: 'nhân sự',
      pronunciation: '/ˌpɜːrsəˈnel/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'The personnel department handles all hiring.',
      exampleVi: 'Phòng nhân sự xử lý tất cả các vấn đề tuyển dụng.',
    ),
    VocabModel(
      id: 'v01_14', wordEn: 'available', wordVi: 'sẵn sàng, rảnh rỗi',
      pronunciation: '/əˈveɪləbl/', partOfSpeech: 'adj',
      themeId: 'theme_01_offices',
      exampleEn: 'Are there any technicians available right now?',
      exampleVi: 'Có kỹ thuật viên nào sẵn sàng không?',
    ),
    VocabModel(
      id: 'v01_15', wordEn: 'maintenance', wordVi: 'bảo trì',
      pronunciation: '/ˈmeɪntənəns/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'The maintenance team fixed the air conditioner.',
      exampleVi: 'Đội bảo trì đã sửa máy điều hòa.',
    ),

    // ── Từ vựng Short Talk 1 (Voice Mail) ──
    VocabModel(
      id: 'v01_16', wordEn: 'voice mail', wordVi: 'hộp thư thoại',
      pronunciation: '/ˈvɔɪs meɪl/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'This is the voice mail of Brian James.',
      exampleVi: 'Đây là hộp thư thoại của Brian James.',
    ),
    VocabModel(
      id: 'v01_17', wordEn: 'emergency', wordVi: 'tình huống khẩn cấp',
      pronunciation: '/ɪˈmɜːrdʒənsi/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'If it is an emergency, please call Ms. Clarke.',
      exampleVi: 'Nếu có tình huống khẩn cấp, xin gọi cho chị Clarke.',
    ),
    VocabModel(
      id: 'v01_18', wordEn: 'teaching assistant', wordVi: 'trợ lý giáo vụ',
      pronunciation: '/ˈtiːtʃɪŋ əˈsɪstənt/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'Please call my teaching assistant Ms. Clarke.',
      exampleVi: 'Vui lòng gọi cho trợ lý giáo vụ của tôi là chị Clarke.',
    ),
    VocabModel(
      id: 'v01_19', wordEn: 'extension', wordVi: 'số máy lẻ',
      pronunciation: '/ɪkˈstenʃən/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'Please call Ms. Clarke at extension 71.',
      exampleVi: 'Vui lòng gọi cho chị Clarke theo số máy lẻ 71.',
    ),
    VocabModel(
      id: 'v01_20', wordEn: 'take care of', wordVi: 'phụ trách, chăm sóc',
      pronunciation: '/teɪk ker əv/', partOfSpeech: 'vp',
      themeId: 'theme_01_offices',
      exampleEn: 'Ms. Clarke will take care of all my daily work.',
      exampleVi: 'Chị Clarke sẽ phụ trách mọi công việc hàng ngày của tôi.',
    ),
    VocabModel(
      id: 'v01_21', wordEn: 'daily work', wordVi: 'công việc hàng ngày',
      pronunciation: '/ˈdeɪli wɜːrk/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'Ms. Clarke will take care of all of my daily work.',
      exampleVi: 'Chị Clarke sẽ phụ trách tất cả công việc hàng ngày của tôi.',
    ),
    VocabModel(
      id: 'v01_22', wordEn: 'personal response', wordVi: 'câu trả lời cá nhân',
      pronunciation: '/ˈpɜːrsənəl rɪˈspɒns/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'If you need my personal responses, send me an email.',
      exampleVi: 'Nếu cần tôi trả lời cá nhân, hãy gửi email cho tôi.',
    ),
    VocabModel(
      id: 'v01_23', wordEn: 'as soon as possible', wordVi: 'sớm nhất có thể',
      pronunciation: '/æz suːn æz ˈpɒsɪbəl/', partOfSpeech: 'adv',
      themeId: 'theme_01_offices',
      exampleEn: "I'll reply to you as soon as possible.",
      exampleVi: 'Tôi sẽ trả lời bạn sớm nhất có thể.',
    ),

    // ── Từ vựng Short Talk 2 (Office Space) ──
    VocabModel(
      id: 'v01_24', wordEn: 'discuss', wordVi: 'bàn bạc, thảo luận',
      pronunciation: '/dɪˈskʌs/', partOfSpeech: 'v',
      themeId: 'theme_01_offices',
      exampleEn: 'We are here to discuss the lack of space.',
      exampleVi: 'Chúng ta ở đây để bàn về vấn đề thiếu không gian.',
    ),
    VocabModel(
      id: 'v01_25', wordEn: 'space', wordVi: 'không gian trống',
      pronunciation: '/speɪs/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'We need to create more space for everybody.',
      exampleVi: 'Chúng ta cần tạo ra thêm không gian cho mọi người.',
    ),
    VocabModel(
      id: 'v01_26', wordEn: 'marketing team', wordVi: 'nhóm marketing',
      pronunciation: '/ˈmɑːrkɪtɪŋ tiːm/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'We added 5 new members to the marketing team.',
      exampleVi: 'Chúng ta thêm 5 thành viên mới vào nhóm marketing.',
    ),
    VocabModel(
      id: 'v01_27', wordEn: 'increase', wordVi: 'tăng lên, gia tăng',
      pronunciation: '/ɪnˈkriːs/', partOfSpeech: 'v',
      themeId: 'theme_01_offices',
      exampleEn: 'This increases the number of staff members to 20.',
      exampleVi: 'Điều này làm tăng số lượng nhân viên lên 20 người.',
    ),
    VocabModel(
      id: 'v01_28', wordEn: 'staff members', wordVi: 'nhân viên',
      pronunciation: '/stæf ˈmembərz/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'The number of staff members increased to 20.',
      exampleVi: 'Số lượng nhân viên tăng lên 20 người.',
    ),
    VocabModel(
      id: 'v01_29', wordEn: 'hold', wordVi: 'tổ chức (cuộc họp)',
      pronunciation: '/hoʊld/', partOfSpeech: 'v',
      themeId: 'theme_01_offices',
      exampleEn: 'It is difficult to hold weekly group meetings.',
      exampleVi: 'Rất khó để tổ chức các buổi họp nhóm hàng tuần.',
    ),
    VocabModel(
      id: 'v01_30', wordEn: 'weekly group meetings', wordVi: 'cuộc họp nhóm hàng tuần',
      pronunciation: '/ˈwiːkli ɡruːp ˈmiːtɪŋz/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'We cannot hold weekly group meetings anymore.',
      exampleVi: 'Chúng ta không thể tổ chức các buổi họp nhóm hàng tuần nữa.',
    ),
    VocabModel(
      id: 'v01_31', wordEn: 'therefore', wordVi: 'do đó',
      pronunciation: '/ˈðerfɔːr/', partOfSpeech: 'conj',
      themeId: 'theme_01_offices',
      exampleEn: 'Therefore, we need to get rid of old files.',
      exampleVi: 'Do đó, chúng ta cần loại bỏ những tài liệu cũ.',
    ),
    VocabModel(
      id: 'v01_32', wordEn: 'in order to', wordVi: 'để làm gì',
      pronunciation: '/ɪn ˈɔːrdər tuː/', partOfSpeech: 'conj',
      themeId: 'theme_01_offices',
      exampleEn: 'In order to create more space, we need to remove desks.',
      exampleVi: 'Để tạo thêm không gian, chúng ta cần dời bàn ghế đi.',
    ),
    VocabModel(
      id: 'v01_33', wordEn: 'get rid of', wordVi: 'loại bỏ, từ bỏ',
      pronunciation: '/ɡet rɪd əv/', partOfSpeech: 'vp',
      themeId: 'theme_01_offices',
      exampleEn: 'We need to get rid of all files we no longer need.',
      exampleVi: 'Chúng ta cần loại bỏ tất cả tài liệu không còn cần nữa.',
    ),
    VocabModel(
      id: 'v01_34', wordEn: 'no longer', wordVi: 'không còn nữa',
      pronunciation: '/noʊ ˈlɔːŋɡər/', partOfSpeech: 'adv',
      themeId: 'theme_01_offices',
      exampleEn: 'Get rid of all books that we no longer need.',
      exampleVi: 'Loại bỏ tất cả sách mà chúng ta không còn cần nữa.',
    ),
    VocabModel(
      id: 'v01_35', wordEn: 'take up', wordVi: 'chiếm (không gian)',
      pronunciation: '/teɪk ʌp/', partOfSpeech: 'vp',
      themeId: 'theme_01_offices',
      exampleEn: 'Those things are taking up all of our space.',
      exampleVi: 'Những thứ đó đang chiếm hết không gian của chúng ta.',
    ),
    VocabModel(
      id: 'v01_36', wordEn: 'freely', wordVi: 'thoải mái, dễ dàng',
      pronunciation: '/ˈfriːli/', partOfSpeech: 'adv',
      themeId: 'theme_01_offices',
      exampleEn: 'We can move more freely around here.',
      exampleVi: 'Chúng ta có thể di chuyển thoải mái hơn nơi này.',
    ),

    // ── Từ vựng hội thoại (Conversation) ──
    VocabModel(
      id: 'v01_37', wordEn: 'accounting', wordVi: 'phòng kế toán',
      pronunciation: '/əˈkaʊntɪŋ/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'Jane works in the accounting department.',
      exampleVi: 'Jane làm việc ở phòng kế toán.',
    ),
    VocabModel(
      id: 'v01_38', wordEn: 'broken', wordVi: 'bị hỏng',
      pronunciation: '/ˈbroʊkən/', partOfSpeech: 'adj',
      themeId: 'theme_01_offices',
      exampleEn: 'The photocopier is broken.',
      exampleVi: 'Máy photocopy bị hỏng.',
    ),
    VocabModel(
      id: 'v01_39', wordEn: 'technician', wordVi: 'kỹ thuật viên',
      pronunciation: '/tekˈnɪʃən/', partOfSpeech: 'n',
      themeId: 'theme_01_offices',
      exampleEn: 'Are there any technicians available?',
      exampleVi: 'Có kỹ thuật viên nào sẵn sàng không?',
    ),
    VocabModel(
      id: 'v01_40', wordEn: 'I\'m afraid', wordVi: 'e rằng, tiếc là',
      pronunciation: '/aɪm əˈfreɪd/', partOfSpeech: 'phrase',
      themeId: 'theme_01_offices',
      exampleEn: "I'm afraid that is not possible.",
      exampleVi: 'Tiếc là điều đó không thể được.',
    ),
    VocabModel(
      id: 'v01_41', wordEn: 'in that case', wordVi: 'trong trường hợp đó',
      pronunciation: '/ɪn ðæt keɪs/', partOfSpeech: 'phrase',
      themeId: 'theme_01_offices',
      exampleEn: 'In that case, I will go there myself.',
      exampleVi: 'Trong trường hợp đó, tôi sẽ tự tới đó.',
    ),
  ];

  // ─── FAB DATA: Từ vựng cần nắm vững theo từng bài ─────────────
  static List<FabVocabItem> get shortTalk1Vocab => [
    FabVocabItem(wordEn: 'the voice mail', pronunciation: '/ðə vɔɪs meɪl/', wordVi: 'Hộp thư thoại', partOfSpeech: 'np'),
    FabVocabItem(wordEn: "teachers' conference", pronunciation: '/ˈtiːtʃərz ˈkɒnfərəns/', wordVi: 'Hội nghị giáo viên', partOfSpeech: 'np'),
    FabVocabItem(wordEn: 'an emergency', pronunciation: '/æn ɪˈmɜːrdʒənsi/', wordVi: 'Một tình huống khẩn cấp', partOfSpeech: 'np'),
    FabVocabItem(wordEn: 'teaching assistant', pronunciation: '/ˈtiːtʃɪŋ əˈsɪstənt/', wordVi: 'Trợ lý giáo vụ', partOfSpeech: 'n'),
    FabVocabItem(wordEn: 'at extension', pronunciation: '/æt ɪkˈstenʃən/', wordVi: 'Theo số máy lẻ', partOfSpeech: 'prep'),
    FabVocabItem(wordEn: 'take care of', pronunciation: '/teɪk ker əv/', wordVi: 'Phụ trách, chăm sóc', partOfSpeech: 'vp'),
    FabVocabItem(wordEn: 'daily work', pronunciation: '/ˈdeɪli wɜːrk/', wordVi: 'Công việc hàng ngày', partOfSpeech: 'np'),
    FabVocabItem(wordEn: 'personal response', pronunciation: '/ˈpɜːrsənəl rɪˈspɒns/', wordVi: 'Câu trả lời cá nhân', partOfSpeech: 'np'),
    FabVocabItem(wordEn: 'as soon as possible', pronunciation: '/æz suːn æz ˈpɒsɪbəl/', wordVi: 'Sớm nhất có thể', partOfSpeech: 'adv'),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
    FabPhraseItem(phrase: 'Be out of the office', meaning: 'Vắng mặt khỏi văn phòng'),
    FabPhraseItem(phrase: 'Please (do sth)', meaning: 'Vui lòng làm gì'),
    FabPhraseItem(phrase: 'Back in the office', meaning: 'Trở lại văn phòng'),
    FabPhraseItem(phrase: 'Reply to sb', meaning: 'Trả lời cho ai, hồi âm cho ai'),
    FabPhraseItem(phrase: 'Feel free to do sth', meaning: 'Đừng ngại làm gì'),
    FabPhraseItem(phrase: 'Send sb sth', meaning: 'Gửi cho ai cái gì'),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => [
    FabAnswerItem(vi: 'Hộp thư thoại', en: 'the voice mail'),
    FabAnswerItem(vi: 'Không có ở văn phòng', en: 'be out of the office'),
    FabAnswerItem(vi: 'Một hội nghị giáo viên', en: "a teachers' conference"),
    FabAnswerItem(vi: 'Một tình huống khẩn cấp', en: 'an emergency'),
    FabAnswerItem(vi: 'Trợ lý giáo vụ của tôi', en: 'my teaching assistant'),
    FabAnswerItem(vi: 'Theo số máy lẻ', en: 'at extension'),
    FabAnswerItem(vi: 'Phụ trách', en: 'take care of'),
    FabAnswerItem(vi: 'Các công việc hàng ngày của tôi', en: 'my daily work'),
    FabAnswerItem(vi: 'Trở lại văn phòng', en: 'back in the office'),
    FabAnswerItem(vi: 'Các câu trả lời cá nhân', en: 'personal responses'),
    FabAnswerItem(vi: 'Đừng ngại gửi cho tôi', en: 'feel free to send me'),
    FabAnswerItem(vi: 'Trả lời cho', en: 'reply to'),
    FabAnswerItem(vi: 'Sớm nhất có thể', en: 'as soon as possible'),
  ];

  static List<FabVocabItem> get shortTalk2Vocab => [
    FabVocabItem(wordEn: 'discuss', pronunciation: '/dɪˈskʌs/', wordVi: 'Bàn bạc, thảo luận', partOfSpeech: 'v'),
    FabVocabItem(wordEn: 'space', pronunciation: '/speɪs/', wordVi: 'Không gian trống', partOfSpeech: 'n'),
    FabVocabItem(wordEn: 'the marketing team', pronunciation: '/ðə ˈmɑːrkɪtɪŋ tiːm/', wordVi: 'Đội/nhóm marketing', partOfSpeech: 'np'),
    FabVocabItem(wordEn: 'increase', pronunciation: '/ɪnˈkriːs/', wordVi: 'Tăng lên, gia tăng', partOfSpeech: 'v'),
    FabVocabItem(wordEn: 'staff members', pronunciation: '/stæf ˈmembərz/', wordVi: 'Nhân viên', partOfSpeech: 'np'),
    FabVocabItem(wordEn: 'hold', pronunciation: '/hoʊld/', wordVi: 'Tổ chức (buổi họp)', partOfSpeech: 'v'),
    FabVocabItem(wordEn: 'weekly group meetings', pronunciation: '/ˈwiːkli ɡruːp ˈmiːtɪŋz/', wordVi: 'Các cuộc họp nhóm hàng tuần', partOfSpeech: 'np'),
    FabVocabItem(wordEn: 'therefore', pronunciation: '/ˈðerfɔːr/', wordVi: 'Do đó', partOfSpeech: 'conj'),
    FabVocabItem(wordEn: 'in order to', pronunciation: '/ɪn ˈɔːrdər tuː/', wordVi: 'Để làm gì', partOfSpeech: 'conj'),
    FabVocabItem(wordEn: 'get rid of', pronunciation: '/ɡet rɪd əv/', wordVi: 'Loại bỏ, từ bỏ', partOfSpeech: 'vp'),
    FabVocabItem(wordEn: 'no longer', pronunciation: '/noʊ ˈlɔːŋɡər/', wordVi: 'Không còn nữa', partOfSpeech: 'adv'),
    FabVocabItem(wordEn: 'take up', pronunciation: '/teɪk ʌp/', wordVi: 'Chiếm (không gian)', partOfSpeech: 'vp'),
    FabVocabItem(wordEn: 'freely', pronunciation: '/ˈfriːli/', wordVi: 'Thoải mái, dễ dàng', partOfSpeech: 'adv'),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
    FabPhraseItem(phrase: 'The lack of sth', meaning: 'Sự thiếu hụt (cái gì)'),
    FabPhraseItem(phrase: 'As you all know', meaning: 'Như tất cả các bạn đã biết'),
    FabPhraseItem(phrase: 'At the back of sth', meaning: 'Phía cuối, phía sau'),
    FabPhraseItem(phrase: 'Make it really difficult (for sb to do sth)', meaning: 'Thực sự gây khó khăn cho ai để làm gì'),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => [
    FabAnswerItem(vi: 'Có mặt ở đây', en: 'are here'),
    FabAnswerItem(vi: 'Sự thiếu không gian', en: 'the lack of space'),
    FabAnswerItem(vi: 'Đã thêm', en: 'added'),
    FabAnswerItem(vi: 'Vào nhóm tiếp thị', en: 'to the marketing team'),
    FabAnswerItem(vi: 'Làm tăng', en: 'increases'),
    FabAnswerItem(vi: 'Lên tới 20 người', en: 'to 20 people'),
    FabAnswerItem(vi: 'Đã khiến cho nó thật sự khó khăn', en: 'has made it really difficult'),
    FabAnswerItem(vi: 'Các buổi họp nhóm hàng tuần', en: 'weekly group meetings'),
    FabAnswerItem(vi: 'Quá nhiều ghế', en: 'too many chairs'),
    FabAnswerItem(vi: 'Để tạo ra', en: 'in order to create'),
    FabAnswerItem(vi: 'Cho mọi người', en: 'for everybody'),
    FabAnswerItem(vi: 'Loại bỏ', en: 'get rid of'),
    FabAnswerItem(vi: 'Không còn cần nữa', en: 'no longer need'),
    FabAnswerItem(vi: 'Đang chiếm', en: 'are taking up'),
    FabAnswerItem(vi: 'Không gian của chúng ta', en: 'our space'),
    FabAnswerItem(vi: 'Cũng nên được chuyển đi', en: 'should also be moved'),
    FabAnswerItem(vi: 'Di chuyển thoải mái hơn', en: 'move more freely'),
  ];

  // ─── DAY 1 ────────────────────────────────────────────────────
  static LessonDay get day1 => LessonDay(
    id: 'theme01_day1',
    dayNumber: 1,
    themeId: 'theme_01_offices',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      // PHASE 1: READ & LISTEN
      LessonPhase(
        id: 'theme01_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_03',
        contentEn: '''This familiar theme will occur in all seven sections of the TOEIC test. It is generally about office situations such as meetings, conferences, office equipment, policies and procedures and is related directly to both the Personnel and Purchasing themes (see 'things in the office' in the Purchasing section).

In the office, situations will be about all kinds of meetings, memos, letters, faxes, emails, departments, all kinds of equipment that has to be looked after such as photocopiers, fax machines, computers, air conditioners, telephones. It is helpful to understand collocations such as 'to hold a meeting', 'to downsize a department', or idiomatic/slang expressions such as 'to sack someone', 'to fire someone' or 'show someone the door' or 'let someone go' all of which mean to terminate (end) someone's employment. To repeat an earlier point, single words and their synonyms are not enough to do well on the TOEIC test, this is particularly the case in conversations of an informal nature where the chance of hearing 'common' or idiomatic language increases. The office theme also uses verbal announcements and written memos to communicate important news to the employees, these would tend to be more formal and thus less difficult to comprehend than face-to-face conversations.''',
        contentVi: '''Chủ đề quen thuộc này sẽ xuất hiện ở tất cả bảy phần của bài thi TOEIC. Chủ đề này nói về các tình huống trong văn phòng nói chung như là các cuộc họp, hội nghị, trang thiết bị trong văn phòng, các chính sách và các quy trình công việc trong công ty, và liên quan trực tiếp tới các chuyên đề Nhân sự và chuyên đề Mua sắm trong doanh nghiệp.

Trong văn phòng, các tình huống sẽ là về các vấn đề gồm họp hành, thông báo nội bộ, thư tín, bản fax, thư điện tử, các phòng ban, tất cả các loại thiết bị văn phòng mà cần được quan tâm như là máy phô-tô, máy fax, máy tính, máy điều hòa, hay điện thoại. Sẽ rất hữu ích khi hiểu về các cách kết hợp từ, chẳng hạn như 'to hold a meeting' (tổ chức một buổi họp), 'to downsize a department' (cắt giảm nhân viên của một phòng ban), hoặc các cách diễn đạt mang tính thành ngữ hoặc tiếng lóng như 'to sack someone', 'to fire someone', hoặc 'show someone the door', hay 'let someone go', tất cả đều có nghĩa là sa thải hoặc cho ai đó thôi việc.''',
      ),

      // PHASE 2: TRANSLATE
      LessonPhase(
        id: 'theme01_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_03',
        contentEn: '''This familiar theme will occur in all seven sections of the TOEIC test. It is generally about office situations such as meetings, conferences, office equipment, policies and procedures.

In the office, situations will be about all kinds of meetings, memos, letters, faxes, emails, departments, all kinds of equipment that has to be looked after such as photocopiers, fax machines, computers, air conditioners, telephones.

The office theme also uses verbal announcements and written memos to communicate important news to the employees, these would tend to be more formal and thus less difficult to comprehend than face-to-face conversations.''',
        contentVi: '''Chủ đề quen thuộc này sẽ xuất hiện ở tất cả bảy phần của bài thi TOEIC. Chủ đề này nói về các tình huống trong văn phòng nói chung như là các cuộc họp, hội nghị, trang thiết bị trong văn phòng, các chính sách và các quy trình công việc.

Trong văn phòng, các tình huống sẽ là về các vấn đề gồm họp hành, thông báo nội bộ, thư tín, bản fax, thư điện tử, các phòng ban, tất cả các loại thiết bị văn phòng mà cần được quan tâm như là máy phô-tô, máy fax, máy tính, máy điều hòa, hay điện thoại.

Chuyên đề Văn phòng này cũng sử dụng các thông báo bằng lời và các thông báo nội bộ dưới dạng viết để truyền tải những tin tức quan trọng tới nhân viên.''',
      ),

      // PHASE 3: MIND GAME
      LessonPhase(
        id: 'theme01_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
      ),

      // PHASE 4: VOCABULARY
      LessonPhase(
        id: 'theme01_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('This familiar theme '),
    const MixedSegment.vietnamese('sẽ xuất hiện', 'will occur'),
    const MixedSegment.english(' in '),
    const MixedSegment.vietnamese('tất cả bảy phần', 'all seven sections'),
    const MixedSegment.english(' of the TOEIC test. It is generally about '),
    const MixedSegment.vietnamese('các tình huống văn phòng', 'office situations'),
    const MixedSegment.english(' such as '),
    const MixedSegment.vietnamese('các cuộc họp', 'meetings'),
    const MixedSegment.english(', conferences, '),
    const MixedSegment.vietnamese('thiết bị văn phòng', 'office equipment'),
    const MixedSegment.english(', policies and '),
    const MixedSegment.vietnamese('các quy trình', 'procedures'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('có liên quan trực tiếp đến', 'is related directly to'),
    const MixedSegment.english(' both the Personnel and Purchasing themes.\n\n'),
    const MixedSegment.vietnamese('Ở trong văn phòng', 'In the office'),
    const MixedSegment.english(', situations will be about all meetings, '),
    const MixedSegment.vietnamese('các thông báo nội bộ', 'memos'),
    const MixedSegment.english(', letters, faxes, emails, '),
    const MixedSegment.vietnamese('các phòng ban', 'departments'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('tất cả các loại thiết bị', 'all kinds of equipment'),
    const MixedSegment.english(' that has to '),
    const MixedSegment.vietnamese('được quan tâm chăm sóc', 'be looked after'),
    const MixedSegment.english(' such as '),
    const MixedSegment.vietnamese('những chiếc máy phô-tô', 'photocopiers'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('những chiếc máy fax', 'fax machines'),
    const MixedSegment.english(', computers, '),
    const MixedSegment.vietnamese('các máy điều hòa', 'air-conditioners'),
    const MixedSegment.english(', telephones.\n\nIt is helpful to understand '),
    const MixedSegment.vietnamese('các cách kết hợp từ', 'collocations'),
    const MixedSegment.english(' such as \'to '),
    const MixedSegment.vietnamese('tổ chức', 'hold'),
    const MixedSegment.english(' a meeting\', or idiomatic/slang '),
    const MixedSegment.vietnamese('các cách diễn đạt', 'expressions'),
    const MixedSegment.english(' such as \'to sack someone\', \'to fire someone\' or \''),
    const MixedSegment.vietnamese('tống khứ ai', 'show someone the door'),
    const MixedSegment.english('\' all of which mean to '),
    const MixedSegment.vietnamese('chấm dứt', 'terminate'),
    const MixedSegment.english(' someone\'s employment.\n\nThe office theme also uses '),
    const MixedSegment.vietnamese('các thông báo bằng lời nói', 'verbal announcements'),
    const MixedSegment.english(' and written memos to communicate '),
    const MixedSegment.vietnamese('những tin tức quan trọng', 'important news'),
    const MixedSegment.english(' to the employees, these would '),
    const MixedSegment.vietnamese('có xu hướng', 'tend'),
    const MixedSegment.english(' to be '),
    const MixedSegment.vietnamese('trang trọng hơn', 'more formal'),
    const MixedSegment.english(' and thus less difficult '),
    const MixedSegment.vietnamese('để hiểu', 'to comprehend'),
    const MixedSegment.english(' than '),
    const MixedSegment.vietnamese('các cuộc hội thoại trực tiếp', 'face-to-face conversations'),
    const MixedSegment.english('.'),
  ];

  // ─── DAY 2 ────────────────────────────────────────────────────
  static LessonDay get day2 => LessonDay(
    id: 'theme01_day2',
    dayNumber: 2,
    themeId: 'theme_01_offices',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      // PHASE 1: Listening Quiz - Practice 1
      LessonPhase(
        id: 'theme01_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation',
        titleVi: 'Luyện tập 1: Hội thoại',
        audioTrackKey: 'track_04',
        questions: _practice1Questions,
      ),

      // PHASE 2: Listening Quiz - Practice 2
      LessonPhase(
        id: 'theme01_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Voice Mail',
        titleVi: 'Luyện tập 2: Bài ngắn - Thư thoại',
        audioTrackKey: 'track_05',
        questions: _practice2Questions,
      ),

      // PHASE 3: Listening Quiz - Practice 3
      LessonPhase(
        id: 'theme01_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Office Speech',
        titleVi: 'Luyện tập 3: Bài ngắn - Thông báo văn phòng',
        audioTrackKey: 'track_06',
        questions: _practice3Questions,
      ),

      // ✅ NEW PHASE: Nghe và Dịch - Conversation
      LessonPhase(
        id: 'theme01_day2_translate1',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Conversation',
        titleVi: 'Nghe và Dịch: Hội thoại',
        audioTrackKey: 'track_04',
        contentEn: '''W: Hello, this is Jane from Accounting. I'm calling to report a broken photocopier in our office on the 6th floor. Are there any technicians from the maintenance department available? Do you think that you could send one over to fix it right now?

M: I'm sorry, but all our technicians are on jobs right now and none of them are in the office. Can it wait until tomorrow morning?

W: I'm afraid that is not possible because it's the only photocopier we have here, and we have a lot of copies to make this afternoon.

M: In that case, I guess I will have to go there and fix it myself. I will be over there in about 30 minutes.''',
        contentVi: '''W: Xin chào, đây là Jane ở phòng kế toán. Tôi gọi điện để báo một chiếc máy phô-tô trong phòng của chúng ta ở tầng 6 bị hỏng. Ở đó có còn kỹ thuật viên nào của phòng bảo trì không? Anh có nghĩ rằng có thể cho một kỹ thuật viên tới sửa máy ngay bây giờ không?

M: Tôi xin lỗi, nhưng tất cả các kỹ thuật viên đang bận việc bây giờ rồi, và giờ chẳng có kỹ thuật viên nào ở trong phòng cả. Liệu để nó tới sáng mai sửa được không?

W: Tôi e là không thể được bởi vì đây là cái máy phô-tô duy nhất mà chúng tôi có ở đây, và chúng tôi có rất nhiều tài liệu phải phô-tô chiều nay.

M: Trong trường hợp này tôi nghĩ là tôi phải tự tới đó để sửa thôi. Tôi sẽ lên đó trong khoảng 30 phút tới nhé.''',
      ),

      // ✅ NEW PHASE: Nghe và Dịch - Short Talk 1
      LessonPhase(
        id: 'theme01_day2_translate2',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Short Talk 1 - Voice Mail',
        titleVi: 'Nghe và Dịch: Bài ngắn 1 - Thư thoại',
        audioTrackKey: 'track_05',
        contentEn: '''This is the voice mail of Brian James at Smartcom Training Center. I will be out of the office all week at a teachers' conference.

If it is an emergency, please call my teaching assistant Ms. Clarke at extension 71. Ms. Clarke will take care of all of my daily work until I'm back in the office this weekend.

If you need my personal responses before the end of the week, feel free to send me an email at brianjames@smartcom.vn. I'll reply to you as soon as possible. Thank you.''',
        contentVi: '''Đây là hộp thư thoại của Brian James ở trung tâm đào tạo Smartcom. Tôi sẽ không có ở văn phòng cả tuần này để tham dự hội nghị giáo viên.

Nếu có việc khẩn cấp, xin vui lòng gọi cho trợ lý giáo vụ của tôi là chị Clarke ở số máy lẻ 71. Chị Clarke sẽ đảm nhiệm mọi công việc hàng ngày của tôi cho tới khi tôi trở lại văn phòng vào cuối tuần này.

Nếu bạn cần chính tôi trả lời trước cuối tuần, đừng ngần ngại gửi email cho tôi vào hộp thư brianjames@smartcom.vn. Tôi sẽ trả lời ngay khi có thể. Xin cảm ơn.''',
      ),

      // ✅ NEW PHASE: Nghe và Dịch - Short Talk 2
      LessonPhase(
        id: 'theme01_day2_translate3',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Short Talk 2 - Office Speech',
        titleVi: 'Nghe và Dịch: Bài ngắn 2 - Thông báo văn phòng',
        audioTrackKey: 'track_06',
        contentEn: '''Good afternoon everybody. We are here this afternoon to discuss the lack of space in our office.

As you all know, at the beginning of this month, we added 5 new members to the marketing team, which increases the number of staff members working on the third floor of the building to 20 people. This has made it really difficult for us to hold weekly group meetings as there are too many chairs and desks.

Therefore, in order to create more space for everybody, we will need to get rid of all the files and books that we no longer need. Those things are taking up all of our space in the office. The old table at the back of the office should also be moved to the second floor so that we can move more freely around here.''',
        contentVi: '''Xin chào tất cả mọi người. Chúng ta ở đây chiều nay để bàn về vấn đề thiếu không gian trong văn phòng của chúng ta.

Như các bạn đều biết, vào đầu tháng này chúng ta có thêm 5 thành viên mới trong nhóm marketing, điều này làm tăng số lượng nhân viên làm việc trên tầng 3 của toà nhà lên 20 người. Việc này đã khiến chúng ta gặp rất nhiều khó khăn trong việc tổ chức các buổi họp nhóm hàng tuần vì có quá nhiều bàn ghế trong văn phòng.

Do vậy, để có thêm không gian cho tất cả mọi người, chúng ta cần loại bỏ tất cả các tài liệu và sách mà chúng ta không cần sử dụng nữa. Đó là những thứ mà hiện tại đang chiếm quá nhiều không gian trong văn phòng của chúng ta. Cái bàn cũ ở phía cuối văn phòng cũng cần được chuyển xuống tầng 2 để chúng ta có thể di chuyển dễ dàng hơn ở trên này.''',
      ),

      // PHASE: Mind Game - Conversation
      LessonPhase(
        id: 'theme01_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Conversation',
        titleVi: 'Huấn luyện Trí nhớ: Hội thoại',
        mixedSegments: _day2ConversationSegments,
      ),

      // PHASE: Mind Game - Short Talk 1
      LessonPhase(
        id: 'theme01_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Voice Mail',
        titleVi: 'Huấn luyện Trí nhớ: Thư thoại',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme1Content.shortTalk1Vocab,
        fabPhrases: Theme1Content.shortTalk1Phrases,
        fabAnswers: Theme1Content.shortTalk1Answers,
      ),

      // PHASE: Mind Game - Short Talk 2
      LessonPhase(
        id: 'theme01_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Office Speech',
        titleVi: 'Huấn luyện Trí nhớ: Thông báo',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme1Content.shortTalk2Vocab,
        fabPhrases: Theme1Content.shortTalk2Phrases,
        fabAnswers: Theme1Content.shortTalk2Answers,
      ),
    ],
  );

  static List<QuizQuestion> get _practice1Questions => [
    QuizQuestion(
      id: 'q01_p1_1', questionText: 'Why is the woman calling the man?',
      options: ['To place an order', 'To ask about a report', 'To arrange an interview', 'To ask for assistance with a broken machine'],
      correctIndex: 3, audioTrackKey: 'track_04', practiceNumber: 'practice1',
    ),
    QuizQuestion(
      id: 'q01_p1_2', questionText: "Why can't the man send a technician right now?",
      options: ['They are all very busy.', 'It is a national holiday.', 'They are on a weekend trip.', 'The office is too far away.'],
      correctIndex: 0, audioTrackKey: 'track_04', practiceNumber: 'practice1',
    ),
    QuizQuestion(
      id: 'q01_p1_3', questionText: 'What does the man offer to do?',
      options: ['Buy a new fax machine', 'Send someone in the afternoon', 'Do the repairs all on his own', 'Give the office a discount'],
      correctIndex: 2, audioTrackKey: 'track_04', practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    QuizQuestion(
      id: 'q01_p2_1', questionText: 'Where is Mr. James this week?',
      options: ['On vacation', 'In his office', 'At a conference', 'Visiting Ms. Clarke'],
      correctIndex: 2, audioTrackKey: 'track_05', practiceNumber: 'practice2',
    ),
    QuizQuestion(
      id: 'q01_p2_2', questionText: "What is probably Mr. James' job?",
      options: ['Teacher', 'Office assistant', 'Telephone operator', 'Mail carrier'],
      correctIndex: 0, audioTrackKey: 'track_05', practiceNumber: 'practice2',
    ),
    QuizQuestion(
      id: 'q01_p2_3', questionText: "What is Ms. Clarke's extension number?",
      options: ['71', '17', '117', '171'],
      correctIndex: 0, audioTrackKey: 'track_05', practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    QuizQuestion(
      id: 'q01_p3_1', questionText: 'Where is the speech being made?',
      options: ['In a bank', 'In a school', 'In an office', 'In a library'],
      correctIndex: 2, audioTrackKey: 'track_06', practiceNumber: 'practice3',
    ),
    QuizQuestion(
      id: 'q01_p3_2', questionText: 'Why is space limited?',
      options: ['Because the new room is too small.', 'Because there are five new employees.', 'Because the meeting area is too large.', 'Because the extra desks have not been removed yet.'],
      correctIndex: 1, audioTrackKey: 'track_06', practiceNumber: 'practice3',
    ),
    QuizQuestion(
      id: 'q01_p3_3', questionText: 'What is the audience asked to do?',
      options: ['Move to a different room', 'Get rid of unneeded books', 'Move desks to the back of the room', 'Move the meeting area to another room'],
      correctIndex: 1, audioTrackKey: 'track_06', practiceNumber: 'practice3',
    ),
  ];

  // Mind Game segments (giữ nguyên như cũ)
  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('W: Hello, '),
    const MixedSegment.vietnamese('đây là', 'this is'),
    const MixedSegment.english(' Jane from Accounting. I\'m '),
    const MixedSegment.vietnamese('đang gọi', 'calling'),
    const MixedSegment.english(' to report '),
    const MixedSegment.vietnamese('một máy phô-tô bị hỏng', 'a broken photocopier'),
    const MixedSegment.english(' in '),
    const MixedSegment.vietnamese('văn phòng của chúng ta', 'our office'),
    const MixedSegment.english(' on the 6th floor. Are there '),
    const MixedSegment.vietnamese('kỹ thuật viên nào', 'any technicians'),
    const MixedSegment.english(' from '),
    const MixedSegment.vietnamese('phòng bảo trì', 'the maintenance department'),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('không bận', 'available'),
    const MixedSegment.english('? Do you think that you '),
    const MixedSegment.vietnamese('có thể gửi một người qua', 'could send one over'),
    const MixedSegment.english(' to fix it '),
    const MixedSegment.vietnamese('ngay lập tức', 'right now'),
    const MixedSegment.english('?\n\nM: I\'m sorry, but '),
    const MixedSegment.vietnamese('tất cả các kỹ thuật viên của chúng tôi', 'all our technicians'),
    const MixedSegment.english(' are '),
    const MixedSegment.vietnamese('đang bận', 'on jobs'),
    const MixedSegment.english(' right now and '),
    const MixedSegment.vietnamese('không ai trong số họ', 'none of them'),
    const MixedSegment.english(' are '),
    const MixedSegment.vietnamese('trong văn phòng', 'in the office'),
    const MixedSegment.english('. Can it '),
    const MixedSegment.vietnamese('chờ đến sáng mai', 'wait until tomorrow morning'),
    const MixedSegment.english('?\n\nW: I\'m '),
    const MixedSegment.vietnamese('e ngại', 'afraid'),
    const MixedSegment.english(' that is not possible because it\'s '),
    const MixedSegment.vietnamese('chiếc máy phô-tô duy nhất', 'the only photocopier'),
    const MixedSegment.english(' we have here, and we have '),
    const MixedSegment.vietnamese('rất nhiều bản phô-tô', 'a lot of copies'),
    const MixedSegment.english(' to make this afternoon.\n\nM: '),
    const MixedSegment.vietnamese('Trong trường hợp đó', 'In that case'),
    const MixedSegment.english(', I guess I will '),
    const MixedSegment.vietnamese('phải tới đó', 'have to go there'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('tự mình sửa nó', 'fix it myself'),
    const MixedSegment.english('. I will be '),
    const MixedSegment.vietnamese('qua đó', 'over there'),
    const MixedSegment.english(' in about 30 minutes.'),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('This is '),
    const MixedSegment.vietnamese('hộp thư thoại', 'the voice mail'),
    const MixedSegment.english(' of Brian James at Smartcom Training Center. I will '),
    const MixedSegment.vietnamese('không có ở văn phòng', 'be out of the office'),
    const MixedSegment.english(' all week at '),
    const MixedSegment.vietnamese('một hội nghị giáo viên', "a teachers' conference"),
    const MixedSegment.english('. If it is '),
    const MixedSegment.vietnamese('một tình huống khẩn cấp', 'an emergency'),
    const MixedSegment.english(', please call '),
    const MixedSegment.vietnamese('trợ lý giáo vụ của tôi', 'my teaching assistant'),
    const MixedSegment.english(' Ms. Clarke '),
    const MixedSegment.vietnamese('theo số máy lẻ', 'at extension'),
    const MixedSegment.english(' 71. Ms. Clarke will '),
    const MixedSegment.vietnamese('phụ trách', 'take care of'),
    const MixedSegment.english(' all of '),
    const MixedSegment.vietnamese('các công việc hàng ngày của tôi', 'my daily work'),
    const MixedSegment.english(' until I\'m '),
    const MixedSegment.vietnamese('trở lại văn phòng', 'back in the office'),
    const MixedSegment.english(' this weekend. If you need my '),
    const MixedSegment.vietnamese('các câu trả lời cá nhân', 'personal responses'),
    const MixedSegment.english(' before the end of the week, '),
    const MixedSegment.vietnamese('đừng ngại gửi cho tôi', 'feel free to send me'),
    const MixedSegment.english(' an email. I\'ll '),
    const MixedSegment.vietnamese('trả lời cho', 'reply to'),
    const MixedSegment.english(' you '),
    const MixedSegment.vietnamese('sớm nhất có thể', 'as soon as possible'),
    const MixedSegment.english('. Thank you.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english('Good afternoon everybody. We '),
    const MixedSegment.vietnamese('có mặt ở đây', 'are here'),
    const MixedSegment.english(' this afternoon to discuss '),
    const MixedSegment.vietnamese('sự thiếu không gian', 'the lack of space'),
    const MixedSegment.english(' in our office. As you all know, at the beginning of this month, we '),
    const MixedSegment.vietnamese('đã thêm', 'added'),
    const MixedSegment.english(' 5 new members '),
    const MixedSegment.vietnamese('vào nhóm tiếp thị', 'to the marketing team'),
    const MixedSegment.english(', which '),
    const MixedSegment.vietnamese('làm tăng', 'increases'),
    const MixedSegment.english(' the number of staff members working on the third floor of the building '),
    const MixedSegment.vietnamese('lên tới 20 người', 'to 20 people'),
    const MixedSegment.english('. This '),
    const MixedSegment.vietnamese('đã khiến cho nó thật sự khó khăn', 'has made it really difficult'),
    const MixedSegment.english(' for us to hold '),
    const MixedSegment.vietnamese('các buổi họp nhóm hàng tuần', 'weekly group meetings'),
    const MixedSegment.english(' as there are '),
    const MixedSegment.vietnamese('quá nhiều ghế', 'too many chairs'),
    const MixedSegment.english(' and desks. Therefore, '),
    const MixedSegment.vietnamese('để tạo ra', 'in order to create'),
    const MixedSegment.english(' more space '),
    const MixedSegment.vietnamese('cho mọi người', 'for everybody'),
    const MixedSegment.english(', we will need to '),
    const MixedSegment.vietnamese('loại bỏ', 'get rid of'),
    const MixedSegment.english(' all the files and books that we '),
    const MixedSegment.vietnamese('không còn cần nữa', 'no longer need'),
    const MixedSegment.english('. Those things '),
    const MixedSegment.vietnamese('đang chiếm', 'are taking up'),
    const MixedSegment.english(' all of '),
    const MixedSegment.vietnamese('không gian của chúng ta', 'our space'),
    const MixedSegment.english(' in the office. The old table at the back of the office '),
    const MixedSegment.vietnamese('cũng nên được chuyển đi', 'should also be moved'),
    const MixedSegment.english(' to the second floor so that we can '),
    const MixedSegment.vietnamese('di chuyển thoải mái hơn', 'move more freely'),
    const MixedSegment.english(' around here.'),
  ];
}

// ─── Data classes cho FAB ─────────────────────────────────────────────────────

class FabVocabItem {
  final String wordEn;
  final String pronunciation;
  final String wordVi;
  final String partOfSpeech;
  const FabVocabItem({
    required this.wordEn,
    required this.pronunciation,
    required this.wordVi,
    required this.partOfSpeech,
  });
}

class FabPhraseItem {
  final String phrase;
  final String meaning;
  const FabPhraseItem({required this.phrase, required this.meaning});
}

class FabAnswerItem {
  final String vi;
  final String en;
  const FabAnswerItem({required this.vi, required this.en});
}

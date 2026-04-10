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
      exampleVi: 'Chuyên đề này sẽ giới thiệu các cuộc đàm phán và hợp đồng pháp lý.',
    ),
    VocabModel(
      id: 'v02_02',
      wordEn: 'merger',
      wordVi: 'sáp nhập doanh nghiệp',
      pronunciation: '/ˈmɜːrdʒər/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'Mergers and acquisitions are common in corporate business.',
      exampleVi: 'Mua bán và sáp nhập doanh nghiệp rất phổ biến trong kinh doanh tập đoàn.',
    ),
    VocabModel(
      id: 'v02_03',
      wordEn: 'franchise',
      wordVi: 'nhượng quyền thương mại',
      pronunciation: '/ˈfræntʃaɪz/',
      partOfSpeech: 'n',
      themeId: 'theme_02_general_business',
      exampleEn: 'The company expanded through franchises across Asia.',
      exampleVi: 'Công ty mở rộng thông qua nhượng quyền thương mại khắp châu Á.',
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
      exampleEn: 'Training sessions are held at the beginning of every quarter.',
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
      exampleVi: 'Cô ấy làm việc cho tập đoàn ADC, một công ty tư vấn hàng đầu.',
    ),
  ];

  // ─── DAY 1 ────────────────────────────────────────────────────
  static LessonDay get day1 => LessonDay(
    id: 'theme02_day1',
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
            '''This theme is anything but 'general'. As in finance, there are a lot of specific terms that need to be learned. The terms are related to 'corporate' business rather than small entrepreneurial businesses. This theme will introduce negotiations, mergers, acquisitions, legal contracts, guarantees and warranties, marketing strategies, sales performance, labour relations, franchises, consultancy, buy-outs, take-overs. There will often be references to the legal profession such as lawyer, solicitor, legal counsel. Other common general nouns: subsidiary, headquarters, chief executive officer, chief financial officer, chairman, board of directors, mutual funds, bonds, stock options.

Corporate business tends to be national and international rather than local and students will need to understand such terms as divisions, departments, branches, chain, and how a large enterprise works. Small business conversations will also be heard but these usually come under different themes such as 'Retailing' or 'Offices' and relate to local businesses. Conversations here are usually about small meetings, computers or photocopiers that need fixing, small advertisements for local newspapers, flyers and brochures, and buying office supplies. Shopping is involved, usually at local markets, supermarkets, small retail shops as well as department stores.''',
        contentVi:
            '''Chuyên đề này đề cập tới mọi chủ đề nhưng chỉ ở mức độ tổng quát. Như khi nói về tài chính, sẽ có rất nhiều các thuật ngữ cụ thể cần được học. Các thuật ngữ liên quan tới các doanh nghiệp lớn nhiều hơn là những doanh nghiệp nhỏ hay hộ kinh doanh. Chuyên đề này sẽ giới thiệu các nội dung về đàm phán, sáp nhập doanh nghiệp, mua bán doanh nghiệp, hợp đồng pháp lý, bảo hành và bảo dưỡng, chiến lược marketing, việc bán hàng, các quan hệ nhân sự, nhượng quyền thương mại, dịch vụ tư vấn, bồi thường hợp đồng lao động, thôn tính doanh nghiệp. Chúng ta cũng sẽ gặp những từ về nghề luật như luật sư, luật sư đại diện, cố vấn pháp lý. Những danh từ phổ biến hay dùng có thể là: chi nhánh, trụ sở chính, tổng giám đốc điều hành, tổng giám đốc tài chính, chủ tịch, ban giám đốc, quỹ tương hỗ, trái phiếu, quyền chọn cổ phiếu.

Các doanh nghiệp ở đây thường có phạm vi quốc gia và quốc tế hơn là các công ty địa phương, và người đọc sẽ cần phải hiểu những thuật ngữ như các ban, các phòng, chi nhánh, chuỗi, và cách mà một doanh nghiệp lớn hoạt động. Bạn cũng có thể nghe những hội thoại trong doanh nghiệp nhỏ nhưng những hội thoại này thường xuất hiện ở những chuyên đề khác như Bán lẻ hay Văn phòng mà có liên quan tới doanh nghiệp địa phương. Các hội thoại đó thường nói về các cuộc họp nhỏ, máy tính hay máy phô-tô mà cần sửa chữa, những mẩu quảng cáo nhỏ cho báo địa phương, tờ rơi, tờ giới thiệu, và mua sắm đồ văn phòng. Việc đi mua sắm cũng được nhắc đến, nhưng thường ở chợ địa phương hay siêu thị, cửa hàng bán lẻ nhỏ và cửa hàng bách hóa.''',
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

Các doanh nghiệp ở đây thường có phạm vi quốc gia và quốc tế hơn là các công ty địa phương, và người đọc sẽ cần phải hiểu những thuật ngữ như các ban, các phòng, chi nhánh, chuỗi, và cách mà một doanh nghiệp lớn hoạt động.

Bạn cũng có thể nghe những hội thoại trong doanh nghiệp nhỏ nhưng những hội thoại này thường xuất hiện ở những chuyên đề khác như Bán lẻ hay Văn phòng mà có liên quan tới doanh nghiệp địa phương.''',
      ),

      // PHASE 3: MIND GAME
      LessonPhase(
        id: 'theme02_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game',
        titleVi: 'Bước 3: Trò chơi Tư duy',
        mixedSegments: _day1MindGameSegments,
      ),

      // PHASE 4: VOCABULARY
      LessonPhase(
        id: 'theme02_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
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
        ' small entrepreneurial businesses. This theme will introduce '),
    const MixedSegment.vietnamese('các cuộc đàm phán', 'negotiations'),
    const MixedSegment.english(', mergers, acquisitions, '),
    const MixedSegment.vietnamese('các hợp đồng pháp lý', 'legal contracts'),
    const MixedSegment.english(', guarantees and '),
    const MixedSegment.vietnamese('các vấn đề bảo hành', 'warranties'),
    const MixedSegment.english(', marketing strategies, '),
    const MixedSegment.vietnamese('hiệu quả bán hàng', 'sales performance'),
    const MixedSegment.english(', labour relations, '),
    const MixedSegment.vietnamese(
        'việc nhượng quyền kinh doanh', 'franchises'),
    const MixedSegment.english(', consultancy, '),
    const MixedSegment.vietnamese('thôn tính doanh nghiệp', 'buy-outs'),
    const MixedSegment.english(
        ', take-overs. There will often be references to the '),
    const MixedSegment.vietnamese('nghề luật', 'legal profession'),
    const MixedSegment.english(' such as '),
    const MixedSegment.vietnamese('luật sư', 'lawyer'),
    const MixedSegment.english(', solicitor, '),
    const MixedSegment.vietnamese('cố vấn pháp lý', 'legal counsel'),
    const MixedSegment.english('. Other common general nouns: '),
    const MixedSegment.vietnamese('chi nhánh', 'subsidiary'),
    const MixedSegment.english(', headquarters, '),
    const MixedSegment.vietnamese(
        'tổng giám đốc điều hành', 'chief executive officer'),
    const MixedSegment.english(', chief financial officer, chairman, '),
    const MixedSegment.vietnamese('ban giám đốc', 'board of directors'),
    const MixedSegment.english(', mutual funds, bonds, '),
    const MixedSegment.vietnamese('quyền mua cổ phiếu', 'stock options'),
    const MixedSegment.english('.\n\n'),
    const MixedSegment.vietnamese('Doanh nghiệp lớn', 'Corporate business'),
    const MixedSegment.english(' tends to be national and '),
    const MixedSegment.vietnamese('quốc tế', 'international'),
    const MixedSegment.english(' rather than local and students will need to understand '),
    const MixedSegment.vietnamese('những thuật ngữ như là', 'such terms as'),
    const MixedSegment.english(' divisions, '),
    const MixedSegment.vietnamese('các phòng ban', 'departments'),
    const MixedSegment.english(', branches, '),
    const MixedSegment.vietnamese('chuỗi', 'chain'),
    const MixedSegment.english(', and how '),
    const MixedSegment.vietnamese('một doanh nghiệp lớn', 'a large enterprise'),
    const MixedSegment.english(' works. Small business conversations '),
    const MixedSegment.vietnamese(
        'cũng sẽ được nghe thấy', 'will also be heard'),
    const MixedSegment.english(" but these usually come under different themes such as '"),
    const MixedSegment.vietnamese('Bán lẻ', 'Retailing'),
    const MixedSegment.english("' or '"),
    const MixedSegment.vietnamese('Văn phòng', 'Offices'),
    const MixedSegment.english("' and relate to "),
    const MixedSegment.vietnamese(
        'các doanh nghiệp địa phương', 'local businesses'),
    const MixedSegment.english('. Conversations here '),
    const MixedSegment.vietnamese('thường là về', 'are usually about'),
    const MixedSegment.english(' small meetings, computers or photocopiers that '),
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
      ),

      // PHASE 2: Quiz Practice 2 - Short Talk 1
      LessonPhase(
        id: 'theme02_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Sales Training Announcement',
        titleVi: 'Luyện tập 2: Bài ngắn - Thông báo huấn luyện bán hàng',
        audioTrackKey: 'track_09',
        questions: _practice2Questions,
      ),

      // PHASE 3: Quiz Practice 3 - Short Talk 2
      LessonPhase(
        id: 'theme02_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - International Business Workshop',
        titleVi: 'Luyện tập 3: Bài ngắn - Hội thảo thương mại quốc tế',
        audioTrackKey: 'track_10',
        questions: _practice3Questions,
      ),

      // PHASE 4: Mind Game - Conversation
      LessonPhase(
        id: 'theme02_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Contract Conversation',
        titleVi: 'Huấn luyện Trí nhớ: Hội thoại Hợp đồng',
        mixedSegments: _day2ConversationSegments,
      ),

      // PHASE 5: Mind Game - Short Talk 1
      LessonPhase(
        id: 'theme02_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Sales Announcement',
        titleVi: 'Huấn luyện Trí nhớ: Thông báo Bán hàng',
        mixedSegments: _day2ShortTalk1Segments,
      ),

      // PHASE 6: Mind Game - Short Talk 2
      LessonPhase(
        id: 'theme02_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Workshop Speech',
        titleVi: 'Huấn luyện Trí nhớ: Bài phát biểu Hội thảo',
        mixedSegments: _day2ShortTalk2Segments,
      ),
    ],
  );

  // ─── PRACTICE 1 QUESTIONS ─────────────────────────────────────
  static List<QuizQuestion> get _practice1Questions => [
    QuizQuestion(
      id: 'q02_p1_1',
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
    QuizQuestion(
      id: 'q02_p1_2',
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
    QuizQuestion(
      id: 'q02_p1_3',
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
    QuizQuestion(
      id: 'q02_p2_1',
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
    QuizQuestion(
      id: 'q02_p2_2',
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
    QuizQuestion(
      id: 'q02_p2_3',
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
    QuizQuestion(
      id: 'q02_p3_1',
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
    QuizQuestion(
      id: 'q02_p3_2',
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
    QuizQuestion(
      id: 'q02_p3_3',
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
    const MixedSegment.vietnamese('vài điểm quan trọng', 'some important points'),
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
    const MixedSegment.english(' imposed?\n\nM: Of course there are. It says here that if one side '),
    const MixedSegment.vietnamese('không tuân thủ', 'fails to uphold'),
    const MixedSegment.english(' the contract, '),
    const MixedSegment.vietnamese('bên còn lại', 'the other side'),
    const MixedSegment.english(' may seek compensation.'),
  ];

  // ─── DAY 2 MIND GAME: SHORT TALK 1 ───────────────────────────
  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Attention everybody. I have '),
    const MixedSegment.vietnamese(
        'một thông báo quan trọng', 'an important announcement'),
    const MixedSegment.english(' to make. In a meeting with '),
    const MixedSegment.vietnamese('các nhà quản lý khác', 'the other managers'),
    const MixedSegment.english(' yesterday, we '),
    const MixedSegment.vietnamese('đã đi đến kết luận', 'came to the conclusion'),
    const MixedSegment.english(' that we must do everything to '),
    const MixedSegment.vietnamese(
        'tăng doanh số bán hàng của chúng ta', 'increase our sales'),
    const MixedSegment.english(' this year. It is '),
    const MixedSegment.vietnamese('một thực tế rõ ràng', 'a known fact'),
    const MixedSegment.english(' that '),
    const MixedSegment.vietnamese(
        'một đội ngũ bán hàng mạnh', 'a strong sales team'),
    const MixedSegment.english(' is '),
    const MixedSegment.vietnamese('sức mạnh', 'the force'),
    const MixedSegment.english(
        ' behind any successful company, especially companies like us. What good is a great product if '),
    const MixedSegment.vietnamese('những người bán hàng', 'the salespeople'),
    const MixedSegment.english(' do not '),
    const MixedSegment.vietnamese('xắn tay áo họ lên', 'roll up their sleeves'),
    const MixedSegment.english(' and sell it? Therefore, we have '),
    const MixedSegment.vietnamese('đã quyết định', 'decided'),
    const MixedSegment.english(' to do something to help you '),
    const MixedSegment.vietnamese('đạt doanh số bán hàng', 'get the sales'),
    const MixedSegment.english(
        ' you want. From now to the end of the year, you will be going to '),
    const MixedSegment.vietnamese('trụ sở chính', 'the head office'),
    const MixedSegment.english(' for a week '),
    const MixedSegment.vietnamese(
        'vào đầu mỗi quý', 'at the beginning of every quarter'),
    const MixedSegment.english(' to '),
    const MixedSegment.vietnamese(
        'nhận được sự huấn luyện thích hợp', 'get the proper training'),
    const MixedSegment.english(' you need to improve '),
    const MixedSegment.vietnamese(
        'thành tích bán hàng của bạn', 'your sales performance'),
    const MixedSegment.english('. You will be trained by '),
    const MixedSegment.vietnamese(
        'những chuyên gia bán hàng hàng đầu', 'the top sales experts'),
    const MixedSegment.english(
        ' in the industry to get the skills you need, and I believe that will '),
    const MixedSegment.vietnamese(
        'tạo ra mọi sự khác biệt', 'make all the difference'),
    const MixedSegment.english(
        '. We are hoping that by December of this year, we '),
    const MixedSegment.vietnamese(
        'sẽ có thể đạt được mục tiêu', 'will be able to reach the goal'),
    const MixedSegment.english(
        ' we set for ourselves at the beginning of this year.'),
  ];

  // ─── DAY 2 MIND GAME: SHORT TALK 2 ───────────────────────────
  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english('Good morning, everybody and welcome all of you to '),
    const MixedSegment.vietnamese(
        'buổi hội thảo ngày hôm nay', "today's workshop"),
    const MixedSegment.english('. Before we start, I '),
    const MixedSegment.vietnamese('muốn lưu ý', 'would like to remind'),
    const MixedSegment.english(' you that we are going to be busy '),
    const MixedSegment.vietnamese('trong ba ngày tới', 'for the next three days'),
    const MixedSegment.english(' and I hope everyone will '),
    const MixedSegment.vietnamese(
        'có được điều gì đó mới mẻ và hữu ích',
        'have something new and useful'),
    const MixedSegment.english(' to take away to '),
    const MixedSegment.vietnamese(
        'nâng cao thành tích của bạn', 'improve your performance'),
    const MixedSegment.english(' in '),
    const MixedSegment.vietnamese(
        'đàm phán các hợp đồng quốc tế', 'negotiating international contracts'),
    const MixedSegment.english('. Over the next three days, we will be working on '),
    const MixedSegment.vietnamese(
        'giao tiếp thương mại quốc tế', 'international business communications'),
    const MixedSegment.english(', and will be focusing on '),
    const MixedSegment.vietnamese(
        'việc giao tiếp hiệu quả', 'effective communication'),
    const MixedSegment.english(' with business people in Asia, '),
    const MixedSegment.vietnamese('đặc biệt là', 'especially'),
    const MixedSegment.english(
        ' those who come from Japan, India, and China. Some of you might think you already know how to '),
    const MixedSegment.vietnamese(
        'giao tiếp một cách hiệu quả', 'communicate effectively'),
    const MixedSegment.english(' in whatever situation you are in, but I '),
    const MixedSegment.vietnamese('biết chắc chắn', 'know for sure'),
    const MixedSegment.english(', everyone will '),
    const MixedSegment.vietnamese('bị ngạc nhiên', 'be surprised'),
    const MixedSegment.english(
        ' by something we learn over the next few days. Lee Kim, '),
    const MixedSegment.vietnamese('một chuyên gia về', 'an expert on'),
    const MixedSegment.english(' international business communication will be '),
    const MixedSegment.vietnamese(
        'diễn giả chính của chúng ta', 'our keynote speaker'),
    const MixedSegment.english(
        ' and trainer in this workshop. Ms. Kim has more than 15 years of experience in '),
    const MixedSegment.vietnamese('kinh doanh quốc tế', 'international business'),
    const MixedSegment.english(' and has worked '),
    const MixedSegment.vietnamese('ở nhiều thành phố', 'in various cities'),
    const MixedSegment.english(
        ' including Beijing, Jakarta, Adelaide, Seoul and Hiroshima '),
    const MixedSegment.vietnamese('chỉ là vài ví dụ', 'just to name a few'),
    const MixedSegment.english('. She is now '),
    const MixedSegment.vietnamese('đang làm việc cho', 'working for'),
    const MixedSegment.english(' ADC Corporation, '),
    const MixedSegment.vietnamese(
        'một công ty tư vấn hàng đầu', 'a leading consulting firm'),
    const MixedSegment.english(' located in Tokyo.'),
  ];
}

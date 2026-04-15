import '../models/mixed_segment_model.dart';
import '../models/lesson_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme3Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_03_technical',
    themeNumber: 3,
    titleEn: 'Technical Areas',
    titleVi: 'Các Vấn Đề Kỹ Thuật',
    description:
        'Công nghệ, máy tính, thiết bị điện tử, phòng thí nghiệm, nhân viên kỹ thuật, phần mềm và phần cứng.',
    iconEmoji: '💻',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY LIST
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    // ── Từ vựng chính bài đọc ──
    VocabModel(
      id: 'v03_01',
      wordEn: 'laboratory',
      wordVi: 'phòng thí nghiệm',
      pronunciation: '/ˈlæbrətɔːri/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn:
          'The scientists conduct experiments in the laboratory every day.',
      exampleVi:
          'Các nhà khoa học tiến hành thí nghiệm trong phòng thí nghiệm mỗi ngày.',
    ),
    VocabModel(
      id: 'v03_02',
      wordEn: 'malfunction',
      wordVi: 'lỗi kỹ thuật, trục trặc',
      pronunciation: '/mælˈfʌŋkʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn:
          'The printer malfunction caused a delay in the report submission.',
      exampleVi:
          'Lỗi kỹ thuật của máy in đã gây ra sự chậm trễ trong việc nộp báo cáo.',
    ),
    VocabModel(
      id: 'v03_03',
      wordEn: 'technician',
      wordVi: 'kỹ thuật viên',
      pronunciation: '/tekˈnɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'The technician will be here tomorrow to fix the server.',
      exampleVi: 'Kỹ thuật viên sẽ tới đây vào ngày mai để sửa máy chủ.',
    ),
    VocabModel(
      id: 'v03_04',
      wordEn: 'software',
      wordVi: 'phần mềm',
      pronunciation: '/ˈsɔːftwer/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'We need to update the software to the latest version.',
      exampleVi: 'Chúng ta cần cập nhật phần mềm lên phiên bản mới nhất.',
    ),
    VocabModel(
      id: 'v03_05',
      wordEn: 'hardware',
      wordVi: 'phần cứng',
      pronunciation: '/ˈhɑːrdwer/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'The hardware components need to be replaced every few years.',
      exampleVi: 'Các bộ phận phần cứng cần được thay thế vài năm một lần.',
    ),
    VocabModel(
      id: 'v03_06',
      wordEn: 'glitch',
      wordVi: 'sự cố kỹ thuật nhỏ',
      pronunciation: '/ɡlɪtʃ/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn:
          'There was a minor glitch in the system, but it has been fixed.',
      exampleVi:
          'Có một sự cố kỹ thuật nhỏ trong hệ thống, nhưng nó đã được sửa.',
    ),
    VocabModel(
      id: 'v03_07',
      wordEn: 'reboot',
      wordVi: 'khởi động lại',
      pronunciation: '/ˌriːˈbuːt/',
      partOfSpeech: 'v',
      themeId: 'theme_03_technical',
      exampleEn: 'Please reboot your computer and try again.',
      exampleVi: 'Xin hãy khởi động lại máy tính của bạn và thử lại.',
    ),
    VocabModel(
      id: 'v03_08',
      wordEn: 'compatible',
      wordVi: 'tương thích',
      pronunciation: '/kəmˈpætɪbəl/',
      partOfSpeech: 'adj',
      themeId: 'theme_03_technical',
      exampleEn:
          'This application is not compatible with the old operating system.',
      exampleVi: 'Ứng dụng này không tương thích với hệ điều hành cũ.',
    ),
    VocabModel(
      id: 'v03_09',
      wordEn: 'microscope',
      wordVi: 'kính hiển vi',
      pronunciation: '/ˈmaɪkrəskoʊp/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'The lab technician examined the sample under the microscope.',
      exampleVi:
          'Kỹ thuật viên phòng thí nghiệm đã kiểm tra mẫu vật dưới kính hiển vi.',
    ),
    VocabModel(
      id: 'v03_10',
      wordEn: 'specification',
      wordVi: 'đặc điểm kỹ thuật',
      pronunciation: '/ˌspesɪfɪˈkeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn:
          'Please check the specifications before purchasing the equipment.',
      exampleVi:
          'Xin hãy kiểm tra các đặc điểm kỹ thuật trước khi mua thiết bị.',
    ),
    VocabModel(
      id: 'v03_11',
      wordEn: 'platform',
      wordVi: 'nền tảng',
      pronunciation: '/ˈplætfɔːrm/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn:
          'The company launched a new digital platform for online sales.',
      exampleVi:
          'Công ty đã ra mắt một nền tảng kỹ thuật số mới cho việc bán hàng trực tuyến.',
    ),
    VocabModel(
      id: 'v03_12',
      wordEn: 'application',
      wordVi: 'ứng dụng phần mềm',
      pronunciation: '/ˌæplɪˈkeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'You can download the application from the company website.',
      exampleVi: 'Bạn có thể tải ứng dụng từ trang web của công ty.',
    ),
    VocabModel(
      id: 'v03_13',
      wordEn: 'hazard',
      wordVi: 'rủi ro, mối nguy hiểm',
      pronunciation: '/ˈhæzərd/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn:
          'Working with chemicals without proper equipment is a serious hazard.',
      exampleVi:
          'Làm việc với hóa chất mà không có thiết bị phù hợp là một rủi ro nghiêm trọng.',
    ),
    VocabModel(
      id: 'v03_14',
      wordEn: 'resolve',
      wordVi: 'giải quyết (vấn đề)',
      pronunciation: '/rɪˈzɑːlv/',
      partOfSpeech: 'v',
      themeId: 'theme_03_technical',
      exampleEn: 'The IT department worked hard to resolve the network issue.',
      exampleVi: 'Phòng IT đã làm việc chăm chỉ để giải quyết vấn đề mạng.',
    ),
    VocabModel(
      id: 'v03_15',
      wordEn: 'crash',
      wordVi: 'sập, ngừng hoạt động',
      pronunciation: '/kræʃ/',
      partOfSpeech: 'v',
      themeId: 'theme_03_technical',
      exampleEn: 'The server crashed during the software update.',
      exampleVi: 'Máy chủ đã sập trong quá trình cập nhật phần mềm.',
    ),

    // ── Từ vựng Conversation (Practice 1) ──
    VocabModel(
      id: 'v03_16',
      wordEn: 'operating system',
      wordVi: 'hệ điều hành',
      pronunciation: '/ˈɑːpəreɪtɪŋ ˈsɪstəm/',
      partOfSpeech: 'np',
      themeId: 'theme_03_technical',
      exampleEn: 'It has the latest operating system available.',
      exampleVi: 'Nó sử dụng hệ điều hành mới nhất hiện có.',
    ),
    VocabModel(
      id: 'v03_17',
      wordEn: 'background programs',
      wordVi: 'chương trình nền',
      pronunciation: '/ˈbækɡraʊnd ˈproʊɡræmz/',
      partOfSpeech: 'np',
      themeId: 'theme_03_technical',
      exampleEn: 'Too many background programs slow down your computer.',
      exampleVi: 'Quá nhiều chương trình nền làm chậm máy tính của bạn.',
    ),
    VocabModel(
      id: 'v03_18',
      wordEn: 'word processing program',
      wordVi: 'chương trình xử lý văn bản',
      pronunciation: '/wɜːrd ˈprɑːsesɪŋ ˈproʊɡræm/',
      partOfSpeech: 'np',
      themeId: 'theme_03_technical',
      exampleEn: 'I know how to use a word processing program.',
      exampleVi: 'Tôi biết sử dụng chương trình xử lý văn bản.',
    ),

    // ── Từ vựng Short Talk 1 (Hotline) ──
    VocabModel(
      id: 'v03_19',
      wordEn: 'operator',
      wordVi: 'tổng đài viên',
      pronunciation: '/ˈɑːpəreɪtər/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'All of our operators are busy at the moment.',
      exampleVi: 'Tất cả tổng đài viên của chúng tôi hiện đang bận.',
    ),
    VocabModel(
      id: 'v03_20',
      wordEn: 'maintenance hotline',
      wordVi: 'đường dây nóng hỗ trợ kỹ thuật',
      pronunciation: '/ˈmeɪntənəns ˈhɑːtlaɪn/',
      partOfSpeech: 'np',
      themeId: 'theme_03_technical',
      exampleEn: 'Thank you for calling the maintenance hotline.',
      exampleVi: 'Cảm ơn bạn đã gọi tới đường dây nóng hỗ trợ kỹ thuật.',
    ),
    VocabModel(
      id: 'v03_21',
      wordEn: 'description',
      wordVi: 'sự miêu tả, mô tả',
      pronunciation: '/dɪˈskrɪpʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'Leave a message with a description of your problem.',
      exampleVi: 'Để lại lời nhắn cùng với mô tả vấn đề của bạn.',
    ),

    // ── Từ vựng Short Talk 2 (Upgrade) ──
    VocabModel(
      id: 'v03_22',
      wordEn: 'replace',
      wordVi: 'thay thế',
      pronunciation: '/rɪˈpleɪs/',
      partOfSpeech: 'v',
      themeId: 'theme_03_technical',
      exampleEn: 'We need to replace the old computers with new ones.',
      exampleVi:
          'Chúng ta cần thay thế những chiếc máy tính cũ bằng những chiếc mới.',
    ),
    VocabModel(
      id: 'v03_23',
      wordEn: 'transfer',
      wordVi: 'chuyển, chuyển sang',
      pronunciation: '/trænsˈfɜːr/',
      partOfSpeech: 'v',
      themeId: 'theme_03_technical',
      exampleEn: 'Please transfer all your files to the central computer.',
      exampleVi: 'Xin hãy chuyển tất cả tài liệu sang máy tính trung tâm.',
    ),
    VocabModel(
      id: 'v03_24',
      wordEn: 'procedure',
      wordVi: 'quy trình, thủ tục',
      pronunciation: '/prəˈsiːdʒər/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'All employees must follow the security procedures.',
      exampleVi: 'Tất cả nhân viên phải tuân theo các quy trình an ninh.',
    ),
    VocabModel(
      id: 'v03_25',
      wordEn: 'locate',
      wordVi: 'xác định vị trí',
      pronunciation: '/ˈloʊkeɪt/',
      partOfSpeech: 'v',
      themeId: 'theme_03_technical',
      exampleEn: 'First, you must locate your important data in your computer.',
      exampleVi:
          'Trước hết, bạn phải xác định vị trí dữ liệu quan trọng trong máy tính.',
    ),
    VocabModel(
      id: 'v03_26',
      wordEn: 'central computer',
      wordVi: 'máy tính trung tâm',
      pronunciation: '/ˈsentrəl kəmˈpjuːtər/',
      partOfSpeech: 'np',
      themeId: 'theme_03_technical',
      exampleEn: 'Transfer your files to the central computer.',
      exampleVi: 'Chuyển tài liệu của bạn sang máy tính trung tâm.',
    ),
    VocabModel(
      id: 'v03_27',
      wordEn: 'sub-folder',
      wordVi: 'tiểu thư mục, thư mục con',
      pronunciation: '/sʌb ˈfoʊldər/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'Create a sub-folder under your name within the main folder.',
      exampleVi:
          'Tạo một tiểu thư mục với tên của bạn bên trong thư mục chính.',
    ),
    VocabModel(
      id: 'v03_28',
      wordEn: 'hard disk',
      wordVi: 'ổ cứng',
      pronunciation: '/hɑːrd dɪsk/',
      partOfSpeech: 'np',
      themeId: 'theme_03_technical',
      exampleEn: 'Back up those files by copying them to the hard disk.',
      exampleVi: 'Sao lưu tài liệu bằng cách sao chép chúng sang ổ cứng.',
    ),
    VocabModel(
      id: 'v03_29',
      wordEn: 'break down',
      wordVi: 'bị hỏng',
      pronunciation: '/breɪk daʊn/',
      partOfSpeech: 'vp',
      themeId: 'theme_03_technical',
      exampleEn: 'A lot of our computers have been breaking down recently.',
      exampleVi: 'Rất nhiều máy tính của chúng ta gần đây đã bị hỏng.',
    ),
    VocabModel(
      id: 'v03_30',
      wordEn: 'get rid of',
      wordVi: 'loại bỏ',
      pronunciation: '/ɡet rɪd ɑːv/',
      partOfSpeech: 'vp',
      themeId: 'theme_03_technical',
      exampleEn: 'Now is a good time to get rid of these computers.',
      exampleVi:
          'Bây giờ là thời điểm tốt để loại bỏ những chiếc máy tính này.',
    ),

    // ── Từ vựng bổ sung ──
    VocabModel(
      id: 'v03_31',
      wordEn: 'programmer',
      wordVi: 'lập trình viên',
      pronunciation: '/ˈproʊɡræmər/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn: 'The programmer fixed the bug in the code within two hours.',
      exampleVi: 'Lập trình viên đã sửa lỗi trong mã nguồn trong vòng hai giờ.',
    ),
    VocabModel(
      id: 'v03_32',
      wordEn: 'electronics',
      wordVi: 'đồ điện tử',
      pronunciation: '/ˌelɪkˈtrɑːnɪks/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn:
          'The company specializes in manufacturing consumer electronics.',
      exampleVi: 'Công ty chuyên sản xuất đồ điện tử tiêu dùng.',
    ),
    VocabModel(
      id: 'v03_33',
      wordEn: 'scientist',
      wordVi: 'nhà khoa học',
      pronunciation: '/ˈsaɪəntɪst/',
      partOfSpeech: 'n',
      themeId: 'theme_03_technical',
      exampleEn:
          'The scientist published research results in an international journal.',
      exampleVi:
          'Nhà khoa học đã công bố kết quả nghiên cứu trên tạp chí quốc tế.',
    ),
    VocabModel(
      id: 'v03_34',
      wordEn: 'scan',
      wordVi: 'quét (virus)',
      pronunciation: '/skæn/',
      partOfSpeech: 'v',
      themeId: 'theme_03_technical',
      exampleEn: 'Make sure to scan your computer for viruses regularly.',
      exampleVi: 'Hãy đảm bảo quét virus cho máy tính thường xuyên.',
    ),
    VocabModel(
      id: 'v03_35',
      wordEn: 'purge',
      wordVi: 'dọn dẹp, loại bỏ',
      pronunciation: '/pɜːrdʒ/',
      partOfSpeech: 'v',
      themeId: 'theme_03_technical',
      exampleEn: 'You should purge unnecessary files to free up disk space.',
      exampleVi:
          'Bạn nên dọn dẹp các tệp không cần thiết để giải phóng dung lượng.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB DATA: Từ vựng cần nắm vững theo từng bài
  // ═══════════════════════════════════════════════════════════════

  // ── FAB cho bài đọc Day 1 ──
  static List<FabVocabItem> get readingVocab => [
    FabVocabItem(
      wordEn: 'technical areas',
      pronunciation: '/ˈteknɪkəl ˈeriəz/',
      wordVi: 'Các lĩnh vực kỹ thuật',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'housing',
      pronunciation: '/ˈhaʊzɪŋ/',
      wordVi: 'Nhà đất',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'previous',
      pronunciation: '/ˈpriːviəs/',
      wordVi: 'Trước đó',
      partOfSpeech: 'adj',
    ),
    FabVocabItem(
      wordEn: 'include',
      pronunciation: '/ɪnˈkluːd/',
      wordVi: 'Bao gồm, gồm có',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'laboratory',
      pronunciation: '/ˈlæbrətɔːri/',
      wordVi: 'Phòng thí nghiệm',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'technical personnel',
      pronunciation: '/ˈteknɪkəl ˌpɜːrsəˈnel/',
      wordVi: 'Nhân viên kỹ thuật',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'specialized equipment',
      pronunciation: '/ˈspeʃəlaɪzd ɪˈkwɪpmənt/',
      wordVi: 'Thiết bị chuyên dụng',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'specification',
      pronunciation: '/ˌspesɪfɪˈkeɪʃən/',
      wordVi: 'Đặc điểm kỹ thuật',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'electronics',
      pronunciation: '/ˌelɪkˈtrɑːnɪks/',
      wordVi: 'Điện tử',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'technology',
      pronunciation: '/tekˈnɑːlədʒi/',
      wordVi: 'Công nghệ',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'technical issues',
      pronunciation: '/ˈteknɪkəl ˈɪʃuːz/',
      wordVi: 'Các vấn đề kỹ thuật',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'resolve',
      pronunciation: '/rɪˈzɑːlv/',
      wordVi: 'Giải quyết',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'software',
      pronunciation: '/ˈsɔːftwer/',
      wordVi: 'Phần mềm',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'hardware',
      pronunciation: '/ˈhɑːrdwer/',
      wordVi: 'Phần cứng',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'scientist',
      pronunciation: '/ˈsaɪəntɪst/',
      wordVi: 'Nhà khoa học',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'lab technician',
      pronunciation: '/læb tekˈnɪʃən/',
      wordVi: 'Kỹ thuật viên PTN',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'flask',
      pronunciation: '/flæsk/',
      wordVi: 'Bình giữ nhiệt',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'test tube',
      pronunciation: '/test tuːb/',
      wordVi: 'Ống nghiệm',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'research',
      pronunciation: '/ˈriːsɜːrtʃ/',
      wordVi: 'Nghiên cứu',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'hazard',
      pronunciation: '/ˈhæzərd/',
      wordVi: 'Rủi ro, mối nguy hiểm',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'programmer',
      pronunciation: '/ˈproʊɡræmər/',
      wordVi: 'Lập trình viên',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'malfunction',
      pronunciation: '/mælˈfʌŋkʃən/',
      wordVi: 'Lỗi kỹ thuật',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'glitch',
      pronunciation: '/ɡlɪtʃ/',
      wordVi: 'Sự cố kỹ thuật nhỏ',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'microscope',
      pronunciation: '/ˈmaɪkrəskoʊp/',
      wordVi: 'Kính hiển vi',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'crash',
      pronunciation: '/kræʃ/',
      wordVi: 'Sập, ngừng hoạt động',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'application',
      pronunciation: '/ˌæplɪˈkeɪʃən/',
      wordVi: 'Ứng dụng',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'platform',
      pronunciation: '/ˈplætfɔːrm/',
      wordVi: 'Nền tảng',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'compatible',
      pronunciation: '/kəmˈpætɪbəl/',
      wordVi: 'Tương thích',
      partOfSpeech: 'adj',
    ),
    FabVocabItem(
      wordEn: 'scan',
      pronunciation: '/skæn/',
      wordVi: 'Quét (virus)',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'purge',
      pronunciation: '/pɜːrdʒ/',
      wordVi: 'Dọn dẹp',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'reboot',
      pronunciation: '/ˌriːˈbuːt/',
      wordVi: 'Khởi động lại',
      partOfSpeech: 'v',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    FabPhraseItem(
      phrase: 'Be (often) related to',
      meaning: '(Thường) liên quan đến',
    ),
    FabPhraseItem(phrase: 'Both … and …', meaning: 'Cả … và …'),
    FabPhraseItem(
      phrase: 'In addition to + sb/ sth',
      meaning: 'Ngoài ai/ cái gì',
    ),
    FabPhraseItem(
      phrase: 'Reference (n) + to sb/ sth',
      meaning: 'Việc nói đến, nhắc đến ai/cái gì',
    ),
  ];

  static List<FabAnswerItem> get readingAnswers => [
    FabAnswerItem(vi: 'Thường liên quan đến', en: 'is often related to'),
    FabAnswerItem(vi: 'Bên cạnh', en: 'In addition to'),
    FabAnswerItem(vi: 'Các chuyên đề trước đó', en: 'the previous themes'),
    FabAnswerItem(vi: 'Sẽ bao gồm', en: 'will include'),
    FabAnswerItem(vi: 'Các phòng thí nghiệm', en: 'laboratories'),
    FabAnswerItem(vi: 'Thiết bị chuyên dụng', en: 'specialized equipment'),
    FabAnswerItem(vi: 'Những chiếc máy tính', en: 'computers'),
    FabAnswerItem(vi: 'Công nghệ', en: 'technology'),
    FabAnswerItem(vi: 'Thường thì', en: 'More than likely'),
    FabAnswerItem(vi: 'Các vấn đề kỹ thuật', en: 'technical issues'),
    FabAnswerItem(
      vi: 'Các hệ thống máy tính công ty',
      en: 'company computer systems',
    ),
    FabAnswerItem(vi: 'Giải quyết', en: 'resolve'),
    FabAnswerItem(vi: 'Phần mềm và phần cứng', en: 'software and hardware'),
    FabAnswerItem(vi: 'Kỹ thuật viên PTN', en: 'lab technician'),
    FabAnswerItem(vi: 'Ống nghiệm', en: 'test tube'),
    FabAnswerItem(vi: 'Rủi ro', en: 'hazard'),
    FabAnswerItem(vi: 'Lỗi kỹ thuật', en: 'malfunction'),
    FabAnswerItem(vi: 'Kính hiển vi', en: 'microscope'),
    FabAnswerItem(vi: 'Ngừng hoạt động', en: 'stops functioning'),
    FabAnswerItem(vi: 'Các ứng dụng', en: 'applications'),
    FabAnswerItem(vi: 'Thuật ngữ thường gặp', en: 'common terminology'),
    FabAnswerItem(vi: 'Nền tảng', en: 'platform'),
    FabAnswerItem(vi: 'Tương thích', en: 'compatible'),
    FabAnswerItem(vi: 'Khởi động lại', en: 'reboot'),
  ];

  // ── FAB cho Conversation (Practice 1) ──
  static List<FabVocabItem> get conversationVocab => [
    FabVocabItem(
      wordEn: 'operating system',
      pronunciation: '/ˈɑːpəreɪtɪŋ ˈsɪstəm/',
      wordVi: 'Hệ điều hành',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'background programs',
      pronunciation: '/ˈbækɡraʊnd ˈproʊɡræmz/',
      wordVi: 'Chương trình nền',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'word processing program',
      pronunciation: '/wɜːrd ˈprɑːsesɪŋ ˈproʊɡræm/',
      wordVi: 'Chương trình xử lý văn bản',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'expert',
      pronunciation: '/ˈekspɜːrt/',
      wordVi: 'Chuyên gia',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'virus',
      pronunciation: '/ˈvaɪrəs/',
      wordVi: 'Vi-rút',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get conversationPhrases => [
    FabPhraseItem(phrase: 'Drive someone crazy', meaning: 'Làm ai phát điên'),
    FabPhraseItem(phrase: 'Take forever', meaning: 'Mất rất nhiều thời gian'),
    FabPhraseItem(phrase: 'Slow something down', meaning: 'Làm chậm cái gì'),
    FabPhraseItem(phrase: 'Figure it out', meaning: 'Tìm ra (vấn đề)'),
    FabPhraseItem(phrase: 'Have a look', meaning: 'Xem xét, nhìn qua'),
  ];

  static List<FabAnswerItem> get conversationAnswers => [
    FabAnswerItem(
      vi: 'Cái máy tính này đang làm tôi phát điên',
      en: 'This computer is driving me crazy',
    ),
    FabAnswerItem(vi: 'Mất rất nhiều thời gian', en: 'take forever'),
    FabAnswerItem(vi: 'Vi-rút', en: 'a virus'),
    FabAnswerItem(
      vi: 'Hệ điều hành mới nhất hiện có',
      en: 'the latest operating system available',
    ),
    FabAnswerItem(vi: 'Chương trình nền', en: 'background programs'),
    FabAnswerItem(vi: 'Làm nó chậm hơn', en: 'slows it down'),
    FabAnswerItem(
      vi: 'Chương trình xử lý văn bản',
      en: 'a word processing program',
    ),
    FabAnswerItem(vi: 'Cũng không phải chuyên gia', en: 'no expert'),
    FabAnswerItem(vi: 'Tìm ra vấn đề', en: 'figure it out'),
  ];

  // ── FAB cho Short Talk 1 (Hotline) ──
  static List<FabVocabItem> get shortTalk1Vocab => [
    FabVocabItem(
      wordEn: 'maintenance hotline',
      pronunciation: '/ˈmeɪntənəns ˈhɑːtlaɪn/',
      wordVi: 'Đường dây nóng hỗ trợ KT',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'value',
      pronunciation: '/ˈvæljuː/',
      wordVi: 'Đánh giá cao, coi trọng',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'operator',
      pronunciation: '/ˈɑːpəreɪtər/',
      wordVi: 'Tổng đài viên',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'at the moment',
      pronunciation: '/æt ðə ˈmoʊmənt/',
      wordVi: 'Hiện tại, hiện thời',
      partOfSpeech: 'prep.p',
    ),
    FabVocabItem(
      wordEn: 'in line',
      pronunciation: '/ɪn laɪn/',
      wordVi: 'Xếp hàng, đang đợi',
      partOfSpeech: 'prep.p',
    ),
    FabVocabItem(
      wordEn: 'press',
      pronunciation: '/pres/',
      wordVi: 'Ấn, nhấn',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'description',
      pronunciation: '/dɪˈskrɪpʃən/',
      wordVi: 'Sự miêu tả',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'computer model number',
      pronunciation: '/kəmˈpjuːtər ˈmɑːdl ˈnʌmbər/',
      wordVi: 'Mã số máy tính',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'customer account number',
      pronunciation: '/ˈkʌstəmər əˈkaʊnt ˈnʌmbər/',
      wordVi: 'Mã số tài khoản KH',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'repeat',
      pronunciation: '/rɪˈpiːt/',
      wordVi: 'Nhắc lại, lặp lại',
      partOfSpeech: 'v',
    ),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
    FabPhraseItem(phrase: 'Stay on the line', meaning: 'Giữ máy, chờ máy'),
    FabPhraseItem(phrase: 'Leave a message', meaning: 'Để lại lời nhắn'),
    FabPhraseItem(
      phrase: 'Have this message repeated',
      meaning: 'Nghe lời nhắn được lặp lại',
    ),
    FabPhraseItem(phrase: 'Wait for sth/ sb', meaning: 'Chờ, đợi ai/điều gì'),
    FabPhraseItem(phrase: 'Wish to do sth', meaning: 'Mong muốn làm gì'),
    FabPhraseItem(phrase: 'Will be replied to', meaning: 'Sẽ được trả lời'),
    FabPhraseItem(
      phrase: 'Within + period of time',
      meaning: 'Trong vòng + khoảng thời gian',
    ),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => [
    FabAnswerItem(vi: 'Cảm ơn bạn đã gọi tới', en: 'Thank you for calling'),
    FabAnswerItem(vi: 'Đường dây nóng hỗ trợ KT', en: 'Maintenance Hotline'),
    FabAnswerItem(vi: 'Đánh giá cao', en: 'value'),
    FabAnswerItem(vi: 'Các tổng đài viên của chúng tôi', en: 'our operators'),
    FabAnswerItem(vi: 'Xếp thứ 15', en: 'fifteenth in line'),
    FabAnswerItem(vi: 'Để đến lượt của bạn', en: 'for your turn'),
    FabAnswerItem(vi: 'Ấn phím', en: 'press'),
    FabAnswerItem(vi: 'Muốn giữ máy', en: 'wish to stay on the line'),
    FabAnswerItem(
      vi: 'Tổng đài viên sẵn sàng tiếp theo',
      en: 'the next available operator',
    ),
    FabAnswerItem(vi: 'Để lại lời nhắn', en: 'leave a message'),
    FabAnswerItem(vi: 'Sự mô tả', en: 'description'),
    FabAnswerItem(
      vi: 'Mã số mẫu máy tính của bạn',
      en: 'your computer model number',
    ),
    FabAnswerItem(
      vi: 'Mã số tài khoản KH của bạn',
      en: 'your customer account number',
    ),
    FabAnswerItem(vi: 'Sẽ được trả lời', en: 'will be replied to'),
    FabAnswerItem(
      vi: 'Nghe lời nhắn này được lặp lại',
      en: 'have this message repeated',
    ),
  ];

  // ── FAB cho Short Talk 2 (Upgrade) ──
  static List<FabVocabItem> get shortTalk2Vocab => [
    FabVocabItem(
      wordEn: 'break down',
      pronunciation: '/breɪk daʊn/',
      wordVi: 'Bị hỏng',
      partOfSpeech: 'vp',
    ),
    FabVocabItem(
      wordEn: 'get rid of',
      pronunciation: '/ɡet rɪd ɑːv/',
      wordVi: 'Loại bỏ',
      partOfSpeech: 'vp',
    ),
    FabVocabItem(
      wordEn: 'technician',
      pronunciation: '/tekˈnɪʃən/',
      wordVi: 'Kỹ thuật viên',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'replace',
      pronunciation: '/rɪˈpleɪs/',
      wordVi: 'Thay thế',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'entire',
      pronunciation: '/ɪnˈtaɪr/',
      wordVi: 'Toàn bộ',
      partOfSpeech: 'adj',
    ),
    FabVocabItem(
      wordEn: 'computer system',
      pronunciation: '/kəmˈpjuːtər ˈsɪstəm/',
      wordVi: 'Hệ thống máy tính',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'latest model',
      pronunciation: '/ˈleɪtɪst ˈmɑːdl/',
      wordVi: 'Mẫu mới nhất',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'lose',
      pronunciation: '/luːz/',
      wordVi: 'Mất, làm mất',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'process',
      pronunciation: '/ˈprɑːses/',
      wordVi: 'Quá trình',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'procedure',
      pronunciation: '/prəˈsiːdʒər/',
      wordVi: 'Quy trình, thủ tục',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'locate',
      pronunciation: '/ˈloʊkeɪt/',
      wordVi: 'Xác định vị trí',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'transfer',
      pronunciation: '/trænsˈfɜːr/',
      wordVi: 'Chuyển sang',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'data',
      pronunciation: '/ˈdɑːtə/',
      wordVi: 'Dữ liệu',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'central computer',
      pronunciation: '/ˈsentrəl kəmˈpjuːtər/',
      wordVi: 'Máy tính trung tâm',
      partOfSpeech: 'np',
    ),
    FabVocabItem(
      wordEn: 'pretty',
      pronunciation: '/ˈprɪti/',
      wordVi: 'Khá, tương đối',
      partOfSpeech: 'adv',
    ),
    FabVocabItem(
      wordEn: 'create',
      pronunciation: '/kriˈeɪt/',
      wordVi: 'Tạo mới',
      partOfSpeech: 'v',
    ),
    FabVocabItem(
      wordEn: 'sub-folder',
      pronunciation: '/sʌb ˈfoʊldər/',
      wordVi: 'Tiểu thư mục',
      partOfSpeech: 'n',
    ),
    FabVocabItem(
      wordEn: 'hard disk',
      pronunciation: '/hɑːrd dɪsk/',
      wordVi: 'Ổ cứng',
      partOfSpeech: 'np',
    ),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
    FabPhraseItem(
      phrase: 'As you all know',
      meaning: 'Như tất cả các bạn đã biết',
    ),
    FabPhraseItem(
      phrase: 'Make it easier for sb to do sth',
      meaning: 'Làm cho ai dễ dàng hơn để làm gì',
    ),
    FabPhraseItem(
      phrase: 'Be required to do sth',
      meaning: 'Được yêu cầu làm gì',
    ),
    FabPhraseItem(phrase: 'In case of + V-ing/NP', meaning: 'Trong trường hợp'),
    FabPhraseItem(
      phrase: 'Be asked to do sth',
      meaning: 'Được yêu cầu phải làm gì',
    ),
    FabPhraseItem(
      phrase: 'Attempt to do sth',
      meaning: 'Cố gắng/nỗ lực làm gì',
    ),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => [
    FabAnswerItem(vi: 'Như tất cả các bạn đã biết', en: 'as you all know'),
    FabAnswerItem(vi: 'Đã bị hỏng', en: 'have been breaking down'),
    FabAnswerItem(vi: 'Để loại bỏ', en: 'to get rid of'),
    FabAnswerItem(vi: 'Các kỹ thuật viên', en: 'the technicians'),
    FabAnswerItem(
      vi: 'Thay thế toàn bộ hệ thống máy tính',
      en: 'replace the entire computer system',
    ),
    FabAnswerItem(vi: 'Để thực hiện công việc của bạn', en: 'to do your jobs'),
    FabAnswerItem(vi: 'Chắc chắn rằng', en: 'make sure that'),
    FabAnswerItem(
      vi: 'Bất kỳ dữ liệu quan trọng nào',
      en: 'any important data',
    ),
    FabAnswerItem(
      vi: 'Được yêu cầu tuân thủ nghiêm ngặt',
      en: 'are required to strictly follow',
    ),
    FabAnswerItem(vi: 'Xác định vị trí', en: 'locate'),
    FabAnswerItem(vi: 'Máy tính trung tâm', en: 'the central computer'),
    FabAnswerItem(vi: 'Tất cả những gì bạn cần làm', en: 'All you need to do'),
    FabAnswerItem(
      vi: 'Mở thư mục máy tính trung tâm',
      en: 'open the central computer folder',
    ),
    FabAnswerItem(vi: 'Tạo một tiểu thư mục', en: 'create a sub-folder'),
    FabAnswerItem(vi: 'Bên trong thư mục chính', en: 'within the main folder'),
    FabAnswerItem(vi: 'Tất cả tài liệu của bạn', en: 'all your files'),
    FabAnswerItem(vi: 'Sẽ không bị mất', en: 'will not be lost'),
    FabAnswerItem(vi: 'Chỉ để đề phòng trường hợp có', en: 'just in case of'),
    FabAnswerItem(
      vi: 'Cũng được yêu cầu sao lưu',
      en: 'are also asked to back up',
    ),
    FabAnswerItem(vi: 'Cái ổ cứng', en: 'the hard disk'),
    FabAnswerItem(vi: 'Cố gắng làm cả hai việc', en: 'attempt to do both'),
    FabAnswerItem(
      vi: 'Bảo toàn sự nguyên vẹn của tất cả dữ liệu',
      en: 'preserve the integrity of all data',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1: Giới thiệu chung về chuyên đề
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme03_day1',
    dayNumber: 1,
    themeId: 'theme_03_technical',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      // ── PHASE 1: READ & LISTEN ──
      LessonPhase(
        id: 'theme03_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_11',
        contentEn:
            '''This theme is often related to both the Housing/ Corporate Property and the Manufacturing themes. In addition to the items described in the previous themes, technical areas will include references to laboratories, technical personnel, specialized equipment, some specifications, computers, electronics and technology. More than likely, the majority of technical issues will be about company computer systems and often about the need to resolve problems with software and hardware.

Common vocabulary: scientist, lab technician, flask, test tube, research, hazard, programmer, malfunction, glitch, microscope, 'crash' (to describe a computer that stops functioning), virus, anti-virus, applications (not related to the verb 'applying' for a job, but a noun also known as apps) and other words in the newer versions of TOEIC tests that reflect current and common terminology like platform, support (meaning compatible), scan, purge, reboot.''',
        contentVi:
            '''Chuyên đề này thường liên quan tới cả hai chuyên đề Tài sản trong doanh nghiệp và chuyên đề Sản xuất. Ngoài những vật dụng đã được đề cập đến ở các chuyên đề trước đó, chuyên đề Các lĩnh vực kỹ thuật sẽ bao gồm các vấn đề liên quan tới phòng thí nghiệm, nhân viên kỹ thuật, thiết bị chuyên dụng, một số đặc điểm kỹ thuật, máy tính, đồ điện tử và công nghệ. Thường thì đa số các vấn đề về kỹ thuật sẽ liên quan đến các hệ thống máy tính của một công ty và hay đề cập tới nhu cầu giải quyết các vấn đề liên quan đến phần mềm và phần cứng máy tính.

Từ vựng thông dụng: nhà khoa học, kỹ thuật viên phòng thí nghiệm, bình giữ nhiệt, ống nghiệm, nghiên cứu, rủi ro, lập trình viên, lỗi kỹ thuật, sự cố kỹ thuật nhỏ, kính hiển vi, sập (để mô tả việc một chiếc máy tính ngừng hoạt động), vi-rút, diệt vi-rút, các ứng dụng (còn được viết tắt là apps, chứ không liên quan đến việc nộp hồ sơ xin việc), và các từ ngữ khác trong các bài thi TOEIC gần đây mà có đề cập đến các thuật ngữ về kỹ thuật phổ biến hiện nay như nền tảng, hỗ trợ (tương thích), quét, dọn dẹp, khởi động lại máy.''',
        fabVocab: Theme3Content.readingVocab,
        fabPhrases: Theme3Content.readingPhrases,
      ),

      // ── PHASE 2: TRANSLATE ──
      LessonPhase(
        id: 'theme03_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_11',
        contentEn:
            '''This theme is often related to both the Housing/ Corporate Property and the Manufacturing themes. In addition to the items described in the previous themes, technical areas will include references to laboratories, technical personnel, specialized equipment, some specifications, computers, electronics and technology. More than likely, the majority of technical issues will be about company computer systems and often about the need to resolve problems with software and hardware.

Common vocabulary: scientist, lab technician, flask, test tube, research, hazard, programmer, malfunction, glitch, microscope, 'crash' (to describe a computer that stops functioning), virus, anti-virus, applications (not related to the verb 'applying' for a job, but a noun also known as apps) and other words in the newer versions of TOEIC tests that reflect current and common terminology like platform, support (meaning compatible), scan, purge, reboot.''',
        contentVi:
            '''Chuyên đề này thường liên quan tới cả hai chuyên đề Tài sản trong doanh nghiệp và chuyên đề Sản xuất. Ngoài những vật dụng đã được đề cập đến ở các chuyên đề trước đó, chuyên đề Các lĩnh vực kỹ thuật sẽ bao gồm các vấn đề liên quan tới phòng thí nghiệm, nhân viên kỹ thuật, thiết bị chuyên dụng, một số đặc điểm kỹ thuật, máy tính, đồ điện tử và công nghệ. Thường thì đa số các vấn đề về kỹ thuật sẽ liên quan đến các hệ thống máy tính của một công ty và hay đề cập tới nhu cầu giải quyết các vấn đề liên quan đến phần mềm và phần cứng máy tính.

Từ vựng thông dụng: nhà khoa học, kỹ thuật viên phòng thí nghiệm, bình giữ nhiệt, ống nghiệm, nghiên cứu, rủi ro, lập trình viên, lỗi kỹ thuật, sự cố kỹ thuật nhỏ, kính hiển vi, sập (để mô tả việc một chiếc máy tính ngừng hoạt động), vi-rút, diệt vi-rút, các ứng dụng (còn được viết tắt là apps, chứ không liên quan đến việc nộp hồ sơ xin việc), và các từ ngữ khác trong các bài thi TOEIC gần đây mà có đề cập đến các thuật ngữ về kỹ thuật phổ biến hiện nay như nền tảng, hỗ trợ (tương thích), quét, dọn dẹp, khởi động lại máy.''',
      ),

      // ── PHASE 3: MIND GAME ──
      LessonPhase(
        id: 'theme03_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme3Content.readingAnswers,
      ),

      // ── PHASE 4: VOCABULARY ──
      LessonPhase(
        id: 'theme03_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('This theme '),
    const MixedSegment.vietnamese(
      'thường liên quan đến',
      'is often related to',
    ),
    const MixedSegment.english(
      ' both the Housing/ Corporate Property and the Manufacturing themes.\n',
    ),
    const MixedSegment.vietnamese('Bên cạnh', 'In addition to'),
    const MixedSegment.english(' the items described in '),
    const MixedSegment.vietnamese(
      'các chuyên đề trước đó',
      'the previous themes',
    ),
    const MixedSegment.english(', technical areas '),
    const MixedSegment.vietnamese('sẽ bao gồm', 'will include'),
    const MixedSegment.english(' references to '),
    const MixedSegment.vietnamese('các phòng thí nghiệm', 'laboratories'),
    const MixedSegment.english(', technical personnel, '),
    const MixedSegment.vietnamese(
      'thiết bị chuyên dụng',
      'specialized equipment',
    ),
    const MixedSegment.english(', some specifications, '),
    const MixedSegment.vietnamese('những chiếc máy tính', 'computers'),
    const MixedSegment.english(', electronics and '),
    const MixedSegment.vietnamese('công nghệ', 'technology'),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese('Thường thì', 'More than likely'),
    const MixedSegment.english(', the majority of '),
    const MixedSegment.vietnamese('các vấn đề kỹ thuật', 'technical issues'),
    const MixedSegment.english(' will be about '),
    const MixedSegment.vietnamese(
      'các hệ thống máy tính công ty',
      'company computer systems',
    ),
    const MixedSegment.english(' and often about the need to '),
    const MixedSegment.vietnamese('giải quyết', 'resolve'),
    const MixedSegment.english(' problems with '),
    const MixedSegment.vietnamese(
      'phần mềm và phần cứng',
      'software and hardware',
    ),
    const MixedSegment.english('.\n\nCommon vocabulary: scientist, '),
    const MixedSegment.vietnamese(
      'kỹ thuật viên phòng thí nghiệm',
      'lab technician',
    ),
    const MixedSegment.english(', flask, '),
    const MixedSegment.vietnamese('ống nghiệm', 'test tube'),
    const MixedSegment.english(', research, '),
    const MixedSegment.vietnamese('rủi ro', 'hazard'),
    const MixedSegment.english(', programmer, '),
    const MixedSegment.vietnamese('lỗi kỹ thuật', 'malfunction'),
    const MixedSegment.english(', glitch, '),
    const MixedSegment.vietnamese('kính hiển vi', 'microscope'),
    const MixedSegment.english(', \'crash\' (to describe a computer that '),
    const MixedSegment.vietnamese('ngừng hoạt động', 'stops functioning'),
    const MixedSegment.english('), virus, anti-virus, '),
    const MixedSegment.vietnamese('các ứng dụng', 'applications'),
    const MixedSegment.english(
      ' (not related to the verb \'applying\' for a job, but a noun also known as apps) '
      'and other words in the newer versions of TOEIC tests that reflect current and ',
    ),
    const MixedSegment.vietnamese('thuật ngữ thường gặp', 'common terminology'),
    const MixedSegment.english(' like '),
    const MixedSegment.vietnamese('nền tảng', 'platform'),
    const MixedSegment.english(', support (meaning '),
    const MixedSegment.vietnamese('tương thích', 'compatible'),
    const MixedSegment.english('), scan, purge, '),
    const MixedSegment.vietnamese('khởi động lại', 'reboot'),
    const MixedSegment.english('.'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2: Nghe và Luyện Trí Nhớ
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme03_day2',
    dayNumber: 2,
    themeId: 'theme_03_technical',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      // ── PHASE 1: LISTENING QUIZ - Practice 1 (Conversation) ──
      LessonPhase(
        id: 'theme03_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation',
        titleVi: 'Luyện tập 1: Hội thoại',
        audioTrackKey: 'track_12',
        questions: _practice1Questions,
      ),

      // ── PHASE 2: LISTENING QUIZ - Practice 2 (Short Talk 1) ──
      LessonPhase(
        id: 'theme03_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Maintenance Hotline',
        titleVi: 'Luyện tập 2: Bài ngắn - Đường dây nóng hỗ trợ KT',
        audioTrackKey: 'track_13',
        questions: _practice2Questions,
      ),

      // ── PHASE 3: LISTENING QUIZ - Practice 3 (Short Talk 2) ──
      LessonPhase(
        id: 'theme03_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Computer Upgrade',
        titleVi: 'Luyện tập 3: Bài ngắn - Nâng cấp hệ thống máy tính',
        audioTrackKey: 'track_14',
        questions: _practice3Questions,
      ),

      // ── PHASE 4: TRANSLATE - Conversation ──
      LessonPhase(
        id: 'theme03_day2_translate1',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Conversation',
        titleVi: 'Nghe và Dịch: Hội thoại',
        audioTrackKey: 'track_12',
        contentEn:
            '''W: This computer is driving me crazy. The programs run really fast but when I first start it, it seems to take forever before it is actually ready and I can use it. Do you think it's been affected with a virus or something?

M: Of course it's fast. It has the latest operating system available. You aren't online so it's not a virus. Maybe the reason is that there are too many background programs loading when you start. That slows it down a lot.

W: I'm not sure I know what you mean by background programs and loading. I'm not so good at these things. I know how to use a word processing program and do e-mail and that's it.

M: OK. Why don't I have a look? I'm no expert either but I hope I can help you figure it out.''',
        contentVi:
            '''W: Cái máy tính này đang làm tôi phát điên. Các chương trình chạy rất nhanh nhưng khi tôi mới khởi động nó, nó có vẻ như mất rất nhiều thời gian trước khi nó thực sự sẵn sàng để tôi có thể sử dụng nó. Anh có nghĩ nó bị vi-rút hay cái gì đó không?

M: Dĩ nhiên là nó nhanh. Nó sử dụng hệ điều hành mới nhất hiện có. Cô không online vì vậy nó không phải là vi-rút. Có lẽ lý do là có quá nhiều chương trình nền đang chạy khi cô khởi động. Điều đó làm nó chậm hơn rất nhiều.

W: Tôi không chắc là tôi hiểu rõ ý anh về các chương trình nền và việc tải các chương trình. Tôi không rành lắm về những thứ này. Tôi biết sử dụng chương trình xử lý văn bản và sử dụng thư điện tử và chỉ có thế thôi.

M: Được rồi. Để tôi xem nào. Tôi cũng chẳng phải là chuyên gia gì nhưng tôi hi vọng tôi có thể giúp cô tìm ra vấn đề.''',
      ),

      // ── PHASE 5: TRANSLATE - Short Talk 1 ──
      LessonPhase(
        id: 'theme03_day2_translate2',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Maintenance Hotline',
        titleVi: 'Nghe và Dịch: Đường dây nóng hỗ trợ KT',
        audioTrackKey: 'track_13',
        contentEn:
            '''Thank you for calling the Big Apple Computers Maintenance Hotline. We value your call. Unfortunately, all of our operators are busy at the moment with other calls. Because your call is fifteenth in line, you may have to wait as long as 10 minutes for your turn.

Please press 1 if you wish to stay on the line and wait for the next available operator. Press 2 to leave a message for the operator with a description of your problem, your computer model number and your customer account number. Your message will be replied to within the next 2 hours.

Press 3 to have this message repeated in Chinese. Press 4 to have this message repeated in Japanese. Press 5 to have this message repeated in Korean. Thank you.''',
        contentVi:
            '''Cảm ơn quý khách đã gọi tới đường dây nóng hỗ trợ kỹ thuật của công ty Big Apple Computers. Chúng tôi đánh giá cao cuộc gọi của quý khách. Thật đáng tiếc vào lúc này tất cả các tổng đài viên của chúng tôi đang bận với các cuộc gọi khác. Vì cuộc gọi của quý khách là cuộc gọi thứ 15 nên có thể quý khách phải đợi khoảng 10 phút để tới lượt mình.

Xin vui lòng ấn phím 1 nếu quý khách muốn chờ máy và đợi tổng đài viên tiếp theo. Ấn phím 2 để để lại lời nhắn cho tổng đài viên cùng với mô tả vấn đề bạn gặp phải, mã số máy tính, và số tài khoản khách hàng. Lời nhắn của bạn sẽ được trả lời trong vòng hai giờ tiếp theo.

Ấn phím 3 để nghe lời nhắn lặp lại bằng tiếng Trung. Ấn phím 4 để nghe lời nhắn lặp lại bằng tiếng Nhật. Ấn phím 5 để nghe lời nhắn lặp lại bằng tiếng Hàn. Xin cảm ơn quý khách.''',
      ),

      // ── PHASE 6: TRANSLATE - Short Talk 2 ──
      LessonPhase(
        id: 'theme03_day2_translate3',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Computer System Upgrade',
        titleVi: 'Nghe và Dịch: Nâng cấp hệ thống máy tính',
        audioTrackKey: 'track_14',
        contentEn:
            '''Attention everybody, as you all know, a lot of our computers in the office have been breaking down recently, so we decided that now is a good time to get rid of these computers. Tomorrow morning, the technicians will be here to replace the entire computer system with the latest models to make it easier for you to do your jobs.

However, we need to make sure that we don't lose any important data during the process. Therefore, you are required to strictly follow the following procedures. First of all, you must locate your important data in your computer and then transfer them to the central computer. This is pretty simple. All you need to do is to open the central computer folder on your desktop, create a sub-folder under your name within the main folder, and then transfer all your files into that new sub-folder. These folders will not be lost when the computers are replaced.

Second of all, just in case of a central computer failure, you are also asked to back up those files by copying them from your computer to the hard disk that we have here. It is essential that each and every one of you attempt to do both in order to preserve the integrity of all data.''',
        contentVi:
            '''Xin mọi người chú ý, như tất cả các bạn đã biết, rất nhiều máy tính của chúng ta trong văn phòng gần đây đã bị hỏng, vì vậy chúng tôi đã quyết định rằng bây giờ là thời điểm tốt để loại bỏ những chiếc máy tính này. Sáng ngày mai, các kỹ thuật viên sẽ tới đây để thay thế toàn bộ hệ thống máy tính bằng mẫu mới nhất để các bạn làm việc dễ dàng hơn.

Tuy nhiên, chúng ta cần chắc chắn rằng chúng ta không làm mất bất kỳ dữ liệu quan trọng nào trong suốt quá trình đó. Vì vậy, các bạn được yêu cầu phải tuân thủ nghiêm ngặt các trình tự sau. Trước hết, các bạn phải xác định vị trí dữ liệu quan trọng trong máy tính của các bạn và sau đó chuyển chúng tới máy tính trung tâm. Việc này khá đơn giản. Tất cả những gì các bạn cần làm là mở thư mục máy tính trung tâm trên màn máy tính của bạn, tạo một tiểu thư mục với tên của các bạn bên trong thư mục chính, và sau đó chuyển tất cả tài liệu của các bạn vào tiểu thư mục mới đó. Những thư mục này sẽ không bị mất khi các máy tính được thay thế.

Thứ hai là, phòng trường hợp máy tính trung tâm bị hỏng, các bạn cũng được yêu cầu sao lưu những tài liệu đó bằng việc sao chép chúng từ máy tính của các bạn sang ổ cứng mà chúng ta có ở đây. Điều nhất thiết là mỗi người trong chúng ta phải cố gắng làm cả hai việc này để bảo toàn sự nguyên vẹn của tất cả dữ liệu.''',
      ),

      // ── PHASE 7: MIND GAME - Conversation ──
      LessonPhase(
        id: 'theme03_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Conversation',
        titleVi: 'Huấn luyện Trí nhớ: Hội thoại',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme3Content.conversationVocab,
        fabPhrases: Theme3Content.conversationPhrases,
        fabAnswers: Theme3Content.conversationAnswers,
      ),

      // ── PHASE 8: MIND GAME - Short Talk 1 ──
      LessonPhase(
        id: 'theme03_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Maintenance Hotline',
        titleVi: 'Huấn luyện Trí nhớ: Đường dây nóng',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme3Content.shortTalk1Vocab,
        fabPhrases: Theme3Content.shortTalk1Phrases,
        fabAnswers: Theme3Content.shortTalk1Answers,
      ),

      // ── PHASE 9: MIND GAME - Short Talk 2 ──
      LessonPhase(
        id: 'theme03_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Computer Upgrade',
        titleVi: 'Huấn luyện Trí nhớ: Nâng cấp máy tính',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme3Content.shortTalk2Vocab,
        fabPhrases: Theme3Content.shortTalk2Phrases,
        fabAnswers: Theme3Content.shortTalk2Answers,
      ),
    ],
  );

  // ── Quiz Questions ──────────────────────────────────────────────

  static List<QuizQuestion> get _practice1Questions => [
    QuizQuestion(
      id: 'q03_p1_1',
      questionText: 'What is the woman\'s problem?',
      options: [
        '(A) Her computer won\'t start.',
        '(B) Her computer got a virus.',
        '(C) Her computer takes a long time to start.',
        '(D) She doesn\'t know how to use e-mail.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_12',
      practiceNumber: 'practice1',
    ),
    QuizQuestion(
      id: 'q03_p1_2',
      questionText: 'What does the man say about the woman\'s computer?',
      options: [
        '(A) It is too old.',
        '(B) It probably got a virus.',
        '(C) It should be replaced by a new computer.',
        '(D) It uses the newest operating system available.',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_12',
      practiceNumber: 'practice1',
    ),
    QuizQuestion(
      id: 'q03_p1_3',
      questionText: 'What does the man offer to do?',
      options: [
        '(A) Help the woman run a virus check.',
        '(B) Call a computer expert.',
        '(C) Buy a new computer for the woman.',
        '(D) Help the woman find out the problem with her computer.',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_12',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    QuizQuestion(
      id: 'q03_p2_1',
      questionText: 'Who is this message aimed at?',
      options: [
        '(A) Telephone operators.',
        '(B) Maintenance workers.',
        '(C) Sales representatives.',
        '(D) The company\'s customers.',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_13',
      practiceNumber: 'practice2',
    ),
    QuizQuestion(
      id: 'q03_p2_2',
      questionText: 'What will happen if you press 2?',
      options: [
        '(A) You may explain the computer problem.',
        '(B) You may listen to the message in Chinese.',
        '(C) You may wait to talk to an operator.',
        '(D) You may end this recorded message.',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_13',
      practiceNumber: 'practice2',
    ),
    QuizQuestion(
      id: 'q03_p2_3',
      questionText:
          'In which language is this message available besides English?',
      options: [
        '(A) Vietnamese.',
        '(B) Japanese.',
        '(C) French.',
        '(D) Spanish.',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_13',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    QuizQuestion(
      id: 'q03_p3_1',
      questionText: 'What are these instructions about?',
      options: [
        '(A) How to fix broken computers.',
        '(B) How to access the company\'s network.',
        '(C) Procedures for upgrading computers.',
        '(D) How to choose a good computer.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_14',
      practiceNumber: 'practice3',
    ),
    QuizQuestion(
      id: 'q03_p3_2',
      questionText: 'What are the listeners asked to do?',
      options: [
        '(A) Fix the broken computers.',
        '(B) Buy a new computer.',
        '(C) Save the files on the central computer.',
        '(D) Delete all data.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_14',
      practiceNumber: 'practice3',
    ),
    QuizQuestion(
      id: 'q03_p3_3',
      questionText: 'Why would the listeners need to use the hard disk?',
      options: [
        '(A) It is the cheapest way to store data.',
        '(B) The central computer might be down.',
        '(C) It is the most reliable method.',
        '(D) The network is not working properly.',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_14',
      practiceNumber: 'practice3',
    ),
  ];

  // ── Mind Game Segments Day 2 ────────────────────────────────────

  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('W: '),
    const MixedSegment.vietnamese(
      'Cái máy tính này đang làm tôi phát điên',
      'This computer is driving me crazy',
    ),
    const MixedSegment.english(
      '. The programs run really fast but when I first start it, it seems to ',
    ),
    const MixedSegment.vietnamese('mất rất nhiều thời gian', 'take forever'),
    const MixedSegment.english(
      ' before it is actually ready and I can use it. Do you think it\'s been affected with ',
    ),
    const MixedSegment.vietnamese('vi-rút', 'a virus'),
    const MixedSegment.english(' or something?\n\n'),
    const MixedSegment.english('M: Of course it\'s fast. It has '),
    const MixedSegment.vietnamese(
      'hệ điều hành mới nhất hiện có',
      'the latest operating system available',
    ),
    const MixedSegment.english(
      '. You aren\'t online so it\'s not a virus. Maybe the reason is that there are too many ',
    ),
    const MixedSegment.vietnamese('chương trình nền', 'background programs'),
    const MixedSegment.english(' loading when you start. That '),
    const MixedSegment.vietnamese('làm nó chậm hơn', 'slows it down'),
    const MixedSegment.english(' a lot.\n\n'),
    const MixedSegment.english(
      'W: I\'m not sure I know what you mean by background programs and loading. I\'m not so good at these things. I know how to use ',
    ),
    const MixedSegment.vietnamese(
      'chương trình xử lý văn bản',
      'a word processing program',
    ),
    const MixedSegment.english(' and do e-mail and that\'s it.\n\n'),
    const MixedSegment.english('M: OK. Why don\'t I have a look? I\'m '),
    const MixedSegment.vietnamese('cũng không phải chuyên gia', 'no expert'),
    const MixedSegment.english(' either but I hope I can help you '),
    const MixedSegment.vietnamese('tìm ra vấn đề', 'figure it out'),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.vietnamese(
      'Cảm ơn bạn đã gọi tới',
      'Thank you for calling',
    ),
    const MixedSegment.english(' the Big Apple Computers '),
    const MixedSegment.vietnamese(
      'đường dây nóng hỗ trợ kỹ thuật',
      'Maintenance Hotline',
    ),
    const MixedSegment.english('. We '),
    const MixedSegment.vietnamese('đánh giá cao', 'value'),
    const MixedSegment.english(' your call. Unfortunately, all of '),
    const MixedSegment.vietnamese(
      'các tổng đài viên của chúng tôi',
      'our operators',
    ),
    const MixedSegment.english(
      ' are busy at the moment with other calls. Because your call is ',
    ),
    const MixedSegment.vietnamese('xếp thứ 15', 'fifteenth in line'),
    const MixedSegment.english(', you may have to wait as long as 10 minutes '),
    const MixedSegment.vietnamese('để đến lượt của bạn', 'for your turn'),
    const MixedSegment.english('. Please '),
    const MixedSegment.vietnamese('ấn phím', 'press'),
    const MixedSegment.english(' 1 if you '),
    const MixedSegment.vietnamese('muốn giữ máy', 'wish to stay on the line'),
    const MixedSegment.english(' and wait for '),
    const MixedSegment.vietnamese(
      'tổng đài viên sẵn sàng hỗ trợ tiếp theo',
      'the next available operator',
    ),
    const MixedSegment.english('. Press 2 to '),
    const MixedSegment.vietnamese('để lại lời nhắn', 'leave a message'),
    const MixedSegment.english(' for the operator with a '),
    const MixedSegment.vietnamese('sự mô tả', 'description'),
    const MixedSegment.english(' of your problem, '),
    const MixedSegment.vietnamese(
      'mã số mẫu máy tính của bạn',
      'your computer model number',
    ),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese(
      'mã số tài khoản khách hàng của bạn',
      'your customer account number',
    ),
    const MixedSegment.english('. Your message '),
    const MixedSegment.vietnamese('sẽ được trả lời', 'will be replied to'),
    const MixedSegment.english(' within the next two hours. Press 3 to '),
    const MixedSegment.vietnamese(
      'nghe lời nhắn này được lặp lại',
      'have this message repeated',
    ),
    const MixedSegment.english(
      ' in Chinese. Press 4 to have this message repeated in Japanese. '
      'Press 5 to have this message repeated in Korean. Thank you.',
    ),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english('Attention everybody, '),
    const MixedSegment.vietnamese(
      'như tất cả các bạn đã biết',
      'as you all know',
    ),
    const MixedSegment.english(', a lot of our computers in the office '),
    const MixedSegment.vietnamese('đã bị hỏng', 'have been breaking down'),
    const MixedSegment.english(
      ' recently, so we decided that now is a good time ',
    ),
    const MixedSegment.vietnamese('để loại bỏ', 'to get rid of'),
    const MixedSegment.english(' these computers. Tomorrow morning, '),
    const MixedSegment.vietnamese('các kỹ thuật viên', 'the technicians'),
    const MixedSegment.english(' will be here to '),
    const MixedSegment.vietnamese(
      'thay thế toàn bộ hệ thống máy tính',
      'replace the entire computer system',
    ),
    const MixedSegment.english(
      ' with the latest models to make it easier for you ',
    ),
    const MixedSegment.vietnamese(
      'để thực hiện công việc của bạn',
      'to do your jobs',
    ),
    const MixedSegment.english('. However, we need to '),
    const MixedSegment.vietnamese('chắc chắn rằng', 'make sure that'),
    const MixedSegment.english(' we don\'t lose '),
    const MixedSegment.vietnamese(
      'bất kỳ dữ liệu quan trọng nào',
      'any important data',
    ),
    const MixedSegment.english(' during the process. Therefore, you '),
    const MixedSegment.vietnamese(
      'được yêu cầu tuân thủ nghiêm ngặt',
      'are required to strictly follow',
    ),
    const MixedSegment.english(
      ' the following procedures. First of all, you must ',
    ),
    const MixedSegment.vietnamese('xác định vị trí', 'locate'),
    const MixedSegment.english(
      ' your important data in your computer and then transfer them to ',
    ),
    const MixedSegment.vietnamese('máy tính trung tâm', 'the central computer'),
    const MixedSegment.english('. This is pretty simple. '),
    const MixedSegment.vietnamese(
      'Tất cả những gì bạn cần làm',
      'All you need to do',
    ),
    const MixedSegment.english(' is to '),
    const MixedSegment.vietnamese(
      'mở thư mục máy tính trung tâm',
      'open the central computer folder',
    ),
    const MixedSegment.english(' on your desktop, '),
    const MixedSegment.vietnamese(
      'tạo một tiểu thư mục',
      'create a sub-folder',
    ),
    const MixedSegment.english(' under your name '),
    const MixedSegment.vietnamese(
      'bên trong thư mục chính',
      'within the main folder',
    ),
    const MixedSegment.english(', and then transfer '),
    const MixedSegment.vietnamese('tất cả tài liệu của bạn', 'all your files'),
    const MixedSegment.english(' into that new sub-folder. These folders '),
    const MixedSegment.vietnamese('sẽ không bị mất', 'will not be lost'),
    const MixedSegment.english(
      ' when the computers are replaced. Second of all, ',
    ),
    const MixedSegment.vietnamese(
      'chỉ để đề phòng trường hợp có',
      'just in case of',
    ),
    const MixedSegment.english(' a central computer failure, you '),
    const MixedSegment.vietnamese(
      'cũng được yêu cầu sao lưu',
      'are also asked to back up',
    ),
    const MixedSegment.english(
      ' those files by copying them from your computer to ',
    ),
    const MixedSegment.vietnamese('cái ổ cứng', 'the hard disk'),
    const MixedSegment.english(
      ' that we have here. It is essential that each and every one of you ',
    ),
    const MixedSegment.vietnamese(
      'cố gắng làm cả hai việc',
      'attempt to do both',
    ),
    const MixedSegment.english(' in order to '),
    const MixedSegment.vietnamese(
      'bảo toàn sự nguyên vẹn của tất cả dữ liệu',
      'preserve the integrity of all data',
    ),
    const MixedSegment.english('.'),
  ];
}

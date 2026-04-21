import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme7Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_07_dining_out',
    themeNumber: 7,
    titleEn: 'Dining Out',
    titleVi: 'Đi Ăn Nhà Hàng',
    description:
        'Đặt bàn, gọi món từ thực đơn, xin gợi ý món/đồ uống, thanh toán hoá đơn; tình huống trang trọng trong bối cảnh kinh doanh.',
    iconEmoji: '🍽️',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY (đủ bao phủ Day1 + Day2 conversation + 2 short talks)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v07_01',
      wordEn: 'formal',
      wordVi: 'trang trọng',
      pronunciation: '/ˈfɔːrml/',
      partOfSpeech: 'adj',
      themeId: 'theme_07_dining_out',
      exampleEn: 'In a formal business dinner, guests usually speak politely.',
      exampleVi:
          'Trong bữa tối công việc trang trọng, khách thường nói chuyện lịch sự.',
    ),
    VocabModel(
      id: 'v07_02',
      wordEn: 'informal',
      wordVi: 'thân mật, không trang trọng',
      pronunciation: '/ɪnˈfɔːrml/',
      partOfSpeech: 'adj',
      themeId: 'theme_07_dining_out',
      exampleEn: 'In an informal setting, people may say, “What’s good today?”',
      exampleVi:
          'Trong bối cảnh thân mật, người ta có thể nói: “Hôm nay có gì ngon?”',
    ),
    VocabModel(
      id: 'v07_03',
      wordEn: 'business setting',
      wordVi: 'bối cảnh thương mại/công việc',
      pronunciation: '/ˈbɪznəs ˈsetɪŋ/',
      partOfSpeech: 'np',
      themeId: 'theme_07_dining_out',
      exampleEn:
          'Dining conversations are often more formal in a business setting.',
      exampleVi:
          'Hội thoại khi đi ăn thường trang trọng hơn trong bối cảnh công việc.',
    ),
    VocabModel(
      id: 'v07_04',
      wordEn: 'banquet',
      wordVi: 'bữa đại tiệc',
      pronunciation: '/ˈbæŋkwɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn:
          'The company hosted a banquet to welcome international partners.',
      exampleVi: 'Công ty tổ chức một bữa đại tiệc để đón đối tác quốc tế.',
    ),
    VocabModel(
      id: 'v07_05',
      wordEn: 'reception',
      wordVi: 'tiệc chiêu đãi/sự tiếp đón',
      pronunciation: '/rɪˈsepʃn/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn:
          'A reception was held after the conference for invited guests.',
      exampleVi:
          'Một buổi tiệc chiêu đãi được tổ chức sau hội nghị cho khách mời.',
    ),
    VocabModel(
      id: 'v07_06',
      wordEn: 'reservation',
      wordVi: 'việc đặt chỗ trước',
      pronunciation: '/ˌrezərˈveɪʃn/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'I made a reservation for 6 p.m. under my name.',
      exampleVi: 'Tôi đã đặt bàn lúc 6 giờ dưới tên của mình.',
    ),
    VocabModel(
      id: 'v07_07',
      wordEn: 'menu',
      wordVi: 'thực đơn',
      pronunciation: '/ˈmenjuː/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'Everything on the menu looked so appealing.',
      exampleVi: 'Mọi thứ trong thực đơn trông hấp dẫn quá.',
    ),
    VocabModel(
      id: 'v07_08',
      wordEn: 'appetizer',
      wordVi: 'món khai vị',
      pronunciation: '/ˈæpɪtaɪzər/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'We ordered an appetizer before choosing the main course.',
      exampleVi: 'Chúng tôi gọi món khai vị trước khi chọn món chính.',
    ),
    VocabModel(
      id: 'v07_09',
      wordEn: 'main course',
      wordVi: 'món chính',
      pronunciation: '/ˈmeɪn kɔːrs/',
      partOfSpeech: 'np',
      themeId: 'theme_07_dining_out',
      exampleEn: 'She chose tuna for the main course to eat lighter.',
      exampleVi: 'Bà ấy chọn cá ngừ làm món chính để ăn nhẹ hơn.',
    ),
    VocabModel(
      id: 'v07_10',
      wordEn: 'dessert',
      wordVi: 'món tráng miệng',
      pronunciation: '/dɪˈzɜːrt/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'Chocolate mousse is the most popular dessert there.',
      exampleVi: 'Bánh mousse sô-cô-la là món tráng miệng nổi tiếng nhất ở đó.',
    ),
    VocabModel(
      id: 'v07_11',
      wordEn: 'wine steward',
      wordVi: 'nhân viên phục vụ rượu',
      pronunciation: '/waɪn ˈstuːərd/',
      partOfSpeech: 'np',
      themeId: 'theme_07_dining_out',
      exampleEn: 'The wine steward recommended a dry wine for seafood.',
      exampleVi: 'Nhân viên rượu gợi ý một loại vang không ngọt cho hải sản.',
    ),
    VocabModel(
      id: 'v07_12',
      wordEn: 'maître d\'',
      wordVi: 'quản lý nhà hàng',
      pronunciation: '/ˌmeɪtrə ˈdiː/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn:
          'The maître d\' greeted the guests and confirmed the reservation.',
      exampleVi: 'Quản lý nhà hàng chào khách và xác nhận đặt bàn.',
    ),
    VocabModel(
      id: 'v07_13',
      wordEn: 'cuisine',
      wordVi: 'ẩm thực',
      pronunciation: '/kwɪˈziːn/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'This restaurant specializes in Italian cuisine.',
      exampleVi: 'Nhà hàng này chuyên về ẩm thực Ý.',
    ),
    VocabModel(
      id: 'v07_14',
      wordEn: 'gourmet',
      wordVi: 'người sành ăn',
      pronunciation: '/ɡʊrˈmeɪ/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn:
          'A gourmet might notice the difference between roast duck and Peking Duck.',
      exampleVi:
          'Người sành ăn có thể nhận ra khác biệt giữa vịt quay và vịt Bắc Kinh.',
    ),
    VocabModel(
      id: 'v07_15',
      wordEn: 'vegetarian',
      wordVi: 'người ăn chay',
      pronunciation: '/ˌvedʒəˈteriən/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'We need vegetarian options for several guests.',
      exampleVi: 'Chúng ta cần lựa chọn ăn chay cho vài vị khách.',
    ),
    VocabModel(
      id: 'v07_16',
      wordEn: 'beverages',
      wordVi: 'các loại đồ uống',
      pronunciation: '/ˈbevərɪdʒɪz/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'The menu lists beverages separately from food items.',
      exampleVi: 'Thực đơn liệt kê đồ uống tách riêng khỏi món ăn.',
    ),
    VocabModel(
      id: 'v07_17',
      wordEn: 'catering',
      wordVi: 'dịch vụ tiệc',
      pronunciation: '/ˈkeɪtərɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'They hired catering for the company reception.',
      exampleVi: 'Họ thuê dịch vụ tiệc cho buổi chiêu đãi của công ty.',
    ),
    VocabModel(
      id: 'v07_18',
      wordEn: 'receipt',
      wordVi: 'biên lai',
      pronunciation: '/rɪˈsiːt/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'Please keep the receipt for reimbursement.',
      exampleVi: 'Vui lòng giữ biên lai để hoàn ứng.',
    ),
    VocabModel(
      id: 'v07_19',
      wordEn: 'ambience',
      wordVi: 'không khí/quang cảnh',
      pronunciation: '/ˈæmbiəns/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'The ambience was quiet and suitable for a business dinner.',
      exampleVi: 'Không khí yên tĩnh và phù hợp cho bữa tối công việc.',
    ),
    VocabModel(
      id: 'v07_20',
      wordEn: 'complimentary',
      wordVi: 'miễn phí, biếu tặng',
      pronunciation: '/ˌkɑːmplɪˈmentri/',
      partOfSpeech: 'adj',
      themeId: 'theme_07_dining_out',
      exampleEn: 'The restaurant offered complimentary bread to all guests.',
      exampleVi: 'Nhà hàng tặng bánh mì miễn phí cho tất cả khách.',
    ),
    VocabModel(
      id: 'v07_21',
      wordEn: 'aromatic',
      wordVi: 'thơm',
      pronunciation: '/ˌærəˈmætɪk/',
      partOfSpeech: 'adj',
      themeId: 'theme_07_dining_out',
      exampleEn: 'The aromatic soup was served hot.',
      exampleVi: 'Món súp thơm được phục vụ nóng.',
    ),
    VocabModel(
      id: 'v07_22',
      wordEn: 'spicy',
      wordVi: 'nhiều gia vị',
      pronunciation: '/ˈspaɪsi/',
      partOfSpeech: 'adj',
      themeId: 'theme_07_dining_out',
      exampleEn:
          'The spicy sauce is popular, but some guests prefer mild flavors.',
      exampleVi:
          'Nước sốt nhiều gia vị phổ biến, nhưng vài khách thích vị nhẹ.',
    ),
    VocabModel(
      id: 'v07_23',
      wordEn: 'hot (taste)',
      wordVi: 'cay (vị)',
      pronunciation: '/hɑːt/',
      partOfSpeech: 'adj',
      themeId: 'theme_07_dining_out',
      exampleEn: 'This dish is hot, so you may want a beverage.',
      exampleVi: 'Món này cay nên bạn có thể muốn gọi đồ uống.',
    ),
    VocabModel(
      id: 'v07_24',
      wordEn: 'roast',
      wordVi: 'quay; (thịt) được quay',
      pronunciation: '/roʊst/',
      partOfSpeech: 'v/adj',
      themeId: 'theme_07_dining_out',
      exampleEn:
          'Roast duck refers to a cooking method, not a specific recipe.',
      exampleVi: '“Vịt quay” là cách nấu chứ không phải công thức cụ thể.',
    ),
    VocabModel(
      id: 'v07_25',
      wordEn: 'recipe',
      wordVi: 'công thức nấu ăn',
      pronunciation: '/ˈresəpi/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'Peking Duck refers to a particular recipe.',
      exampleVi: 'Vịt Bắc Kinh chỉ một công thức nấu ăn cụ thể.',
    ),
    VocabModel(
      id: 'v07_26',
      wordEn: 'recommend',
      wordVi: 'gợi ý/giới thiệu',
      pronunciation: '/ˌrekəˈmend/',
      partOfSpeech: 'v',
      themeId: 'theme_07_dining_out',
      exampleEn: 'What do you recommend for dessert?',
      exampleVi: 'Bạn gợi ý món gì cho tráng miệng?',
    ),
    VocabModel(
      id: 'v07_27',
      wordEn: 'appealing',
      wordVi: 'hấp dẫn',
      pronunciation: '/əˈpiːlɪŋ/',
      partOfSpeech: 'adj',
      themeId: 'theme_07_dining_out',
      exampleEn: 'Everything on the menu looks so appealing.',
      exampleVi: 'Mọi thứ trong thực đơn nhìn hấp dẫn quá.',
    ),
    VocabModel(
      id: 'v07_28',
      wordEn: 'exceptionally',
      wordVi: 'cực kỳ',
      pronunciation: '/ɪkˈsepʃənəli/',
      partOfSpeech: 'adv',
      themeId: 'theme_07_dining_out',
      exampleEn: 'The grilled tuna is exceptionally good today.',
      exampleVi: 'Cá ngừ nướng vỉ hôm nay cực kỳ ngon.',
    ),
    VocabModel(
      id: 'v07_29',
      wordEn: 'accept reservations',
      wordVi: 'chấp nhận đặt bàn trước',
      pronunciation: '/əkˈsept ˌrezərˈveɪʃənz/',
      partOfSpeech: 'vp',
      themeId: 'theme_07_dining_out',
      exampleEn: 'They only accept reservations for parties of 15 or more.',
      exampleVi: 'Họ chỉ nhận đặt bàn cho nhóm từ 15 người trở lên.',
    ),
    VocabModel(
      id: 'v07_30',
      wordEn: 'dressing',
      wordVi: 'nước sốt (trộn salad)',
      pronunciation: '/ˈdresɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_07_dining_out',
      exampleEn: 'You can choose any salad dressing you like.',
      exampleVi: 'Bạn có thể chọn loại nước sốt salad nào bạn thích.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 1 Reading
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => [
    const FabVocabItem(
      wordEn: 'banquet',
      wordVi: 'Bữa đại tiệc',
      pronunciation: '/ˈbæŋkwɪt/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'reservation',
      wordVi: 'Đặt chỗ trước',
      pronunciation: '/ˌrezərˈveɪʃn/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'appetizer',
      wordVi: 'Món khai vị',
      pronunciation: '/ˈæpɪtaɪzər/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'dessert',
      wordVi: 'Món tráng miệng',
      pronunciation: '/dɪˈzɜːrt/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'receipt',
      wordVi: 'Biên lai',
      pronunciation: '/rɪˈsiːt/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'ambience',
      wordVi: 'Không khí',
      pronunciation: '/ˈæmbiəns/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'complimentary',
      wordVi: 'Miễn phí',
      pronunciation: '/ˌkɑːmplɪˈmentri/',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'aromatic',
      wordVi: 'Thơm',
      pronunciation: '/ˌærəˈmætɪk/',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'spicy',
      wordVi: 'Nhiều gia vị',
      pronunciation: '/ˈspaɪsi/',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'roast',
      wordVi: 'Quay',
      pronunciation: '/roʊst/',
      partOfSpeech: 'v/adj',
    ),
    const FabVocabItem(
      wordEn: 'recipe',
      wordVi: 'Công thức nấu ăn',
      pronunciation: '/ˈresəpi/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    const FabPhraseItem(phrase: 'Make reservations', meaning: 'Đặt chỗ trước'),
    const FabPhraseItem(
      phrase: 'Order food and drink',
      meaning: 'Gọi đồ ăn và thức uống',
    ),
    const FabPhraseItem(phrase: 'Pay the bill', meaning: 'Thanh toán hoá đơn'),
    const FabPhraseItem(
      phrase: 'A variety of + N',
      meaning: 'Phong phú/đa dạng',
    ),
    const FabPhraseItem(
      phrase: 'Plan an event',
      meaning: 'Lên kế hoạch cho một sự kiện',
    ),
    const FabPhraseItem(
      phrase: 'Interact with',
      meaning: 'Tương tác/tiếp xúc với',
    ),
    const FabPhraseItem(
      phrase: 'Make a request',
      meaning: 'Đưa ra một yêu cầu',
    ),
  ];

  static List<FabAnswerItem> get readingAnswers => const [
    FabAnswerItem(vi: 'sẽ xuất hiện', en: 'will appear'),
    FabAnswerItem(vi: 'sẽ trang trọng hơn', en: 'will be more formal'),
    FabAnswerItem(vi: 'các tình huống', en: 'the situations'),
    FabAnswerItem(
      vi: 'trong một bối cảnh thương mại',
      en: 'in a business setting',
    ),
    FabAnswerItem(vi: 'các buổi đại tiệc', en: 'banquets'),
    FabAnswerItem(
      vi: 'cũng như là các nhà hàng thực tế',
      en: 'as well as actual restaurants',
    ),
    FabAnswerItem(vi: 'việc đặt chỗ trước', en: 'making reservations'),
    FabAnswerItem(vi: 'từ một thực đơn', en: 'from a menu'),
    FabAnswerItem(vi: 'thanh toán hóa đơn', en: 'paying the bill'),
    FabAnswerItem(vi: 'món khai vị', en: 'appetizer'),
    FabAnswerItem(vi: 'nhân viên phục vụ rượu', en: 'wine steward'),
    FabAnswerItem(vi: 'ẩm thực', en: 'cuisine'),
    FabAnswerItem(vi: 'người ăn chay', en: 'vegetarian'),
    FabAnswerItem(vi: 'các đồ uống', en: 'beverages'),
    FabAnswerItem(vi: 'biên lai', en: 'receipt'),
    FabAnswerItem(vi: 'gọi món', en: 'order'),
    FabAnswerItem(vi: 'đặt chỗ trước', en: 'reserve'),
    FabAnswerItem(vi: 'hủy', en: 'cancel'),
    FabAnswerItem(vi: 'ký tên', en: 'sign'),
    FabAnswerItem(vi: 'không khí', en: 'ambience'),
    FabAnswerItem(vi: 'miễn phí', en: 'complimentary'),
    FabAnswerItem(vi: 'cay', en: 'hot'),
    FabAnswerItem(vi: 'một con vịt quay', en: 'a roast duck'),
    FabAnswerItem(vi: 'một công thức nấu ăn cụ thể', en: 'a particular recipe'),
    FabAnswerItem(vi: 'lên kế hoạch một sự kiện', en: 'planning an event'),
    FabAnswerItem(
      vi: 'tương tác với nhân viên nhà hàng',
      en: 'interacting with restaurant staff',
    ),
    FabAnswerItem(vi: 'việc giới thiệu đồ uống', en: 'beverage recommendation'),
    FabAnswerItem(
      vi: 'một yêu cầu đặc biệt về đồ ăn',
      en: 'a special food request',
    ),
    FabAnswerItem(vi: 'gây khó hiểu', en: 'confusing'),
    FabAnswerItem(vi: 'Bạn gợi ý món gì?', en: 'What do you recommend?'),
    FabAnswerItem(vi: 'Hôm nay có gì ngon?', en: 'What\'s good today?'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 MindGame: Conversation
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get conversationVocab => [
    const FabVocabItem(
      wordEn: 'appealing',
      wordVi: 'Hấp dẫn',
      pronunciation: '/əˈpiːlɪŋ/',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'particularly',
      wordVi: 'Đặc biệt',
      pronunciation: '/pərˈtɪkjələrli/',
      partOfSpeech: 'adv',
    ),
    const FabVocabItem(
      wordEn: 'exceptionally',
      wordVi: 'Cực kỳ',
      pronunciation: '/ɪkˈsepʃənəli/',
      partOfSpeech: 'adv',
    ),
    const FabVocabItem(
      wordEn: 'dessert',
      wordVi: 'Món tráng miệng',
      pronunciation: '/dɪˈzɜːrt/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'main course',
      wordVi: 'Món chính',
      pronunciation: '/ˈmeɪn kɔːrs/',
      partOfSpeech: 'np',
    ),
  ];

  static List<FabPhraseItem> get conversationPhrases => [
    const FabPhraseItem(phrase: 'What to order', meaning: 'Gọi món gì'),
    const FabPhraseItem(
      phrase: 'Not up to normal standards',
      meaning: 'Không ngon như thường ngày',
    ),
    const FabPhraseItem(phrase: 'Be right back', meaning: 'Trở lại ngay'),
    const FabPhraseItem(
      phrase: 'Lose a bit of weight',
      meaning: 'Giảm cân một chút',
    ),
  ];

  static List<FabAnswerItem> get conversationAnswers => const [
    FabAnswerItem(vi: 'món gì để gọi', en: 'what to order'),
    FabAnswerItem(vi: 'trông hấp dẫn quá', en: 'looks so appealing'),
    FabAnswerItem(vi: 'thật lòng mà nói', en: 'honestly'),
    FabAnswerItem(vi: 'đặc biệt gợi ý', en: 'particularly recommend'),
    FabAnswerItem(
      vi: 'không ngon được như thường ngày',
      en: 'not up to normal standards',
    ),
    FabAnswerItem(vi: 'cực kỳ ngon', en: 'exceptionally good'),
    FabAnswerItem(vi: 'cho món tráng miệng', en: 'for dessert'),
    FabAnswerItem(
      vi: 'món tráng miệng nổi tiếng nhất của chúng tôi',
      en: 'our most popular dessert',
    ),
    FabAnswerItem(vi: 'nghe có vẻ ngon', en: 'sounds delicious'),
    FabAnswerItem(vi: 'giảm cân một chút', en: 'lose a bit of weight'),
    FabAnswerItem(vi: 'cho món chính', en: 'for the main course'),
    FabAnswerItem(vi: 'trở lại ngay', en: 'be right back'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 MindGame: Short Talk 1 (Alessandro's)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk1Vocab => [
    const FabVocabItem(
      wordEn: 'faithfully',
      wordVi: 'Tận tình',
      pronunciation: '/ˈfeɪθfəli/',
      partOfSpeech: 'adv',
    ),
    const FabVocabItem(
      wordEn: 'accept',
      wordVi: 'Chấp nhận',
      pronunciation: '/əkˈsept/',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'reservation',
      wordVi: 'Đặt bàn',
      pronunciation: '/ˌrezərˈveɪʃn/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'exact',
      wordVi: 'Chính xác',
      pronunciation: '/ɪɡˈzækt/',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'contact',
      wordVi: 'Liên lạc',
      pronunciation: '/ˈkɑːntækt/',
      partOfSpeech: 'v',
    ),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
    const FabPhraseItem(
      phrase: 'At no additional charge',
      meaning: 'Không mất thêm phí',
    ),
    const FabPhraseItem(
      phrase: 'Please be informed that',
      meaning: 'Xin lưu ý rằng',
    ),
    const FabPhraseItem(phrase: 'When necessary', meaning: 'Khi cần'),
    const FabPhraseItem(phrase: 'To make a reservation', meaning: 'Để đặt bàn'),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => const [
    FabAnswerItem(vi: 'tận tình phục vụ', en: 'faithfully serve'),
    FabAnswerItem(
      vi: 'gồm cả các ngày nghỉ lễ và cuối tuần',
      en: 'including holidays and weekends',
    ),
    FabAnswerItem(vi: 'giờ ăn trưa', en: 'lunch time'),
    FabAnswerItem(vi: 'được phục vụ', en: 'is served'),
    FabAnswerItem(
      vi: 'cứ hai tuần một lần vào cuối tuần',
      en: 'Every other weekend',
    ),
    FabAnswerItem(vi: 'những buổi hòa nhạc đặc biệt', en: 'special concerts'),
    FabAnswerItem(vi: 'mà không tính thêm phí', en: 'at no additional charge'),
    FabAnswerItem(
      vi: 'chấp nhận việc đặt bàn trước',
      en: 'accept reservations',
    ),
    FabAnswerItem(vi: 'Để đặt bàn', en: 'To make a reservation'),
    FabAnswerItem(vi: 'để lại tên của mình', en: 'leave your name'),
    FabAnswerItem(vi: 'việc đặt bàn của quý vị', en: 'your reservation'),
    FabAnswerItem(
      vi: 'số lượng người chính xác',
      en: 'the exact number of people',
    ),
    FabAnswerItem(vi: 'bữa ăn', en: 'the meal'),
    FabAnswerItem(vi: 'để liên lạc', en: 'to contact'),
    FabAnswerItem(vi: 'khi cần', en: 'when necessary'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 MindGame: Short Talk 2 (Vine and Dine)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk2Vocab => [
    const FabVocabItem(
      wordEn: 'dressing',
      wordVi: 'Nước sốt',
      pronunciation: '/ˈdresɪŋ/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'purchased fresh',
      wordVi: 'Mua khi còn tươi',
      pronunciation: '/ˈpɜːrtʃəst freʃ/',
      partOfSpeech: 'vp',
    ),
    const FabVocabItem(
      wordEn: 'local farmers',
      wordVi: 'Nông dân địa phương',
      pronunciation: '/ˈloʊkəl ˈfɑːrmərz/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'look over',
      wordVi: 'Xem qua',
      pronunciation: '/lʊk ˈoʊvər/',
      partOfSpeech: 'vp',
    ),
    const FabVocabItem(
      wordEn: 'decision',
      wordVi: 'Quyết định',
      pronunciation: '/dɪˈsɪʒən/',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
    const FabPhraseItem(
      phrase: 'It\'s totally up to you',
      meaning: 'Hoàn toàn tuỳ vào bạn',
    ),
    const FabPhraseItem(phrase: 'To start off', meaning: 'Để khởi đầu'),
    const FabPhraseItem(phrase: 'Take your time', meaning: 'Cứ thong thả'),
    const FabPhraseItem(
      phrase: 'What would you like to drink?',
      meaning: 'Quý vị muốn uống gì?',
    ),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => const [
    FabAnswerItem(
      vi: 'ăn tối cùng chúng tôi đêm nay',
      en: 'dining with us tonight',
    ),
    FabAnswerItem(vi: 'Để khởi đầu', en: 'To start off'),
    FabAnswerItem(
      vi: 'sự lựa chọn nước sốt riêng của quý vị',
      en: 'your choice of dressing',
    ),
    FabAnswerItem(vi: 'những loại chính', en: 'main kinds'),
    FabAnswerItem(
      vi: 'điều đó hoàn toàn tùy vào quý vị',
      en: 'it\'s totally up to you',
    ),
    FabAnswerItem(vi: 'được mua khi vẫn còn tươi', en: 'are purchased fresh'),
    FabAnswerItem(
      vi: 'những món đặc biệt cho món chính',
      en: 'main course specials',
    ),
    FabAnswerItem(
      vi: 'dành cho quý vị thêm một chút thời gian',
      en: 'give you a little more time',
    ),
    FabAnswerItem(vi: 'xem qua', en: 'look over'),
    FabAnswerItem(
      vi: 'đưa ra những quyết định của mình',
      en: 'make your decisions',
    ),
    FabAnswerItem(vi: 'hãy cứ thong thả', en: 'take your time'),
    FabAnswerItem(
      vi: 'quý vị muốn uống gì?',
      en: 'what would you like to drink?',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme07_day1',
    dayNumber: 1,
    themeId: 'theme_07_dining_out',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      LessonPhase(
        id: 'theme07_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_27',
        contentEn:
            '''This is a common theme and will appear in several sections of the test. Conversations will be more formal than informal as the situations are mainly in a business setting and will include banquets, receptions, as well as actual restaurants.

Main lexicon will be about making reservations, ordering food and drink from a menu, asking for and paying the bill. Nouns such as: appetizer, mains, dessert, wine steward, maitre d', cuisine, gourmet, vegetarian, credit card, beverages, catering, snack, receipt and a variety of food items will be heard. Verbs such as: order, select, reserve, book, cancel, greet, sign are common. Some words are quite specific to this theme such as 'ambience' as are a variety of adjectives such as complimentary, aromatic, spicy, hot (as in taste), dry (referring to wine that is not sweet), and sometimes there is difficulty in following the conversation because while a 'roast' duck refers to a method of cooking, Peking Duck refers to a particular recipe. This can be distracting but luckily of minor importance in the test.

Conversations will be about planning an event or interacting with restaurant staff such as asking for a food or beverage recommendation or making a special food request. The informal and formal asking of questions can be a little confusing but the more polite "What do you recommend?" has the same meaning as the more informal "What's good today?"''',
        contentVi:
            '''Đây là một chuyên đề phổ biến và sẽ xuất hiện ở nhiều phần của bài thi. Các bài hội thoại thường có tính trang trọng hơn là thân mật vì các tình huống chủ yếu là trong bối cảnh thương mại và sẽ bao gồm các buổi đại tiệc, việc đón tiếp khách, cũng như là các nhà hàng thực tế.

Từ vựng chính sẽ là về việc đặt chỗ, gọi đồ ăn đồ uống từ thực đơn, yêu cầu và thanh toán hóa đơn. Những danh từ như là: món khai vị, các món chính, món tráng miệng, nhân viên phục vụ rượu, quản lý nhà hàng, ẩm thực, người sành ăn, người ăn chay, thẻ tín dụng, đồ uống, cung cấp dịch vụ tiệc, đồ ăn nhẹ, biên lai, và một loạt các đồ ăn cũng sẽ được nhắc đến. Những động từ như: gọi món, chọn món, đặt chỗ, hủy, chào hỏi, ký tên là các từ vựng thường gặp. Một vài từ khá đặc trưng cho chuyên đề này, chẳng hạn như từ 'ambience' (không khí), cũng như một loạt các tính từ như complimentary (miễn phí), aromatic (thơm), spicy (nhiều gia vị), hot (cay), dry (không ngọt - nói về rượu vang), và đôi khi có những khó khăn trong việc theo dõi các cuộc hội thoại vì trong khi từ 'roast' (quay) trong cụm từ 'a roast duck' chỉ cách nấu ăn; thì Peking Duck lại chỉ một công thức nấu ăn cụ thể. Điều này có thể khiến bạn mất tập trung, tuy nhiên may mắn là nó không quá quan trọng trong bài thi TOEIC.

Các đoạn hội thoại thường nói về việc lên kế hoạch cho một sự kiện hoặc tương tác với nhân viên nhà hàng như là yêu cầu đồ ăn hay gợi ý đồ uống hoặc là đưa ra những yêu cầu đặc biệt về đồ ăn. Việc đưa ra các câu hỏi mang tính thân mật hoặc trang trọng cũng có thể gây khó hiểu đôi chút, tuy nhiên cách nói lịch sự "What do you recommend?" (Bạn sẽ gợi ý món gì?) thì cũng có cùng ý nghĩa như khi ta nói một cách thân mật hơn đó là "What's good today?" (Hôm nay có món gì ngon vậy?)''',
        fabVocab: Theme7Content.readingVocab,
        fabPhrases: Theme7Content.readingPhrases,
      ),
      LessonPhase(
        id: 'theme07_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_27',
        contentEn: null,
        contentVi: null,
      ),
      LessonPhase(
        id: 'theme07_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme7Content.readingAnswers,
      ),
      LessonPhase(
        id: 'theme07_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('This is a common theme and '),
    const MixedSegment.vietnamese('sẽ xuất hiện', 'will appear'),
    const MixedSegment.english(
      ' in several sections of the test. Conversations ',
    ),
    const MixedSegment.vietnamese('sẽ trang trọng hơn', 'will be more formal'),
    const MixedSegment.english(' than informal as '),
    const MixedSegment.vietnamese('các tình huống', 'the situations'),
    const MixedSegment.english(' are mainly '),
    const MixedSegment.vietnamese(
      'trong một bối cảnh thương mại',
      'in a business setting',
    ),
    const MixedSegment.english(' and will include '),
    const MixedSegment.vietnamese('các buổi đại tiệc', 'banquets'),
    const MixedSegment.english(', receptions, '),
    const MixedSegment.vietnamese(
      'cũng như là các nhà hàng thực tế',
      'as well as actual restaurants',
    ),
    const MixedSegment.english('.\n\nMain lexicon will be about '),
    const MixedSegment.vietnamese('việc đặt chỗ trước', 'making reservations'),
    const MixedSegment.english(', ordering food and drink '),
    const MixedSegment.vietnamese('từ một thực đơn', 'from a menu'),
    const MixedSegment.english(', asking for and '),
    const MixedSegment.vietnamese('thanh toán hóa đơn', 'paying the bill'),
    const MixedSegment.english('.\nNouns such as: '),
    const MixedSegment.vietnamese('món khai vị', 'appetizer'),
    const MixedSegment.english(', mains, dessert, '),
    const MixedSegment.vietnamese('nhân viên phục vụ rượu', 'wine steward'),
    const MixedSegment.english(', maitre d\', '),
    const MixedSegment.vietnamese('ẩm thực', 'cuisine'),
    const MixedSegment.english(', gourmet, '),
    const MixedSegment.vietnamese('người ăn chay', 'vegetarian'),
    const MixedSegment.english(', credit card, '),
    const MixedSegment.vietnamese('các đồ uống', 'beverages'),
    const MixedSegment.english(', catering, snack, '),
    const MixedSegment.vietnamese('biên lai', 'receipt'),
    const MixedSegment.english(
      ' and a variety of food items will be heard.\nVerbs such as: ',
    ),
    const MixedSegment.vietnamese('gọi món', 'order'),
    const MixedSegment.english(', select, '),
    const MixedSegment.vietnamese('đặt chỗ trước', 'reserve'),
    const MixedSegment.english(', book, '),
    const MixedSegment.vietnamese('hủy', 'cancel'),
    const MixedSegment.english(', greet, '),
    const MixedSegment.vietnamese('ký tên', 'sign'),
    const MixedSegment.english(
      ' are common. Some words are quite specific to this theme such as ',
    ),
    const MixedSegment.vietnamese('không khí', 'ambience'),
    const MixedSegment.english(' as are a variety of adjectives such as '),
    const MixedSegment.vietnamese('miễn phí', 'complimentary'),
    const MixedSegment.english(', aromatic, spicy, '),
    const MixedSegment.vietnamese('cay', 'hot'),
    const MixedSegment.english(
      ' (as in taste), dry (referring to wine that is not sweet), and sometimes there is difficulty in following the conversation because while ',
    ),
    const MixedSegment.vietnamese('một con vịt quay', 'a roast duck'),
    const MixedSegment.english(
      ' refers to a method of cooking, Peking Duck refers to ',
    ),
    const MixedSegment.vietnamese(
      'một công thức nấu ăn cụ thể',
      'a particular recipe',
    ),
    const MixedSegment.english(
      '. This can be distracting but luckily of minor importance in the test.\n\nConversations will be about ',
    ),
    const MixedSegment.vietnamese(
      'lên kế hoạch một sự kiện',
      'planning an event',
    ),
    const MixedSegment.english(' or '),
    const MixedSegment.vietnamese(
      'tương tác với nhân viên nhà hàng',
      'interacting with restaurant staff',
    ),
    const MixedSegment.english(' such as asking for a food or '),
    const MixedSegment.vietnamese(
      'việc giới thiệu đồ uống',
      'beverage recommendation',
    ),
    const MixedSegment.english(' or making '),
    const MixedSegment.vietnamese(
      'một yêu cầu đặc biệt về đồ ăn',
      'a special food request',
    ),
    const MixedSegment.english(
      '. The informal and formal asking of questions can be a little ',
    ),
    const MixedSegment.vietnamese('gây khó hiểu', 'confusing'),
    const MixedSegment.english(' but the more polite "'),
    const MixedSegment.vietnamese(
      'Bạn gợi ý món gì?',
      'What do you recommend?',
    ),
    const MixedSegment.english('" has the same meaning as the more informal "'),
    const MixedSegment.vietnamese('Hôm nay có gì ngon?', 'What\'s good today?'),
    const MixedSegment.english('".'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme07_day2',
    dayNumber: 2,
    themeId: 'theme_07_dining_out',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      LessonPhase(
        id: 'theme07_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation',
        titleVi: 'Luyện tập 1: Hội thoại',
        audioTrackKey: 'track_28',
        questions: _practice1Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 1 (A): M nói "I\'ll be right back with your food" = Trong một nhà hàng.',
            en: 'Q1 (A): M says "I\'ll be right back with your food" = In a restaurant.',
          ),
          const FabAnswerItem(
            vi: 'Câu 2 (B): W hỏi "Is there anything that you\'d particularly recommend?" = Nhờ gợi ý món ăn.',
            en: 'Q2 (B): W asks "Is there anything that you\'d particularly recommend?" = Suggest some food.',
          ),
          const FabAnswerItem(
            vi: 'Câu 3 (C): M nói "the Roasted Chicken is not up to normal standards today" = Không gợi ý món gà quay.',
            en: 'Q3 (C): M says "the Roasted Chicken is not up to normal standards today" = The Roasted Chicken.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme07_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Reservations',
        titleVi: 'Luyện tập 2: Bài ngắn - Đặt bàn',
        audioTrackKey: 'track_29',
        questions: _practice2Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 4 (C): Bài nói nhắc đến "lunch time", "dinner" và "reservations" = Nhà hàng.',
            en: 'Q4 (C): The talk mentions "lunch time", "dinner", and "reservations" = A restaurant.',
          ),
          const FabAnswerItem(
            vi: 'Câu 5 (D): "we only accept reservations for parties of 15 people or more" = Ít nhất 15 người.',
            en: 'Q5 (D): "we only accept reservations for parties of 15 people or more" = 15.',
          ),
          const FabAnswerItem(
            vi: 'Câu 6 (A): "a number we could use to contact you when necessary" = Số điện thoại.',
            en: 'Q6 (A): "a number we could use to contact you when necessary" = A telephone number.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme07_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Welcome Speech',
        titleVi: 'Luyện tập 3: Bài ngắn - Chào đón & gọi đồ uống',
        audioTrackKey: 'track_30',
        questions: _practice3Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 7 (D): Người nói giới thiệu thực đơn, gợi ý món ăn và hỏi đồ uống = Nữ bồi bàn.',
            en: 'Q7 (D): The speaker introduces the menu, suggests dishes, and asks for drinks = A waitress.',
          ),
          const FabAnswerItem(
            vi: 'Câu 8 (B): "all of our garden vegetables are purchased fresh from local farmers" = Rau trồng tại địa phương.',
            en: 'Q8 (B): "all of our garden vegetables are purchased fresh from local farmers" = They are locally grown.',
          ),
          const FabAnswerItem(
            vi: 'Câu 9 (D): "Now before I go, what would you like to drink?" = Hỏi món đồ uống.',
            en: 'Q9 (D): "Now before I go, what would you like to drink?" = A beverage order.',
          ),
        ],
      ),

      LessonPhase(
        id: 'theme07_day2_translate1',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Conversation',
        titleVi: 'Nghe và Dịch: Hội thoại',
        audioTrackKey: 'track_28',
        contentEn:
            '''W: I don't know what to order. Everything on the menu looks so appealing, although honestly I don't know what some things actually are. Is there anything that you'd particularly recommend?
M: I'm told the Roasted Chicken is not up to normal standards today, but the Grilled Tuna and the Korean Barbecued Beef are exceptionally good. You might enjoy one of those with a rich chocolate mousse for dessert. That is certainly our most popular dessert.
W: It sounds delicious, but I'm trying to lose a bit of weight. I think I'll just have the tuna for the main course and some grapes for dessert.
M: Alright, madam. I'll be right back with your food.''',
        contentVi:
            '''W: Tôi không biết gọi món nào đâu. Mọi thứ trong thực đơn nhìn hấp dẫn quá, dù thật lòng mà nói tôi chẳng biết mấy món đó thực ra là như thế nào. Cậu có gợi ý món nào đặc biệt không?
M: Tôi được biết là món gà quay hôm nay không ngon như thường ngày, nhưng cá ngừ nướng vỉ và bò nướng Hàn Quốc thì cực kỳ ngon. Bà có thể sẽ thích một trong hai món đó với bánh kem nhiều sô cô la để tráng miệng. Đây là món tráng miệng nổi tiếng nhất của chúng tôi.
W: Nghe ngon thật đấy, nhưng tôi đang cố gắng giảm cân một chút. Tôi nghĩ là tôi chỉ ăn món chính là cá ngừ và tráng miệng bằng nho thôi.
M: Vâng được thưa bà. Tôi sẽ mang đồ ăn lại cho bà ngay.''',
      ),
      LessonPhase(
        id: 'theme07_day2_translate2',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Alessandro\'s',
        titleVi: 'Nghe và Dịch: Alessandro\'s',
        audioTrackKey: 'track_29',
        contentEn:
            '''Thank you for calling Alessandro's. We faithfully serve in the Boston area every day including holidays and weekends. Our lunch time is from 10:30 a.m. to 3:30 p.m. and dinner is served from 5 p.m. until 11 p.m. Every other weekend, we have special concerts that you can all enjoy at no additional charge. Please be informed that we only accept reservations for parties of 15 people or more. To make a reservation, you need to leave your name and the date and time of your reservation. We also require you to tell us the exact number of people who will be attending the meal and a number we could use to contact you when necessary. Thank you for choosing us.''',
        contentVi:
            '''Cảm ơn quý khách đã gọi tới nhà hàng Alessandro's. Chúng tôi luôn tận tình phục vụ quý khách ở khu vực Boston hằng ngày gồm cả các ngày lễ và ngày nghỉ cuối tuần. Giờ ăn trưa của chúng tôi là từ 10:30 sáng tới 3:30 chiều và bữa tối được phục vụ từ 5 giờ chiều tới tận 11 giờ đêm. Cứ 2 tuần một lần vào dịp cuối tuần, chúng tôi có các buổi hòa nhạc đặc biệt mà quý khách có thể thưởng thức mà không phải trả thêm phí. Xin lưu ý rằng chúng tôi chỉ chấp nhận việc đặt chỗ cho các bữa tiệc từ 15 người trở lên. Để đặt chỗ, quý khách cần để lại tên, ngày và giờ đặt chỗ. Bên cạnh đó, chúng tôi cũng yêu cầu quý khách cho chúng tôi biết chính xác số người sẽ tham dự bữa ăn và số điện thoại chúng tôi có thể liên hệ khi cần. Cảm ơn quý khách đã lựa chọn chúng tôi.''',
      ),
      LessonPhase(
        id: 'theme07_day2_translate3',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Vine and Dine',
        titleVi: 'Nghe và Dịch: Vine and Dine',
        audioTrackKey: 'track_30',
        contentEn:
            '''Good evening, ladies and gentlemen. Welcome to Vine and Dine. We're so happy to have you dining with us tonight. To start off your evening, I can recommend a fresh garden salad with your choice of dressing. We have all the main kinds of salad dressing, so it's totally up to you as to which one to choose. You might be glad to know that all of our garden vegetables are purchased fresh from local farmers. Our main course specials today are the Baked Macaroni and Cheese and the Grilled Vegetable Sandwich. I'll give you a little more time to look over the menu and make your decisions, so take your time. Now before I go, what would you like to drink?''',
        contentVi:
            '''Chào buổi tối các quý ông và quý bà. Xin chào mừng quý vị đến với Vine and Dine. Chúng tôi rất vui mừng được tiếp đón quý vị đến và dùng bữa tối nay. Để bắt đầu cho buổi tối của quý vị, tôi xin giới thiệu món salad tươi với nước sốt tự chọn. Chúng tôi có tất cả các loại nước sốt chính cho salad, vì vậy việc chọn loại nước sốt nào tùy thuộc hoàn toàn vào quý vị. Quý vị có thể sẽ vui mừng khi biết rằng tất cả rau quả của chúng tôi đều được mua khi vẫn còn tươi từ những người nông dân địa phương. Thực đơn đặc biệt cho món chính ngày hôm nay là món mỳ ống bỏ lò sốt phô mai và bánh xăng-đuých rau xanh nướng. Tôi sẽ dành cho quý vị thêm chút thời gian để tham khảo thực đơn và quyết định, xin các vị cứ thong thả. Và bây giờ, trước khi tôi đi, xin được hỏi quý vị muốn dùng đồ uống gì?''',
      ),

      LessonPhase(
        id: 'theme07_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Conversation',
        titleVi: 'Huấn luyện Trí nhớ: Hội thoại',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme7Content.conversationVocab,
        fabPhrases: Theme7Content.conversationPhrases,
        fabAnswers: Theme7Content.conversationAnswers,
      ),
      LessonPhase(
        id: 'theme07_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Alessandro\'s',
        titleVi: 'Huấn luyện Trí nhớ: Alessandro\'s',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme7Content.shortTalk1Vocab,
        fabPhrases: Theme7Content.shortTalk1Phrases,
        fabAnswers: Theme7Content.shortTalk1Answers,
      ),
      LessonPhase(
        id: 'theme07_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Vine and Dine',
        titleVi: 'Huấn luyện Trí nhớ: Vine and Dine',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme7Content.shortTalk2Vocab,
        fabPhrases: Theme7Content.shortTalk2Phrases,
        fabAnswers: Theme7Content.shortTalk2Answers,
      ),
    ],
  );

  // QUIZ
  static List<QuizQuestion> get _practice1Questions => [
    const QuizQuestion(
      id: 'theme07_q01',
      questionText: 'Where is the conversation taking place?',
      options: [
        '(A) In a restaurant',
        '(B) In a department store',
        '(C) At the supermarket',
        '(D) In the kitchen',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_28',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme07_q02',
      questionText: 'What does the woman ask the man to do?',
      options: [
        '(A) Bring her a menu',
        '(B) Suggest some food',
        '(C) Explain some menu items',
        '(D) Bring her the bill',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_28',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme07_q03',
      questionText: 'What does the man NOT recommend?',
      options: [
        '(A) The Grilled Tuna',
        '(B) The Korean Barbecued Beef',
        '(C) The Roasted Chicken',
        '(D) The chocolate mousse',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_28',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    const QuizQuestion(
      id: 'theme07_q04',
      questionText: 'What kind of business is Alessandro\'s?',
      options: [
        '(A) A cleaning service',
        '(B) A party planner',
        '(C) A restaurant',
        '(D) A travel agency',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_29',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme07_q05',
      questionText:
          'What is the minimum number of customers required to make a reservation?',
      options: ['(A) 5', '(B) 10', '(C) 11', '(D) 15'],
      correctIndex: 3,
      audioTrackKey: 'track_29',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme07_q06',
      questionText: 'Which of the following is needed to make a reservation?',
      options: [
        '(A) A telephone number',
        '(B) The customer\'s social security number',
        '(C) The customer\'s address',
        '(D) The customer\'s seating preference',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_29',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
      id: 'theme07_q07',
      questionText: 'Who most likely is the speaker?',
      options: [
        '(A) A chef',
        '(B) A food critic',
        '(C) A diner',
        '(D) A waitress',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_30',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme07_q08',
      questionText: 'What does the speaker say about the vegetables?',
      options: [
        '(A) They are currently not available.',
        '(B) They are locally grown.',
        '(C) They are cheap.',
        '(D) They are purchased every day.',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_30',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme07_q09',
      questionText: 'What does the speaker ask for?',
      options: [
        '(A) A bill',
        '(B) A menu',
        '(C) A recipe',
        '(D) A beverage order',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_30',
      practiceNumber: 'practice3',
    ),
  ];

  // MIND GAME Day 2 segments
  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('W: I don\'t know '),
    const MixedSegment.vietnamese('món gì để gọi', 'what to order'),
    const MixedSegment.english('. Everything on the menu '),
    const MixedSegment.vietnamese('trông hấp dẫn quá', 'looks so appealing'),
    const MixedSegment.english(', although '),
    const MixedSegment.vietnamese('thật lòng mà nói', 'honestly'),
    const MixedSegment.english(
      ' I don\'t know what some things actually are. Is there anything that you\'d ',
    ),
    const MixedSegment.vietnamese('đặc biệt gợi ý', 'particularly recommend'),
    const MixedSegment.english('?\n\nM: I\'m told the Roasted Chicken is '),
    const MixedSegment.vietnamese(
      'không ngon được như thường ngày',
      'not up to normal standards',
    ),
    const MixedSegment.english(
      ' today, but the Grilled Tuna and the Korean Barbecued Beef are ',
    ),
    const MixedSegment.vietnamese('cực kỳ ngon', 'exceptionally good'),
    const MixedSegment.english(
      '. You might enjoy one of those with a rich chocolate mousse ',
    ),
    const MixedSegment.vietnamese('cho món tráng miệng', 'for dessert'),
    const MixedSegment.english('. That is certainly '),
    const MixedSegment.vietnamese(
      'món tráng miệng nổi tiếng nhất của chúng tôi',
      'our most popular dessert',
    ),
    const MixedSegment.english('.\n\nW: It '),
    const MixedSegment.vietnamese('nghe có vẻ ngon', 'sounds delicious'),
    const MixedSegment.english(', but I\'m trying to '),
    const MixedSegment.vietnamese('giảm cân một chút', 'lose a bit of weight'),
    const MixedSegment.english('. I think I\'ll just have the tuna '),
    const MixedSegment.vietnamese('cho món chính', 'for the main course'),
    const MixedSegment.english(
      ' and some grapes for dessert.\n\nM: Alright, madam. I\'ll ',
    ),
    const MixedSegment.vietnamese('trở lại ngay', 'be right back'),
    const MixedSegment.english(' with your food.'),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Thank you for calling Alessandro\'s. We '),
    const MixedSegment.vietnamese('tận tình phục vụ', 'faithfully serve'),
    const MixedSegment.english(' in the Boston area every day '),
    const MixedSegment.vietnamese(
      'gồm cả các ngày nghỉ lễ và cuối tuần',
      'including holidays and weekends',
    ),
    const MixedSegment.english('. Our '),
    const MixedSegment.vietnamese('giờ ăn trưa', 'lunch time'),
    const MixedSegment.english(' is from 10:30 a.m. to 3:30 p.m. and dinner '),
    const MixedSegment.vietnamese('được phục vụ', 'is served'),
    const MixedSegment.english(' from 5 p.m. until 11 p.m. '),
    const MixedSegment.vietnamese(
      'cứ hai tuần một lần vào cuối tuần',
      'Every other weekend',
    ),
    const MixedSegment.english(', we have '),
    const MixedSegment.vietnamese(
      'những buổi hòa nhạc đặc biệt',
      'special concerts',
    ),
    const MixedSegment.english(' that you can all enjoy '),
    const MixedSegment.vietnamese(
      'mà không tính thêm phí',
      'at no additional charge',
    ),
    const MixedSegment.english('. Please be informed that we only '),
    const MixedSegment.vietnamese(
      'chấp nhận việc đặt bàn trước',
      'accept reservations',
    ),
    const MixedSegment.english(' for parties of 15 people or more. '),
    const MixedSegment.vietnamese('Để đặt bàn', 'To make a reservation'),
    const MixedSegment.english(', you need to '),
    const MixedSegment.vietnamese('để lại tên của mình', 'leave your name'),
    const MixedSegment.english(' and the date and time of '),
    const MixedSegment.vietnamese(
      'việc đặt bàn của quý vị',
      'your reservation',
    ),
    const MixedSegment.english('. We also require you to tell us '),
    const MixedSegment.vietnamese(
      'số lượng người chính xác',
      'the exact number of people',
    ),
    const MixedSegment.english(' who will be attending '),
    const MixedSegment.vietnamese('bữa ăn', 'the meal'),
    const MixedSegment.english(' and a number we could use '),
    const MixedSegment.vietnamese('để liên lạc', 'to contact'),
    const MixedSegment.english(' you '),
    const MixedSegment.vietnamese('khi cần', 'when necessary'),
    const MixedSegment.english('. Thank you for choosing us.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english(
      'Good evening, ladies and gentlemen. Welcome to Vine and Dine. We\'re so happy to have you ',
    ),
    const MixedSegment.vietnamese(
      'ăn tối cùng chúng tôi đêm nay',
      'dining with us tonight',
    ),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese('Để khởi đầu', 'To start off'),
    const MixedSegment.english(
      ' your evening, I can recommend a fresh garden salad with ',
    ),
    const MixedSegment.vietnamese(
      'sự lựa chọn nước sốt riêng của quý vị',
      'your choice of dressing',
    ),
    const MixedSegment.english('. We have all the '),
    const MixedSegment.vietnamese('những loại chính', 'main kinds'),
    const MixedSegment.english(' of salad dressing, so '),
    const MixedSegment.vietnamese(
      'điều đó hoàn toàn tùy vào quý vị',
      'it\'s totally up to you',
    ),
    const MixedSegment.english(
      ' as to which one to choose. You might be glad to know that all of our garden vegetables ',
    ),
    const MixedSegment.vietnamese(
      'được mua khi vẫn còn tươi',
      'are purchased fresh',
    ),
    const MixedSegment.english(' from local farmers. Our '),
    const MixedSegment.vietnamese(
      'những món đặc biệt cho món chính',
      'main course specials',
    ),
    const MixedSegment.english(
      ' today are the Baked Macaroni and Cheese and the Grilled Vegetable Sandwich. I\'ll ',
    ),
    const MixedSegment.vietnamese(
      'dành cho quý vị thêm một chút thời gian',
      'give you a little more time',
    ),
    const MixedSegment.english(' to '),
    const MixedSegment.vietnamese('xem qua', 'look over'),
    const MixedSegment.english(' the menu and '),
    const MixedSegment.vietnamese(
      'đưa ra những quyết định của mình',
      'make your decisions',
    ),
    const MixedSegment.english(', so '),
    const MixedSegment.vietnamese('hãy cứ thong thả', 'take your time'),
    const MixedSegment.english('. Now before I go, '),
    const MixedSegment.vietnamese(
      'quý vị muốn uống gì?',
      'what would you like to drink?',
    ),
  ];
}

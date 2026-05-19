import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme4Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_04_travel',
    themeNumber: 4,
    titleEn: 'Travel',
    titleVi: 'Đi Lại và Công Tác',
    description:
        'Giao thông vận tải, lịch trình, mua vé, thông báo sân bay và nhà ga, ngành khách sạn và du lịch.',
    iconEmoji: '✈️',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY LIST
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v04_01',
      wordEn: 'schedule',
      wordVi: 'lịch trình',
      pronunciation: "/'s k e d 3^1/",
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'The flight schedule shows three departures before noon.',
      exampleVi: 'Lịch trình bay hiển thị ba chuyến khởi hành trước buổi trưa.',
    ),
    VocabModel(
      id: 'v04_02',
      wordEn: 'reservation',
      wordVi: 'việc đặt (chỗ) trước',
      pronunciation: "/ re z a r 'v e i Jc?n/",
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'I made a reservation at the hotel for two nights.',
      exampleVi: 'Tôi đã đặt phòng khách sạn trước cho hai đêm.',
    ),
    VocabModel(
      id: 'v04_03',
      wordEn: 'cancellation',
      wordVi: 'sự huỷ bỏ',
      pronunciation: "/ k a e n s s 'le ip n /",
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'The cancellation of the flight disrupted many travel plans.',
      exampleVi: 'Việc huỷ chuyến bay đã làm xáo trộn nhiều kế hoạch du lịch.',
    ),
    VocabModel(
      id: 'v04_04',
      wordEn: 'delay',
      wordVi: 'sự trì hoãn',
      pronunciation: "/c ỉi'le i/",
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'The delay was caused by bad weather conditions.',
      exampleVi: 'Sự trì hoãn là do điều kiện thời tiết xấu gây ra.',
    ),
    VocabModel(
      id: 'v04_05',
      wordEn: 'fare',
      wordVi: 'giá vé',
      pronunciation: '/fer/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'The taxi fare from the airport to the hotel was quite high.',
      exampleVi: 'Giá vé taxi từ sân bay đến khách sạn khá cao.',
    ),
    VocabModel(
      id: 'v04_06',
      wordEn: 'departure',
      wordVi: 'khu khởi hành',
      pronunciation: '/dɪˈpɑːrtʃər/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'Please proceed to the departure gate immediately.',
      exampleVi: 'Xin vui lòng tiến đến cổng khởi hành ngay lập tức.',
    ),
    VocabModel(
      id: 'v04_07',
      wordEn: 'arrival',
      wordVi: 'khu đến',
      pronunciation: '/əˈraɪvəl/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'The arrivals board showed that the flight had landed.',
      exampleVi: 'Bảng thông báo khu đến cho thấy chuyến bay đã hạ cánh.',
    ),
    VocabModel(
      id: 'v04_08',
      wordEn: 'passport',
      wordVi: 'hộ chiếu',
      pronunciation: '/ˈpæspɔːrt/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'Make sure your passport is valid for at least six months.',
      exampleVi: 'Hãy đảm bảo hộ chiếu của bạn còn hiệu lực ít nhất sáu tháng.',
    ),
    VocabModel(
      id: 'v04_09',
      wordEn: 'customs',
      wordVi: 'hải quan',
      pronunciation: '/ˈkʌstəmz/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn:
          'All passengers must pass through customs before collecting luggage.',
      exampleVi: 'Tất cả hành khách phải qua hải quan trước khi nhận hành lý.',
    ),
    VocabModel(
      id: 'v04_10',
      wordEn: 'immigration',
      wordVi: 'sự nhập cảnh',
      pronunciation: '/ˌɪmɪˈɡreɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'The immigration officer checked her visa carefully.',
      exampleVi: 'Nhân viên nhập cảnh đã kiểm tra visa của cô ấy cẩn thận.',
    ),
    VocabModel(
      id: 'v04_11',
      wordEn: 'stop-over',
      wordVi: 'sự quá cảnh',
      pronunciation: '/ˈstɑːpˌoʊvər/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'We had a four-hour stop-over in Singapore.',
      exampleVi: 'Chúng tôi có bốn tiếng quá cảnh ở Singapore.',
    ),
    VocabModel(
      id: 'v04_12',
      wordEn: 'cabin crew',
      wordVi: 'phi hành đoàn',
      pronunciation: '/ˈkæbɪn kruː/',
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'The cabin crew will assist you during the flight.',
      exampleVi: 'Phi hành đoàn sẽ hỗ trợ bạn trong suốt chuyến bay.',
    ),
    VocabModel(
      id: 'v04_13',
      wordEn: 'flight attendant',
      wordVi: 'tiếp viên hàng không',
      pronunciation: '/flaɪt əˈtendənt/',
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'The flight attendant demonstrated the safety procedures.',
      exampleVi: 'Tiếp viên hàng không đã hướng dẫn các quy trình an toàn.',
    ),
    VocabModel(
      id: 'v04_14',
      wordEn: 'seatbelt',
      wordVi: 'dây an toàn',
      pronunciation: '/ˈsiːtbelt/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'Please fasten your seatbelt before takeoff.',
      exampleVi: 'Xin hãy thắt dây an toàn trước khi cất cánh.',
    ),
    VocabModel(
      id: 'v04_15',
      wordEn: 'terminal',
      wordVi: 'nhà ga hàng không',
      pronunciation: '/ˈtɜːrmɪnəl/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'The international flights depart from Terminal 2.',
      exampleVi: 'Các chuyến bay quốc tế khởi hành từ Nhà ga số 2.',
    ),
    VocabModel(
      id: 'v04_16',
      wordEn: 'disembark',
      wordVi: 'xuống máy bay',
      pronunciation: '/ˌdɪsɪmˈbɑːrk/',
      partOfSpeech: 'v',
      themeId: 'theme_04_travel',
      exampleEn: 'Passengers will disembark at Gate 14.',
      exampleVi: 'Hành khách sẽ xuống máy bay ở Cổng 14.',
    ),
    VocabModel(
      id: 'v04_17',
      wordEn: 'hand luggage',
      wordVi: 'hành lý xách tay',
      pronunciation: '/hænd ˈlʌɡɪdʒ/',
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'Only one piece of hand luggage is allowed per passenger.',
      exampleVi: 'Mỗi hành khách chỉ được phép mang một kiện hành lý xách tay.',
    ),
    VocabModel(
      id: 'v04_18',
      wordEn: 're-schedule',
      wordVi: 'sắp xếp lại, lên lịch trình lại',
      pronunciation: "/ ri's k e d 3^1/",
      partOfSpeech: 'v',
      themeId: 'theme_04_travel',
      exampleEn: 'We had to re-schedule our trip due to the storm.',
      exampleVi: 'Chúng tôi phải sắp xếp lại lịch trình do bão.',
    ),
    VocabModel(
      id: 'v04_19',
      wordEn: 'shuttle bus',
      wordVi: 'xe buýt con thoi (chạy đi chạy lại trên tuyến cố định)',
      pronunciation: "/’Ðštl bšs/",
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'A free shuttle bus runs between the hotel and the airport.',
      exampleVi:
          'Một chuyến xe buýt con thoi miễn phí chạy giữa khách sạn và sân bay.',
    ),
    VocabModel(
      id: 'v04_20',
      wordEn: 'voucher',
      wordVi: 'phiếu mua hàng',
      pronunciation: '/ˈvaʊtʃər/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'The airline gave passengers a meal voucher for the delay.',
      exampleVi:
          'Hãng hàng không đã phát phiếu ăn cho hành khách vì sự chậm trễ.',
    ),
    VocabModel(
      id: 'v04_21',
      wordEn: 'travel agent',
      wordVi: 'nhân viên đại lý du lịch',
      pronunciation: "/'trasvp l 'e id 3^ nt/",
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'The travel agent booked our flights and hotels.',
      exampleVi:
          'Nhân viên đại lý du lịch đã đặt vé máy bay và khách sạn cho chúng tôi.',
    ),
    VocabModel(
      id: 'v04_22',
      wordEn: 'express train',
      wordVi: 'tàu tốc hành',
      pronunciation: '/ɪkˈspres treɪn/',
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'The express train will get you there in under two hours.',
      exampleVi: 'Tàu tốc hành sẽ đưa bạn đến đó trong chưa đầy hai tiếng.',
    ),
    VocabModel(
      id: 'v04_23',
      wordEn: 'platform',
      wordVi: 'sân ga, ke tàu',
      pronunciation: '/ˈplætfɔːrm/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'Please be at the platform at least thirty minutes early.',
      exampleVi: 'Xin vui lòng có mặt ở sân ga ít nhất ba mươi phút trước.',
    ),
    VocabModel(
      id: 'v04_24',
      wordEn: 'excursion rates',
      wordVi: 'bảng giá lữ hành đặc biệt',
      pronunciation: '/ɪkˈskɜːrʒən reɪts/',
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn:
          'The agency offers special excursion rates for group bookings.',
      exampleVi:
          'Đại lý cung cấp bảng giá lữ hành đặc biệt cho đặt tour theo nhóm.',
    ),
    VocabModel(
      id: 'v04_25',
      wordEn: 'engine problem',
      wordVi: 'vấn đề về động cơ',
      pronunciation: '/ˈendʒɪn ˈprɑːbləm/',
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'The flight was delayed due to an engine problem.',
      exampleVi: 'Chuyến bay bị trì hoãn do một vấn đề về động cơ.',
    ),
    VocabModel(
      id: 'v04_26',
      wordEn: 'transportation',
      wordVi: 'giao thông vận tải',
      pronunciation: '/ˌtrænspərˈteɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'Public transportation is very efficient in this city.',
      exampleVi: 'Giao thông công cộng rất hiệu quả ở thành phố này.',
    ),
    VocabModel(
      id: 'v04_27',
      wordEn: 'hospitality industry',
      wordVi: 'ngành kinh doanh nhà hàng-khách sạn',
      pronunciation: "/ỗo h a isp a 'ta e la ti 'in c h s tri/",
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn:
          'He has worked in the hospitality industry for over ten years.',
      exampleVi:
          'Anh ấy đã làm việc trong ngành nhà hàng khách sạn hơn 10 năm.',
    ),
    VocabModel(
      id: 'v04_28',
      wordEn: 'travel agency',
      wordVi: 'hãng du lịch, đại lý du lịch',
      pronunciation: "/'tracvp l 'e icl3«?nsi/",
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'The travel agency arranged the entire tour for us.',
      exampleVi: 'Đại lý du lịch đã sắp xếp toàn bộ chuyến đi cho chúng tôi.',
    ),
    VocabModel(
      id: 'v04_29',
      wordEn: 'booking',
      wordVi: 'việc đặt mua vé trước',
      pronunciation: "/'b u k iij/",
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'I need to confirm my booking for the flight.',
      exampleVi: 'Tôi cần xác nhận việc đặt vé cho chuyến bay của mình.',
    ),
    VocabModel(
      id: 'v04_30',
      wordEn: 'alternate',
      wordVi: 'luân phiên, xen kẽ; được dùng để thay thế, dự phòng',
      pronunciation: "/ a ilt orn á t /",
      partOfSpeech: 'adj',
      themeId: 'theme_04_travel',
      exampleEn: 'We took an alternate route to avoid the traffic jam.',
      exampleVi: 'Chúng tôi đã đi con đường thay thế để tránh tắc đường.',
    ),
    VocabModel(
      id: 'v04_31',
      wordEn: 'coupon',
      wordVi: 'phiếu giảm giá',
      pronunciation: "/ 'k u :p a :n /",
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'Use this coupon to get a discount on your next flight.',
      exampleVi: 'Sử dụng phiếu này để được giảm giá cho chuyến bay tới.',
    ),
    VocabModel(
      id: 'v04_32',
      wordEn: 'coach',
      wordVi: 'xe khách / hạng phổ thông',
      pronunciation: '/koʊtʃ/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'Traveling by coach is often cheaper than by train.',
      exampleVi: 'Đi bằng xe khách thường rẻ hơn đi bằng tàu hỏa.',
    ),
    VocabModel(
      id: 'v04_33',
      wordEn: 'cruise',
      wordVi: 'chuyến du ngoạn trên biển',
      pronunciation: '/kruːz/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'They went on a luxury cruise around the Mediterranean.',
      exampleVi: 'Họ đã đi một chuyến du ngoạn xa hoa quanh Địa Trung Hải.',
    ),
    VocabModel(
      id: 'v04_34',
      wordEn: 'aisle seat',
      wordVi: 'chỗ ngồi cạnh lối đi',
      pronunciation: '/aɪl siːt/',
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'I prefer an aisle seat for long-haul flights.',
      exampleVi: 'Tôi thích một chỗ ngồi cạnh lối đi cho các chuyến bay dài.',
    ),
    VocabModel(
      id: 'v04_35',
      wordEn: 'window seat',
      wordVi: 'chỗ ngồi cạnh cửa sổ',
      pronunciation: '/ˈwɪndoʊ siːt/',
      partOfSpeech: 'np',
      themeId: 'theme_04_travel',
      exampleEn: 'The children always fight over the window seat.',
      exampleVi: 'Lũ trẻ luôn tranh giành chỗ ngồi cạnh cửa sổ.',
    ),
    VocabModel(
      id: 'v04_36',
      wordEn: 'ferry',
      wordVi: 'phà',
      pronunciation: '/ˈferi/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'The ferry leaves for the island every hour.',
      exampleVi: 'Cứ mỗi tiếng lại có một chuyến phà ra đảo.',
    ),
    VocabModel(
      id: 'v04_37',
      wordEn: 'limousine',
      wordVi: 'xe li-mô, xe sang trọng',
      pronunciation: '/ˌlɪməˈziːn/',
      partOfSpeech: 'n',
      themeId: 'theme_04_travel',
      exampleEn: 'A limousine was sent to pick up the VIP guest.',
      exampleVi: 'Một chiếc xe li-mô đã được cử đến để đón khách VIP.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB DATA
  // ═══════════════════════════════════════════════════════════════

  // ── FAB cho bài đọc Day 1 ──
  static List<FabVocabItem> get readingVocab => [
    const FabVocabItem(
      wordEn: 'schedule',
      wordVi: 'lịch trình',
      pronunciation: "/'s k e d 3^1/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'reservation',
      wordVi: 'việc đặt (chỗ) trước',
      pronunciation: "/ re z a r 'v e i Jc?n/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'cancellation',
      wordVi: 'sự huỷ bỏ',
      pronunciation: "/ k a e n s s 'le ip n /",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'delay',
      wordVi: 'sự trì hoãn',
      pronunciation: "/c ỉi'le i/",
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'fare',
      wordVi: 'giá vé',
      pronunciation: '/fer/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'departure',
      wordVi: 'khu khởi hành',
      pronunciation: '/dɪˈpɑːrtʃər/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'arrival',
      wordVi: 'khu đến',
      pronunciation: '/əˈraɪvəl/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'passport',
      wordVi: 'hộ chiếu',
      pronunciation: '/ˈpæspɔːrt/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'customs',
      wordVi: 'hải quan',
      pronunciation: '/ˈkʌstəmz/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'immigration',
      wordVi: 'sự nhập cảnh',
      pronunciation: '/ˌɪmɪˈɡreɪʃən/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'stop-over',
      wordVi: 'sự quá cảnh',
      pronunciation: '/ˈstɑːpˌoʊvər/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'cabin crew',
      wordVi: 'phi hành đoàn',
      pronunciation: '/ˈkæbɪn kruː/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'flight attendant',
      wordVi: 'tiếp viên hàng không',
      pronunciation: '/flaɪt əˈtendənt/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'seatbelt',
      wordVi: 'dây an toàn',
      pronunciation: '/ˈsiːtbelt/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'terminal',
      wordVi: 'nhà ga hàng không',
      pronunciation: '/ˈtɜːrmɪnəl/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'disembark',
      wordVi: 'xuống máy bay',
      pronunciation: '/ˌdɪsɪmˈbɑːrk/',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'hand luggage',
      wordVi: 'hành lý xách tay',
      pronunciation: '/hænd ˈlʌɡɪdʒ/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 're-schedule',
      wordVi: 'sắp xếp lại, lên lịch trình lại',
      pronunciation: "/ ri's k e d 3^1/",
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'shuttle bus',
      wordVi: 'xe buýt con thoi',
      pronunciation: "/’Ðštl bšs/",
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'voucher',
      wordVi: 'phiếu mua hàng',
      pronunciation: '/ˈvaʊtʃər/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'travel agent',
      wordVi: 'nhân viên đại lý du lịch',
      pronunciation: "/'trasvp l 'e id 3^ nt/",
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'express train',
      wordVi: 'tàu tốc hành',
      pronunciation: '/ɪkˈspres treɪn/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'platform',
      wordVi: 'sân ga, ke tàu',
      pronunciation: '/ˈplætfɔːrm/',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'excursion rates',
      wordVi: 'bảng giá lữ hành đặc biệt',
      pronunciation: '/ɪkˈskɜːrʒən reɪts/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'engine problem',
      wordVi: 'vấn đề về động cơ',
      pronunciation: '/ˈendʒɪn ˈprɑːbləm/',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'transportation',
      pronunciation: '/ˌtrænspərˈteɪʃən/',
      wordVi: 'Giao thông vận tải',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'hospitality industry',
      pronunciation: "/ỗo h a isp a 'ta e la ti 'in c h s tri/",
      wordVi: 'Ngành kinh doanh nhà hàng-khách sạn',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'travel agency',
      pronunciation: "/'tracvp l 'e icl3«?nsi/",
      wordVi: 'Hãng du lịch',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'booking',
      pronunciation: "/'b u k iij/",
      wordVi: 'Việc đặt mua vé trước',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'alternate',
      pronunciation: "/ a ilt orn á t /",
      wordVi: 'Thay thế, dự phòng',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'coupon',
      pronunciation: "/ 'k u :p a :n /",
      wordVi: 'Phiếu giảm giá',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'coach',
      pronunciation: '/koʊtʃ/',
      wordVi: 'Xe khách / Hạng phổ thông',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'cruise',
      pronunciation: '/kruːz/',
      wordVi: 'Chuyến du ngoạn trên biển',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'aisle seat',
      pronunciation: '/aɪl siːt/',
      wordVi: 'Chỗ ngồi cạnh lối đi',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'window seat',
      pronunciation: '/ˈwɪndoʊ siːt/',
      wordVi: 'Chỗ ngồi cạnh cửa sổ',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'ferry',
      pronunciation: '/ˈferi/',
      wordVi: 'Phà',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'limousine',
      pronunciation: '/ˌlɪməˈziːn/',
      wordVi: 'Xe li-mô',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    const FabPhraseItem(
      phrase: 'Make an arrangement',
      meaning: 'Bố trí, sắp xếp',
    ),
    const FabPhraseItem(phrase: 'Be about sth', meaning: 'Nói về cái gì'),
    const FabPhraseItem(phrase: 'Pick sb up', meaning: 'Đón ai đó'),
    const FabPhraseItem(
      phrase: 'Deliver sb to somewhere',
      meaning: 'Đưa ai tới đâu',
    ),
    const FabPhraseItem(
      phrase: 'Be (often) associated with',
      meaning: '(Thường) gắn liền với / có liên quan tới',
    ),
    const FabPhraseItem(phrase: 'At the last minute', meaning: 'Vào phút chót'),
  ];

  // ── FAB cho Conversation (Practice 1) ──
  static List<FabVocabItem> get conversationVocab => [
    const FabVocabItem(
      wordEn: 'conference',
      pronunciation: '/ˈkɑːnfərəns/',
      wordVi: 'Hội nghị',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'convention center',
      pronunciation: '/kənˈvenʃən ˈsentər/',
      wordVi: 'Trung tâm hội nghị',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'express train',
      pronunciation: '/ɪkˈspres treɪn/',
      wordVi: 'Tàu tốc hành',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'recommendation',
      pronunciation: '/ˌrekəmenˈdeɪʃən/',
      wordVi: 'Lời khuyên, sự giới thiệu',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'credit card',
      pronunciation: '/ˈkredɪt kɑːrd/',
      wordVi: 'Thẻ tín dụng',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'platform',
      pronunciation: '/ˈplætfɔːrm/',
      wordVi: 'Sân ga, ke tàu',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'prior to',
      pronunciation: '/ˈpraɪər tuː/',
      wordVi: 'Trước (thời gian)',
      partOfSpeech: 'prep.p',
    ),
  ];

  static List<FabPhraseItem> get conversationPhrases => [
    const FabPhraseItem(
      phrase: 'Attend a conference',
      meaning: 'Tham dự một hội nghị',
    ),
    const FabPhraseItem(
      phrase: 'Have any recommendations',
      meaning: 'Có lời khuyên nào không',
    ),
    const FabPhraseItem(
      phrase: 'Take credit cards',
      meaning: 'Chấp nhận thẻ tín dụng',
    ),
    const FabPhraseItem(
      phrase: 'Prior to + NP',
      meaning: 'Trước (thời điểm/sự kiện gì)',
    ),
    const FabPhraseItem(
      phrase: 'Be at the platform',
      meaning: 'Có mặt ở sân ga',
    ),
  ];

  static List<FabAnswerItem> get conversationAnswers => const [
    FabAnswerItem(vi: 'Hai vé tàu', en: 'Two train tickets'),
    FabAnswerItem(
      vi: 'cần tham dự một hội nghị',
      en: 'need to attend a conference',
    ),
    FabAnswerItem(vi: 'trước buổi trưa', en: 'by noon'),
    FabAnswerItem(
      vi: 'chuyến đi sẽ mất bao lâu',
      en: 'how long the ride will take',
    ),
    FabAnswerItem(vi: 'đi chuyến tàu nào', en: 'which train to take'),
    FabAnswerItem(
      vi: 'Cô có lời khuyên nào không',
      en: 'Do you have any recommendations',
    ),
    FabAnswerItem(
      vi: 'đón chuyến tàu tốc hành lúc 9 giờ sáng',
      en: 'take the 9 a.m. express train',
    ),
    FabAnswerItem(vi: 'sẽ tới', en: 'will arrive'),
    FabAnswerItem(
      vi: 'đi chuyến tàu tốc hành đó',
      en: 'take the express train',
    ),
    FabAnswerItem(
      vi: 'Tôi có thể thanh toán tiền vé của tôi như thế nào',
      en: 'How do I pay for my tickets',
    ),
    FabAnswerItem(vi: 'chấp nhận thẻ tín dụng', en: 'take credit cards'),
    FabAnswerItem(vi: 'Chắc chắn rồi', en: 'Absolutely'),
    FabAnswerItem(
      vi: 'hai tấm vé tàu tốc hành',
      en: 'two express train tickets',
    ),
    FabAnswerItem(vi: 'có mặt ở sân ga', en: 'be at the platform'),
    FabAnswerItem(
      vi: 'trước giờ khởi hành của quý khách',
      en: 'prior to your departure time',
    ),
  ];

  // ── FAB cho Short Talk 1 (Travel Agency Hotline) ──
  static List<FabVocabItem> get shortTalk1Vocab => [
    const FabVocabItem(
      wordEn: 'destination',
      pronunciation: '/ˌdestɪˈneɪʃən/',
      wordVi: 'Điểm đến, đích đến',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'travel arrangements',
      pronunciation: '/ˈtrævəl əˈreɪndʒmənts/',
      wordVi: 'Sự sắp xếp tour du lịch',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'excursion rates',
      pronunciation: '/ɪkˈskɜːrʒən reɪts/',
      wordVi: 'Bảng giá lữ hành đặc biệt',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'available',
      pronunciation: '/əˈveɪləbəl/',
      wordVi: 'Có sẵn',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'computer system',
      pronunciation: '/kəmˈpjuːtər ˈsɪstəm/',
      wordVi: 'Hệ thống máy tính',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'situation',
      pronunciation: '/ˌsɪtʃuˈeɪʃən/',
      wordVi: 'Tình huống, tình hình',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
    const FabPhraseItem(
      phrase: 'Make hotel reservations',
      meaning: 'Đặt phòng khách sạn',
    ),
    const FabPhraseItem(
      phrase: 'Other than (+ NP/Gerund)',
      meaning: 'Ngoài, trừ',
    ),
    const FabPhraseItem(
      phrase: 'Due to sth',
      meaning: 'Do, tại (việc gì / điều gì)',
    ),
    const FabPhraseItem(phrase: 'Call back later', meaning: 'Gọi lại sau'),
    const FabPhraseItem(
      phrase: 'Find out',
      meaning: 'Tìm ra, tìm hiểu để biết',
    ),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => const [
    FabAnswerItem(vi: 'Công ty Lữ hành Hà Nội', en: 'Hanoi Travel Agency'),
    FabAnswerItem(vi: 'vé máy bay', en: 'airline tickets'),
    FabAnswerItem(
      vi: 'du lịch trong nội địa Việt Nam',
      en: 'travel within Vietnam',
    ),
    FabAnswerItem(vi: 'điểm đến của bạn', en: 'your destination'),
    FabAnswerItem(vi: 'ở một đất nước khác', en: 'in another country'),
    FabAnswerItem(vi: 'đặt phòng khách sạn', en: 'make hotel reservations'),
    FabAnswerItem(vi: 'mua vé máy bay', en: 'purchasing airline tickets'),
    FabAnswerItem(vi: 'thông báo', en: 'announce'),
    FabAnswerItem(
      vi: 'bảng giá lữ hành đặc biệt',
      en: 'special excursion rates',
    ),
    FabAnswerItem(vi: 'do một vài sự cố', en: 'due to some problems'),
    FabAnswerItem(
      vi: 'hệ thống máy tính của chúng tôi',
      en: 'our computer system',
    ),
    FabAnswerItem(vi: 'Xin vui lòng gọi lại sau', en: 'Please call back later'),
    FabAnswerItem(vi: 'đã thay đổi', en: 'has changed'),
  ];

  // ── FAB cho Short Talk 2 (Flight Announcement) ──
  static List<FabVocabItem> get shortTalk2Vocab => [
    const FabVocabItem(
      wordEn: 'shortly',
      pronunciation: '/ˈʃɔːrtli/',
      wordVi: 'Nhanh chóng, sắp sửa',
      partOfSpeech: 'adv',
    ),
    const FabVocabItem(
      wordEn: 'immediately',
      pronunciation: '/ɪˈmiːdiətli/',
      wordVi: 'Ngay lập tức',
      partOfSpeech: 'adv',
    ),
    const FabVocabItem(
      wordEn: 'be securely fastened',
      pronunciation: '/biː sɪˈkjʊərli ˈfæsənd/',
      wordVi: 'Được thắt một cách an toàn',
      partOfSpeech: 'vp',
    ),
    const FabVocabItem(
      wordEn: 'distribute',
      pronunciation: '/dɪˈstrɪbjuːt/',
      wordVi: 'Phân phát',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'duty free items',
      pronunciation: '/ˈduːti friː ˈaɪtəmz/',
      wordVi: 'Mặt hàng miễn thuế',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'overhead bins',
      pronunciation: '/ˌoʊvərˈhed bɪnz/',
      wordVi: 'Khoang chứa đồ trên đầu',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'local time',
      pronunciation: '/ˈloʊkəl taɪm/',
      wordVi: 'Giờ địa phương',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'engine problem',
      pronunciation: '/ˈendʒɪn ˈprɑːbləm/',
      wordVi: 'Vấn đề về động cơ',
      partOfSpeech: 'np',
    ),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
    const FabPhraseItem(
      phrase: 'Apologize for doing sth',
      meaning: 'Xin lỗi vì đã làm gì',
    ),
    const FabPhraseItem(
      phrase: '15 minutes behind schedule',
      meaning: 'Muộn 15 phút so với lịch trình',
    ),
    const FabPhraseItem(
      phrase: 'Take this opportunity',
      meaning: 'Nhân cơ hội này',
    ),
    const FabPhraseItem(
      phrase: 'Look forward to (doing sth)',
      meaning: 'Mong đợi làm gì',
    ),
    const FabPhraseItem(
      phrase: 'In the near future',
      meaning: 'Trong tương lai gần',
    ),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => [
    const FabAnswerItem(vi: 'sắp tới', en: 'shortly be arriving'),
    const FabAnswerItem(
      vi: 'quay trở lại chỗ ngồi của quý vị',
      en: 'return to your seats',
    ),
    const FabAnswerItem(vi: 'ngay lập tức', en: 'immediately'),
    const FabAnswerItem(
      vi: 'được thắt một cách an toàn',
      en: 'is securely fastened',
    ),
    const FabAnswerItem(
      vi: 'di chuyển dọc theo máy bay',
      en: 'moving through the aircraft',
    ),
    const FabAnswerItem(vi: 'kiểm tra dây an toàn', en: 'check your seatbelts'),
    const FabAnswerItem(
      vi: 'các mặt hàng miễn thuế còn lại',
      en: 'any remaining duty free items',
    ),
    const FabAnswerItem(vi: 'hành lý xách tay', en: 'hand luggage'),
    const FabAnswerItem(
      vi: 'dưới chỗ ngồi phía trước',
      en: 'under the seat in front of you',
    ),
    const FabAnswerItem(
      vi: 'trong các khoang chứa đồ trên đầu',
      en: 'in the overhead bins',
    ),
    const FabAnswerItem(vi: 'giờ địa phương', en: 'local time'),
    const FabAnswerItem(vi: 'xuống máy bay', en: 'disembarking'),
    const FabAnswerItem(
      vi: 'xin lỗi vì đến chậm',
      en: 'apologize for arriving',
    ),
    const FabAnswerItem(
      vi: 'muộn 15 phút so với lịch trình',
      en: '15 minutes behind schedule',
    ),
    const FabAnswerItem(
      vi: 'do một vấn đề về động cơ',
      en: 'due to an engine problem',
    ),
    const FabAnswerItem(vi: 'nhân cơ hội này', en: 'take this opportunity'),
    const FabAnswerItem(
      vi: 'bay cùng hãng hàng không Air India',
      en: 'flying with Air India',
    ),
    const FabAnswerItem(
      vi: 'mong sẽ lại được phục vụ',
      en: 'look forward to serving you again',
    ),
  ];
  static List<FabAnswerItem> get readingAnswers => const [
    FabAnswerItem(
      vi: 'tất cả các loại hình giao thông vận tải',
      en: 'all kinds of transportation',
    ),
    FabAnswerItem(vi: 'việc mua vé', en: 'ticket purchasing'),
    FabAnswerItem(vi: 'liên quan tới', en: 'related to'),
    FabAnswerItem(vi: 'các nhân viên đại lý du lịch', en: 'travel agents'),
    FabAnswerItem(vi: 'khách sạn', en: 'hotels'),
    FabAnswerItem(vi: 'việc đặt chỗ trước', en: 'reservations'),
    FabAnswerItem(vi: 'sự trì hoãn', en: 'delays'),
    FabAnswerItem(vi: 'trong lịch trình', en: 'in schedules'),
    FabAnswerItem(vi: 'sắp xếp lại một chuyến đi', en: 'reschedule a trip'),
    FabAnswerItem(
      vi: 'đưa ra những phương án thay thế',
      en: 'making alternate arrangements',
    ),
    FabAnswerItem(
      vi: 'đón người từ sân bay',
      en: 'picking people up from the airport',
    ),
    FabAnswerItem(vi: 'giá vé', en: 'fare'),
    FabAnswerItem(vi: 'ga (điểm) đến', en: 'arrivals'),
    FabAnswerItem(vi: 'xe khách', en: 'coach'),
    FabAnswerItem(vi: 'hộ chiếu', en: 'passport'),
    FabAnswerItem(vi: 'hải quan', en: 'customs'),
    FabAnswerItem(vi: 'quá cảnh', en: 'stop-over'),
    FabAnswerItem(vi: 'tiếp viên hàng không', en: 'flight attendant'),
    FabAnswerItem(vi: 'chỗ ngồi cạnh cửa sổ', en: 'window seat'),
    FabAnswerItem(vi: 'một chiều', en: 'one-way'),
    FabAnswerItem(vi: 'khứ hồi', en: 'return'),
    FabAnswerItem(vi: 'một loại xe buýt', en: 'a type of bus'),
    FabAnswerItem(vi: 'hạng phổ thông', en: 'economy class'),
    FabAnswerItem(vi: 'tàu hoả', en: 'train'),
    FabAnswerItem(vi: 'phà', en: 'ferry'),
    FabAnswerItem(vi: 'xe buýt con thoi', en: 'shuttle bus'),
    FabAnswerItem(vi: 'thường gắn liền với', en: 'is often associated with'),
  ];
  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme04_day1',
    dayNumber: 1,
    themeId: 'theme_04_travel',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      // ── PHASE 1: READ & LISTEN ──
      LessonPhase(
        id: 'theme04_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_15',
        contentEn:
            'Travel includes all kinds of transportation, schedules, ticket purchasing, station and airport announcements, and many items related to the hospitality industry such as travel agents, travel agency, hotels, restaurants, reservations, bookings, delays, cancellations.\n\n'
            'Many listening and reading items are about delays and changes in schedules, trying to re-schedule a trip at the last minute, making alternate arrangements for travel, delivering people to and picking people up from the airport.\n\n'
            'Common vocabulary: fare, coupon, arrivals, departures, cab, coach, security, passport, immigration, customs, vouchers, stop-over, cabin crew, pilot, flight attendant, first/business/economy class, aisle or window seat, cruise. Terms such as one-way or return trip are heard often and there are times when a word has more than one meaning such as \'coach\' which is both a type of bus as well as a description that means the same as "economy class".\n\n'
            'Common transport: taxi, car, bus, train, airplane, ferry, ship, limousine, shuttle bus. The travel theme is often associated with the Dining Out and Entertainment themes.',
        contentVi:
            'Chuyên đề "Đi lại và công tác" bao gồm tất cả các loại hình giao thông vận tải, các lịch trình đi lại, việc mua vé, các thông báo ở nhà ga và sân bay, và rất nhiều nội dung liên quan tới ngành kinh doanh nhà hàng-khách sạn chẳng hạn như nhân viên đại lý du lịch, hãng du lịch, khách sạn, nhà hàng, việc đặt chỗ trước, việc đặt mua vé, việc hoãn, và huỷ chuyến.\n\n'
            'Rất nhiều bài đọc và bài nghe có nội dung về sự trì hoãn và thay đổi trong lịch trình, việc cố gắng để sắp xếp lại lịch trình một chuyến đi vào phút chót, đưa ra các phương án thay thế cho việc đi lại, đưa ai đó tới sân bay và đón họ từ sân bay về.\n\n'
            'Từ vựng thường gặp: giá vé, phiếu giảm giá, ga (điểm) đến, ga (điểm) khởi hành, tắc-xi, xe khách, an ninh, hộ chiếu, việc nhập cảnh, hải quan, phiếu mua hàng giảm giá, quá cảnh, phi hành đoàn, phi công, tiếp viên hàng không, khoang hạng nhất/hạng thương gia/hạng thường, chỗ ngồi cạnh lối đi hay cạnh cửa sổ, chuyến du ngoạn trên biển. Các từ ngữ như chuyến đi một chiều hay khứ hồi thường được nghe thấy và có khi một từ có thể có nhiều hơn một nghĩa, chẳng hạn như từ "coach" vừa là một loại xe buýt, vừa là một từ chỉ hạng ghế bình dân giống như từ "economy class".\n\n'
            'Các phương tiện giao thông phổ biến: tắc-xi, ô-tô, xe buýt, tàu hoả, máy bay, phà, tàu biển, xe li-mô, xe buýt con thoi. Chuyên đề "Đi lại và công tác" thường gắn liền với hai chuyên đề "Đi ăn nhà hàng" và chuyên đề "Giải trí và chiêu đãi khách".',
        fabVocab: Theme4Content.readingVocab,
        fabPhrases: Theme4Content.readingPhrases,
      ),

      // ── PHASE 2: TRANSLATE ──
      LessonPhase(
        id: 'theme04_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_15',
        contentEn:
            'Travel includes all kinds of transportation, schedules, ticket purchasing, station and airport announcements, and many items related to the hospitality industry such as travel agents, travel agency, hotels, restaurants, reservations, bookings, delays, cancellations.\n\n'
            'Many listening and reading items are about delays and changes in schedules, trying to re-schedule a trip at the last minute, making alternate arrangements for travel, delivering people to and picking people up from the airport.\n\n'
            'Common vocabulary: fare, coupon, arrivals, departures, cab, coach, security, passport, immigration, customs, vouchers, stop-over, cabin crew, pilot, flight attendant, first/business/economy class, aisle or window seat, cruise. Terms such as one-way or return trip are heard often and there are times when a word has more than one meaning such as \'coach\' which is both a type of bus as well as a description that means the same as "economy class".\n\n'
            'Common transport: taxi, car, bus, train, airplane, ferry, ship, limousine, shuttle bus. The travel theme is often associated with the Dining Out and Entertainment themes.',
        contentVi:
            'Chuyên đề "Đi lại và công tác" bao gồm tất cả các loại hình giao thông vận tải, các lịch trình đi lại, việc mua vé, các thông báo ở nhà ga và sân bay, và rất nhiều nội dung liên quan tới ngành kinh doanh nhà hàng-khách sạn chẳng hạn như nhân viên đại lý du lịch, hãng du lịch, khách sạn, nhà hàng, việc đặt chỗ trước, việc đặt mua vé, việc hoãn, và huỷ chuyến.\n\n'
            'Rất nhiều bài đọc và bài nghe có nội dung về sự trì hoãn và thay đổi trong lịch trình, việc cố gắng để sắp xếp lại lịch trình một chuyến đi vào phút chót, đưa ra các phương án thay thế cho việc đi lại, đưa ai đó tới sân bay và đón họ từ sân bay về.\n\n'
            'Từ vựng thường gặp: giá vé, phiếu giảm giá, ga (điểm) đến, ga (điểm) khởi hành, tắc-xi, xe khách, an ninh, hộ chiếu, việc nhập cảnh, hải quan, phiếu mua hàng giảm giá, quá cảnh, phi hành đoàn, phi công, tiếp viên hàng không, khoang hạng nhất/hạng thương gia/hạng thường, chỗ ngồi cạnh lối đi hay cạnh cửa sổ, chuyến du ngoạn trên biển.\n\n'
            'Các phương tiện giao thông phổ biến: tắc-xi, ô-tô, xe buýt, tàu hoả, máy bay, phà, tàu biển, xe li-mô, xe buýt con thoi. Chuyên đề "Đi lại và công tác" thường gắn liền với hai chuyên đề "Đi ăn nhà hàng" và chuyên đề "Giải trí và chiêu đãi khách".',
      ),

      // ── PHASE 3: MIND GAME ──
      LessonPhase(
        id: 'theme04_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme4Content.readingAnswers,
      ),

      // ── PHASE 4: VOCABULARY ──
      LessonPhase(
        id: 'theme04_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('Travel includes '),
    const MixedSegment.vietnamese(
      'tất cả các loại hình giao thông vận tải',
      'all kinds of transportation',
    ),
    const MixedSegment.english(', schedules, '),
    const MixedSegment.vietnamese('việc mua vé', 'ticket purchasing'),
    const MixedSegment.english(
      ', station and airport announcements, and many items ',
    ),
    const MixedSegment.vietnamese('liên quan tới', 'related to'),
    const MixedSegment.english(' the hospitality industry such as '),
    const MixedSegment.vietnamese(
      'các nhân viên đại lý du lịch',
      'travel agents',
    ),
    const MixedSegment.english(', travel agency, '),
    const MixedSegment.vietnamese('khách sạn', 'hotels'),
    const MixedSegment.english(', restaurants, '),
    const MixedSegment.vietnamese('việc đặt chỗ trước', 'reservations'),
    const MixedSegment.english(', bookings, '),
    const MixedSegment.vietnamese('sự trì hoãn', 'delays'),
    const MixedSegment.english(
      ', cancellations.\n\nMany listening and reading items are about delays and changes ',
    ),
    const MixedSegment.vietnamese('trong lịch trình', 'in schedules'),
    const MixedSegment.english(', trying to '),
    const MixedSegment.vietnamese(
      'sắp xếp lại một chuyến đi',
      'reschedule a trip',
    ),
    const MixedSegment.english(' at the last minute, '),
    const MixedSegment.vietnamese(
      'đưa ra những phương án thay thế',
      'making alternate arrangements',
    ),
    const MixedSegment.english(' for travel, delivering people to and '),
    const MixedSegment.vietnamese(
      'đón người từ sân bay',
      'picking people up from the airport',
    ),
    const MixedSegment.english('.\n\nCommon vocabulary: '),
    const MixedSegment.vietnamese('giá vé', 'fare'),
    const MixedSegment.english(', coupon, '),
    const MixedSegment.vietnamese('ga (điểm) đến', 'arrivals'),
    const MixedSegment.english(', departures, cab, '),
    const MixedSegment.vietnamese('xe khách', 'coach'),
    const MixedSegment.english(', security, '),
    const MixedSegment.vietnamese('hộ chiếu', 'passport'),
    const MixedSegment.english(', immigration, '),
    const MixedSegment.vietnamese('hải quan', 'customs'),
    const MixedSegment.english(', vouchers, '),
    const MixedSegment.vietnamese('quá cảnh', 'stop-over'),
    const MixedSegment.english(', cabin crew, pilot, '),
    const MixedSegment.vietnamese('tiếp viên hàng không', 'flight attendant'),
    const MixedSegment.english(', first/business/economy class, aisle or '),
    const MixedSegment.vietnamese('chỗ ngồi cạnh cửa sổ', 'window seat'),
    const MixedSegment.english(', cruise. Terms such as '),
    const MixedSegment.vietnamese('một chiều', 'one-way'),
    const MixedSegment.english(' or '),
    const MixedSegment.vietnamese('khứ hồi', 'return'),
    const MixedSegment.english(
      ' trip are heard often and there are times when a word has more than one meaning such as \'coach\' which is both ',
    ),
    const MixedSegment.vietnamese('một loại xe buýt', 'a type of bus'),
    const MixedSegment.english(
      ' as well as a description that means the same as ',
    ),
    const MixedSegment.vietnamese('hạng phổ thông', 'economy class'),
    const MixedSegment.english('.\n\nCommon transport: taxi, car, bus, '),
    const MixedSegment.vietnamese('tàu hoả', 'train'),
    const MixedSegment.english(', airplane, '),
    const MixedSegment.vietnamese('phà', 'ferry'),
    const MixedSegment.english(', ship, limousine, '),
    const MixedSegment.vietnamese('xe buýt con thoi', 'shuttle bus'),
    const MixedSegment.english('. The travel theme '),
    const MixedSegment.vietnamese(
      'thường gắn liền với',
      'is often associated with',
    ),
    const MixedSegment.english(' the Dining Out and Entertainment themes.'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme04_day2',
    dayNumber: 2,
    themeId: 'theme_04_travel',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      // ── PHASE 1: LISTENING QUIZ - Practice 1 (Conversation) ──
      LessonPhase(
        id: 'theme04_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation',
        titleVi: 'Luyện tập 1: Hội thoại',
        audioTrackKey: 'track_16',
        questions: _practice1Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 1 (C): M nói "I need to attend a conference at Farhamton Convention Center" = Tham dự một sự kiện.',
            en: 'Q1 (C): M says "I need to attend a conference at Farhamton Convention Center" = To attend an event.',
          ),
          const FabAnswerItem(
            vi: 'Câu 2 (D): W nói tàu chạy từ "9 a.m." và đến lúc "12" = Chuyến đi mất 3 tiếng.',
            en: 'Q2 (D): W says the train leaves at "9 a.m." and arrives "by 12" = The ride takes three hours.',
          ),
          const FabAnswerItem(
            vi: 'Câu 3 (B): W yêu cầu "Please be at the platform at least half an hour prior" = Đến ga sớm.',
            en: 'Q3 (B): W asks "Please be at the platform at least half an hour prior" = Arrive early at the station.',
          ),
        ],
      ),

      // ── PHASE 2: LISTENING QUIZ - Practice 2 (Short Talk 1) ──
      LessonPhase(
        id: 'theme04_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Travel Agency Hotline',
        titleVi: 'Luyện tập 2: Bài ngắn - Đường dây hãng du lịch',
        audioTrackKey: 'track_17',
        questions: _practice2Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 4 (B): "If your destination is in another country, press two" = Ấn phím 2.',
            en: 'Q4 (B): "If your destination is in another country, press two" = Press 2.',
          ),
          const FabAnswerItem(
            vi: 'Câu 5 (A): "If you would like to make hotel reservations... press three" = Đặt phòng khách sạn.',
            en: 'Q5 (A): "If you would like to make hotel reservations... press three" = To make hotel reservations.',
          ),
          const FabAnswerItem(
            vi: 'Câu 6 (B): "due to some problems with our computer system" = Hệ thống máy tính gặp sự cố.',
            en: 'Q6 (B): "due to some problems with our computer system" = The computer system is not working properly.',
          ),
        ],
      ),

      // ── PHASE 3: LISTENING QUIZ - Practice 3 (Short Talk 2) ──
      LessonPhase(
        id: 'theme04_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Flight Announcement',
        titleVi: 'Luyện tập 3: Bài ngắn - Thông báo trên máy bay',
        audioTrackKey: 'track_18',
        questions: _practice3Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 7 (D): Yêu cầu "return to your seats" và "make sure your seatbelt is securely fastened" = Chuẩn bị hạ cánh.',
            en: 'Q7 (D): Passengers are asked to "return to your seats" and "make sure your seatbelt is securely fastened" = Get ready for landing.',
          ),
          const FabAnswerItem(
            vi: 'Câu 8 (D): "We should be disembarking... at about 4:00 p.m" = Xuống máy bay lúc 4 giờ.',
            en: 'Q8 (D): "We should be disembarking... at about 4:00 p.m" = 4:00 p.m.',
          ),
          const FabAnswerItem(
            vi: 'Câu 9 (C): "arriving 15 minutes behind schedule due to an engine problem" = Lỗi kỹ thuật động cơ.',
            en: 'Q9 (C): "arriving 15 minutes behind schedule due to an engine problem" = Mechanical problems.',
          ),
        ],
      ),

      // ── PHASE 4: TRANSLATE - Conversation ──
      LessonPhase(
        id: 'theme04_day2_translate1',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Conversation',
        titleVi: 'Nghe và Dịch: Hội thoại',
        audioTrackKey: 'track_16',
        contentEn:
            'M: Two train tickets to Farhamton, please. I need to attend a conference at Farhamton Convention Center at 1.30 pm so I have to be there by noon. I\'m not sure how long the ride will take or which train to take. Do you have any recommendations?\n\n'
            'W: I recommend you take the 9 a.m. express train, then you will arrive in Farhamton by 12.\n\n'
            'M: Great. I\'ll take the express train then. How do I pay for my tickets? Do you take credit cards?\n\n'
            'W: Absolutely. That will be \$100 for two express train tickets on the 9 a.m. train from Denver to Farhamton. Please be at the platform at least half an hour prior to your departure time.',
        contentVi:
            'M: Làm ơn cho hai vé tàu tới Farhamton. Tôi cần tham dự một hội nghị ở Trung tâm Hội nghị Farhamton lúc 1.30 chiều vì vậy tôi phải ở đó trước buổi trưa. Tôi không chắc chuyến đi sẽ mất bao lâu hay sẽ đi chuyến tàu nào. Cô có lời khuyên nào không?\n\n'
            'W: Tôi khuyên ông nên đi chuyến tàu tốc hành lúc 9 giờ sáng, như thế thì ông sẽ đến Farhamton trước 12 giờ.\n\n'
            'M: Tuyệt. Thế thì tôi sẽ đi tàu tốc hành vậy. Tôi có thể thanh toán tiền vé của tôi như thế nào? Cô có chấp nhận thẻ tín dụng không?\n\n'
            'W: Chắc chắn rồi. Sẽ là \$100 cho hai vé tàu tốc hành trên chuyến tàu lúc 9 giờ sáng từ Denver đến Farhamton. Ông vui lòng có mặt ở sân ga ít nhất nửa tiếng trước giờ khởi hành.',
      ),

      // ── PHASE 5: TRANSLATE - Short Talk 1 ──
      LessonPhase(
        id: 'theme04_day2_translate2',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Travel Agency Hotline',
        titleVi: 'Nghe và Dịch: Đường dây hãng du lịch',
        audioTrackKey: 'track_17',
        contentEn:
            'Thank you for calling Hanoi Travel Agency, the best place to buy airline tickets. If you wish to travel within Vietnam, press one. If your destination is in another country, press two. If you would like to make hotel reservations or travel arrangements other than purchasing airline tickets, press three. We\'re sorry to announce that information on special excursion rates is not available at the moment due to some problems with our computer system. Please call back later to find out if the situation has changed.',
        contentVi:
            'Cảm ơn bạn đã gọi tới Công ty Lữ hành Hà Nội, nơi tối ưu nhất để đặt vé máy bay. Nếu bạn muốn đi du lịch nội địa Việt Nam, ấn phím một. Nếu điểm đến của bạn ở một quốc gia khác, ấn phím hai. Nếu bạn muốn đặt phòng khách sạn hoặc sắp xếp cho chuyến đi của mình chứ không phải là mua vé máy bay, ấn phím ba. Chúng tôi xin lỗi phải thông báo thông tin về giá lữ hành đặc biệt hiện thời không có do sự cố với hệ thống máy tính. Xin vui lòng gọi lại sau để biết tình hình có gì thay đổi hay không.',
      ),

      // ── PHASE 6: TRANSLATE - Short Talk 2 ──
      LessonPhase(
        id: 'theme04_day2_translate3',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Flight Announcement',
        titleVi: 'Nghe và Dịch: Thông báo trên máy bay',
        audioTrackKey: 'track_18',
        contentEn:
            'Attention, ladies and gentlemen. We will shortly be arriving at Hong Kong International Airport. Please return to your seats immediately and make sure your seatbelt is securely fastened. In a few minutes, the cabin crew will be moving through the aircraft to check your seatbelts and to distribute any remaining duty free items. Please keep all hand luggage either under the seat in front of you or in the overhead bins. It is a hot and sunny afternoon in Hong Kong today and it is now 3:40 p.m. local time. We should be disembarking outside terminal 1 at about 4:00 p.m. We apologize for arriving 15 minutes behind schedule due to an engine problem. We would like to take this opportunity to thank you for flying with Air India and look forward to serving you again in the near future.',
        contentVi:
            'Xin quý vị hãy chú ý! Chúng ta sắp tới sân bay quốc tế Hồng Kông. Xin quay trở lại chỗ ngồi của quý vị ngay lập tức và chắc chắn là dây an toàn của quý vị được thắt một cách an toàn. Trong ít phút nữa, đội tiếp viên sẽ di chuyển dọc theo máy bay để kiểm tra dây an toàn của quý vị và phân phát các mặt hàng miễn thuế còn lại. Xin giữ tất cả hành lý xách tay dưới chỗ ngồi phía trước quý vị hoặc để trong các khoang chứa đồ ở trên đầu. Buổi chiều hôm nay ở Hồng Kông nắng và nóng và bây giờ là 3:40 phút theo giờ địa phương. Chúng ta sẽ xuống máy bay phía ngoài nhà đón khách số 1 vào khoảng 4 giờ chiều. Chúng tôi xin lỗi vì đến chậm 15 phút so với lịch trình do có một vấn đề về động cơ. Tôi muốn nhân cơ hội này cảm ơn quý khách đã bay cùng hãng hàng không Air India và rất mong sẽ lại được phục vụ quý khách trong thời gian tới.',
      ),

      // ── PHASE 7: MIND GAME - Conversation ──
      LessonPhase(
        id: 'theme04_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Conversation',
        titleVi: 'Huấn luyện Trí nhớ: Hội thoại',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme4Content.conversationVocab,
        fabPhrases: Theme4Content.conversationPhrases,
        fabAnswers: Theme4Content.conversationAnswers,
      ),
      LessonPhase(
        id: 'theme04_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Travel Agency Hotline',
        titleVi: 'Huấn luyện Trí nhớ: Đường dây hãng du lịch',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme4Content.shortTalk1Vocab,
        fabPhrases: Theme4Content.shortTalk1Phrases,
        fabAnswers: Theme4Content.shortTalk1Answers,
      ),
      LessonPhase(
        id: 'theme04_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Flight Announcement',
        titleVi: 'Huấn luyện Trí nhớ: Thông báo trên máy bay',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme4Content.shortTalk2Vocab,
        fabPhrases: Theme4Content.shortTalk2Phrases,
        fabAnswers: Theme4Content.shortTalk2Answers,
      ),
    ],
  );

  // ── Quiz Questions ──────────────────────────────────────────────

  static List<QuizQuestion> get _practice1Questions => [
    const QuizQuestion(
      id: 'theme04_q01',
      questionText: 'Why does the man need to go to Farhamton?',
      options: [
        '(A) He is going to visit a friend there.',
        '(B) His home is there.',
        '(C) He has to attend an event there.',
        '(D) He is going to spend his vacation there.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_16',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme04_q02',
      questionText:
          'According to the woman, how long does the express train ride take?',
      options: [
        '(A) One hour',
        '(B) One and a half hours',
        '(C) Two hours',
        '(D) Three hours',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_16',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme04_q03',
      questionText: 'What is the man asked to do?',
      options: [
        '(A) Pay in cash',
        '(B) Arrive early at the station',
        '(C) Stay at a convention hotel',
        '(D) Catch a bus to Denver',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_16',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    const QuizQuestion(
      id: 'theme04_q04',
      questionText:
          'What should a client do to find out about tickets to another country?',
      options: [
        '(A) Press 1',
        '(B) Press 2',
        '(C) Use the computer',
        '(D) Call back later',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_17',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme04_q05',
      questionText: 'Why would a client press three?',
      options: [
        '(A) To make hotel reservations',
        '(B) To purchase airline tickets',
        '(C) To find out about excursion rates',
        '(D) To connect with the agency\'s computer',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_17',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme04_q06',
      questionText: 'Why is there no information on special excursion rates?',
      options: [
        '(A) The excursion rates are no longer available.',
        '(B) The computer system is not working properly.',
        '(C) The situation has changed.',
        '(D) The excursions have all been reserved.',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_17',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
      id: 'theme04_q07',
      questionText: 'What are the airline passengers asked to do?',
      options: [
        '(A) Leave their seats',
        '(B) Check in their luggage',
        '(C) Get off the plane immediately',
        '(D) Get ready for landing',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_18',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme04_q08',
      questionText: 'What time will they arrive?',
      options: [
        '(A) 1:00 p.m.',
        '(B) 3:40 p.m.',
        '(C) 3:45 p.m.',
        '(D) 4:00 p.m.',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_18',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme04_q09',
      questionText: 'What is the reason for their delay?',
      options: [
        '(A) Bad weather',
        '(B) The pilot is late',
        '(C) Mechanical problems',
        '(D) An airline strike',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_18',
      practiceNumber: 'practice3',
    ),
  ];

  // ── Mind Game Segments Day 2 ────────────────────────────────────

  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('M: '),
    const MixedSegment.vietnamese('Hai vé tàu', 'Two train tickets'),
    const MixedSegment.english(' to Farhamton, please. I '),
    const MixedSegment.vietnamese(
      'cần tham dự một hội nghị',
      'need to attend a conference',
    ),
    const MixedSegment.english(
      ' at Farhamton Convention Center at 1.30 pm so I have to be there ',
    ),
    const MixedSegment.vietnamese('trước buổi trưa', 'by noon'),
    const MixedSegment.english('. I\'m not sure '),
    const MixedSegment.vietnamese(
      'chuyến đi sẽ mất bao lâu',
      'how long the ride will take',
    ),
    const MixedSegment.english(' or '),
    const MixedSegment.vietnamese('đi chuyến tàu nào', 'which train to take'),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese(
      'Cô có lời khuyên nào không',
      'Do you have any recommendations',
    ),
    const MixedSegment.english('?\n\nW: I recommend you '),
    const MixedSegment.vietnamese(
      'đón chuyến tàu tốc hành lúc 9 giờ sáng',
      'take the 9 a.m. express train',
    ),
    const MixedSegment.english(', then you '),
    const MixedSegment.vietnamese('sẽ tới', 'will arrive'),
    const MixedSegment.english(' in Farhamton by 12.\n\nM: Great. I\'ll '),
    const MixedSegment.vietnamese(
      'đi chuyến tàu tốc hành đó',
      'take the express train',
    ),
    const MixedSegment.english(' then. '),
    const MixedSegment.vietnamese(
      'Tôi có thể thanh toán tiền vé của tôi như thế nào',
      'How do I pay for my tickets',
    ),
    const MixedSegment.english('? Do you '),
    const MixedSegment.vietnamese(
      'chấp nhận thẻ tín dụng',
      'take credit cards',
    ),
    const MixedSegment.english('?\n\nW: '),
    const MixedSegment.vietnamese('Chắc chắn rồi', 'Absolutely'),
    const MixedSegment.english('. That will be \$100 for '),
    const MixedSegment.vietnamese(
      'hai tấm vé tàu tốc hành',
      'two express train tickets',
    ),
    const MixedSegment.english(
      ' on the 9 a.m. train from Denver to Farhamton. Please ',
    ),
    const MixedSegment.vietnamese('có mặt ở sân ga', 'be at the platform'),
    const MixedSegment.english(' at least half an hour '),
    const MixedSegment.vietnamese(
      'trước giờ khởi hành của quý khách',
      'prior to your departure time',
    ),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Thank you for calling '),
    const MixedSegment.vietnamese(
      'Công ty Lữ hành Hà Nội',
      'Hanoi Travel Agency',
    ),
    const MixedSegment.english(', the best place to buy '),
    const MixedSegment.vietnamese('vé máy bay', 'airline tickets'),
    const MixedSegment.english('. If you wish to '),
    const MixedSegment.vietnamese(
      'du lịch trong nội địa Việt Nam',
      'travel within Vietnam',
    ),
    const MixedSegment.english(', press one. If '),
    const MixedSegment.vietnamese('điểm đến của bạn', 'your destination'),
    const MixedSegment.english(' is '),
    const MixedSegment.vietnamese('ở một đất nước khác', 'in another country'),
    const MixedSegment.english(', press two. If you would like to '),
    const MixedSegment.vietnamese(
      'đặt phòng khách sạn',
      'make hotel reservations',
    ),
    const MixedSegment.english(' or travel arrangements other than '),
    const MixedSegment.vietnamese(
      'mua vé máy bay',
      'purchasing airline tickets',
    ),
    const MixedSegment.english(', press three. We\'re sorry to '),
    const MixedSegment.vietnamese('thông báo', 'announce'),
    const MixedSegment.english(' that information on '),
    const MixedSegment.vietnamese(
      'bảng giá lữ hành đặc biệt',
      'special excursion rates',
    ),
    const MixedSegment.english(' is not available at the moment '),
    const MixedSegment.vietnamese('do một vài sự cố', 'due to some problems'),
    const MixedSegment.english(' with '),
    const MixedSegment.vietnamese(
      'hệ thống máy tính của chúng tôi',
      'our computer system',
    ),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese(
      'Xin vui lòng gọi lại sau',
      'Please call back later',
    ),
    const MixedSegment.english(' to find out if the situation '),
    const MixedSegment.vietnamese('đã thay đổi', 'has changed'),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english('Attention, ladies and gentlemen. We will '),
    const MixedSegment.vietnamese('sắp tới', 'shortly be arriving'),
    const MixedSegment.english(' at Hong Kong International Airport. Please '),
    const MixedSegment.vietnamese(
      'quay trở lại chỗ ngồi của quý vị',
      'return to your seats',
    ),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('ngay lập tức', 'immediately'),
    const MixedSegment.english(' and make sure your seatbelt '),
    const MixedSegment.vietnamese(
      'được thắt một cách an toàn',
      'is securely fastened',
    ),
    const MixedSegment.english('. In a few minutes, the cabin crew will be '),
    const MixedSegment.vietnamese(
      'di chuyển dọc theo máy bay',
      'moving through the aircraft',
    ),
    const MixedSegment.english(' to '),
    const MixedSegment.vietnamese(
      'kiểm tra dây an toàn',
      'check your seatbelts',
    ),
    const MixedSegment.english(' and to distribute '),
    const MixedSegment.vietnamese(
      'các mặt hàng miễn thuế còn lại',
      'any remaining duty free items',
    ),
    const MixedSegment.english('. Please keep all '),
    const MixedSegment.vietnamese('hành lý xách tay', 'hand luggage'),
    const MixedSegment.english(' either '),
    const MixedSegment.vietnamese(
      'dưới chỗ ngồi phía trước',
      'under the seat in front of you',
    ),
    const MixedSegment.english(' or '),
    const MixedSegment.vietnamese(
      'trong các khoang chứa đồ trên đầu',
      'in the overhead bins',
    ),
    const MixedSegment.english(
      '. It is a hot and sunny afternoon in Hong Kong today and it is now 3:40 p.m. ',
    ),
    const MixedSegment.vietnamese('giờ địa phương', 'local time'),
    const MixedSegment.english('. We should be '),
    const MixedSegment.vietnamese('xuống máy bay', 'disembarking'),
    const MixedSegment.english(' outside terminal 1 at about 4:00 p.m. We '),
    const MixedSegment.vietnamese(
      'xin lỗi vì đến chậm',
      'apologize for arriving',
    ),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese(
      'muộn 15 phút so với lịch trình',
      '15 minutes behind schedule',
    ),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese(
      'do một vấn đề về động cơ',
      'due to an engine problem',
    ),
    const MixedSegment.english('. We would like to '),
    const MixedSegment.vietnamese('nhân cơ hội này', 'take this opportunity'),
    const MixedSegment.english(' to thank you for '),
    const MixedSegment.vietnamese(
      'bay cùng hãng hàng không Air India',
      'flying with Air India',
    ),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese(
      'mong sẽ lại được phục vụ',
      'look forward to serving you again',
    ),
    const MixedSegment.english(' in the near future.'),
  ];
}

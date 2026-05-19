import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme6Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_06_purchasing',
    themeNumber: 6,
    titleEn: 'Purchasing',
    titleVi: 'Mua Sắm Trong Doanh Nghiệp',
    description:
        'Đặt hàng & mua sắm văn phòng phẩm, vận chuyển, hoá đơn, điều khoản tín dụng, chiết khấu; mua sắm quy mô lớn liên quan logistics, vận đơn, xuất nhập khẩu.',
    iconEmoji: '🧾',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY LIST (bao phủ Day1 + Conversation + ShortTalk1 + ShortTalk2)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    // --- Day 1 vocabulary core ---
    VocabModel(
      id: 'v06_01',
      wordEn: 'deal with',
      wordVi: 'giải quyết, đề cập tới',
      pronunciation: '/diːl wɪð/',
      partOfSpeech: 'vp',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'This department deals with local ordering and purchasing of office supplies.',
      exampleVi:
          'Phòng ban này giải quyết việc đặt hàng và mua văn phòng phẩm nội địa.',
    ),
    VocabModel(
      id: 'v06_02',
      wordEn: 'local',
      wordVi: 'mang tính địa phương, nội địa',
      pronunciation: '/ˈloʊkəl/',
      partOfSpeech: 'adj',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Local suppliers can deliver faster than overseas vendors.',
      exampleVi:
          'Nhà cung cấp nội địa có thể giao hàng nhanh hơn nhà cung cấp nước ngoài.',
    ),
    VocabModel(
      id: 'v06_03',
      wordEn: 'ordering',
      wordVi: 'việc đặt hàng',
      pronunciation: '/ˈɔːrdərɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Ordering office supplies in bulk can reduce costs.',
      exampleVi: 'Đặt văn phòng phẩm số lượng lớn có thể giảm chi phí.',
    ),
    VocabModel(
      id: 'v06_04',
      wordEn: 'office supplies',
      wordVi: 'đồ dùng/thiết bị văn phòng',
      pronunciation: '/ˈɔːfɪs səˈplaɪz/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'We need to restock basic office supplies like paper and pens.',
      exampleVi:
          'Chúng ta cần bổ sung các đồ dùng văn phòng cơ bản như giấy và bút.',
    ),
    VocabModel(
      id: 'v06_05',
      wordEn: 'shipping',
      wordVi: 'việc vận chuyển hàng',
      pronunciation: '/ˈʃɪpɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Shipping costs may increase during peak seasons.',
      exampleVi: 'Chi phí vận chuyển có thể tăng vào mùa cao điểm.',
    ),
    VocabModel(
      id: 'v06_06',
      wordEn: 'transportation',
      wordVi: 'sự chuyên chở, vận tải',
      pronunciation: '/ˌtrænspərˈteɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Transportation delays can affect delivery schedules.',
      exampleVi: 'Trì hoãn vận tải có thể ảnh hưởng lịch giao hàng.',
    ),
    VocabModel(
      id: 'v06_07',
      wordEn: 'purchase',
      wordVi: 'hàng hoá đã mua; sự mua hàng',
      pronunciation: '/ˈpɜːrtʃəs/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Keep a record of each purchase for accounting purposes.',
      exampleVi: 'Hãy lưu hồ sơ của từng lần mua hàng để phục vụ kế toán.',
    ),
    VocabModel(
      id: 'v06_08',
      wordEn: 'invoice',
      wordVi: 'hoá đơn',
      pronunciation: '/ˈɪnvɔɪs/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'The invoice lists the quantity, unit price, and discount.',
      exampleVi: 'Hoá đơn liệt kê số lượng, đơn giá và chiết khấu.',
    ),
    VocabModel(
      id: 'v06_09',
      wordEn: 'billing',
      wordVi: 'việc lập hoá đơn',
      pronunciation: '/ˈbɪlɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'Billing is handled by the finance team at the end of each month.',
      exampleVi:
          'Việc lập hoá đơn do bộ phận tài chính xử lý vào cuối mỗi tháng.',
    ),
    VocabModel(
      id: 'v06_10',
      wordEn: 'credit terms',
      wordVi: 'điều khoản tín dụng',
      pronunciation: '/ˈkredɪt tɜːrmz/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn: 'We negotiated better credit terms to improve cash flow.',
      exampleVi:
          'Chúng tôi đàm phán điều khoản tín dụng tốt hơn để cải thiện dòng tiền.',
    ),
    VocabModel(
      id: 'v06_11',
      wordEn: 'discount',
      wordVi: 'chiết khấu, giảm giá',
      pronunciation: '/ˈdɪskaʊnt/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'The supplier offered a discount for large orders.',
      exampleVi: 'Nhà cung cấp đưa ra chiết khấu cho đơn hàng lớn.',
    ),
    VocabModel(
      id: 'v06_12',
      wordEn: 'photocopy paper',
      wordVi: 'giấy phô-tô',
      pronunciation: '/ˈfoʊtəˌkɑːpi ˈpeɪpər/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn: 'We ran out of photocopy paper before the board meeting.',
      exampleVi: 'Chúng tôi hết giấy phô-tô trước cuộc họp ban giám đốc.',
    ),
    VocabModel(
      id: 'v06_13',
      wordEn: 'photocopy toner',
      wordVi: 'hộp mực in laze (toner)',
      pronunciation: '/ˈfoʊtəˌkɑːpi ˈtoʊnər/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn: 'The company replaces photocopy toner every two months.',
      exampleVi: 'Công ty thay hộp mực in laze mỗi hai tháng.',
    ),
    VocabModel(
      id: 'v06_14',
      wordEn: 'photocopy cartridge',
      wordVi: 'hộp mực (cartridge) trong máy phô-tô',
      pronunciation: '/ˈfoʊtəˌkɑːpi ˈkɑːrtrɪdʒ/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'The new copier uses a different cartridge than the old model.',
      exampleVi: 'Máy phô-tô mới dùng hộp mực khác so với mẫu cũ.',
    ),
    VocabModel(
      id: 'v06_15',
      wordEn: 'staple',
      wordVi: 'cái ghim giấy',
      pronunciation: '/ˈsteɪpəl/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Please order staples and paper clips for the supply cabinet.',
      exampleVi: 'Vui lòng đặt ghim giấy và kẹp giấy cho tủ đồ dùng.',
    ),
    VocabModel(
      id: 'v06_16',
      wordEn: 'paper clip',
      wordVi: 'kẹp giấy',
      pronunciation: '/ˈpeɪpər klɪp/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'Use a paper clip to attach the invoice to the purchase order.',
      exampleVi: 'Dùng kẹp giấy để ghim hoá đơn vào đơn đặt hàng.',
    ),
    VocabModel(
      id: 'v06_17',
      wordEn: 'envelope',
      wordVi: 'phong bì',
      pronunciation: '/ˈenvəloʊp/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'We need envelopes for mailing out contracts.',
      exampleVi: 'Chúng ta cần phong bì để gửi hợp đồng.',
    ),
    VocabModel(
      id: 'v06_18',
      wordEn: 'printing matter',
      wordVi: 'đồ in ấn',
      pronunciation: '/ˈprɪntɪŋ ˈmætər/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'Printing matter like business cards and letterhead must be ordered in advance.',
      exampleVi: 'Đồ in ấn như danh thiếp và giấy tiêu đề phải đặt trước.',
    ),
    VocabModel(
      id: 'v06_19',
      wordEn: 'business card',
      wordVi: 'danh thiếp',
      pronunciation: '/ˈbɪznəs kɑːrd/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'She ordered new business cards with the updated phone number.',
      exampleVi: 'Cô ấy đặt danh thiếp mới với số điện thoại cập nhật.',
    ),
    VocabModel(
      id: 'v06_20',
      wordEn: 'letterhead',
      wordVi: 'giấy tiêu đề',
      pronunciation: '/ˈletərhed/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Please print the contract on company letterhead.',
      exampleVi: 'Vui lòng in hợp đồng trên giấy tiêu đề của công ty.',
    ),
    VocabModel(
      id: 'v06_21',
      wordEn: 'binder',
      wordVi: 'bìa tài liệu, hồ sơ',
      pronunciation: '/ˈbaɪndər/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'All documents should be stored in a binder by department.',
      exampleVi: 'Tất cả tài liệu nên được lưu trong bìa hồ sơ theo phòng ban.',
    ),
    VocabModel(
      id: 'v06_22',
      wordEn: 'file folder',
      wordVi: 'tập tài liệu',
      pronunciation: '/faɪl ˈfoʊldər/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Use a file folder to organize signed invoices.',
      exampleVi: 'Dùng tập tài liệu để sắp xếp các hoá đơn đã ký.',
    ),
    VocabModel(
      id: 'v06_23',
      wordEn: 'file box',
      wordVi: 'hộp đựng tài liệu',
      pronunciation: '/faɪl bɑːks/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn: 'We keep archived contracts in labeled file boxes.',
      exampleVi:
          'Chúng tôi lưu hợp đồng lưu trữ trong các hộp tài liệu có nhãn.',
    ),
    VocabModel(
      id: 'v06_24',
      wordEn: 'office canteen',
      wordVi: 'căng tin văn phòng',
      pronunciation: '/ˈɔːfɪs kænˈtiːn/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'Purchases are also made for the office canteen and washrooms.',
      exampleVi: 'Hàng hoá cũng được mua cho căng tin và nhà vệ sinh.',
    ),
    VocabModel(
      id: 'v06_25',
      wordEn: 'washroom',
      wordVi: 'nhà vệ sinh',
      pronunciation: '/ˈwɑːʃruːm/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'We need to order soap and paper towels for the washrooms.',
      exampleVi: 'Chúng ta cần đặt xà phòng và khăn giấy cho nhà vệ sinh.',
    ),
    VocabModel(
      id: 'v06_26',
      wordEn: 'board meeting',
      wordVi: 'cuộc họp ban giám đốc/hội đồng quản trị',
      pronunciation: '/bɔːrd ˈmiːtɪŋ/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn: 'They ordered flowers and gifts for the board meeting.',
      exampleVi: 'Họ đặt hoa và quà cho cuộc họp ban giám đốc.',
    ),
    VocabModel(
      id: 'v06_27',
      wordEn: 'raw materials',
      wordVi: 'nguyên liệu thô',
      pronunciation: '/rɔː məˈtɪriəlz/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Manufacturers purchase raw materials on a larger scale.',
      exampleVi: 'Các nhà sản xuất mua nguyên liệu thô ở quy mô lớn hơn.',
    ),
    VocabModel(
      id: 'v06_28',
      wordEn: 'waybill',
      wordVi: 'vận đơn',
      pronunciation: '/ˈweɪbɪl/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'The waybill contains the shipment details and destination.',
      exampleVi: 'Vận đơn chứa thông tin lô hàng và điểm đến.',
    ),
    VocabModel(
      id: 'v06_29',
      wordEn: 'bill of lading',
      wordVi: 'vận đơn đường biển',
      pronunciation: '/ˌbɪl əv ˈleɪdɪŋ/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'A bill of lading is required for international sea shipments.',
      exampleVi:
          'Vận đơn đường biển cần cho lô hàng vận chuyển quốc tế đường biển.',
    ),
    VocabModel(
      id: 'v06_30',
      wordEn: 'logistics',
      wordVi: 'hậu cần',
      pronunciation: '/ləˈdʒɪstɪks/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'The logistics team coordinated containers and customs documents.',
      exampleVi: 'Bộ phận hậu cần điều phối công-te-nơ và giấy tờ hải quan.',
    ),
    VocabModel(
      id: 'v06_31',
      wordEn: 'container',
      wordVi: 'công-te-nơ, thùng chứa',
      pronunciation: '/kənˈteɪnər/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'The goods were loaded into a container for export.',
      exampleVi: 'Hàng hoá được xếp vào công-te-nơ để xuất khẩu.',
    ),
    VocabModel(
      id: 'v06_32',
      wordEn: 'customs',
      wordVi: 'hải quan',
      pronunciation: '/ˈkʌstəmz/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'The shipment was held at customs for inspection.',
      exampleVi: 'Lô hàng bị giữ ở hải quan để kiểm tra.',
    ),
    VocabModel(
      id: 'v06_33',
      wordEn: 'excise tax',
      wordVi: 'thuế tiêu thụ đặc biệt',
      pronunciation: '/ˈeksaɪz tæks/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Some imported items are subject to excise tax.',
      exampleVi: 'Một số mặt hàng nhập khẩu phải chịu thuế tiêu thụ đặc biệt.',
    ),
    VocabModel(
      id: 'v06_34',
      wordEn: 'import',
      wordVi: 'nhập khẩu',
      pronunciation: '/ˈɪmpɔːrt/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'Import regulations may change depending on the product category.',
      exampleVi: 'Quy định nhập khẩu có thể thay đổi tuỳ theo loại sản phẩm.',
    ),
    VocabModel(
      id: 'v06_35',
      wordEn: 'export',
      wordVi: 'xuất khẩu',
      pronunciation: '/ˈekspɔːrt/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'The company handles both import and export of goods.',
      exampleVi: 'Công ty xử lý cả việc nhập khẩu và xuất khẩu hàng hoá.',
    ),

    // --- Day 2: Conversation (toner sales call) ---
    VocabModel(
      id: 'v06_36',
      wordEn: 'record',
      wordVi: 'hồ sơ, ghi chép',
      pronunciation: '/ˈrekərd/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'According to our record, your last order was three months ago.',
      exampleVi:
          'Theo ghi chép của chúng tôi, đơn hàng gần nhất của ông là ba tháng trước.',
    ),
    VocabModel(
      id: 'v06_37',
      wordEn: 'carry (a product)',
      wordVi: 'có bán/có cung cấp (sản phẩm)',
      pronunciation: '/ˈkæri/',
      partOfSpeech: 'v',
      themeId: 'theme_06_purchasing',
      exampleEn: 'I don’t believe you carry that cartridge model.',
      exampleVi: 'Tôi không nghĩ bên bạn có loại hộp mực đó.',
    ),
    VocabModel(
      id: 'v06_38',
      wordEn: 'supplier',
      wordVi: 'nhà cung cấp',
      pronunciation: '/səˈplaɪər/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'They chose another supplier after buying a new copy machine.',
      exampleVi: 'Họ chọn nhà cung cấp khác sau khi mua máy phô-tô mới.',
    ),
    VocabModel(
      id: 'v06_39',
      wordEn: 'brand',
      wordVi: 'thương hiệu',
      pronunciation: '/brænd/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn: 'Our store carries virtually all major brands.',
      exampleVi: 'Cửa hàng của chúng tôi có hầu hết các thương hiệu lớn.',
    ),
    VocabModel(
      id: 'v06_40',
      wordEn: 'model number',
      wordVi: 'mã số mẫu (mã hàng)',
      pronunciation: '/ˈmɑːdl ˈnʌmbər/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'Please e-mail the photocopier’s model number so we can check stock.',
      exampleVi:
          'Vui lòng email mã số mẫu máy phô-tô để chúng tôi kiểm tra hàng trong kho.',
    ),

    // --- Day 2: Short Talk 1 (supermarket promo) ---
    VocabModel(
      id: 'v06_41',
      wordEn: 'specials',
      wordVi: 'hàng giảm giá nhân dịp khuyến mại đặc biệt',
      pronunciation: '/ˈspeʃəlz/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'Take advantage of our birthday specials for the next 45 minutes.',
      exampleVi:
          'Hãy tận dụng hàng giảm giá nhân dịp sinh nhật trong 45 phút tới.',
    ),
    VocabModel(
      id: 'v06_42',
      wordEn: 'voucher',
      wordVi: 'phiếu mua hàng giảm giá',
      pronunciation: '/ˈvaʊtʃər/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'Customers who spend more than \$500 will receive a \$100 voucher.',
      exampleVi: 'Khách chi hơn \$500 sẽ nhận phiếu \$100.',
    ),
    VocabModel(
      id: 'v06_43',
      wordEn: 'checkout counter',
      wordVi: 'quầy thanh toán',
      pronunciation: '/ˈtʃekaʊt ˈkaʊntər/',
      partOfSpeech: 'np',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'There may be longer lines than usual at the checkout counter.',
      exampleVi: 'Có thể có hàng dài hơn thường lệ ở quầy thanh toán.',
    ),

    // --- Day 2: Short Talk 2 (OfficeMax voicemail) ---
    VocabModel(
      id: 'v06_44',
      wordEn: 'unavailable',
      wordVi: 'không có sẵn',
      pronunciation: '/ˌʌnəˈveɪləbəl/',
      partOfSpeech: 'adj',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'The photocopier model you requested is unavailable right now.',
      exampleVi: 'Mẫu máy phô-tô ông yêu cầu hiện không có sẵn.',
    ),
    VocabModel(
      id: 'v06_45',
      wordEn: 'in stock',
      wordVi: 'có trong kho',
      pronunciation: '/ɪn stɑːk/',
      partOfSpeech: 'prep.p',
      themeId: 'theme_06_purchasing',
      exampleEn: 'It won’t be in stock for another four weeks.',
      exampleVi: 'Phải bốn tuần nữa mới có hàng trong kho.',
    ),
    VocabModel(
      id: 'v06_46',
      wordEn: 'comparable (to)',
      wordVi: 'tương tự, tương đương (với)',
      pronunciation: '/ˈkɑːmpərəbl/',
      partOfSpeech: 'adj',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'We have another model comparable to the original one you requested.',
      exampleVi: 'Chúng tôi có mẫu khác tương tự mẫu ban đầu ông yêu cầu.',
    ),
    VocabModel(
      id: 'v06_47',
      wordEn: 'loan (v)',
      wordVi: 'cho mượn',
      pronunciation: '/loʊn/',
      partOfSpeech: 'v',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'We are willing to loan you this model while you wait for the shipment.',
      exampleVi:
          'Chúng tôi sẵn sàng cho ông mượn mẫu này trong khi chờ lô hàng.',
    ),
    VocabModel(
      id: 'v06_48',
      wordEn: 'shipment',
      wordVi: 'lô hàng; việc chuyển hàng',
      pronunciation: '/ˈʃɪpmənt/',
      partOfSpeech: 'n',
      themeId: 'theme_06_purchasing',
      exampleEn:
          'Please contact us to proceed with respect to the photocopier shipment.',
      exampleVi:
          'Vui lòng liên hệ để giải quyết vấn đề liên quan tới lô hàng máy phô-tô.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 1 Reading
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => [
    const FabVocabItem(
      wordEn: 'office supplies',
      pronunciation: '/ˈɔːfɪs səˈplaɪz/',
      wordVi: 'Đồ dùng/thiết bị văn phòng',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'invoice',
      pronunciation: '/ˈɪnvɔɪs/',
      wordVi: 'Hoá đơn',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'billing',
      pronunciation: '/ˈbɪlɪŋ/',
      wordVi: 'Việc lập hoá đơn',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'credit terms',
      pronunciation: '/ˈkredɪt tɜːrmz/',
      wordVi: 'Điều khoản tín dụng',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'photocopy toner',
      pronunciation: '/ˈfoʊtəˌkɑːpi ˈtoʊnər/',
      wordVi: 'Hộp mực in laze',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'binders',
      pronunciation: '/ˈbaɪndərz/',
      wordVi: 'Bìa tài liệu',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'file boxes',
      pronunciation: '/faɪl ˈbɑːksɪz/',
      wordVi: 'Hộp đựng tài liệu',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'raw materials',
      pronunciation: '/rɔː məˈtɪriəlz/',
      wordVi: 'Nguyên liệu thô',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'bill of lading',
      pronunciation: '/ˌbɪl əv ˈleɪdɪŋ/',
      wordVi: 'Vận đơn đường biển',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'customs',
      pronunciation: '/ˈkʌstəmz/',
      wordVi: 'Hải quan',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'excise tax',
      pronunciation: '/ˈeksaɪz tæks/',
      wordVi: 'Thuế tiêu thụ đặc biệt',
      partOfSpeech: 'np',
    ),
  ];

  static List<FabPhraseItem> get readingPhrases => [
    const FabPhraseItem(phrase: 'Deal with', meaning: 'Đề cập tới/giải quyết'),
    const FabPhraseItem(
      phrase: 'Purchasing on a larger scale',
      meaning: 'Mua sắm ở quy mô lớn hơn',
    ),
    const FabPhraseItem(phrase: 'Be associated with', meaning: 'Gắn liền với'),
    const FabPhraseItem(
      phrase: 'May be encountered',
      meaning: 'Có thể được gặp phải',
    ),
    const FabPhraseItem(
      phrase: 'Import and export of goods',
      meaning: 'Xuất nhập khẩu hàng hoá',
    ),
  ];

  static List<FabAnswerItem> get readingAnswers => const [
    FabAnswerItem(en: 'deals with', vi: 'đề cập tới'),
    FabAnswerItem(
      en: 'purchasing of office supplies',
      vi: 'việc mua sắm văn phòng phẩm',
    ),
    FabAnswerItem(
      en: 'shipping and transportation',
      vi: 'việc giao hàng và vận tải',
    ),
    FabAnswerItem(en: 'invoices', vi: 'các loại hoá đơn'),
    FabAnswerItem(en: 'credit terms', vi: 'các điều khoản tín dụng'),
    FabAnswerItem(en: 'photocopy toner', vi: 'hộp mực in cho máy phô-tô'),
    FabAnswerItem(en: 'staples', vi: 'những chiếc ghim giấy'),
    FabAnswerItem(en: 'envelopes', vi: 'những cái phong bì'),
    FabAnswerItem(en: 'business cards', vi: 'những chiếc danh thiếp'),
    FabAnswerItem(en: 'binders', vi: 'các bìa tài liệu'),
    FabAnswerItem(en: 'file boxes', vi: 'các hộp đựng tài liệu'),
    FabAnswerItem(en: 'Purchases', vi: 'Các hàng hoá mua sắm'),
    FabAnswerItem(en: 'the office canteen', vi: 'nhà ăn ở văn phòng'),
    FabAnswerItem(en: 'board meetings', vi: 'các cuộc họp ban giám đốc'),
    FabAnswerItem(en: 'special events', vi: 'các sự kiện đặc biệt'),
    FabAnswerItem(en: 'are required', vi: 'được yêu cầu'),
    FabAnswerItem(en: 'on a larger scale', vi: 'ở một quy mô lớn hơn'),
    FabAnswerItem(en: 'raw materials', vi: 'nguyên liệu thô'),
    FabAnswerItem(en: 'is associated with', vi: 'được gắn liền với'),
    FabAnswerItem(en: 'bill of lading', vi: 'vận đơn đường biển'),
    FabAnswerItem(
      en: 'freight on board',
      vi: 'giao hàng trên phương tiện vận chuyển',
    ),
    FabAnswerItem(en: 'cash on delivery', vi: 'giao hàng thu tiền'),
    FabAnswerItem(en: 'excise tax', vi: 'thuế tiêu thụ đặc biệt'),
    FabAnswerItem(en: 'import', vi: 'nhập khẩu'),
    FabAnswerItem(en: 'export', vi: 'xuất khẩu'),
    FabAnswerItem(en: 'may be encountered', vi: 'có thể được gặp phải'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Conversation (toner sales call)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get conversationVocab => [
    const FabVocabItem(
      wordEn: 'toner',
      pronunciation: '/ˈtoʊnər/',
      wordVi: 'Hộp mực in (toner)',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'cartridge',
      pronunciation: '/ˈkɑːrtrɪdʒ/',
      wordVi: 'Hộp mực (cartridge)',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'supplier',
      pronunciation: '/səˈplaɪər/',
      wordVi: 'Nhà cung cấp',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'in stock',
      pronunciation: '/ɪn stɑːk/',
      wordVi: 'Trong kho/có hàng',
      partOfSpeech: 'prep.p',
    ),
    const FabVocabItem(
      wordEn: 'pricing',
      pronunciation: '/ˈpraɪsɪŋ/',
      wordVi: 'Giá cả/bảng giá',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get conversationPhrases => [
    const FabPhraseItem(
      phrase: 'According to our record',
      meaning: 'Theo ghi chép của chúng tôi',
    ),
    const FabPhraseItem(
      phrase: 'Are having a big sale',
      meaning: 'Đang có một đợt giảm giá lớn',
    ),
    const FabPhraseItem(
      phrase: 'Just got a new copy machine',
      meaning: 'Vừa mua một máy phô-tô mới',
    ),
    const FabPhraseItem(
      phrase: 'Choose another supplier',
      meaning: 'Chọn nhà cung cấp khác',
    ),
    const FabPhraseItem(
      phrase: 'Get back to you',
      meaning: 'Liên hệ lại với ông/bà',
    ),
  ];

  static List<FabAnswerItem> get conversationAnswers => const [
    FabAnswerItem(en: 'Sky Office Supplies', vi: 'hãng Thiết bị Văn phòng Sky'),
    FabAnswerItem(
      en: 'your last photocopy toner order',
      vi: 'đơn hàng hộp mực in laze gần đây nhất của bên ông',
    ),
    FabAnswerItem(
      en: 'places an order of this kind',
      vi: 'đặt một đơn hàng loại này',
    ),
    FabAnswerItem(
      en: 'are having a big sale',
      vi: 'đang có một đợt giảm giá lớn',
    ),
    FabAnswerItem(
      en: 'almost every kind of office supplies',
      vi: 'hầu hết tất cả các loại thiết bị văn phòng',
    ),
    FabAnswerItem(en: 'a very good time', vi: 'một thời điểm rất tốt'),
    FabAnswerItem(
      en: 'high quality toners',
      vi: 'các loại hộp mực in laze chất lượng cao',
    ),
    FabAnswerItem(en: 'The reason', vi: 'Nguyên do'),
    FabAnswerItem(
      en: 'just got a new copy machine',
      vi: 'vừa mua một chiếc máy phô-tô-copy mới',
    ),
    FabAnswerItem(en: 'a different cartridge', vi: 'một hộp mực in khác'),
    FabAnswerItem(
      en: 'choose another supplier',
      vi: 'lựa chọn một nhà cung cấp khác',
    ),
    FabAnswerItem(
      en: 'virtually all major brands',
      vi: 'hầu hết các thương hiệu lớn',
    ),
    FabAnswerItem(
      en: 'models of photocopier toners',
      vi: 'các mẫu hộp mực in cho máy phô-tô-copy',
    ),
    FabAnswerItem(en: 'the one you need', vi: 'cái mà ông cần'),
    FabAnswerItem(
      en: 'your new copier',
      vi: 'chiếc máy phô-tô mới của bên ông',
    ),
    FabAnswerItem(en: 'what we have in stock', vi: 'chúng tôi có gì trong kho'),
    FabAnswerItem(en: 'get back to you', vi: 'liên hệ lại với ông'),
    FabAnswerItem(en: 'in about 10 minutes', vi: 'trong khoảng 10 phút nữa'),
    FabAnswerItem(
      en: 'the new photocopier\'s model number',
      vi: 'mã số của mẫu máy phô-tô-copy mới đó',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 1 (Supermarket announcement)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk1Vocab => [
    const FabVocabItem(
      wordEn: 'specials',
      pronunciation: '/ˈspeʃəlz/',
      wordVi: 'Hàng giảm giá đặc biệt',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'valid',
      pronunciation: '/ˈvælɪd/',
      wordVi: 'Có hiệu lực',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'exclude',
      pronunciation: '/ɪkˈskluːd/',
      wordVi: 'Loại trừ',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'voucher',
      pronunciation: '/ˈvaʊtʃər/',
      wordVi: 'Phiếu mua hàng giảm giá',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'complimentary',
      pronunciation: '/ˌkɑːmplɪˈmentri/',
      wordVi: 'Miễn phí',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'muffin',
      pronunciation: '/ˈmʌfɪn/',
      wordVi: 'Bánh nướng',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'main entrance',
      pronunciation: '/meɪn ˈentrəns/',
      wordVi: 'Cửa chính',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'checkout counter',
      pronunciation: '/ˈtʃekaʊt ˈkaʊntər/',
      wordVi: 'Quầy thanh toán',
      partOfSpeech: 'np',
    ),
  ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
    const FabPhraseItem(phrase: 'Take advantage of', meaning: 'Tận dụng'),
    const FabPhraseItem(
      phrase: 'Be greatly reduced in price',
      meaning: 'Được giảm giá cực mạnh',
    ),
    const FabPhraseItem(phrase: 'Save up to', meaning: 'Tiết kiệm tới'),
    const FabPhraseItem(phrase: 'Award sth to sb', meaning: 'Trao/tặng cho ai'),
    const FabPhraseItem(phrase: 'Be nice to', meaning: 'Lịch thiệp/tử tế với'),
    const FabPhraseItem(phrase: 'Be patient', meaning: 'Kiên nhẫn'),
  ];

  static List<FabAnswerItem> get shortTalk1Answers => const [
    FabAnswerItem(en: 'take advantage of', vi: 'tận dụng'),
    FabAnswerItem(
      en: 'specials',
      vi: 'những mặt hàng giảm giá nhân dịp khuyến mại đặc biệt',
    ),
    FabAnswerItem(en: 'For the next 45 minutes', vi: 'Trong vòng 45 phút nữa'),
    FabAnswerItem(
      en: 'be greatly reduced in price',
      vi: 'được giảm giá cực mạnh',
    ),
    FabAnswerItem(en: 'valid', vi: 'có giá trị'),
    FabAnswerItem(en: 'save up to', vi: 'tiết kiệm tới'),
    FabAnswerItem(en: 'in-store', vi: 'có trong cửa hàng'),
    FabAnswerItem(en: 'china', vi: 'đồ sứ'),
    FabAnswerItem(en: 'pottery', vi: 'đồ gốm'),
    FabAnswerItem(en: 'offer', vi: 'dành tặng'),
    FabAnswerItem(en: 'vouchers', vi: 'phiếu mua hàng giảm giá'),
    FabAnswerItem(en: 'award to customers', vi: 'thưởng cho những khách hàng'),
    FabAnswerItem(en: 'complimentary tea', vi: 'trà miễn phí đi kèm'),
    FabAnswerItem(en: 'muffins', vi: 'bánh nướng'),
    FabAnswerItem(en: 'our bakery counter', vi: 'quầy bánh của chúng tôi'),
    FabAnswerItem(en: 'juice', vi: 'nước hoa quả'),
    FabAnswerItem(en: 'free balloons', vi: 'bóng bay miễn phí'),
    FabAnswerItem(en: 'the main entrance', vi: 'khu cửa chính'),
    FabAnswerItem(en: 'be nice to', vi: 'lịch thiệp với'),
    FabAnswerItem(en: 'patient', vi: 'kiên nhẫn'),
    FabAnswerItem(
      en: 'longer lines than usual',
      vi: 'những hàng người xếp hàng dài hơn thường lệ',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB - Day 2 Short Talk 2 (OfficeMax voicemail)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk2Vocab => [
    const FabVocabItem(
      wordEn: 'photocopier',
      pronunciation: '/ˈfoʊtəˌkɑːpiər/',
      wordVi: 'Máy phô-tô',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'fax machine',
      pronunciation: '/fæks məˈʃiːn/',
      wordVi: 'Máy fax',
      partOfSpeech: 'np',
    ),
    const FabVocabItem(
      wordEn: 'unavailable',
      pronunciation: '/ˌʌnəˈveɪləbəl/',
      wordVi: 'Không có sẵn',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'in stock',
      pronunciation: '/ɪn stɑːk/',
      wordVi: 'Trong kho',
      partOfSpeech: 'prep.p',
    ),
    const FabVocabItem(
      wordEn: 'comparable',
      pronunciation: '/ˈkɑːmpərəbl/',
      wordVi: 'Tương tự',
      partOfSpeech: 'adj',
    ),
    const FabVocabItem(
      wordEn: 'loan',
      pronunciation: '/loʊn/',
      wordVi: 'Cho mượn',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'shipment',
      pronunciation: '/ˈʃɪpmənt/',
      wordVi: 'Lô hàng',
      partOfSpeech: 'n',
    ),
    const FabVocabItem(
      wordEn: 'proceed',
      pronunciation: '/prəˈsiːd/',
      wordVi: 'Tiến hành/giải quyết',
      partOfSpeech: 'v',
    ),
    const FabVocabItem(
      wordEn: 'cooperation',
      pronunciation: '/koʊˌɑːpəˈreɪʃən/',
      wordVi: 'Sự hợp tác',
      partOfSpeech: 'n',
    ),
  ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
    const FabPhraseItem(
      phrase: 'Be willing to do sth',
      meaning: 'Sẵn sàng làm gì',
    ),
    const FabPhraseItem(
      phrase: 'Have sth done',
      meaning: 'Làm cho việc gì được thực hiện',
    ),
    const FabPhraseItem(phrase: 'With respect to', meaning: 'Liên quan đến'),
    const FabPhraseItem(
      phrase: 'Hear from sb',
      meaning: 'Nhận được phản hồi từ ai',
    ),
  ];

  static List<FabAnswerItem> get shortTalk2Answers => const [
    FabAnswerItem(en: 'just received', vi: 'vừa nhận được'),
    FabAnswerItem(
      en: 'photocopiers and fax machines',
      vi: 'những chiếc máy phô-tô và máy fax',
    ),
    FabAnswerItem(en: 'the photocopier model', vi: 'mẫu máy phô-tô'),
    FabAnswerItem(en: 'had requested', vi: 'đã yêu cầu'),
    FabAnswerItem(en: 'unavailable', vi: 'không có sẵn'),
    FabAnswerItem(en: 'in stock', vi: 'trong kho'),
    FabAnswerItem(
      en: 'another photocopier model',
      vi: 'một mẫu máy phô tô khác',
    ),
    FabAnswerItem(
      en: 'comparable to the original one',
      vi: 'tương tự như mẫu ban đầu',
    ),
    FabAnswerItem(en: 'are willing to loan you', vi: 'sẵn sàng cho ông mượn'),
    FabAnswerItem(en: 'the other shipment', vi: 'lô hàng kia'),
    FabAnswerItem(en: 'no problems', vi: 'không vấn đề gì'),
    FabAnswerItem(en: 'the fax machine order', vi: 'đơn đặt hàng máy fax'),
    FabAnswerItem(en: 'contact', vi: 'liên hệ'),
    FabAnswerItem(
      en: 'with respect to the photocopiers',
      vi: 'liên quan tới những chiếc máy phô-tô',
    ),
    FabAnswerItem(en: 'your cooperation', vi: 'sự hợp tác của ông'),
    FabAnswerItem(en: 'hear from', vi: 'nhận được phản hồi từ'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme06_day1',
    dayNumber: 1,
    themeId: 'theme_06_purchasing',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      LessonPhase(
        id: 'theme06_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_23',
        contentEn:
            '''This theme is very common and deals with the local ordering and purchasing of office supplies, doing shopping for the office, shipping and transportation of purchases, invoices, billing, credit terms, discounts.

Most common items found in the office are: pens, pencils, photocopy paper, photocopy toner, photocopy cartridge, staples, paper clips, envelopes, printing matter (business cards, letterhead), binders, file folders, file boxes. Purchases are also made for other areas such as the office canteen, washrooms, board meetings and special events in which flowers, gifts are required.

Purchasing on a larger scale occurs in companies that need significant amounts of raw materials and often is associated with Transportation. Therefore, vocabulary such as waybill, bill of lading, logistics, container, FOB (freight on board), COD (cash on delivery), customs, excise tax and other lexicon specific to the movement and import and export of goods may be encountered.''',
        contentVi:
            '''Chuyên đề này rất phổ biến và thường đề cập tới các vấn đề về đặt hàng và mua văn phòng phẩm nội địa, thực hiện việc mua sắm đồ dùng cho văn phòng, việc vận chuyển và lưu thông hàng hoá đã mua, các loại hoá đơn, việc lập hoá đơn, các điều khoản tín dụng, chiết khấu.

Các mặt hàng phổ biến nhất có trong văn phòng bao gồm: bút bi, bút chì, giấy phô-tô, mực in, hộp mực trong máy phô-tô, những chiếc ghim giấy, kẹp giấy, phong bì, các vấn đề về in ấn (danh thiếp, giấy tiêu đề), bìa tài liệu, tập tài liệu, hộp đựng tài liệu. Hàng hoá cũng được mua sắm cho các khu vực khác trong doanh nghiệp như nhà ăn công ty, phòng vệ sinh; các buổi họp ban giám đốc và các sự kiện đặc biệt khi mà cần có hoa và quà.

Việc mua sắm ở quy mô lớn hơn diễn ra ở các công ty mà cần một lượng lớn các nguyên liệu thô và thường gắn với chuyên đề Giao thông vận tải. Do đó, những từ vựng như vận đơn, vận đơn đường biển, hậu cần, công-te-nơ, giao hàng trên phương tiện vận chuyển (FOB), giao hàng thu tiền (COD), hải quan, thuế tiêu thụ đặc biệt, và các từ ngữ cụ thể khác liên quan đến việc vận chuyển và xuất nhập khẩu hàng hoá là những từ ngữ có thể gặp phải.''',
        fabVocab: Theme6Content.readingVocab,
        fabPhrases: Theme6Content.readingPhrases,
      ),
      LessonPhase(
        id: 'theme06_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_23',
        contentEn:
            '''This theme is very common and deals with the local ordering and purchasing of office supplies, doing shopping for the office, shipping and transportation of purchases, invoices, billing, credit terms, discounts.

Most common items found in the office are: pens, pencils, photocopy paper, photocopy toner, photocopy cartridge, staples, paper clips, envelopes, printing matter (business cards, letterhead), binders, file folders, file boxes. Purchases are also made for other areas such as the office canteen, washrooms, board meetings and special events in which flowers, gifts are required.

Purchasing on a larger scale occurs in companies that need significant amounts of raw materials and often is associated with Transportation. Therefore, vocabulary such as waybill, bill of lading, logistics, container, FOB (freight on board), COD (cash on delivery), customs, excise tax and other lexicon specific to the movement and import and export of goods may be encountered.''',
        contentVi:
            '''Chuyên đề này rất phổ biến và thường đề cập tới các vấn đề về đặt hàng và mua văn phòng phẩm nội địa, thực hiện việc mua sắm đồ dùng cho văn phòng, việc vận chuyển và lưu thông hàng hoá đã mua, các loại hoá đơn, việc lập hoá đơn, các điều khoản tín dụng, chiết khấu.

Các mặt hàng phổ biến nhất có trong văn phòng bao gồm: bút bi, bút chì, giấy phô-tô, mực in, hộp mực trong máy phô-tô, những chiếc ghim giấy, kẹp giấy, phong bì, các vấn đề về in ấn (danh thiếp, giấy tiêu đề), bìa tài liệu, tập tài liệu, hộp đựng tài liệu. Hàng hoá cũng được mua sắm cho các khu vực khác trong doanh nghiệp như nhà ăn công ty, phòng vệ sinh; các buổi họp ban giám đốc và các sự kiện đặc biệt khi mà cần có hoa và quà.

Việc mua sắm ở quy mô lớn hơn diễn ra ở các công ty mà cần một lượng lớn các nguyên liệu thô và thường gắn với chuyên đề Giao thông vận tải. Do đó, những từ vựng như vận đơn, vận đơn đường biển, hậu cần, công-te-nơ, giao hàng trên phương tiện vận chuyển (FOB), giao hàng thu tiền (COD), hải quan, thuế tiêu thụ đặc biệt, và các từ ngữ cụ thể khác liên quan đến việc vận chuyển và xuất nhập khẩu hàng hoá là những từ ngữ có thể gặp phải.''',
      ),
      LessonPhase(
        id: 'theme06_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme6Content.readingAnswers,
      ),
      LessonPhase(
        id: 'theme06_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('This theme is very common and '),
    const MixedSegment.vietnamese('đề cập tới', 'deals with'),
    const MixedSegment.english(' the local ordering and '),
    const MixedSegment.vietnamese(
      'việc mua sắm văn phòng phẩm',
      'purchasing of office supplies',
    ),
    const MixedSegment.english(', doing shopping for the office, '),
    const MixedSegment.vietnamese(
      'việc giao hàng và vận tải',
      'shipping and transportation',
    ),
    const MixedSegment.english(' of purchases, '),
    const MixedSegment.vietnamese('các loại hoá đơn', 'invoices'),
    const MixedSegment.english(', billing, '),
    const MixedSegment.vietnamese('các điều khoản tín dụng', 'credit terms'),
    const MixedSegment.english(
      ', discounts.\n\nMost common items found in the office are: pens, pencils, photocopy paper, ',
    ),
    const MixedSegment.vietnamese(
      'hộp mực in cho máy phô-tô',
      'photocopy toner',
    ),
    const MixedSegment.english(', photocopy cartridge, '),
    const MixedSegment.vietnamese('những chiếc ghim giấy', 'staples'),
    const MixedSegment.english(', paper clips, '),
    const MixedSegment.vietnamese('những cái phong bì', 'envelopes'),
    const MixedSegment.english(', printing matter ('),
    const MixedSegment.vietnamese('những chiếc danh thiếp', 'business cards'),
    const MixedSegment.english(', letterhead), '),
    const MixedSegment.vietnamese('các bìa tài liệu', 'binders'),
    const MixedSegment.english(', file folders, '),
    const MixedSegment.vietnamese('các hộp đựng tài liệu', 'file boxes'),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese('Các hàng hoá mua sắm', 'Purchases'),
    const MixedSegment.english(' are also made for other areas such as '),
    const MixedSegment.vietnamese('nhà ăn ở văn phòng', 'the office canteen'),
    const MixedSegment.english(', washrooms, '),
    const MixedSegment.vietnamese(
      'các cuộc họp ban giám đốc',
      'board meetings',
    ),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('các sự kiện đặc biệt', 'special events'),
    const MixedSegment.english(' in which flowers, gifts '),
    const MixedSegment.vietnamese('được yêu cầu', 'are required'),
    const MixedSegment.english('.\n\nPurchasing '),
    const MixedSegment.vietnamese('ở một quy mô lớn hơn', 'on a larger scale'),
    const MixedSegment.english(
      ' occurs in companies that need significant amounts of ',
    ),
    const MixedSegment.vietnamese('nguyên liệu thô', 'raw materials'),
    const MixedSegment.english(' and often '),
    const MixedSegment.vietnamese('được gắn liền với', 'is associated with'),
    const MixedSegment.english(
      ' Transportation. Therefore, vocabulary such as waybill, ',
    ),
    const MixedSegment.vietnamese('vận đơn đường biển', 'bill of lading'),
    const MixedSegment.english(', logistics, container, FOB ('),
    const MixedSegment.vietnamese(
      'giao hàng trên phương tiện vận chuyển',
      'freight on board',
    ),
    const MixedSegment.english('), COD ('),
    const MixedSegment.vietnamese('giao hàng thu tiền', 'cash on delivery'),
    const MixedSegment.english('), customs, '),
    const MixedSegment.vietnamese('thuế tiêu thụ đặc biệt', 'excise tax'),
    const MixedSegment.english(
      ' and other lexicon specific to the movement and ',
    ),
    const MixedSegment.vietnamese('nhập khẩu', 'import'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('xuất khẩu', 'export'),
    const MixedSegment.english(' of goods '),
    const MixedSegment.vietnamese('có thể được gặp phải', 'may be encountered'),
    const MixedSegment.english('.'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme06_day2',
    dayNumber: 2,
    themeId: 'theme_06_purchasing',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      // --- QUIZ 1/2/3 ---
      LessonPhase(
        id: 'theme06_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation',
        titleVi: 'Luyện tập 1: Hội thoại',
        audioTrackKey: 'track_24',
        questions: _practice1Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 1 (D): W nói "now is a very good time to purchase high quality toners" = Chào bán mực in.',
            en: 'Q1 (D): W says "now is a very good time to purchase high quality toners" = To sell some toner.',
          ),
          const FabAnswerItem(
            vi: 'Câu 2 (C): W nói "your last photocopy toner order with us was 3 months ago" = 3 tháng trước.',
            en: 'Q2 (C): W says "your last photocopy toner order with us was 3 months ago" = 3 months ago.',
          ),
          const FabAnswerItem(
            vi: 'Câu 3 (B): M nói "I will send you an e-mail in about 10 minutes" = Gửi email cho người phụ nữ.',
            en: 'Q3 (B): M says "I will send you an e-mail in about 10 minutes" = Send the woman an email.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme06_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - Supermarket Promotion',
        titleVi: 'Luyện tập 2: Bài ngắn - Khuyến mãi siêu thị',
        audioTrackKey: 'track_25',
        questions: _practice2Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 4 (B): "Please take advantage of our 10th birthday specials" = Một sự kiện khuyến mãi.',
            en: 'Q4 (B): "Please take advantage of our 10th birthday specials" = A promotional event.',
          ),
          const FabAnswerItem(
            vi: 'Câu 5 (C): "enjoy complimentary tea, coffee... Soda and juice will be served" = Đồ uống miễn phí.',
            en: 'Q5 (C): "enjoy complimentary tea, coffee... Soda and juice will be served" = Free drinks.',
          ),
          const FabAnswerItem(
            vi: 'Câu 6 (C): "there may be longer lines than usual at the checkout counter" = Có những hàng dài người đợi.',
            en: 'Q6 (C): "there may be longer lines than usual at the checkout counter" = There are long queues of people.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme06_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - OfficeMax Message',
        titleVi: 'Luyện tập 3: Bài ngắn - Tin nhắn OfficeMax',
        audioTrackKey: 'track_26',
        questions: _practice3Questions,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 7 (B): "the photocopier model that you had requested is unavailable" = Thông báo vấn đề về đơn hàng.',
            en: 'Q7 (B): "the photocopier model that you had requested is unavailable" = To notify the customer of an order problem.',
          ),
          const FabAnswerItem(
            vi: 'Câu 8 (B): "We are willing to loan you this model" = Cho khách hàng mượn một máy phô-tô tương đương.',
            en: 'Q8 (B): "We are willing to loan you this model" = To let him use a comparable photocopier.',
          ),
          const FabAnswerItem(
            vi: 'Câu 9 (C): "no problems with the fax machine order... shipped by Monday afternoon" = Máy fax.',
            en: 'Q9 (C): "no problems with the fax machine order... shipped by Monday afternoon" = Fax machines.',
          ),
        ],
      ),

      // --- TRANSLATE 1/2/3 ---
      LessonPhase(
        id: 'theme06_day2_translate1',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Conversation',
        titleVi: 'Nghe và Dịch: Hội thoại',
        audioTrackKey: 'track_24',
        contentEn:
            '''W: Good morning Mr. Solis, This is Rachel at Sky Office Supplies. According to our record, your last photocopy toner order with us was 3 months ago and your company usually replaces an order of this kind every 2 months. I thought you would be very interested to know that we are having a big sale on almost every kind of office supplies and now is a very good time to purchase high quality toners at low prices.
M: Yes, you're right. The reason is that we just got a new copy machine and it uses a different cartridge, which I don't believe you carry. Therefore, we had to choose another supplier.
W: Our store carries virtually all major brands and models of photocopier toners, so I believe that we have the one you need. Maybe you could send me the information about your new copier, then I'll see what we have in stock and get back to you with pricing.
M: All right, I will send you an e-mail in about 10 minutes with the new photocopier's model number.''',
        contentVi:
            '''W: Chào buổi sáng ông Solis. Đây là Rachel ở hãng Thiết bị Văn phòng Sky. Theo ghi chép của chúng tôi, đơn hàng hộp mực in laze gần đây nhất của bên ông đặt hàng với chúng tôi là 3 tháng trước và công ty ông thường đặt một đơn hàng loại này hai tháng một lần. Tôi nghĩ rằng ông sẽ rất vui khi biết rằng chúng tôi đang có một đợt giảm giá lớn trên hầu hết tất cả các loại thiết bị văn phòng và bây giờ là một thời điểm rất tốt để mua các loại hộp mực in chất lượng cao với mức giá thấp.
M: Vâng, cô nói đúng. Nguyên do là chúng tôi vừa mua một chiếc máy phô-tô-copy mới và nó sử dụng một hộp mực in khác, loại mà tôi không nghĩ là bên cô có. Do đó, chúng tôi đã phải lựa chọn một nhà cung cấp khác.
W: Cửa hàng của chúng tôi có hầu hết các thương hiệu và các mẫu hộp mực in lớn, vì vậy tôi tin rằng chúng tôi có loại mà ông cần. Có lẽ ông có thể gửi cho tôi thông tin về chiếc máy phô-tô-copy mới của bên ông, sau đó tôi sẽ xem chúng tôi có gì trong kho và liên hệ lại với ông về giá cả nhé.
M: Được thôi, tôi sẽ gửi cô một bức thư điện tử trong vòng 10 phút nữa với mã số mẫu máy phô-tô-copy mới đó.''',
      ),
      LessonPhase(
        id: 'theme06_day2_translate2',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: Supermarket Promotion',
        titleVi: 'Nghe và Dịch: Khuyến mãi siêu thị',
        audioTrackKey: 'track_25',
        contentEn:
            '''Attention A&p supermarket shoppers! Please take advantage of our 10th birthday specials. For the next 45 minutes all items in the supermarket will be greatly reduced in price. This special deal is valid only for today and tomorrow. This means you can save up to 30 percent on all items in-store. The only items which are excluded are china and pottery. We will also offer \$100 supermarket vouchers to award to customers who spend more than \$500. You can also enjoy complimentary tea, coffee and muffins at our bakery counter. Soda and juice will be served to children. Children can also receive free balloons and candy at the main entrance. Please be nice to other customers and be patient as there may be longer lines than usual at the checkout counter.''',
        contentVi:
            '''Xin quý vị khách hàng của siêu thị A&p chú ý! Hãy nhanh chân tận dụng chương trình khuyến mãi đặc biệt nhân dịp kỷ niệm mười năm thành lập siêu thị của chúng tôi. Trong vòng 45 phút tới tất cả các mặt hàng trong siêu thị sẽ giảm giá cực mạnh. Dịp đặc biệt này chỉ có giá trị trong ngày hôm nay và ngày mai. Điều này có nghĩa là quý vị có thể tiết kiệm được tới 30% đối với tất cả các mặt hàng được bày bán trong siêu thị. Những mặt hàng duy nhất không nằm trong nhóm hàng được giảm giá này là đồ sứ và đồ gốm. Chúng tôi cũng tặng phiếu mua hàng giảm giá trị giá 100 đô-la cho quý khách có đơn hàng trị giá trên 500 đô-la. Quý vị cũng có thể thưởng thức trà, cà phê và bánh nướng miễn phí tại quầy bánh của chúng tôi. Trẻ em sẽ được phục vụ sô-đa và nước ép trái cây. Trẻ em còn nhận được bóng bay và kẹo miễn phí ở khu vực cửa chính. Xin cư xử lịch thiệp với các khách hàng khác và kiên nhẫn vì quý vị có thể phải xếp hàng dài hơn mọi ngày tại quầy thanh toán.''',
      ),
      LessonPhase(
        id: 'theme06_day2_translate3',
        phaseTypeStr: 'translate',
        titleEn: 'Listen & Translate: OfficeMax Message',
        titleVi: 'Nghe và Dịch: Tin nhắn OfficeMax',
        audioTrackKey: 'track_26',
        contentEn:
            '''Good morning, Mr. Southgate. This is James McCauley calling from OfficeMax. I just received your e-mail regarding your company's purchase of photocopiers and fax machines. Unfortunately, the photocopier model that you had requested is unavailable right now, and won't be in stock for another four weeks. We do, however, currently have another photocopier model that is comparable to the original one that you had requested. We are willing to loan you this model while you are waiting for the other shipment. There are no problems with the fax machine order, though. We will have your delivery shipped by Monday afternoon. Please contact us about how you would like to proceed with respect to the photocopiers. Thank you for your cooperation and we hope to hear from you soon.''',
        contentVi:
            '''Chào ông Southgate. Tôi là James McCauley gọi đến từ OfficeMax. Tôi vừa nhận được thư điện tử của ông về việc mua các máy phô-tô và máy fax của công ty ông. Thật không may là mẫu máy phô-tô mà ông yêu cầu vào ngay thời điểm này không có sẵn, và sau bốn tuần nữa mới có hàng. Tuy nhiên, hiện tại chúng tôi cũng có mẫu máy phô-tô khác giống với loại mà ông đã yêu cầu. Chúng tôi sẵn sàng cho ông mượn mẫu này trong thời gian ông đang đợi chuyển lô hàng kia. Còn về đơn hàng máy fax thì không có vấn đề gì. Chúng tôi sẽ giao hàng chậm nhất là chiều ngày thứ Hai. Xin liên hệ với chúng tôi về việc ông muốn giải quyết vấn đề liên quan tới đơn đặt hàng máy phô-tô như thế nào. Cảm ơn sự hợp tác của ông và chúng tôi hy vọng sớm có được sự phản hồi từ ông.''',
      ),

      // --- MIND GAME 1/2/3 ---
      LessonPhase(
        id: 'theme06_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Conversation',
        titleVi: 'Huấn luyện Trí nhớ: Hội thoại',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme6Content.conversationVocab,
        fabPhrases: Theme6Content.conversationPhrases,
        fabAnswers: Theme6Content.conversationAnswers,
      ),
      LessonPhase(
        id: 'theme06_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Supermarket Promotion',
        titleVi: 'Huấn luyện Trí nhớ: Khuyến mãi siêu thị',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme6Content.shortTalk1Vocab,
        fabPhrases: Theme6Content.shortTalk1Phrases,
        fabAnswers: Theme6Content.shortTalk1Answers,
      ),
      LessonPhase(
        id: 'theme06_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: OfficeMax Message',
        titleVi: 'Huấn luyện Trí nhớ: Tin nhắn OfficeMax',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme6Content.shortTalk2Vocab,
        fabPhrases: Theme6Content.shortTalk2Phrases,
        fabAnswers: Theme6Content.shortTalk2Answers,
      ),
    ],
  );

  // ═══════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS (9) - đáp án suy ra trực tiếp từ transcript
  // Practice 1: D, C, B
  // Practice 2: B, C, C
  // Practice 3: B, B, C
  // ═══════════════════════════════════════════════════════════════

  static List<QuizQuestion> get _practice1Questions => [
    const QuizQuestion(
      id: 'theme06_q01',
      questionText: 'What is the purpose of the woman\'s call?',
      options: [
        '(A) To sell a photocopy machine',
        '(B) To place a toner order',
        '(C) To cancel an order',
        '(D) To sell some toner',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_24',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme06_q02',
      questionText: 'When did Mr. Solis last buy toner?',
      options: [
        '(A) A month ago',
        '(B) 2 months ago',
        '(C) 3 months ago',
        '(D) 5 months ago',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_24',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme06_q03',
      questionText: 'What will Mr. Solis probably do next?',
      options: [
        '(A) Write the woman a letter',
        '(B) Send the woman an email',
        '(C) Give the woman a call',
        '(D) Go to the store',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_24',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    const QuizQuestion(
      id: 'theme06_q04',
      questionText: 'What is being announced?',
      options: [
        '(A) A house-warming party',
        '(B) A promotional event',
        '(C) An awards ceremony',
        '(D) A grand opening of a supermarket',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_25',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme06_q05',
      questionText: 'What will customers receive at the bakery counter?',
      options: [
        '(A) Free movie tickets',
        '(B) Free party supplies',
        '(C) Free drinks',
        '(D) Free coffee makers',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_25',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme06_q06',
      questionText: 'Why are the customers asked to be nice to others?',
      options: [
        '(A) The air-conditioning doesn\'t work.',
        '(B) Some items are out of stock.',
        '(C) There are long queues of people.',
        '(D) There is an interruption in the counter service.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_25',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
      id: 'theme06_q07',
      questionText: 'Why is the person leaving this message?',
      options: [
        '(A) To order some office equipment',
        '(B) To notify the customer of an order problem',
        '(C) To receive payment for the purchase',
        '(D) To ask for information about a new photocopier model',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_26',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme06_q08',
      questionText: 'What does the caller offer Mr. Southgate?',
      options: [
        '(A) To give him a discount on his order',
        '(B) To let him use a comparable photocopier',
        '(C) To provide him with additional software',
        '(D) To deliver the shipment free of charge',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_26',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme06_q09',
      questionText: 'What will be delivered to Mr. Southgate on Monday?',
      options: [
        '(A) Computers',
        '(B) Photocopiers',
        '(C) Fax machines',
        '(D) Printers',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_26',
      practiceNumber: 'practice3',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // Mind Game Segments - Day 2
  // ═══════════════════════════════════════════════════════════════

  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english(
      'W: Good morning, Mr. Solis. This is Rachel at ',
    ),
    const MixedSegment.vietnamese(
      'hãng Thiết bị Văn phòng Sky',
      'Sky Office Supplies',
    ),
    const MixedSegment.english('. According to our record, '),
    const MixedSegment.vietnamese(
      'đơn hàng hộp mực in laze gần đây nhất của bên ông',
      'your last photocopy toner order',
    ),
    const MixedSegment.english(
      ' with us was 3 months ago and your company usually ',
    ),
    const MixedSegment.vietnamese(
      'đặt một đơn hàng loại này',
      'places an order of this kind',
    ),
    const MixedSegment.english(
      ' every two months. I thought you would be very interested to know that we ',
    ),
    const MixedSegment.vietnamese(
      'đang có một đợt giảm giá lớn',
      'are having a big sale',
    ),
    const MixedSegment.english(' on '),
    const MixedSegment.vietnamese(
      'hầu hết tất cả các loại thiết bị văn phòng',
      'almost every kind of office supplies',
    ),
    const MixedSegment.english(' and now is '),
    const MixedSegment.vietnamese('một thời điểm rất tốt', 'a very good time'),
    const MixedSegment.english(' to purchase '),
    const MixedSegment.vietnamese(
      'các loại hộp mực in laze chất lượng cao',
      'high quality toners',
    ),
    const MixedSegment.english(' at low prices.\n\nM: Yes, you\'re right. '),
    const MixedSegment.vietnamese('Nguyên do', 'The reason'),
    const MixedSegment.english(' is that we '),
    const MixedSegment.vietnamese(
      'vừa mua một chiếc máy phô-tô-copy mới',
      'just got a new copy machine',
    ),
    const MixedSegment.english(' and it uses '),
    const MixedSegment.vietnamese(
      'một hộp mực in khác',
      'a different cartridge',
    ),
    const MixedSegment.english(
      ', which I don\'t believe you carry. Therefore, we had to ',
    ),
    const MixedSegment.vietnamese(
      'lựa chọn một nhà cung cấp khác',
      'choose another supplier',
    ),
    const MixedSegment.english('.\n\nW: Our store carries '),
    const MixedSegment.vietnamese(
      'hầu hết các thương hiệu lớn',
      'virtually all major brands',
    ),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese(
      'các mẫu hộp mực in cho máy phô-tô-copy',
      'models of photocopier toners',
    ),
    const MixedSegment.english(', so I believe that we have '),
    const MixedSegment.vietnamese('cái mà ông cần', 'the one you need'),
    const MixedSegment.english(
      '. Maybe you could send me the information about ',
    ),
    const MixedSegment.vietnamese(
      'chiếc máy phô-tô mới của bên ông',
      'your new copier',
    ),
    const MixedSegment.english(', then I\'ll see '),
    const MixedSegment.vietnamese(
      'chúng tôi có gì trong kho',
      'what we have in stock',
    ),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('liên hệ lại với ông', 'get back to you'),
    const MixedSegment.english(
      ' with pricing.\n\nM: All right, I will send you an e-mail ',
    ),
    const MixedSegment.vietnamese(
      'trong khoảng 10 phút nữa',
      'in about 10 minutes',
    ),
    const MixedSegment.english(' with '),
    const MixedSegment.vietnamese(
      'mã số của mẫu máy phô-tô-copy mới đó',
      'the new photocopier\'s model number',
    ),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Attention A&p supermarket shoppers! Please '),
    const MixedSegment.vietnamese('tận dụng', 'take advantage of'),
    const MixedSegment.english(' our 10th birthday '),
    const MixedSegment.vietnamese(
      'những mặt hàng giảm giá nhân dịp khuyến mại đặc biệt',
      'specials',
    ),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese(
      'Trong vòng 45 phút nữa',
      'For the next 45 minutes',
    ),
    const MixedSegment.english(' all items in the supermarket will '),
    const MixedSegment.vietnamese(
      'được giảm giá cực mạnh',
      'be greatly reduced in price',
    ),
    const MixedSegment.english('. This special deal is '),
    const MixedSegment.vietnamese('có giá trị', 'valid'),
    const MixedSegment.english(
      ' only for today and tomorrow. This means you can ',
    ),
    const MixedSegment.vietnamese('tiết kiệm tới', 'save up to'),
    const MixedSegment.english(' 30 percent on all items '),
    const MixedSegment.vietnamese('có trong cửa hàng', 'in-store'),
    const MixedSegment.english('. The only items which are excluded are '),
    const MixedSegment.vietnamese('đồ sứ', 'china'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('đồ gốm', 'pottery'),
    const MixedSegment.english('. We will also '),
    const MixedSegment.vietnamese('dành tặng', 'offer'),
    const MixedSegment.english(' \$100 supermarket '),
    const MixedSegment.vietnamese('phiếu mua hàng giảm giá', 'vouchers'),
    const MixedSegment.english(' to '),
    const MixedSegment.vietnamese(
      'thưởng cho những khách hàng',
      'award to customers',
    ),
    const MixedSegment.english(
      ' who spend more than \$500. You can also enjoy ',
    ),
    const MixedSegment.vietnamese('trà miễn phí đi kèm', 'complimentary tea'),
    const MixedSegment.english(', coffee and '),
    const MixedSegment.vietnamese('bánh nướng', 'muffins'),
    const MixedSegment.english(' at '),
    const MixedSegment.vietnamese(
      'quầy bánh của chúng tôi',
      'our bakery counter',
    ),
    const MixedSegment.english('. Soda and '),
    const MixedSegment.vietnamese('nước hoa quả', 'juice'),
    const MixedSegment.english(
      ' will be served to children. Children can also receive ',
    ),
    const MixedSegment.vietnamese('bóng bay miễn phí', 'free balloons'),
    const MixedSegment.english(' and candy at '),
    const MixedSegment.vietnamese('khu cửa chính', 'the main entrance'),
    const MixedSegment.english('. Please '),
    const MixedSegment.vietnamese('lịch thiệp với', 'be nice to'),
    const MixedSegment.english(' other customers and be '),
    const MixedSegment.vietnamese('kiên nhẫn', 'patient'),
    const MixedSegment.english(' as there may be '),
    const MixedSegment.vietnamese(
      'những hàng người xếp hàng dài hơn thường lệ',
      'longer lines than usual',
    ),
    const MixedSegment.english(' at the checkout counter.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english(
      'Good morning, Mr. Southgate. This is James McCauley calling from OfficeMax. I ',
    ),
    const MixedSegment.vietnamese('vừa nhận được', 'just received'),
    const MixedSegment.english(
      ' your e-mail regarding your company\'s purchase of ',
    ),
    const MixedSegment.vietnamese(
      'những chiếc máy phô-tô và máy fax',
      'photocopiers and fax machines',
    ),
    const MixedSegment.english('. Unfortunately, '),
    const MixedSegment.vietnamese('mẫu máy phô-tô', 'the photocopier model'),
    const MixedSegment.english(' that you '),
    const MixedSegment.vietnamese('đã yêu cầu', 'had requested'),
    const MixedSegment.english(' is '),
    const MixedSegment.vietnamese('không có sẵn', 'unavailable'),
    const MixedSegment.english(' right now, and won\'t be '),
    const MixedSegment.vietnamese('trong kho', 'in stock'),
    const MixedSegment.english(
      ' for another four weeks. We do, however, currently have ',
    ),
    const MixedSegment.vietnamese(
      'một mẫu máy phô tô khác',
      'another photocopier model',
    ),
    const MixedSegment.english(' that is '),
    const MixedSegment.vietnamese(
      'tương tự như mẫu ban đầu',
      'comparable to the original one',
    ),
    const MixedSegment.english(' that you had requested. We '),
    const MixedSegment.vietnamese(
      'sẵn sàng cho ông mượn',
      'are willing to loan you',
    ),
    const MixedSegment.english(' this model while you are waiting for '),
    const MixedSegment.vietnamese('lô hàng kia', 'the other shipment'),
    const MixedSegment.english('. There are '),
    const MixedSegment.vietnamese('không vấn đề gì', 'no problems'),
    const MixedSegment.english(' with '),
    const MixedSegment.vietnamese(
      'đơn đặt hàng máy fax',
      'the fax machine order',
    ),
    const MixedSegment.english(
      ', though. We will have your delivery shipped by Monday afternoon. Please ',
    ),
    const MixedSegment.vietnamese('liên hệ', 'contact'),
    const MixedSegment.english(' us about how you would like to proceed '),
    const MixedSegment.vietnamese(
      'liên quan tới những chiếc máy phô-tô',
      'with respect to the photocopiers',
    ),
    const MixedSegment.english('. Thank you for '),
    const MixedSegment.vietnamese('sự hợp tác của ông', 'your cooperation'),
    const MixedSegment.english(' and we hope to '),
    const MixedSegment.vietnamese('nhận được phản hồi từ', 'hear from'),
    const MixedSegment.english(' you soon.'),
  ];
}

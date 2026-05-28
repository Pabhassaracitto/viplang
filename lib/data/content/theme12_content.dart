// lib/data/content/theme12_content.dart

import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme12Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_12_housing_property',
    themeNumber: 12,
    titleEn: 'Housing & Corporate Property',
    titleVi: 'Nhà Đất & Tài Sản Doanh Nghiệp',
    description:
        'Xây dựng, kỹ thuật, dịch vụ điện & khí đốt, bảo trì tòa nhà, mua bán & thuê mướn, nâng cấp, sửa chữa, tài sản ngoài tòa nhà.',
    iconEmoji: '🏠',
    isUnlocked: false,
    totalDays: 2,
  );

  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v12_01',
      wordEn: 'housing',
      wordVi: 'Nơi ăn chốn ở, nhà ở',
      pronunciation: '/ˈhaʊzɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The government is trying to provide affordable housing.',
      exampleVi: 'Chính phủ đang cố gắng cung cấp nhà ở giá rẻ.',
    ),
    VocabModel(
      id: 'v12_02',
      wordEn: 'corporate',
      wordVi: 'Thuộc về doanh nghiệp',
      pronunciation: '/ˈkɔːpərət/',
      partOfSpeech: 'adj',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The corporate headquarters is located downtown.',
      exampleVi: 'Trụ sở chính của doanh nghiệp nằm ở trung tâm thành phố.',
    ),
    VocabModel(
      id: 'v12_03',
      wordEn: 'property',
      wordVi: 'Tài sản, của cải, đất đai, nhà cửa',
      pronunciation: '/ˈprɒpəti/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The value of the property has increased significantly.',
      exampleVi: 'Giá trị của bất động sản này đã tăng lên đáng kể.',
    ),
    VocabModel(
      id: 'v12_04',
      wordEn: 'building construction',
      wordVi: 'Việc xây dựng nhà cửa',
      pronunciation: '/ˈbɪldɪŋ kənˈstrʌkʃən/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Building construction is a major industry in this city.',
      exampleVi:
          'Xây dựng nhà cửa là một ngành công nghiệp lớn ở thành phố này.',
    ),
    VocabModel(
      id: 'v12_05',
      wordEn: 'engineering',
      wordVi: 'Nghề kỹ sư, ngành kỹ thuật',
      pronunciation: '/ˌendʒɪˈnɪərɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'He studied mechanical engineering at university.',
      exampleVi: 'Anh ấy học ngành kỹ thuật cơ khí tại trường đại học.',
    ),
    VocabModel(
      id: 'v12_06',
      wordEn: 'electricity',
      wordVi: 'Điện, điện lực',
      pronunciation: '/ɪˌlekˈtrɪsɪti/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The bill for electricity was very high last month.',
      exampleVi: 'Hóa đơn tiền điện tháng trước rất cao.',
    ),
    VocabModel(
      id: 'v12_07',
      wordEn: 'gas service',
      wordVi: 'Dịch vụ cung cấp khí đốt',
      pronunciation: '/ɡæs ˈsɜːvɪs/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The gas service was interrupted for maintenance.',
      exampleVi: 'Dịch vụ khí đốt đã bị gián đoạn để bảo trì.',
    ),
    VocabModel(
      id: 'v12_08',
      wordEn: 'building maintenance',
      wordVi: 'Sự bảo trì công trình',
      pronunciation: '/ˈbɪldɪŋ ˈmeɪntənəns/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The landlord is responsible for building maintenance.',
      exampleVi: 'Chủ nhà có trách nhiệm bảo trì công trình.',
    ),
    VocabModel(
      id: 'v12_09',
      wordEn: 'renovation',
      wordVi: 'Sự nâng cấp, đổi mới, sửa chữa',
      pronunciation: '/ˌrenəˈveɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The hotel is closed for renovation.',
      exampleVi: 'Khách sạn đang đóng cửa để nâng cấp.',
    ),
    VocabModel(
      id: 'v12_10',
      wordEn: 'repair',
      wordVi: 'Sửa chữa, sự sửa chữa',
      pronunciation: '/rɪˈpeə/',
      partOfSpeech: 'v, n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The roof needs urgent repair.',
      exampleVi: 'Mái nhà cần được sửa chữa gấp.',
    ),
    VocabModel(
      id: 'v12_11',
      wordEn: 'parking lot',
      wordVi: 'Bãi đỗ xe',
      pronunciation: '/ˈpɑːkɪŋ lɒt/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'There is a large parking lot behind the building.',
      exampleVi: 'Có một bãi đỗ xe lớn phía sau tòa nhà.',
    ),
    VocabModel(
      id: 'v12_12',
      wordEn: 'storage facilities',
      wordVi: 'Các kho chứa đồ',
      pronunciation: '/ˈstɔːrɪdʒ fəˈsɪlɪtiz/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The warehouse has excellent storage facilities.',
      exampleVi: 'Kho hàng có các kho chứa đồ tuyệt vời.',
    ),
    VocabModel(
      id: 'v12_13',
      wordEn: 'warehouse',
      wordVi: 'Kho hàng',
      pronunciation: '/ˈweəhaʊs/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The goods are stored in a large warehouse.',
      exampleVi: 'Hàng hóa được lưu trữ trong một kho hàng lớn.',
    ),
    VocabModel(
      id: 'v12_14',
      wordEn: 'superintendent',
      wordVi: 'Người giám sát, người quản lý',
      pronunciation: '/ˌsuːpərɪnˈtendənt/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The superintendent is in charge of the construction site.',
      exampleVi: 'Người giám sát chịu trách nhiệm về công trường xây dựng.',
    ),
    VocabModel(
      id: 'v12_15',
      wordEn: 'janitor',
      wordVi: 'Người trông coi trường học, người gác cửa',
      pronunciation: '/ˈdʒænɪtə/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The janitor cleans the hallways every night.',
      exampleVi: 'Người gác cửa dọn dẹp các hành lang mỗi tối.',
    ),
    VocabModel(
      id: 'v12_16',
      wordEn: 'cleaning staff',
      wordVi: 'Nhân viên dọn dẹp, lao công, tạp vụ',
      pronunciation: '/ˈkliːnɪŋ stɑːf/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Our cleaning staff does a great job maintaining hygiene.',
      exampleVi:
          'Nhân viên dọn dẹp của chúng tôi làm rất tốt việc duy trì vệ sinh.',
    ),
    VocabModel(
      id: 'v12_17',
      wordEn: 'technician',
      wordVi: 'Kỹ thuật viên',
      pronunciation: '/tekˈnɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'We need a technician to fix the server.',
      exampleVi: 'Chúng tôi cần một kỹ thuật viên để sửa máy chủ.',
    ),
    VocabModel(
      id: 'v12_18',
      wordEn: 'surveyor',
      wordVi: 'Người đo vẽ bản đồ địa hình',
      pronunciation: '/səˈveɪə/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'A surveyor was called to measure the plot of land.',
      exampleVi: 'Một người đo vẽ bản đồ đã được gọi đến để đo khu đất.',
    ),
    VocabModel(
      id: 'v12_19',
      wordEn: 'construction worker',
      wordVi: 'Công nhân xây dựng',
      pronunciation: '/kənˈstrʌkʃən ˈwɜːkə/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Construction workers are working hard on the new bridge.',
      exampleVi:
          'Các công nhân xây dựng đang nỗ lực làm việc trên cây cầu mới.',
    ),
    VocabModel(
      id: 'v12_20',
      wordEn: 'parking lot attendant',
      wordVi: 'Nhân viên bãi đỗ xe',
      pronunciation: '/ˈpɑːkɪŋ lɒt əˈtendənt/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Please give your ticket to the parking lot attendant.',
      exampleVi: 'Vui lòng đưa vé của bạn cho nhân viên bãi đỗ xe.',
    ),
    VocabModel(
      id: 'v12_21',
      wordEn: 'office manager',
      wordVi: 'Người quản lý văn phòng',
      pronunciation: '/ˈɒfɪs ˈmænɪdʒə/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The office manager handles all administrative tasks.',
      exampleVi:
          'Người quản lý văn phòng xử lý tất cả các nhiệm vụ hành chính.',
    ),
    VocabModel(
      id: 'v12_22',
      wordEn: 'forklift operator',
      wordVi: 'Người điều khiển xe nâng hàng hóa',
      pronunciation: '/ˈfɔːklɪft ˈɒpəreɪtə/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The forklift operator moved the heavy crates.',
      exampleVi: 'Người điều khiển xe nâng đã di chuyển các thùng hàng nặng.',
    ),
    VocabModel(
      id: 'v12_23',
      wordEn: 'security guard',
      wordVi: 'Nhân viên bảo vệ',
      pronunciation: '/sɪˈkjʊərɪti ɡɑːd/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The security guard checks the identity of visitors.',
      exampleVi: 'Nhân viên bảo vệ kiểm tra danh tính của khách tham quan.',
    ),
    VocabModel(
      id: 'v12_24',
      wordEn: 'electrician',
      wordVi: 'Thợ điện',
      pronunciation: '/ɪˌlekˈtrɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'He called an electrician to install new lights.',
      exampleVi: 'Anh ấy đã gọi thợ điện đến để lắp đèn mới.',
    ),
    VocabModel(
      id: 'v12_25',
      wordEn: 'architect',
      wordVi: 'Kiến trúc sư',
      pronunciation: '/ˈɑːkɪtekt/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The architect drew the plans for the new house.',
      exampleVi: 'Kiến trúc sư đã vẽ sơ đồ cho ngôi nhà mới.',
    ),
    VocabModel(
      id: 'v12_26',
      wordEn: 'utilities services',
      wordVi: 'Các dịch vụ tiện ích',
      pronunciation: '/juːˈtɪlɪtiz ˈsɜːvɪsɪz/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The cost of utilities services is rising.',
      exampleVi: 'Chi phí của các dịch vụ tiện ích đang tăng lên.',
    ),
    VocabModel(
      id: 'v12_27',
      wordEn: 'billing',
      wordVi: 'Việc tính tiền hoá đơn',
      pronunciation: '/ˈbɪlɪŋ/',
      partOfSpeech: 'v',
      themeId: 'theme_12_housing_property',
      exampleEn: 'There was an error in the monthly billing.',
      exampleVi: 'Đã có một lỗi trong việc tính hóa đơn hàng tháng.',
    ),
    VocabModel(
      id: 'v12_28',
      wordEn: 'repair scheduling',
      wordVi: 'Việc lên kế hoạch sửa chữa',
      pronunciation: '/rɪˈpeə ˈʃedjuːlɪŋ/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Repair scheduling is managed by the maintenance office.',
      exampleVi:
          'Việc lên kế hoạch sửa chữa được quản lý bởi văn phòng bảo trì.',
    ),
    VocabModel(
      id: 'v12_29',
      wordEn: 'delay',
      wordVi: 'Sự chậm trễ, sự trì hoãn',
      pronunciation: '/dɪˈleɪ/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The heavy rain caused a delay in construction.',
      exampleVi: 'Mưa lớn đã gây ra sự chậm trễ trong việc xây dựng.',
    ),
    VocabModel(
      id: 'v12_30',
      wordEn: 'safety',
      wordVi: 'Sự an toàn',
      pronunciation: '/ˈseɪfti/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Safety is our top priority on the construction site.',
      exampleVi: 'An toàn là ưu tiên hàng đầu của chúng tôi tại công trường.',
    ),
    VocabModel(
      id: 'v12_31',
      wordEn: 'workplace',
      wordVi: 'Nơi làm việc',
      pronunciation: '/ˈwɜːkpleɪs/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'A modern workplace should be ergonomic and bright.',
      exampleVi: 'Một nơi làm việc hiện đại nên tiện dụng và sáng sủa.',
    ),
    VocabModel(
      id: 'v12_32',
      wordEn: 'design',
      wordVi: 'Bản thiết kế',
      pronunciation: '/dɪˈzaɪn/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The interior design of the office is very impressive.',
      exampleVi: 'Thiết kế nội thất của văn phòng rất ấn tượng.',
    ),
    VocabModel(
      id: 'v12_33',
      wordEn: 'office',
      wordVi: 'Văn phòng',
      pronunciation: '/ˈɒfɪs/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'He works in a large office building downtown.',
      exampleVi: 'Anh ấy làm việc trong một tòa nhà văn phòng lớn ở trung tâm.',
    ),
    VocabModel(
      id: 'v12_34',
      wordEn: 'manufacturing',
      wordVi: 'Sự sản xuất, chế tạo',
      pronunciation: '/ˌmænjuˈfæktʃərɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Manufacturing processes have become highly automated.',
      exampleVi: 'Các quá trình sản xuất đã trở nên tự động hóa cao.',
    ),
    VocabModel(
      id: 'v12_35',
      wordEn: 'technical',
      wordVi: 'Thuộc kỹ thuật',
      pronunciation: '/ˈteknɪkəl/',
      partOfSpeech: 'adj',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The report provides detailed technical specifications.',
      exampleVi: 'Bản báo cáo cung cấp các thông số kỹ thuật chi tiết.',
    ),
    VocabModel(
      id: 'v12_36',
      wordEn: 'lease',
      wordVi: 'Thuê, hợp đồng thuê',
      pronunciation: '/liːs/',
      partOfSpeech: 'v, n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The company signed a ten-year lease for the warehouse.',
      exampleVi: 'Công ty đã ký hợp đồng thuê kho hàng trong mười năm.',
    ),
    VocabModel(
      id: 'v12_37',
      wordEn: 'premises',
      wordVi: 'Nhà xưởng, cơ sở kinh doanh',
      pronunciation: '/ˈpremɪsɪz/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Smoking is prohibited on the business premises.',
      exampleVi: 'Hút thuốc bị cấm trong cơ sở kinh doanh.',
    ),
    VocabModel(
      id: 'v12_38',
      wordEn: 'rental contract',
      wordVi: 'Hợp đồng thuê',
      pronunciation: '/ˈrentəl ˈkɒntrækt/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Read the rental contract carefully before signing.',
      exampleVi: 'Đọc kỹ hợp đồng thuê trước khi ký.',
    ),
    VocabModel(
      id: 'v12_39',
      wordEn: 'termination',
      wordVi: 'Sự chấm dứt hợp đồng',
      pronunciation: '/ˌtɜːmɪˈneɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Early termination of the lease requires a penalty fee.',
      exampleVi: 'Chấm dứt hợp đồng thuê sớm yêu cầu phí phạt.',
    ),
    VocabModel(
      id: 'v12_40',
      wordEn: 'security deposit',
      wordVi: 'Tiền đặt cọc',
      pronunciation: '/sɪˈkjʊərɪti dɪˈpɒzɪt/',
      partOfSpeech: 'np',
      themeId: 'theme_12_housing_property',
      exampleEn: 'You must pay a security deposit of one month\'s rent.',
      exampleVi: 'Bạn phải trả tiền đặt cọc bằng một tháng tiền thuê.',
    ),
    VocabModel(
      id: 'v12_41',
      wordEn: 'refurbish',
      wordVi: 'Tân trang, cải tạo',
      pronunciation: '/ˌriːˈfɜːbɪʃ/',
      partOfSpeech: 'v',
      themeId: 'theme_12_housing_property',
      exampleEn: 'They decided to refurbish the old office.',
      exampleVi: 'Họ quyết định tân trang lại văn phòng cũ.',
    ),
    VocabModel(
      id: 'v12_42',
      wordEn: 'refit',
      wordVi: 'Tân trang, cải tạo',
      pronunciation: '/ˌriːˈfɪt/',
      partOfSpeech: 'v',
      themeId: 'theme_12_housing_property',
      exampleEn: 'The ship was sent for a refit.',
      exampleVi: 'Con tàu đã được gửi đi để tân trang.',
    ),
    VocabModel(
      id: 'v12_43',
      wordEn: 'renovate',
      wordVi: 'Nâng cấp, cải tạo',
      pronunciation: '/ˈrenəveɪt/',
      partOfSpeech: 'v',
      themeId: 'theme_12_housing_property',
      exampleEn: 'We plan to renovate the kitchen next year.',
      exampleVi: 'Chúng tôi dự định cải tạo nhà bếp vào năm tới.',
    ),
    VocabModel(
      id: 'v12_44',
      wordEn: 'complain about',
      wordVi: 'Phàn nàn về cái gì',
      pronunciation: '/kəmˈpleɪn əˈbaʊt/',
      partOfSpeech: 'vp',
      themeId: 'theme_12_housing_property',
      exampleEn: 'Customers often complain about poor service.',
      exampleVi: 'Khách hàng thường phàn nàn về dịch vụ kém.',
    ),
    VocabModel(
      id: 'v12_45',
      wordEn: 'overlap with',
      wordVi: 'Chồng chéo với cái gì, trùng lặp với cái gì',
      pronunciation: '/ˌəʊvəˈlæp wɪð/',
      partOfSpeech: 'vp',
      themeId: 'theme_12_housing_property',
      exampleEn: 'My schedule overlaps with yours.',
      exampleVi: 'Lịch trình của tôi chồng chéo với lịch của bạn.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB VOCABULARY - DAY 1
  // ═══════════════════════════════════════════════════════════════
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

  static List<FabPhraseItem> get day1ReadingPhrases => const [
    FabPhraseItem(phrase: 'Building construction', meaning: 'Xây dựng'),
    FabPhraseItem(phrase: 'Overlap with', meaning: 'Chổng chéo với'),
    FabPhraseItem(phrase: 'Complain about', meaning: 'Phàn nàn về'),
    FabPhraseItem(phrase: 'Incorrect billing', meaning: 'Tính sai hoá đơn'),
    FabPhraseItem(
      phrase: 'Repair scheduling',
      meaning: 'Lên kế hoạch sửa chữa',
    ),
  ];

  static List<FabAnswerItem> get day1ReadingAnswers => const [
    FabAnswerItem(vi: 'các toà nhà', en: 'buildings'),
    FabAnswerItem(vi: 'xây dựng các toà nhà', en: 'building construction'),
    FabAnswerItem(vi: 'kỹ thuật', en: 'engineering'),
    FabAnswerItem(vi: 'điện', en: 'electricity'),
    FabAnswerItem(vi: 'bảo trì tòa nhà', en: 'building maintenance'),
    FabAnswerItem(vi: 'nâng cấp cải tạo', en: 'renovations'),
    FabAnswerItem(vi: 'tài sản', en: 'property'),
    FabAnswerItem(vi: 'các bãi đỗ xe', en: 'parking lots'),
    FabAnswerItem(vi: 'nơi chứa đổ', en: 'storage facilities'),
    FabAnswerItem(vi: 'kho hàng', en: 'warehouses'),
    FabAnswerItem(vi: 'liên quan đến', en: 'related to'),
    FabAnswerItem(vi: 'người giám sát', en: 'superintendent'),
    FabAnswerItem(vi: 'lao công', en: 'cleaning staff'),
    FabAnswerItem(vi: 'kỹ thuật viên', en: 'technician'),
    FabAnswerItem(vi: 'người đo vẽ bản đồ', en: 'surveyor'),
    FabAnswerItem(vi: 'công nhân xây dựng', en: 'construction worker'),
    FabAnswerItem(vi: 'nhân viên bãi đỗ xe', en: 'parking lot attendant'),
    FabAnswerItem(vi: 'người điều khiển xe nâng', en: 'forklift operator'),
    FabAnswerItem(vi: 'nhân viên an ninh', en: 'security guard'),
    FabAnswerItem(vi: 'thợ điện', en: 'electrician'),
    FabAnswerItem(vi: 'kiến trúc sư', en: 'architect'),
  ];

  static List<FabPhraseItem> get day2ConversationPhrases => const [
    FabPhraseItem(phrase: 'In walking distance', meaning: 'Trong tầm đi bộ'),
    FabPhraseItem(phrase: 'Prestige building', meaning: 'Tòa nhà cao cấp'),
    FabPhraseItem(
      phrase: 'Make up the difference',
      meaning: 'Bù vào chênh lệch',
    ),
    FabPhraseItem(phrase: 'Rent increase', meaning: 'Tăng tiền thuê'),
  ];

  static List<FabAnswerItem> get day2ConversationAnswers => const [
    FabAnswerItem(vi: 'căn hộ mới của tôi', en: 'my new apartment'),
    FabAnswerItem(vi: 'rộng rãi', en: 'spacious'),
    FabAnswerItem(vi: 'sáng sủa', en: 'bright'),
    FabAnswerItem(vi: 'Mọi thứ tôi cần', en: 'Everything I need'),
    FabAnswerItem(vi: 'trong tầm đi bộ', en: 'in walking distance'),
    FabAnswerItem(vi: 'tàu điện ngầm', en: 'the subway'),
    FabAnswerItem(
      vi: 'ngay bên ngoài cổng trước',
      en: 'right outside the front gate',
    ),
    FabAnswerItem(vi: 'nghe có vẻ lý tưởng', en: 'sounds perfect'),
    FabAnswerItem(vi: 'rất nhiều tiền', en: 'an awful lot of money'),
    FabAnswerItem(vi: 'tòa nhà cao cấp', en: 'prestige building'),
    FabAnswerItem(vi: 'giống như', en: 'the same as'),
    FabAnswerItem(vi: 'nơi ở cũ của tôi', en: 'my old place'),
    FabAnswerItem(vi: 'chuẩn bị đi nước ngoài', en: 'is leaving the country'),
    FabAnswerItem(vi: 'đã đồng ý', en: 'agreed'),
    FabAnswerItem(vi: 'bù vào khoản chênh lệch', en: 'make up the difference'),
    FabAnswerItem(vi: 'Điều đó thật tuyệt', en: 'That\'s great'),
    FabAnswerItem(vi: 'chỉ hi vọng', en: 'just hope'),
    FabAnswerItem(vi: 'bản hợp đồng đó', en: 'that lease'),
    FabAnswerItem(vi: 'khi nó kết thúc', en: 'when it ends'),
    FabAnswerItem(vi: 'chắc chắn', en: 'no doubt'),
  ];

  static List<FabPhraseItem> get day2ShortTalk1Phrases => const [
    FabPhraseItem(phrase: 'As you can see', meaning: 'Như bạn có thể thấy'),
    FabPhraseItem(phrase: 'Follow me', meaning: 'Đi theo tôi'),
    FabPhraseItem(phrase: 'Feel free to', meaning: 'Cứ tự nhiên'),
    FabPhraseItem(phrase: 'Go upstairs', meaning: 'Đi lên tầng trên'),
  ];

  static List<FabAnswerItem> get day2ShortTalk1Answers => const [
    FabAnswerItem(vi: 'cho phép tôi giới thiệu', en: 'let me tell you'),
    FabAnswerItem(vi: 'đã được xây dựng', en: 'was built'),
    FabAnswerItem(vi: 'như bạn có thể thấy', en: 'as you can see'),
    FabAnswerItem(
      vi: 'trong tình trạng khá tốt',
      en: 'in remarkably good condition',
    ),
    FabAnswerItem(vi: 'đi theo tôi', en: 'follow me'),
    FabAnswerItem(vi: 'cửa trước', en: 'front door'),
    FabAnswerItem(vi: 'nhận thấy', en: 'notice'),
    FabAnswerItem(vi: 'khá rộng rãi', en: 'quite spacious'),
    FabAnswerItem(
      vi: 'đã được sửa sang lại toàn bộ',
      en: 'was totally renovated',
    ),
    FabAnswerItem(vi: 'phòng khách', en: 'living room'),
    FabAnswerItem(vi: 'rất nhiều không gian', en: 'plenty of room'),
    FabAnswerItem(vi: 'đồ nội thất', en: 'furniture'),
    FabAnswerItem(vi: 'cửa sổ nhìn ra vịnh', en: 'bay window'),
    FabAnswerItem(vi: 'sáng sủa', en: 'bright'),
    FabAnswerItem(vi: 'sàn gỗ', en: 'real wood flooring'),
    FabAnswerItem(vi: 'có lẽ sẽ không thể tìm', en: 'are not likely to find'),
    FabAnswerItem(vi: 'khoảng giá', en: 'price range'),
    FabAnswerItem(vi: 'cứ tự nhiên xem', en: 'feel free to take a look'),
    FabAnswerItem(vi: 'lên tầng trên', en: 'go upstairs'),
    FabAnswerItem(vi: 'phòng tắm lớn', en: 'master bathroom'),
  ];

  static List<FabAnswerItem> get day2ShortTalk2Answers => const [
    FabAnswerItem(vi: 'một vài lời khuyên', en: 'a few tips'),
    FabAnswerItem(vi: 'thuê cơ sở kinh doanh', en: 'leasing business premises'),
    FabAnswerItem(vi: 'tìm hữu ích', en: 'find useful'),
    FabAnswerItem(vi: 'ký hợp đồng thuê', en: 'sign a lease'),
    FabAnswerItem(vi: 'địa điểm tốt nhất', en: 'best location'),
    FabAnswerItem(vi: 'Tìm kiếm dấu hiệu', en: 'Look for the indicators'),
    FabAnswerItem(vi: 'tốt cho kinh doanh', en: 'good for business'),
    FabAnswerItem(vi: 'giao thông công cộng', en: 'public transportation'),
    FabAnswerItem(vi: 'thuận tiện', en: 'convenient'),
    FabAnswerItem(vi: 'khách hàng', en: 'clients'),
    FabAnswerItem(vi: 'trông thích hợp', en: 'look appropriate'),
    FabAnswerItem(
      vi: 'xem xét các lựa chọn khác',
      en: 'look into other options',
    ),
    FabAnswerItem(vi: 'ép buộc', en: 'force yourself'),
    FabAnswerItem(vi: 'hợp đồng thuê dài hạn', en: 'long-term lease'),
    FabAnswerItem(vi: 'tiếp tục cân nhắc', en: 'proceed to consider'),
    FabAnswerItem(vi: 'Đơn giá cho thuê', en: 'Rental rates'),
    FabAnswerItem(vi: 'phụ thuộc vào', en: 'depend on'),
    FabAnswerItem(
      vi: 'doanh nghiệp vừa và nhỏ',
      en: 'small and medium-sized enterprises',
    ),
    FabAnswerItem(vi: 'trong khoảng 5 năm', en: 'for as long as five years'),
    FabAnswerItem(vi: 'được đảm bảo', en: 'are guaranteed'),
    FabAnswerItem(vi: 'có thể chi trả', en: 'can afford'),
  ];

  static List<FabPhraseItem> get day2ShortTalk2Phrases => const [
    FabPhraseItem(phrase: 'Make sure', meaning: 'Chắc chắn rằng'),
    FabPhraseItem(phrase: 'Look for', meaning: 'Tìm kiếm'),
    FabPhraseItem(phrase: 'Sign a lease', meaning: 'Ký hợp đồng thuê'),
    FabPhraseItem(phrase: 'Long-term lease', meaning: 'Hợp đồng thuê dài hạn'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme12_day1',
    dayNumber: 1,
    themeId: 'theme_12_housing_property',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      LessonPhase(
        id: 'theme12_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_47',
        contentEn:
            '''This theme is about buildings and will include building construction, engineering, electricity and gas services, building maintenance, some buying and renting, renovations, repairs, as well as property outside of a building such as parking lots, storage facilities and warehouses.

This theme is related, and overlaps with, the Manufacturing and Technical Areas themes.

Common vocabulary: people such as superintendent, janitor, cleaning staff, technician, surveyor, construction worker, parking lot attendant, office manager, forklift operator, security guard, electrician, architect.

Conversations and reading will be about the providing of utilities services, complaining about incorrect billing for such services, renovation or repair scheduling, delays, safety in the workplace, design of offices. You may also hear conversations about leasing premises, rental contracts, termination of lease/rent, long or short term lease, security deposit. Words that have similar meanings but differ slightly would include: fix, repair, refurbish, refit, renovate.''',
        contentVi:
            '''Chuyên đề này là về nhà cửa và sẽ nói về việc xây dựng các tòa nhà, kỹ thuật, dịch vụ điện và khí đốt, bảo trì tòa nhà, một số mua bán và thuê mướn, nâng cấp, sửa chữa, cũng như tài sản bên ngoài một tòa nhà như bãi đỗ xe, nơi chứa đổ và kho hàng.

Chuyên đề này liên quan đến, và cũng chổng chéo với các chuyên đề Sản xuất và Kỹ thuật.

Các từ vựng thường gặp là: các danh từ chỉ người như người giám sát, người gác cửa, lao công, kỹ thuật viên, người đo vẽ bản đổ địa hình, công nhân xây dựng, nhân viên bãi đỗ xe, quản lý văn phòng, người điều khiển xe nâng, nhân viên an ninh, thợ điện, kiến trúc sư.

Các đoạn hội thoại và các bài đọc sẽ tập trung vào nội dung như việc cung cấp các dịch vụ tiện ích, phàn nàn vể việc tính sai hoá đơn cho những dịch vụ như trên, việc lên kế hoạch nâng cấp hoặc sửa chữa, những sự trì hoãn, an toàn ở công trường, hay việc thiết kế các văn phòng. Bạn cũng có thể nghe thấy các đoạn hội thoại về việc thuê các cơ sở kinh doanh, hợp đổng cho thuê, chấm dứt hợp đổng cho thuê, hợp đổng dài hạn và ngắn hạn, tiền đặt cọc. Các từ có nghĩa tương tự nhau, chỉ khác ứ"! chút bao gồm: fix và repair (sửa chữa), refurbish, refit, và renovate (cải tạo).''',
        fabVocab: Theme12Content.readingVocab,
        fabPhrases: Theme12Content.day1ReadingPhrases,
      ),
      LessonPhase(
        id: 'theme12_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_47',
      ),
      LessonPhase(
        id: 'theme12_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme12Content.day1ReadingAnswers,
      ),
      LessonPhase(
        id: 'theme12_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.english('This theme is about '),
    const MixedSegment.vietnamese('các toà nhà', 'buildings'),
    const MixedSegment.english(' and will include '),
    const MixedSegment.vietnamese(
      'xây dựng các toà nhà',
      'building construction',
    ),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('kỹ thuật', 'engineering'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('điện', 'electricity'),
    const MixedSegment.english(' and gas services, '),
    const MixedSegment.vietnamese('bảo trì tòa nhà', 'building maintenance'),
    const MixedSegment.english(', some buying and renting, '),
    const MixedSegment.vietnamese('nâng cấp cải tạo', 'renovations'),
    const MixedSegment.english(', repairs, as well as '),
    const MixedSegment.vietnamese('tài sản', 'property'),
    const MixedSegment.english(' outside of a building such as '),
    const MixedSegment.vietnamese('các bãi đỗ xe', 'parking lots'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('nơi chứa đổ', 'storage facilities'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('kho hàng', 'warehouses'),
    const MixedSegment.english('.'),
    const MixedSegment.english('This theme is '),
    const MixedSegment.vietnamese('liên quan đến', 'related to'),
    const MixedSegment.english(
      ', and overlaps with, the Manufacturing and Technical Areas themes.',
    ),
    const MixedSegment.english('Common vocabulary: people such as '),
    const MixedSegment.vietnamese('người giám sát', 'superintendent'),
    const MixedSegment.english(', janitor, '),
    const MixedSegment.vietnamese('lao công', 'cleaning staff'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('kỹ thuật viên', 'technician'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('người đo vẽ bản đồ', 'surveyor'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('công nhân xây dựng', 'construction worker'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese(
      'nhân viên bãi đỗ xe',
      'parking lot attendant',
    ),
    const MixedSegment.english(', office manager, '),
    const MixedSegment.vietnamese(
      'người điều khiển xe nâng',
      'forklift operator',
    ),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('nhân viên an ninh', 'security guard'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('thợ điện', 'electrician'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('kiến trúc sư', 'architect'),
    const MixedSegment.english('.'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme12_day2',
    dayNumber: 2,
    themeId: 'theme_12_housing_property',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      LessonPhase(
        id: 'theme12_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation - Apartment Rental',
        titleVi: 'Luyện tập 1: Hội thoại - Thuê căn hộ',
        audioTrackKey: 'track_48',
        contentEn:
            '''M: I am so happy with my new apartment. It's so spacious and bright. Everything I need is in walking distance, and the subway to the office is right outside the front gate.
W: It sounds perfect. But you're probably paying an awful lot of money. That is a popular location and prestige building, isn't it?
M: I'm paying the same as I did for my old place. I got this from someone who already has a lease but is leaving the country. He agreed to give it to me for what I paid before and he will make up the difference.
W: That's great. I just hope there's a long time left on that lease because when it ends you'll no doubt face a big rent increase.''',
        contentVi:
            '''M: Tôi vô cùng hạnh phúc với căn hộ mới của tôi. Nó thật rộng rãi và sáng sủa. Mọi thứ tôi cần đều ở trong tầm đi bộ, và ga tàu điện ngầm đến văn phòng thì ngay bên ngoài cổng trước.
W: Nó nghe có vẻ thật lý tưởng. Nhưng anh có lẽ đang phải trả rất nhiều tiền cho nó. Nó là một toà nhà cao cấp nằm ở địa điểm đẹp đúng không?
M: Tôi đang trả khoản tiền giống như tôi đã chi trả cho nơi ở cũ của tôi. Tôi thuê nó từ một người mà đang thuê nó rồi nhưng chuẩn bị đi nước ngoài. Anh ta đã đồng ý cho tôi thuê lại bằng với khoản tiền tôi đã trả trước đó và anh ta sẽ bù vào khoản chênh lệch.
W: Điều đó thật tuyệt. Tôi chỉ hi vọng sẽ còn nhiều thời gian trong hợp đồng bởi vì khi nó kết thúc anh chắc chắn sẽ đối mặt với một mức tăng lớn về tiền thuê nhà.''',
        questions: _practice1Questions,
        fabVocab: Theme12Content.conversationVocab,
        fabPhrases: Theme12Content.day2ConversationPhrases,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 1 (C): Ga tàu điện ngầm đến văn phòng ở ngay cửa, nhưng không nói văn phòng ở gần = Không đúng về căn hộ.',
            en: 'Q1 (C): Subway to the office is right outside, but it doesn\'t say the office is close = NOT true about the apartment.',
          ),
          const FabAnswerItem(
            vi: 'Câu 2 (C): Người thuê trước đồng ý bù vào khoản chênh lệch tiền thuê = Có người trả một phần tiền thuê.',
            en: 'Q2 (C): The previous tenant agreed to make up the difference in rent = Someone else pays part of the rent.',
          ),
          const FabAnswerItem(
            vi: 'Câu 3 (D): Người phụ nữ lo ngại người thuê sẽ đối mặt với việc tăng tiền thuê lớn khi hợp đồng kết thúc.',
            en: 'Q3 (D): The woman is concerned that the tenant will face a big rent increase when the lease ends.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme12_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk - House Tour',
        titleVi: 'Luyện tập 2: Bài ngắn - Tham quan nhà',
        audioTrackKey: 'track_49',
        contentEn:
            '''Alright, now let me tell you something about the property. This house was built in the 1930s and, as you can see, it is in remarkably good condition considering the age. If you just follow me through the front door, you'll notice that the kitchen is quite spacious as it was totally renovated just three months ago. The living room is also huge. There's plenty of room for your furniture and the bay window in here keeps the room bright and cheerful until early evening. Also, notice the real wood flooring in this room. That's something you are not likely to find in a property in this price range. OK, feel free to take a look around, and in a minute we'll go upstairs to check out the master bathroom.''',
        contentVi:
            '''Nào, bây giờ cho phép tôi giới thiệu với quý vị về ngôi nhà này. Ngôi nhà này được xây dựng vào những năm 1930 và như quý vị có thể thấy, nó vẫn trong điều kiện rất tốt so với tuổi thọ của mình. Nếu quý vị đi theo tôi qua cánh cửa chính, quý vị sẽ thấy nhà bếp khá rộng rãi vì nó đã được sửa sang lại toàn bộ cách đây chỉ 3 tháng. Phòng khách cũng rất lớn. Có nhiều không gian cho các đồ nội thất, và cửa sổ nhìn ra vịnh làm cho căn phòng sáng sủa và tươi vui cho tới tận lúc chập tối. Và xin hãy chú ý tới sàn nhà lát gỗ tự nhiên trong căn phòng này. Đó là điều mà quý vị khó có thể tìm thấy trong bất kỳ ngôi nhà nào ở mức giá này. Xin cứ tự nhiên tham quan xung quanh và một lát nữa chúng ta sẽ đi lên tầng trên để xem cái phòng tắm lớn.''',
        questions: _practice2Questions,
        fabVocab: Theme12Content.shortTalk1Vocab,
        fabPhrases: Theme12Content.day2ShortTalk1Phrases,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 4 (A): Ngôi nhà xây từ những năm 1930 và đang ở tình trạng rất tốt = Cũ nhưng được bảo trì tốt.',
            en: 'Q4 (A): The house was built in the 1930s and is in remarkably good condition = Old but well-maintained.',
          ),
          const FabAnswerItem(
            vi: 'Câu 5 (D): "The living room is also huge. There\'s plenty of room for your furniture" = Rất nhiều không gian.',
            en: 'Q5 (D): "The living room is also huge. There\'s plenty of room for your furniture" = A lot of space.',
          ),
          const FabAnswerItem(
            vi: 'Câu 6 (B): "we\'ll go upstairs to check out the master bathroom" = Lên tầng hai.',
            en: 'Q6 (B): "we\'ll go upstairs to check out the master bathroom" = Take the visitors to the second floor.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme12_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk - Business Leasing Tips',
        titleVi: 'Luyện tập 3: Bài ngắn - Mẹo thuê cơ sở kinh doanh',
        audioTrackKey: 'track_50',
        contentEn:
            '''Ladies and gentlemen, I'm here today with a few tips on leasing business premises that I think most of you would find useful. Before you sign a lease on a space for your business, make sure you have found the best location. Look for the indicators of a neighborhood that is good for business. For example, are there other successful businesses occupying spaces nearby? Is there good access to public transportations? Is the area convenient for customers and clients? If the conditions don't look appropriate for your business, look into other options. Don't force yourself to sign a long-term lease on a space that isn't right for you. Once you have found the right space for your business, you could proceed to consider signing a long-term lease. Rental rates often fluctuate and depend on the length of the lease. For small and medium-sized enterprises like yours, I think it would be a good idea to sign a lease for as long as five years. That way, you are guaranteed a rent you can afford.''',
        contentVi:
            '''Thưa các quý vị, tôi ở đây ngày hôm nay để cung cấp cho quý vị một vài lời khuyên về việc thuê các cơ sở kinh doanh mà tôi nghĩ hầu hết các quý vị sẽ cảm thấy hữu ích. Trước khi đặt bút ký vào một hợp đồng thuê địa điểm kinh doanh, hãy chắc chắn là quý vị đã tìm được địa điểm tốt nhất. Hãy tìm kiếm những dấu hiệu của khu vực quanh đây tốt cho công việc kinh doanh. Ví dụ như, có các công ty thành công nào khác đang làm ăn ở gần đó không? Địa điểm đó có thuận tiện kết nối với giao thông công cộng không? Khu vực đó có thuận tiện cho khách hàng không? Nếu các điều kiện không thích hợp cho việc kinh doanh của quý vị, hãy xem xét các lựa chọn khác. Đừng buộc mình phải ký một hợp đồng thuê dài hạn đối với một địa điểm không phù hợp với quý vị. Khi quý vị đã tìm được không gian thích hợp cho việc kinh doanh, quý vị có thể tiến hành cân nhắc về việc ký một hợp đồng thuê dài hạn. Giá thuê thường dao động và phụ thuộc vào thời gian thuê. Đối với các doanh nghiệp vừa và nhỏ như của quý vị, tôi nghĩ việc ký một hợp đồng thuê có thời hạn khoảng 5 năm sẽ là một ý hay. Như thế, quý vị được bảo đảm về khoản tiền thuê mà quý vị có thể chi trả.''',
        questions: _practice3Questions,
        fabVocab: Theme12Content.shortTalk2Vocab,
        fabPhrases: Theme12Content.day2ShortTalk2Phrases,
        fabAnswers: [
          const FabAnswerItem(
            vi: 'Câu 7 (B): Bài nói dành cho người chuẩn bị "leasing business premises" = Người thuê.',
            en: 'Q7 (B): The talk targets people "leasing business premises" = Tenants.',
          ),
          const FabAnswerItem(
            vi: 'Câu 8 (B): "make sure you have found the best location. Look for the indicators of a neighborhood" = Xem xét khu vực lân cận.',
            en: 'Q8 (B): "make sure you have found the best location. Look for the indicators of a neighborhood" = Look at the neighborhood.',
          ),
          const FabAnswerItem(
            vi: 'Câu 9 (C): "it would be a good idea to sign a lease for as long as five years" = Năm năm.',
            en: 'Q9 (C): "it would be a good idea to sign a lease for as long as five years" = Five years.',
          ),
        ],
      ),
      LessonPhase(
        id: 'theme12_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Apartment Rental',
        titleVi: 'Huấn luyện Trí nhớ: Thuê căn hộ',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme12Content.conversationVocab,
        fabPhrases: Theme12Content.day2ConversationPhrases,
        fabAnswers: Theme12Content.day2ConversationAnswers,
      ),
      LessonPhase(
        id: 'theme12_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: House Tour',
        titleVi: 'Huấn luyện Trí nhớ: Tham quan nhà',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme12Content.shortTalk1Vocab,
        fabPhrases: Theme12Content.day2ShortTalk1Phrases,
        fabAnswers: Theme12Content.day2ShortTalk1Answers,
      ),
      LessonPhase(
        id: 'theme12_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Business Leasing',
        titleVi: 'Huấn luyện Trí nhớ: Thuê kinh doanh',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme12Content.shortTalk2Vocab,
        fabPhrases: Theme12Content.day2ShortTalk2Phrases,
        fabAnswers: Theme12Content.day2ShortTalk2Answers,
      ),
    ],
  );

  // ═══════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ═══════════════════════════════════════════════════════════════
  static List<QuizQuestion> get _practice1Questions => [
    const QuizQuestion(
      id: 'theme12_q01',
      questionText: 'What is NOT true about the apartment?',
      options: [
        '(A) It has a lot of space.',
        '(B) It is bright.',
        '(C) It is close to the man\'s office.',
        '(D) It is close to the subway.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_48',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme12_q02',
      questionText: 'Why is the man\'s rent low?',
      options: [
        '(A) It is an old building.',
        '(B) It is not a popular location.',
        '(C) Someone else pays part of the rent.',
        '(D) The apartment is small.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_48',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme12_q03',
      questionText: 'What is the woman concerned about?',
      options: [
        '(A) The lease is too long.',
        '(B) There was no lease.',
        '(C) The previous tenant may want the apartment back.',
        '(D) The rent will go up.',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_48',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    const QuizQuestion(
      id: 'theme12_q04',
      questionText: 'According to the speaker, what is true about the house?',
      options: [
        '(A) It is old but well-maintained.',
        '(B) It was built 30 years ago.',
        '(C) It has not been renovated.',
        '(D) It is a small house.',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_49',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme12_q05',
      questionText: 'What does the speaker say about the living room?',
      options: [
        '(A) It is quite small but pretty.',
        '(B) There is a bright lamp.',
        '(C) It was renovated three months ago.',
        '(D) It has a lot of space.',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_49',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme12_q06',
      questionText: 'What will the speaker do next?',
      options: [
        '(A) Show the visitors the kitchen',
        '(B) Take the visitors to the second floor',
        '(C) Leave the house',
        '(D) Talk about the price',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_49',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
      id: 'theme12_q07',
      questionText: 'Who is this talk aimed at?',
      options: [
        '(A) Landlords',
        '(B) Tenants',
        '(C) Commuters',
        '(D) Customers and clients',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_50',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme12_q08',
      questionText:
          'According to the speaker, what should a business owner do before signing a lease?',
      options: [
        '(A) Make sure that the rental rate is the lowest',
        '(B) Look at the neighborhood',
        '(C) Inform his customers and clients',
        '(D) Make sure that his business is successful',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_50',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme12_q09',
      questionText: 'What length of time does the speaker suggest for a lease?',
      options: [
        '(A) One year',
        '(B) Three years',
        '(C) Five years',
        '(D) Ten years',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_50',
      practiceNumber: 'practice3',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // MIND GAME SEGMENTS
  // ═══════════════════════════════════════════════════════════════
  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('M: I am so happy with '),
    const MixedSegment.vietnamese('căn hộ mới của tôi', 'my new apartment'),
    const MixedSegment.english('. It\'s so '),
    const MixedSegment.vietnamese('rộng rãi', 'spacious'),
    const MixedSegment.english(' and '),
    const MixedSegment.vietnamese('sáng sủa', 'bright'),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese('Mọi thứ tôi cần', 'Everything I need'),
    const MixedSegment.english(' is '),
    const MixedSegment.vietnamese('trong tầm đi bộ', 'in walking distance'),
    const MixedSegment.english(', and '),
    const MixedSegment.vietnamese('tàu điện ngầm', 'the subway'),
    const MixedSegment.english(' to the office is '),
    const MixedSegment.vietnamese(
      'ngay bên ngoài cổng trước',
      'right outside the front gate',
    ),
    const MixedSegment.english('.'),
    const MixedSegment.english('W: Nó '),
    const MixedSegment.vietnamese('nghe có vẻ lý tưởng', 'sounds perfect'),
    const MixedSegment.english('. But you\'re probably paying '),
    const MixedSegment.vietnamese('rất nhiều tiền', 'an awful lot of money'),
    const MixedSegment.english('. That is a popular location and '),
    const MixedSegment.vietnamese('tòa nhà cao cấp', 'prestige building'),
    const MixedSegment.english(', isn\'t it?'),
    const MixedSegment.english('M: I\'m paying '),
    const MixedSegment.vietnamese('giống như', 'the same as'),
    const MixedSegment.english(' I did for '),
    const MixedSegment.vietnamese('nơi ở cũ của tôi', 'my old place'),
    const MixedSegment.english(
      '. I got this from someone who already has a lease but ',
    ),
    const MixedSegment.vietnamese(
      'chuẩn bị đi nước ngoài',
      'is leaving the country',
    ),
    const MixedSegment.english('. He '),
    const MixedSegment.vietnamese('đã đồng ý', 'agreed'),
    const MixedSegment.english(
      ' to give it to me for what I paid before and he will ',
    ),
    const MixedSegment.vietnamese(
      'bù vào khoản chênh lệch',
      'make up the difference',
    ),
    const MixedSegment.english('.'),
    const MixedSegment.english('W: '),
    const MixedSegment.vietnamese('Điều đó thật tuyệt', 'That\'s great'),
    const MixedSegment.english('. I '),
    const MixedSegment.vietnamese('chỉ hi vọng', 'just hope'),
    const MixedSegment.english(' there\'s a long time left on '),
    const MixedSegment.vietnamese('bản hợp đồng đó', 'that lease'),
    const MixedSegment.english(' because '),
    const MixedSegment.vietnamese('khi nó kết thúc', 'when it ends'),
    const MixedSegment.english(' you\'ll '),
    const MixedSegment.vietnamese('chắc chắn', 'no doubt'),
    const MixedSegment.english(' face a big rent increase.'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // MIND GAME SEGMENTS
  // ═══════════════════════════════════════════════════════════════

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Alright, now '),
    const MixedSegment.vietnamese('cho phép tôi giới thiệu', 'let me tell you'),
    const MixedSegment.english(' something about the property. This house '),
    const MixedSegment.vietnamese('đã được xây dựng', 'was built'),
    const MixedSegment.english(' in the 1930s and, '),
    const MixedSegment.vietnamese('như bạn có thể thấy', 'as you can see'),
    const MixedSegment.english(', it is '),
    const MixedSegment.vietnamese(
      'trong tình trạng khá tốt',
      'in remarkably good condition',
    ),
    const MixedSegment.english(' considering the age. If you just '),
    const MixedSegment.vietnamese('đi theo tôi', 'follow me'),
    const MixedSegment.english(' through the '),
    const MixedSegment.vietnamese('cửa trước', 'front door'),
    const MixedSegment.english(', you\'ll '),
    const MixedSegment.vietnamese('nhận thấy', 'notice'),
    const MixedSegment.english(' that the kitchen is '),
    const MixedSegment.vietnamese('khá rộng rãi', 'quite spacious'),
    const MixedSegment.english(' as it '),
    const MixedSegment.vietnamese(
      'đã được sửa sang lại toàn bộ',
      'was totally renovated',
    ),
    const MixedSegment.english(' just three months ago. The '),
    const MixedSegment.vietnamese('phòng khách', 'living room'),
    const MixedSegment.english(' is also huge. There\'s '),
    const MixedSegment.vietnamese('rất nhiều không gian', 'plenty of room'),
    const MixedSegment.english(' for your '),
    const MixedSegment.vietnamese('đồ nội thất', 'furniture'),
    const MixedSegment.english(' and the '),
    const MixedSegment.vietnamese('cửa sổ nhìn ra vịnh', 'bay window'),
    const MixedSegment.english(' in here keeps the room '),
    const MixedSegment.vietnamese('sáng sủa', 'bright'),
    const MixedSegment.english(
      ' and cheerful until early evening. Also, notice the ',
    ),
    const MixedSegment.vietnamese('sàn gỗ', 'real wood flooring'),
    const MixedSegment.english(' in this room. That\'s something you '),
    const MixedSegment.vietnamese(
      'có lẽ sẽ không thể tìm',
      'are not likely to find',
    ),
    const MixedSegment.english(' in a property in this '),
    const MixedSegment.vietnamese('khoảng giá', 'price range'),
    const MixedSegment.english('. OK, '),
    const MixedSegment.vietnamese(
      'cứ tự nhiên xem',
      'feel free to take a look',
    ),
    const MixedSegment.english(' around, and in a minute we\'ll '),
    const MixedSegment.vietnamese('lên tầng trên', 'go upstairs'),
    const MixedSegment.english(' to check out the '),
    const MixedSegment.vietnamese('phòng tắm lớn', 'master bathroom'),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english('Ladies and gentlemen, I\'m here today with '),
    const MixedSegment.vietnamese('một vài lời khuyên', 'a few tips'),
    const MixedSegment.english(' on '),
    const MixedSegment.vietnamese(
      'thuê cơ sở kinh doanh',
      'leasing business premises',
    ),
    const MixedSegment.english(' that I think most of you would '),
    const MixedSegment.vietnamese('tìm hữu ích', 'find useful'),
    const MixedSegment.english('. Before you '),
    const MixedSegment.vietnamese('ký hợp đồng thuê', 'sign a lease'),
    const MixedSegment.english(
      ' on a space for your business, make sure you have found the ',
    ),
    const MixedSegment.vietnamese('địa điểm tốt nhất', 'best location'),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese(
      'Tìm kiếm dấu hiệu',
      'Look for the indicators',
    ),
    const MixedSegment.english(' of a neighborhood that is '),
    const MixedSegment.vietnamese('tốt cho kinh doanh', 'good for business'),
    const MixedSegment.english(
      '. For example, are there other successful businesses occupying spaces nearby? Is there good access to ',
    ),
    const MixedSegment.vietnamese(
      'giao thông công cộng',
      'public transportation',
    ),
    const MixedSegment.english('? Is the area '),
    const MixedSegment.vietnamese('thuận tiện', 'convenient'),
    const MixedSegment.english(' for customers and '),
    const MixedSegment.vietnamese('khách hàng', 'clients'),
    const MixedSegment.english('? If the conditions don\'t '),
    const MixedSegment.vietnamese('trông thích hợp', 'look appropriate'),
    const MixedSegment.english(' for your business, '),
    const MixedSegment.vietnamese(
      'xem xét các lựa chọn khác',
      'look into other options',
    ),
    const MixedSegment.english('. Don\'t '),
    const MixedSegment.vietnamese('ép buộc', 'force yourself'),
    const MixedSegment.english(' to sign a '),
    const MixedSegment.vietnamese('hợp đồng thuê dài hạn', 'long-term lease'),
    const MixedSegment.english(
      ' on a space that isn\'t right for you. Once you have found the right space for your business, you could ',
    ),
    const MixedSegment.vietnamese('tiếp tục cân nhắc', 'proceed to consider'),
    const MixedSegment.english(' signing a long-term lease. '),
    const MixedSegment.vietnamese('Đơn giá cho thuê', 'Rental rates'),
    const MixedSegment.english(' often fluctuate and '),
    const MixedSegment.vietnamese('phụ thuộc vào', 'depend on'),
    const MixedSegment.english(' the length of the lease. For '),
    const MixedSegment.vietnamese(
      'doanh nghiệp vừa và nhỏ',
      'small and medium-sized enterprises',
    ),
    const MixedSegment.english(
      ' like yours, I think it would be a good idea to sign a lease ',
    ),
    const MixedSegment.vietnamese(
      'trong khoảng 5 năm',
      'for as long as five years',
    ),
    const MixedSegment.english('. That way, you '),
    const MixedSegment.vietnamese('được đảm bảo', 'are guaranteed'),
    const MixedSegment.english(' a rent you '),
    const MixedSegment.vietnamese('có thể chi trả', 'can afford'),
    const MixedSegment.english('.'),
  ];
}

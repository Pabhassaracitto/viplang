// lib/data/content/theme13_content.dart

import '../models/lesson_model.dart';
import '../models/mixed_segment_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme13Content {
  static ThemeModel get theme => ThemeModel(
    id: 'theme_13_health',
    themeNumber: 13,
    titleEn: 'Technical & Medical Knowledge, Fitness, and Nutrition',
    titleVi: 'Kiến thức Y tế & Kỹ thuật, Thể hình và Dinh dưỡng',
    description:
        'Thăm khám bác sĩ, nha sĩ, thể dục, dinh dưỡng, kiến thực y học kỹ thuật và chăm sóc sức khỏe.',
    iconEmoji: '🏥',
    isUnlocked: false,
    totalDays: 2,
  );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY (52 từ)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
    VocabModel(
      id: 'v13_01',
      wordEn: 'section',
      wordVi: 'Phần',
      pronunciation: '/ˈsekʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The medical report has a section for previous illnesses.',
      exampleVi: 'Báo cáo y tế có một phần dành cho các bệnh trước đây.',
    ),
    VocabModel(
      id: 'v13_02',
      wordEn: 'technical',
      wordVi: 'Thuộc về kỹ thuật, mang tính kỹ thuật',
      pronunciation: '/ˈteknɪkəl/',
      partOfSpeech: 'adj',
      themeId: 'theme_13_health',
      exampleEn: 'The doctor explained the technical details of the surgery.',
      exampleVi: 'Bác sĩ giải thích các chi tiết kỹ thuật của ca phẫu thuật.',
    ),
    VocabModel(
      id: 'v13_03',
      wordEn: 'medical',
      wordVi: 'Thuộc về y học',
      pronunciation: '/ˈmedɪkəl/',
      partOfSpeech: 'adj',
      themeId: 'theme_13_health',
      exampleEn: 'She is a student at a top medical school.',
      exampleVi: 'Cô ấy là sinh viên tại một trường y hàng đầu.',
    ),
    VocabModel(
      id: 'v13_04',
      wordEn: 'knowledge',
      wordVi: 'Kiến thức, sự hiểu biết',
      pronunciation: '/ˈnɒlɪdʒ/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'He has extensive knowledge of human anatomy.',
      exampleVi: 'Anh ấy có kiến thức sâu rộng về giải phẫu người.',
    ),
    VocabModel(
      id: 'v13_05',
      wordEn: 'dentist',
      wordVi: 'Nha sĩ',
      pronunciation: '/ˈdentɪst/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'I have an appointment with my dentist tomorrow.',
      exampleVi: 'Tôi có một cuộc hẹn với nha sĩ của tôi vào ngày mai.',
    ),
    VocabModel(
      id: 'v13_06',
      wordEn: 'assist',
      wordVi: 'Giúp đỡ, hỗ trợ',
      pronunciation: '/əˈsɪst/',
      partOfSpeech: 'v',
      themeId: 'theme_13_health',
      exampleEn: 'The nurse will assist the doctor during the exam.',
      exampleVi: 'Y tá sẽ hỗ trợ bác sĩ trong suốt quá trình khám.',
    ),
    VocabModel(
      id: 'v13_07',
      wordEn: 'nurse',
      wordVi: 'Y tá',
      pronunciation: '/nɜːs/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The nurse took my blood pressure and temperature.',
      exampleVi: 'Y tá đã đo huyết áp và nhiệt độ cho tôi.',
    ),
    VocabModel(
      id: 'v13_08',
      wordEn: 'fitness',
      wordVi: 'Sự khoẻ mạnh, sự rèn luyện thân thể',
      pronunciation: '/ˈfɪtnəs/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Regular exercise is essential for overall fitness.',
      exampleVi:
          'Tập thể dục thường xuyên là điều cần thiết để rèn luyện thân thể toàn diện.',
    ),
    VocabModel(
      id: 'v13_09',
      wordEn: 'nutrition',
      wordVi: 'Dinh dưỡng',
      pronunciation: '/njuːˈtrɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Good nutrition is the key to a healthy life.',
      exampleVi: 'Dinh dưỡng tốt là chìa khóa của một cuộc sống lành mạnh.',
    ),
    VocabModel(
      id: 'v13_10',
      wordEn: 'clinic',
      wordVi: 'Phòng khám',
      pronunciation: '/ˈklɪnɪk/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The local clinic provides free vaccinations.',
      exampleVi: 'Phòng khám địa phương cung cấp dịch vụ tiêm chủng miễn phí.',
    ),
    VocabModel(
      id: 'v13_11',
      wordEn: 'hospital',
      wordVi: 'Bệnh viện',
      pronunciation: '/ˈhɒspɪtəl/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'She works as a surgeon at the city hospital.',
      exampleVi:
          'Cô ấy làm việc như một bác sĩ phẫu thuật tại bệnh viện thành phố.',
    ),
    VocabModel(
      id: 'v13_12',
      wordEn: 'ambulance',
      wordVi: 'Xe cứu thương, xe cấp cứu',
      pronunciation: '/ˈæmbjələns/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The ambulance arrived within minutes of the call.',
      exampleVi: 'Xe cứu thương đã đến trong vòng vài phút sau cuộc gọi.',
    ),
    VocabModel(
      id: 'v13_13',
      wordEn: 'emergency',
      wordVi: 'Tình trạng khẩn cấp',
      pronunciation: '/ɪˈmɜːdʒənsi/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Dial 911 in case of a medical emergency.',
      exampleVi: 'Quay số 911 trong trường hợp khẩn cấp về y tế.',
    ),
    VocabModel(
      id: 'v13_14',
      wordEn: 'medical checkup',
      wordVi: 'Việc kiểm tra sức khoẻ, kiểm tra y tế',
      pronunciation: '/ˈmedɪkəl ˈtʃekʌp/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn: 'You should have a medical checkup once a year.',
      exampleVi: 'Bạn nên đi kiểm tra sức khỏe mỗi năm một lần.',
    ),
    VocabModel(
      id: 'v13_15',
      wordEn: 'surgeon',
      wordVi: 'Bác sĩ phẫu thuật',
      pronunciation: '/ˈsɜːdʒən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The surgeon performed the heart transplant successfully.',
      exampleVi: 'Bác sĩ phẫu thuật đã thực hiện ca ghép tim thành công.',
    ),
    VocabModel(
      id: 'v13_16',
      wordEn: 'flu shot',
      wordVi: 'Tiêm phòng bệnh cúm',
      pronunciation: '/fluː ʃɒt/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn: 'It is recommended to get a flu shot every autumn.',
      exampleVi: 'Nên tiêm phòng cúm vào mỗi mùa thu.',
    ),
    VocabModel(
      id: 'v13_17',
      wordEn: 'vaccination',
      wordVi: 'Việc tiêm chủng',
      pronunciation: '/ˌvæksɪˈneɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The vaccination campaign aims to eradicate the virus.',
      exampleVi: 'Chiến dịch tiêm chủng nhằm mục đích xóa sổ virus.',
    ),
    VocabModel(
      id: 'v13_18',
      wordEn: 'immunization',
      wordVi: 'Sự miễn dịch',
      pronunciation: '/ˌɪmjunaɪˈzeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Childhood immunization protects against measles.',
      exampleVi: 'Miễn dịch ở trẻ em giúp bảo vệ chống lại bệnh sởi.',
    ),
    VocabModel(
      id: 'v13_19',
      wordEn: 'medicine',
      wordVi: 'Thuốc, y học',
      pronunciation: '/ˈmedsən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Advances in medicine have increased life expectancy.',
      exampleVi: 'Những tiến bộ trong y học đã làm tăng tuổi thọ.',
    ),
    VocabModel(
      id: 'v13_20',
      wordEn: 'medication',
      wordVi: 'Thuốc thang',
      pronunciation: '/ˌmedɪˈkeɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'He needs to take his medication twice a day.',
      exampleVi: 'Anh ấy cần uống thuốc hai lần một ngày.',
    ),
    VocabModel(
      id: 'v13_21',
      wordEn: 'operation',
      wordVi: 'Ca phẫu thuật, sự phẫu thuật',
      pronunciation: '/ˌɒpəˈreɪʃən/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The operation lasted for over five hours.',
      exampleVi: 'Ca phẫu thuật kéo dài hơn năm giờ.',
    ),
    VocabModel(
      id: 'v13_22',
      wordEn: 'fever',
      wordVi: 'Sốt',
      pronunciation: '/ˈfiːvə/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'A high fever can be a symptom of an infection.',
      exampleVi: 'Sốt cao có thể là triệu chứng của một sự nhiễm trùng.',
    ),
    VocabModel(
      id: 'v13_23',
      wordEn: 'headache',
      wordVi: 'Đau đầu',
      pronunciation: '/ˈhedeɪk/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Stress often causes a severe headache.',
      exampleVi: 'Căng thẳng thường gây ra đau đầu dữ dội.',
    ),
    VocabModel(
      id: 'v13_24',
      wordEn: 'sore throat',
      wordVi: 'Đau họng, viêm họng',
      pronunciation: '/sɔː θrəʊt/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn: 'Warm salt water can help soothe a sore throat.',
      exampleVi: 'Nước muối ấm có thể giúp làm dịu cơn đau họng.',
    ),
    VocabModel(
      id: 'v13_25',
      wordEn: 'examine',
      wordVi: 'Khám bệnh',
      pronunciation: '/ɪɡˈzæmɪn/',
      partOfSpeech: 'v',
      themeId: 'theme_13_health',
      exampleEn: 'The doctor will examine the patient’s lungs.',
      exampleVi: 'Bác sĩ sẽ khám phổi của bệnh nhân.',
    ),
    VocabModel(
      id: 'v13_26',
      wordEn: 'consult',
      wordVi: 'Xin tư vấn, tham khảo ý kiến',
      pronunciation: '/kənˈsʌlt/',
      partOfSpeech: 'v',
      themeId: 'theme_13_health',
      exampleEn: 'You should consult a specialist about this condition.',
      exampleVi: 'Bạn nên tham khảo ý kiến chuyên gia về tình trạng này.',
    ),
    VocabModel(
      id: 'v13_27',
      wordEn: 'check',
      wordVi: 'Kiểm tra (sức khoẻ), khám (bệnh)',
      pronunciation: '/tʃek/',
      partOfSpeech: 'v',
      themeId: 'theme_13_health',
      exampleEn: 'The nurse will check your vital signs now.',
      exampleVi: 'Y tá sẽ kiểm tra các dấu hiệu sinh tồn của bạn ngay bây giờ.',
    ),
    VocabModel(
      id: 'v13_28',
      wordEn: 'recover',
      wordVi: 'Hồi phục',
      pronunciation: '/rɪˈkʌvə/',
      partOfSpeech: 'v',
      themeId: 'theme_13_health',
      exampleEn: 'It takes time to recover from a major surgery.',
      exampleVi: 'Phải mất thời gian để hồi phục sau một ca phẫu thuật lớn.',
    ),
    VocabModel(
      id: 'v13_29',
      wordEn: 'gym',
      wordVi: 'Phòng tập thể hình',
      pronunciation: '/dʒɪm/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'I go to the gym to stay in good shape.',
      exampleVi: 'Tôi đến phòng tập thể hình để giữ vóc dáng cân đối.',
    ),
    VocabModel(
      id: 'v13_30',
      wordEn: 'work-out',
      wordVi: 'Việc rèn luyện thân thể, tập thể hình',
      pronunciation: '/ˈwɜːkaʊt/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Her daily work-out includes swimming and running.',
      exampleVi:
          'Việc rèn luyện thân thể hàng ngày của cô ấy bao gồm bơi lội và chạy bộ.',
    ),
    VocabModel(
      id: 'v13_31',
      wordEn: 'jogging',
      wordVi: 'Môn đi bộ, chạy bộ',
      pronunciation: '/ˈdʒɒɡɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Jogging is a great way to improve cardiovascular health.',
      exampleVi:
          'Chạy bộ là một cách tuyệt vời để cải thiện sức khỏe tim mạch.',
    ),
    VocabModel(
      id: 'v13_32',
      wordEn: 'weight-lifting',
      wordVi: 'Môn nâng tạ',
      pronunciation: '/ˈweɪtˌlɪftɪŋ/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Weight-lifting helps to increase bone density.',
      exampleVi: 'Môn nâng tạ giúp tăng mật độ xương.',
    ),
    VocabModel(
      id: 'v13_33',
      wordEn: 'muscle',
      wordVi: 'Cơ bắp',
      pronunciation: '/ˈmʌsəl/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'He spent months building his muscle at the gym.',
      exampleVi: 'Anh ấy đã dành nhiều tháng để xây dựng cơ bắp tại phòng tập.',
    ),
    VocabModel(
      id: 'v13_34',
      wordEn: 'strain',
      wordVi: 'Sự căng, sự kéo căng',
      pronunciation: '/streɪn/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Be careful not to put too much strain on your back.',
      exampleVi: 'Cẩn thận đừng để lưng của bạn bị căng quá mức.',
    ),
    VocabModel(
      id: 'v13_35',
      wordEn: 'shoulder',
      wordVi: 'Vai',
      pronunciation: '/ˈʃəʊldə/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'He carried the child on his shoulder.',
      exampleVi: 'Anh ấy cõng đứa trẻ trên vai mình.',
    ),
    VocabModel(
      id: 'v13_36',
      wordEn: 'elbow',
      wordVi: 'Khuỷu tay',
      pronunciation: '/ˈelbəʊ/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'She leaned her elbow on the table.',
      exampleVi: 'Cô ấy chống khuỷu tay lên bàn.',
    ),
    VocabModel(
      id: 'v13_37',
      wordEn: 'knee',
      wordVi: 'Đầu gối',
      pronunciation: '/niː/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'He fell down and hurt his knee.',
      exampleVi: 'Anh ấy bị ngã và làm đau đầu gối.',
    ),
    VocabModel(
      id: 'v13_38',
      wordEn: 'physical therapist',
      wordVi: 'Bác sĩ vật lý trị liệu',
      pronunciation: '/ˈfɪzɪkəl ˈθerəpɪst/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn:
          'A physical therapist can help restore movement after an injury.',
      exampleVi:
          'Bác sĩ vật lý trị liệu có thể giúp khôi phục khả năng vận động sau chấn thương.',
    ),
    VocabModel(
      id: 'v13_39',
      wordEn: 'personal trainer',
      wordVi: 'Huấn luyện viên cá nhân',
      pronunciation: '/ˈpɜːsənəl ˈtreɪnə/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn: 'A personal trainer creates a customized exercise program.',
      exampleVi:
          'Huấn luyện viên cá nhân tạo ra một chương trình tập luyện tùy chỉnh.',
    ),
    VocabModel(
      id: 'v13_40',
      wordEn: 'vitamin',
      wordVi: 'Vi-ta-min',
      pronunciation: '/ˈvɪtəmɪn/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Fruits and vegetables are rich in essential vitamins.',
      exampleVi: 'Trái cây và rau quả rất giàu các vi-ta-min thiết yếu.',
    ),
    VocabModel(
      id: 'v13_41',
      wordEn: 'fat',
      wordVi: 'Béo, chất béo',
      pronunciation: '/fæt/',
      partOfSpeech: 'adj, n',
      themeId: 'theme_13_health',
      exampleEn: 'Avocados contain healthy fats.',
      exampleVi: 'Bơ chứa các chất béo lành mạnh.',
    ),
    VocabModel(
      id: 'v13_42',
      wordEn: 'protein',
      wordVi: 'Chất đạm, pro-tê-in',
      pronunciation: '/ˈprəʊtiːn/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Beans are an excellent plant-based source of protein.',
      exampleVi: 'Đậu là một nguồn cung cấp chất đạm thực vật tuyệt vời.',
    ),
    VocabModel(
      id: 'v13_43',
      wordEn: 'calorie',
      wordVi: 'Ca-lo',
      pronunciation: '/ˈkæləri/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'An average adult needs about 2000 calories per day.',
      exampleVi:
          'Một người trưởng thành bình thường cần khoảng 2000 ca-lo mỗi ngày.',
    ),
    VocabModel(
      id: 'v13_44',
      wordEn: 'blood sugar',
      wordVi: 'Đường huyết',
      pronunciation: '/blʌd ˈʃʊɡə/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn: 'Diabetics need to monitor their blood sugar levels closely.',
      exampleVi:
          'Người bị tiểu đường cần theo dõi mức đường huyết một cách chặt chẽ.',
    ),
    VocabModel(
      id: 'v13_45',
      wordEn: 'carbohydrate',
      wordVi: 'Các-bon hidrat',
      pronunciation: '/ˌkɑːbəʊˈhaɪdreɪt/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Pasta is high in carbohydrates.',
      exampleVi: 'Mì ống chứa nhiều các-bon hidrat.',
    ),
    VocabModel(
      id: 'v13_46',
      wordEn: 'fibre',
      wordVi: 'Chất xơ',
      pronunciation: '/ˈfaɪbə/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Whole grains provide a good amount of dietary fibre.',
      exampleVi: 'Ngũ cốc nguyên hạt cung cấp một lượng chất xơ dồi dào.',
    ),
    VocabModel(
      id: 'v13_47',
      wordEn: 'cholesterol',
      wordVi: 'Colextêrôn (chất béo gây xơ cứng động mạch)',
      pronunciation: '/kəˈlestərɒl/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Exercise can help lower bad cholesterol.',
      exampleVi: 'Tập thể dục có thể giúp giảm colextêrôn xấu.',
    ),
    VocabModel(
      id: 'v13_48',
      wordEn: 'nutritionist',
      wordVi: 'Nhà dinh dưỡng học',
      pronunciation: '/njuːˈtrɪʃənɪst/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'The nutritionist advised him on a healthier diet.',
      exampleVi:
          'Nhà dinh dưỡng học đã tư vấn cho anh ta về một chế độ ăn uống lành mạnh hơn.',
    ),
    VocabModel(
      id: 'v13_49',
      wordEn: 'homeopathic food supplement',
      wordVi: 'Thực phẩm bổ sung vi lượng đồng căn',
      pronunciation: '/ˌhəʊmiəˈpæθɪk fuːd ˈsʌplɪmənt/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn:
          'Some people prefer homeopathic food supplements over traditional ones.',
      exampleVi:
          'Một số người thích thực phẩm bổ sung vi lượng đồng căn hơn các loại truyền thống.',
    ),
    VocabModel(
      id: 'v13_50',
      wordEn: 'food group',
      wordVi: 'Nhóm thực phẩm',
      pronunciation: '/fuːd ɡruːp/',
      partOfSpeech: 'np',
      themeId: 'theme_13_health',
      exampleEn: 'A balanced diet should include items from every food group.',
      exampleVi:
          'Một chế độ ăn uống cân bằng nên bao gồm các món từ mọi nhóm thực phẩm.',
    ),
    VocabModel(
      id: 'v13_51',
      wordEn: 'diet',
      wordVi: 'Chế độ ăn',
      pronunciation: '/ˈdaɪət/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'A healthy diet is important for maintaining a good weight.',
      exampleVi:
          'Một chế độ ăn lành mạnh là quan trọng để duy trì cân nặng tốt.',
    ),
    VocabModel(
      id: 'v13_52',
      wordEn: 'obesity',
      wordVi: 'Chứng béo phì',
      pronunciation: '/əʊˈbiːsɪti/',
      partOfSpeech: 'n',
      themeId: 'theme_13_health',
      exampleEn: 'Obesity is a major factor in heart disease.',
      exampleVi: 'Béo phì là một nhân tố chính trong bệnh tim.',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // FAB VOCABULARY & PHRASES (DAY 1)
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

  static List<FabPhraseItem> get readingPhrases => [
    const FabPhraseItem(
      phrase: 'Make an appointment',
      meaning: 'Hẹn gặp, sắp xếp một cuộc hẹn',
    ),
    const FabPhraseItem(
      phrase: 'Cancel an appointment',
      meaning: 'Huỷ một cuộc hẹn',
    ),
    const FabPhraseItem(
      phrase: 'Medical checkup',
      meaning: 'Việc kiểm tra sức khoẻ',
    ),
    const FabPhraseItem(phrase: 'Get better', meaning: 'Khỏe hơn, hồi phục'),
  ];

  static List<FabAnswerItem> get readingAnswers => const [
    FabAnswerItem(vi: 'Chuyên đề này', en: 'This theme'),
    FabAnswerItem(vi: 'được nhìn thấy', en: 'is often seen'),
    FabAnswerItem(vi: 'các phần khác nhau', en: 'various other sections'),
    FabAnswerItem(
      vi: 'kiến thức y học kỹ thuật',
      en: 'technical, medical knowledge',
    ),
    FabAnswerItem(vi: 'được yêu cầu', en: 'required'),
    FabAnswerItem(vi: 'các sự kiện hàng ngày', en: 'everyday events'),
    FabAnswerItem(vi: 'thăm bác sĩ', en: 'visiting the doctor'),
    FabAnswerItem(vi: 'nha sĩ', en: 'the dentist'),
    FabAnswerItem(vi: 'được hỗ trợ bởi y tá', en: 'being assisted by a nurse'),
    FabAnswerItem(vi: 'hẹn gặp', en: 'making an appointment'),
    FabAnswerItem(vi: 'hủy cuộc hẹn', en: 'cancelling an appointment'),
    FabAnswerItem(vi: 'sự khỏe mạnh', en: 'fitness'),
    FabAnswerItem(vi: 'cũng như', en: 'as well as'),
    FabAnswerItem(vi: 'dinh dưỡng', en: 'nutrition'),
    FabAnswerItem(
      vi: 'Từ vựng y học phổ biến',
      en: 'Common medical vocabulary',
    ),
    FabAnswerItem(vi: 'phòng khám', en: 'clinic'),
    FabAnswerItem(vi: 'bệnh viện', en: 'hospital'),
    FabAnswerItem(vi: 'xe cứu thương', en: 'ambulance'),
    FabAnswerItem(vi: 'tình trạng khẩn cấp', en: 'emergency'),
    FabAnswerItem(vi: 'kiểm tra y tế', en: 'medical checkup'),
    FabAnswerItem(vi: 'bác sĩ phẫu thuật', en: 'surgeon'),
    FabAnswerItem(vi: 'tiêm chủng', en: 'vaccination'),
    FabAnswerItem(vi: 'thuốc', en: 'medication'),
    FabAnswerItem(vi: 'ca phẫu thuật', en: 'operation'),
    FabAnswerItem(vi: 'sốt', en: 'fever'),
    FabAnswerItem(vi: 'đau đầu', en: 'headache'),
    FabAnswerItem(vi: 'đau họng', en: 'sore throat'),
    FabAnswerItem(vi: 'khám bệnh', en: 'to examine'),
    FabAnswerItem(vi: 'hồi phục', en: 'to recover'),
    FabAnswerItem(vi: 'phòng tập thể hình', en: 'gym'),
    FabAnswerItem(vi: 'rèn luyện thân thể', en: 'work-out'),
    FabAnswerItem(vi: 'cơ bắp', en: 'muscle'),
    FabAnswerItem(vi: 'các bộ phận cơ thể', en: 'parts of the body'),
    FabAnswerItem(vi: 'vai', en: 'shoulder'),
    FabAnswerItem(vi: 'khuỷu tay', en: 'elbow'),
    FabAnswerItem(vi: 'đầu gối', en: 'knee'),
    FabAnswerItem(vi: 'vi-ta-min', en: 'vitamins'),
    FabAnswerItem(vi: 'chất béo', en: 'fat'),
    FabAnswerItem(vi: 'chất đạm', en: 'protein'),
    FabAnswerItem(vi: 'ca-lo', en: 'calories'),
    FabAnswerItem(vi: 'đường huyết', en: 'blood sugar'),
    FabAnswerItem(vi: 'colesterol', en: 'cholesterol'),
    FabAnswerItem(vi: 'chế độ ăn', en: 'diet'),
    FabAnswerItem(vi: 'chứng béo phì', en: 'obesity'),
  ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
    id: 'theme13_day1',
    dayNumber: 1,
    themeId: 'theme_13_health',
    titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
    phases: [
      LessonPhase(
        id: 'theme13_day1_phase1',
        phaseTypeStr: 'read_listen',
        titleEn: 'Step 1: Read & Listen',
        titleVi: 'Bước 1: Đọc và Nghe',
        audioTrackKey: 'track_51',
        contentEn:
            '''This theme is often seen in the Part I picture description as well as various other sections. There is not much technical, medical knowledge required by the student as situations are everyday events such as visiting the doctor, the dentist, being assisted by a nurse, making or cancelling an appointment.

Students will also hear and read about fitness as well as nutrition.

Common medical vocabulary would be: clinic, hospital, ambulance, emergency, medical checkup, surgeon, flu shot, vaccination, immunization, medicine, medication, operation, fever, headache, sore throat, to examine, to consult, to check, to recover.

Common fitness vocabulary: gym, work-out, jogging, weight-lifting, muscle, strain, and parts of the body (shoulder, elbow, knee etc.), physical therapist, personal trainer.

Common nutrition vocabulary: vitamin, fat, protein, calorie, blood sugar, carbohydrate, fibre, cholesterol, nutritionist, homeopathic food supplement, food group, diet, obesity.''',
        contentVi:
            '''Chuyên đề này thường xuất hiện trong phần I miêu tả tranh cũng như nhiều phần khác. Không có nhiều kiến thức y học kỹ thuật được yêu cầu từ học viên vì các tình huống là những sự kiện hàng ngày như thăm bác sĩ, nha sĩ, được y tá hỗ trợ, hẹn gặp hoặc hủy cuộc hẹn.

Học viên cũng sẽ nghe và đọc về thể dục cũng như dinh dưỡng.

Từ vựng y học phổ biến sẽ là: phòng khám, bệnh viện, xe cứu thương, tình trạng khẩn cấp, kiểm tra sức khỏe, bác sĩ phẫu thuật, tiêm phòng cúm, tiêm chủng, miễn dịch, thuốc, thuốc men, ca phẫu thuật, sốt, đau đầu, đau họng, khám bệnh, tư vấn, kiểm tra, hồi phục.

Từ vựng về thể dục phổ biến: phòng tập, tập luyện, chạy bộ, nâng tạ, cơ bắp, căng cơ, và các bộ phận cơ thể (vai, khuỷu tay, đầu gối, v.v.), bác sĩ vật lý trị liệu, huấn luyện viên cá nhân.

Từ vựng về dinh dưỡng phổ biến: vi-ta-min, chất béo, chất đạm, ca-lo, đường huyết, các-bon hi-đrat, chất xơ, colextêrôn, nhà dinh dưỡng học, thực phẩm bổ sung vi lượng đồng căn, nhóm thực phẩm, chế độ ăn, béo phì.''',
        fabVocab: Theme13Content.readingVocab,
        fabPhrases: Theme13Content.readingPhrases,
      ),
      LessonPhase(
        id: 'theme13_day1_phase2',
        phaseTypeStr: 'translate',
        titleEn: 'Step 2: Listen & Translate',
        titleVi: 'Bước 2: Nghe và Dịch',
        audioTrackKey: 'track_51',
        contentEn: null,
        contentVi: null,
      ),
      LessonPhase(
        id: 'theme13_day1_phase3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Step 3: Mind Game - Say it in English!',
        titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
        mixedSegments: _day1MindGameSegments,
        fabAnswers: Theme13Content.readingAnswers,
      ),
      LessonPhase(
        id: 'theme13_day1_phase4',
        phaseTypeStr: 'vocabulary',
        titleEn: 'Vocabulary Review',
        titleVi: 'Ôn tập Từ vựng',
      ),
    ],
  );

  static List<MixedSegment> get _day1MindGameSegments => [
    const MixedSegment.vietnamese('Chuyên đề này', 'This theme'),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('được nhìn thấy', 'is often seen'),
    const MixedSegment.english(
      ' in the Part I picture description as well as ',
    ),
    const MixedSegment.vietnamese(
      'các phần khác nhau',
      'various other sections',
    ),
    const MixedSegment.english('. There is not much '),
    const MixedSegment.vietnamese(
      'kiến thức y học kỹ thuật',
      'technical, medical knowledge',
    ),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('được yêu cầu', 'required'),
    const MixedSegment.english(' by the student as situations are '),
    const MixedSegment.vietnamese('các sự kiện hàng ngày', 'everyday events'),
    const MixedSegment.english(' such as '),
    const MixedSegment.vietnamese('thăm bác sĩ', 'visiting the doctor'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('nha sĩ', 'the dentist'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese(
      'được hỗ trợ bởi y tá',
      'being assisted by a nurse',
    ),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('hẹn gặp', 'making an appointment'),
    const MixedSegment.english(' or '),
    const MixedSegment.vietnamese('hủy cuộc hẹn', 'cancelling an appointment'),
    const MixedSegment.english('. Students will also hear and read about '),
    const MixedSegment.vietnamese('sự khỏe mạnh', 'fitness'),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('cũng như', 'as well as'),
    const MixedSegment.english(' '),
    const MixedSegment.vietnamese('dinh dưỡng', 'nutrition'),
    const MixedSegment.english('. '),
    const MixedSegment.vietnamese(
      'Từ vựng y học phổ biến',
      'Common medical vocabulary',
    ),
    const MixedSegment.english(' would be: '),
    const MixedSegment.vietnamese('phòng khám', 'clinic'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('bệnh viện', 'hospital'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('xe cứu thương', 'ambulance'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('tình trạng khẩn cấp', 'emergency'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('kiểm tra y tế', 'medical checkup'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('bác sĩ phẫu thuật', 'surgeon'),
    const MixedSegment.english(', flu shot, '),
    const MixedSegment.vietnamese('tiêm chủng', 'vaccination'),
    const MixedSegment.english(', immunization, medicine, '),
    const MixedSegment.vietnamese('thuốc', 'medication'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('ca phẫu thuật', 'operation'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('sốt', 'fever'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('đau đầu', 'headache'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('đau họng', 'sore throat'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('khám bệnh', 'to examine'),
    const MixedSegment.english(', to consult, to check, '),
    const MixedSegment.vietnamese('hồi phục', 'to recover'),
    const MixedSegment.english(' (get better). Common fitness vocabulary: '),
    const MixedSegment.vietnamese('phòng tập thể hình', 'gym'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('rèn luyện thân thể', 'work-out'),
    const MixedSegment.english(', jogging, weight-lifting, '),
    const MixedSegment.vietnamese('cơ bắp', 'muscle'),
    const MixedSegment.english(', strain, and '),
    const MixedSegment.vietnamese('các bộ phận cơ thể', 'parts of the body'),
    const MixedSegment.english(' ('),
    const MixedSegment.vietnamese('vai', 'shoulder'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('khuỷu tay', 'elbow'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('đầu gối', 'knee'),
    const MixedSegment.english(
      ' etc.), physical therapist, personal trainer. Common nutrition vocabulary: ',
    ),
    const MixedSegment.vietnamese('vi-ta-min', 'vitamins'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('chất béo', 'fat'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('chất đạm', 'protein'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('ca-lo', 'calories'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('đường huyết', 'blood sugar'),
    const MixedSegment.english(', carbohydrates, fibre, '),
    const MixedSegment.vietnamese('colesterol', 'cholesterol'),
    const MixedSegment.english(
      ', nutritionist, homeopathic food supplements, food groups, ',
    ),
    const MixedSegment.vietnamese('chế độ ăn', 'diet'),
    const MixedSegment.english(', '),
    const MixedSegment.vietnamese('chứng béo phì', 'obesity'),
    const MixedSegment.english('.'),
  ];

  // // ═══════════════════════════════════════════════════════════════
  // DAY 2 - PHẦN 2: NGHE VÀ LUYỆN TRÍ NHỚ
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
    id: 'theme13_day2',
    dayNumber: 2,
    themeId: 'theme_13_health',
    titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
    phases: [
      // ═══════════════════════════════════════════════════════════════
      // PRACTICE 1: CONVERSATION - TENNIS ELBOW
      // ═══════════════════════════════════════════════════════════════
      LessonPhase(
        id: 'theme13_day2_quiz1',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 1: Conversation - Tennis Elbow',
        titleVi: 'Luyện tập 1: Hội thoại - Chứng đau nhức khuỷu tay',
        audioTrackKey: 'track_52',
        contentEn:
            '''W: OK, Mr. Thomas, I see no breaks in your arm or elbow. And there are no signs of inflammation, but it is obviously quite painful for you. When did you say this happened?
M: Exactly 5 days ago. I was having a game of tennis with my colleagues and shortly after the game, I began to feel sore all over my arm. It did go away after a few hours but the next time I played it was even worse. That's how it has continued; a little bit worse and lasting a little bit longer each time I play.
W: Now I think I see what it is. It's tennis elbow. It's not something too serious. What you should do now is to see a sports therapist who can massage it, and remember to treat it with an ice pack before you sleep. You should be okay after 3 or 4 days.
M: You know, I think you're right. I guess I have to stop playing tennis for a few days.''',
        contentVi:
            '''W: Được rồi, anh Thomas. Tôi không nhận thấy có chỗ nào bị gãy ở cánh tay hay khuỷu tay của anh cả. Và không có các dấu hiệu của viêm nhiễm, nhưng rõ ràng là anh vẫn còn đau. Anh đã nói rằng việc này xảy ra khi nào nhỉ?
M: Chính xác là 5 ngày trước. Tôi đang chơi tennis với các đồng nghiệp của tôi và không lâu sau trận đấu, tôi bắt đầu cảm thấy đau nhức khắp cánh tay của tôi. Nó đã biến mất sau một vài giờ đồng hồ nhưng lần tiếp theo tôi chơi thì thậm chí còn đau hơn. Luôn là như vậy từ lúc đó tới giờ, nó đau hơn một chút và kéo dài hơn một chút mỗi lần tôi chơi.
W: Giờ thì tôi nghĩ là tôi biết vấn đề là gì rồi. Nó là chứng đau nhức khuỷu tay do chơi tennis. Nó không quá nghiêm trọng. Những gì anh nên làm bây giờ là đến gặp một bác sĩ trị liệu thể thao, người mà có thể xoa bóp nó, và nhớ chườm đá trước khi anh đi ngủ. Anh sẽ khỏi sau ba hoặc bốn ngày.
M: Tôi hiểu, tôi nghĩ là chị nói đúng đấy. Chắc là tôi sẽ phải dừng chơi tennis trong một vài ngày.''',
        questions: _practice1Questions,
        fabVocab: Theme13Content.day2ConversationVocab,
        fabPhrases: Theme13Content.day2ConversationPhrases,
        fabAnswers: const [
          FabAnswerItem(
            vi: 'Câu 1 (A): Người phụ nữ nói "I see no breaks in your arm or elbow" và đưa lời khuyên điều trị = cuộc nói chuyện diễn ra ở phòng khám / phòng bác sĩ.',
            en: 'Q1 (A): The woman says "I see no breaks in your arm or elbow" and gives treatment advice = The conversation is taking place in a doctor\'s office.',
          ),
          FabAnswerItem(
            vi: 'Câu 2 (C): Người đàn ông nói "the next time I played it was even worse" và "a little bit worse ... each time I play" = cơn đau đang trở nên tệ hơn.',
            en: 'Q2 (C): The man says "the next time I played it was even worse" and "a little bit worse ... each time I play" = The pain is getting worse.',
          ),
          FabAnswerItem(
            vi: 'Câu 3 (B): Người phụ nữ khuyên "see a sports therapist" và chườm đá = lời khuyên chính là đi gặp bác sĩ/chuyên gia trị liệu.',
            en: 'Q3 (B): The woman advises him to "see a sports therapist" and use an ice pack = He should see a therapist.',
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // PRACTICE 2: SHORT TALK 1 - MEDICAL FORM
      // ═══════════════════════════════════════════════════════════════
      LessonPhase(
        id: 'theme13_day2_quiz2',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 2: Short Talk 1 - Medical Form',
        titleVi: 'Luyện tập 2: Bài ngắn 1 - Mẫu đơn y tế',
        audioTrackKey: 'track_53',
        contentEn:
            '''Now, Mr. Thomas, according to our records, this is your first visit to our clinic. Before Dr. James can examine you, you'll have to fill out these medical history and insurance forms. Could you please list all of the medications you are taking and any allergies you may have. After you have filled out the forms, a nurse will take your blood pressure and temperature. I'll be here in my office if you have any questions.''',
        contentVi:
            '''Vâng, thưa ông Thomas, theo hồ sơ của chúng tôi thì đây là lần thăm khám đầu tiên của ông tại phòng khám của chúng tôi. Trước khi bác sĩ James tiến hành khám cho ông, ông sẽ phải điền đầy đủ vào các mẫu tiểu sử bệnh và bảo hiểm y tế này. Ông hãy vui lòng liệt kê tất cả các loại thuốc mà ông đang sử dụng và bất kỳ loại dị ứng nào mà ông có thể gặp phải. Sau khi ông điền xong các mẫu đơn, y tá sẽ đo huyết áp và thân nhiệt của ông. Tôi sẽ chờ ở trong văn phòng nếu ông có bất kỳ câu hỏi nào cần hỏi.''',
        questions: _practice2Questions,
        fabVocab: Theme13Content.day2ShortTalk1Vocab,
        fabPhrases: Theme13Content.day2ShortTalk1Phrases,
        fabAnswers: const [
          FabAnswerItem(
            vi: 'Câu 4 (A): Người nói nói rõ "this is your first visit to our clinic" = cuộc nói chuyện diễn ra ở một phòng khám y tế.',
            en: 'Q4 (A): The speaker clearly says "this is your first visit to our clinic" = This is taking place in a medical clinic.',
          ),
          FabAnswerItem(
            vi: 'Câu 5 (C): Người nói yêu cầu "list all of the medications you are taking" = cần ghi tên các loại thuốc đang sử dụng.',
            en: 'Q5 (C): The speaker asks him to "list all of the medications you are taking" = The form should include the names of medications being taken.',
          ),
          FabAnswerItem(
            vi: 'Câu 6 (C): Người nói nói "After you have filled out the forms, a nurse will take your blood pressure and temperature" = sau khi điền xong mẫu đơn, y tá sẽ đo huyết áp và thân nhiệt.',
            en: 'Q6 (C): The speaker says "After you have filled out the forms, a nurse will take your blood pressure and temperature" = Blood pressure and temperature will be taken next.',
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // PRACTICE 3: SHORT TALK 2 - FITNESS PROGRAM
      // ═══════════════════════════════════════════════════════════════
      LessonPhase(
        id: 'theme13_day2_quiz3',
        phaseTypeStr: 'listening_quiz',
        titleEn: 'Practice 3: Short Talk 2 - Fitness Program',
        titleVi: 'Luyện tập 3: Bài ngắn 2 - Chương trình fitness',
        audioTrackKey: 'track_54',
        contentEn:
            '''We all know that both exercise and diet play an important part in our daily lives. The importance of maintaining good health has long been emphasized by health and fitness experts. We are here to offer you a fresh start. Our program, Fitness For All, combines nutrition and diet with regular exercise. No two people are alike. So, unlike other weight loss programs, our trainers will provide you with a nutrition and exercise plan tailored personally for you. We will work together in order for you to obtain your desired results in weight loss by providing you with the tools you need. We are committed to providing you with fast results: it's our 40-day guarantee.''',
        contentVi:
            '''Chúng ta đều biết rằng, cả việc luyện tập và chế độ ăn đều đóng một vai trò quan trọng trong cuộc sống hàng ngày của chúng ta. Tầm quan trọng của việc duy trì một sức khỏe tốt từ lâu đã được các chuyên gia về y tế và sức khỏe nhấn mạnh. Chúng tôi ở đây để mang đến cho bạn một sự khởi đầu mới. Chương trình của chúng tôi có tên là "Sức khỏe cho mọi người" kết hợp yếu tố dinh dưỡng và chế độ ăn với việc rèn luyện cơ thể đều đặn. Chúng ta không ai giống ai cả. Do vậy, khác với các chương trình giảm cân khác, các huấn luyện viên của chúng tôi sẽ cung cấp cho bạn một kế hoạch dinh dưỡng và luyện tập được thiết kế dành riêng cho cá nhân bạn. Chúng ta sẽ hợp tác cùng nhau để bạn đạt được kết quả mong muốn trong việc giảm cân bằng việc cung cấp cho bạn các công cụ cần thiết. Chúng tôi cam kết mang lại kết quả nhanh chóng. Đó là sự cam kết đem lại kết quả mong muốn sau 40 ngày.''',
        questions: _practice3Questions,
        fabVocab: Theme13Content.day2ShortTalk2Vocab,
        fabPhrases: Theme13Content.day2ShortTalk2Phrases,
        fabAnswers: const [
          FabAnswerItem(
            vi: 'Câu 7 (C): Bài nói đang giới thiệu một chương trình giảm cân / fitness, có câu "We are here to offer you a fresh start" và "it\'s our 40-day guarantee" = người nói giống nhân viên tư vấn / bán chương trình hơn là bác sĩ hay đầu bếp.',
            en: 'Q7 (C): The speaker is promoting a fitness and weight-loss program, saying "We are here to offer you a fresh start" and "it\'s our 40-day guarantee" = The speaker is most likely a salesperson.',
          ),
          FabAnswerItem(
            vi: 'Câu 8 (B): Bài nói nêu rõ chương trình sẽ cung cấp "a nutrition and exercise plan tailored personally for you" = chương trình được thiết kế riêng cho từng khách hàng.',
            en: 'Q8 (B): The talk says it provides "a nutrition and exercise plan tailored personally for you" = The program is specifically designed for each customer.',
          ),
          FabAnswerItem(
            vi: 'Câu 9 (D): Người nói nói "it\'s our 40-day guarantee" = chương trình cam kết kết quả trong thời gian ngắn.',
            en: 'Q9 (D): The speaker says "it\'s our 40-day guarantee" = The program guarantees a short-time period.',
          ),
        ],
      ),

      // ═══════════════════════════════════════════════════════════════
      // MIND GAME 1: CONVERSATION
      // ═══════════════════════════════════════════════════════════════
      LessonPhase(
        id: 'theme13_day2_mindgame1',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Tennis Elbow',
        titleVi: 'Huấn luyện Trí nhớ: Chứng đau nhức khuỷu tay',
        mixedSegments: _day2ConversationSegments,
        fabVocab: Theme13Content.day2ConversationVocab,
        fabPhrases: Theme13Content.day2ConversationPhrases,
        fabAnswers: Theme13Content.day2ConversationAnswers,
      ),

      // ═══════════════════════════════════════════════════════════════
      // MIND GAME 2: SHORT TALK 1
      // ═══════════════════════════════════════════════════════════════
      LessonPhase(
        id: 'theme13_day2_mindgame2',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Medical Form',
        titleVi: 'Huấn luyện Trí nhớ: Mẫu đơn y tế',
        mixedSegments: _day2ShortTalk1Segments,
        fabVocab: Theme13Content.day2ShortTalk1Vocab,
        fabPhrases: Theme13Content.day2ShortTalk1Phrases,
        fabAnswers: Theme13Content.day2ShortTalk1Answers,
      ),

      // ═══════════════════════════════════════════════════════════════
      // MIND GAME 3: SHORT TALK 2
      // ═══════════════════════════════════════════════════════════════
      LessonPhase(
        id: 'theme13_day2_mindgame3',
        phaseTypeStr: 'mind_game',
        titleEn: 'Memory Training: Fitness Program',
        titleVi: 'Huấn luyện Trí nhớ: Chương trình fitness',
        mixedSegments: _day2ShortTalk2Segments,
        fabVocab: Theme13Content.day2ShortTalk2Vocab,
        fabPhrases: Theme13Content.day2ShortTalk2Phrases,
        fabAnswers: Theme13Content.day2ShortTalk2Answers,
      ),
    ],
  );

  // ═══════════════════════════════════════════════════════════════
  // DAY 2 - FAB VOCABULARY & PHRASES
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get day2ConversationVocab => vocabulary
      .map(
        (v) => FabVocabItem(
          wordEn: v.wordEn,
          wordVi: v.wordVi,
          pronunciation: v.pronunciation,
          partOfSpeech: v.partOfSpeech,
        ),
      )
      .toList();

  static List<FabPhraseItem> get day2ConversationPhrases => [
    const FabPhraseItem(
      phrase: 'See no breaks',
      meaning: 'Không thấy chỗ nào bị gãy',
    ),
    const FabPhraseItem(
      phrase: 'Signs of inflammation',
      meaning: 'Dấu hiệu viêm nhiễm',
    ),
    const FabPhraseItem(
      phrase: 'Feel sore all over',
      meaning: 'Cảm thấy đau nhức khắp nơi',
    ),
    const FabPhraseItem(
      phrase: 'Tennis elbow',
      meaning: 'Chứng đau nhức khuỷu tay',
    ),
    const FabPhraseItem(
      phrase: 'See a therapist',
      meaning: 'Đến gặp bác sĩ trị liệu',
    ),
    const FabPhraseItem(phrase: 'Treat with ice pack', meaning: 'Chườm đá'),
  ];

  static List<FabAnswerItem> get day2ConversationAnswers => const [
    FabAnswerItem(vi: 'nhận thấy không có chỗ nào bị gãy', en: 'see no breaks'),
    FabAnswerItem(vi: 'khuỷu tay', en: 'elbow'),
    FabAnswerItem(vi: 'dấu hiệu viêm nhiễm', en: 'signs of inflammation'),
    FabAnswerItem(vi: 'rõ ràng khá đau', en: 'obviously quite painful'),
    FabAnswerItem(vi: 'với các đồng nghiệp của tôi', en: 'with my colleagues'),
    FabAnswerItem(vi: 'bắt đầu cảm thấy đau nhức', en: 'began to feel sore'),
    FabAnswerItem(vi: 'đã biến mất', en: 'did go away'),
    FabAnswerItem(vi: 'lần tiếp theo', en: 'the next time'),
    FabAnswerItem(vi: 'thậm chí còn tệ hơn', en: 'even worse'),
    FabAnswerItem(vi: 'tệ hơn một chút', en: 'a little bit worse'),
    FabAnswerItem(
      vi: 'chứng đau nhức khuỷu tay do chơi tennis',
      en: 'tennis elbow',
    ),
    FabAnswerItem(vi: 'quá nghiêm trọng', en: 'too serious'),
    FabAnswerItem(
      vi: 'gặp một bác sĩ trị liệu thể thao',
      en: 'see a sports therapist',
    ),
    FabAnswerItem(vi: 'xoa bóp nó', en: 'massage it'),
    FabAnswerItem(vi: 'một túi chườm đá', en: 'an ice pack'),
    FabAnswerItem(
      vi: 'phải dừng chơi tennis',
      en: 'have to stop playing tennis',
    ),
  ];

  // SHORT TALK 1 FAB
  static List<FabVocabItem> get day2ShortTalk1Vocab => vocabulary
      .map(
        (v) => FabVocabItem(
          wordEn: v.wordEn,
          wordVi: v.wordVi,
          pronunciation: v.pronunciation,
          partOfSpeech: v.partOfSpeech,
        ),
      )
      .toList();

  static List<FabPhraseItem> get day2ShortTalk1Phrases => [
    const FabPhraseItem(phrase: 'According to records', meaning: 'Theo hồ sơ'),
    const FabPhraseItem(
      phrase: 'First visit',
      meaning: 'Lần thăm khám đầu tiên',
    ),
    const FabPhraseItem(phrase: 'Fill out forms', meaning: 'Điền các mẫu đơn'),
    const FabPhraseItem(
      phrase: 'List medications',
      meaning: 'Liệt kê các loại thuốc',
    ),
    const FabPhraseItem(phrase: 'Take blood pressure', meaning: 'Đo huyết áp'),
  ];

  static List<FabAnswerItem> get day2ShortTalk1Answers => const [
    FabAnswerItem(
      vi: 'theo hồ sơ của chúng tôi',
      en: 'according to our records',
    ),
    FabAnswerItem(vi: 'lần thăm khám đầu tiên', en: 'first visit'),
    FabAnswerItem(vi: 'phòng khám', en: 'clinic'),
    FabAnswerItem(vi: 'khám cho ông', en: 'examine you'),
    FabAnswerItem(vi: 'điền đầy đủ', en: 'fill out'),
    FabAnswerItem(vi: 'tiểu sử bệnh', en: 'medical history'),
    FabAnswerItem(vi: 'liệt kê', en: 'list'),
    FabAnswerItem(vi: 'các loại thuốc', en: 'the medications'),
    FabAnswerItem(vi: 'bất kỳ dị ứng nào', en: 'any allergies'),
    FabAnswerItem(
      vi: 'đã điền xong các mẫu đơn',
      en: 'have filled out the forms',
    ),
    FabAnswerItem(
      vi: 'đo huyết áp và thân nhiệt',
      en: 'take your blood pressure and temperature',
    ),
    FabAnswerItem(vi: 'văn phòng', en: 'office'),
    FabAnswerItem(vi: 'bất kỳ câu hỏi nào', en: 'any questions'),
  ];

  // SHORT TALK 2 FAB
  static List<FabVocabItem> get day2ShortTalk2Vocab => vocabulary
      .map(
        (v) => FabVocabItem(
          wordEn: v.wordEn,
          wordVi: v.wordVi,
          pronunciation: v.pronunciation,
          partOfSpeech: v.partOfSpeech,
        ),
      )
      .toList();

  static List<FabPhraseItem> get day2ShortTalk2Phrases => [
    const FabPhraseItem(
      phrase: 'Play important part',
      meaning: 'Đóng vai trò quan trọng',
    ),
    const FabPhraseItem(
      phrase: 'Maintaining good health',
      meaning: 'Duy trì sức khỏe tốt',
    ),
    const FabPhraseItem(
      phrase: 'Combine nutrition and diet',
      meaning: 'Kết hợp dinh dưỡng và chế độ ăn',
    ),
    const FabPhraseItem(
      phrase: 'Tailored personally',
      meaning: 'Thiết kế riêng cho từng người',
    ),
    const FabPhraseItem(
      phrase: 'Obtain desired results',
      meaning: 'Đạt được kết quả mong muốn',
    ),
  ];

  static List<FabAnswerItem> get day2ShortTalk2Answers => const [
    FabAnswerItem(vi: 'đóng vai trò quan trọng', en: 'play an important part'),
    FabAnswerItem(vi: 'cuộc sống hàng ngày', en: 'daily lives'),
    FabAnswerItem(vi: 'duy trì sức khỏe tốt', en: 'maintaining good health'),
    FabAnswerItem(vi: 'được nhấn mạnh', en: 'emphasized'),
    FabAnswerItem(vi: 'các chuyên gia y tế', en: 'health and fitness experts'),
    FabAnswerItem(vi: 'một sự khởi đầu mới', en: 'a fresh start'),
    FabAnswerItem(vi: 'kết hợp', en: 'combines'),
    FabAnswerItem(vi: 'luyện tập thường xuyên', en: 'regular exercise'),
    FabAnswerItem(
      vi: 'khác với các chương trình khác',
      en: 'unlike other weight loss programs',
    ),
    FabAnswerItem(vi: 'huấn luyện viên', en: 'trainers'),
    FabAnswerItem(vi: 'cung cấp cho bạn', en: 'provide you with'),
    FabAnswerItem(
      vi: 'kế hoạch dinh dưỡng và luyện tập',
      en: 'nutrition and exercise plan',
    ),
    FabAnswerItem(vi: 'thiết kế riêng cho', en: 'tailored personally for'),
    FabAnswerItem(vi: 'hợp tác cùng nhau', en: 'work together'),
    FabAnswerItem(
      vi: 'đạt được kết quả mong muốn',
      en: 'obtain your desired results',
    ),
    FabAnswerItem(vi: 'việc giảm cân', en: 'weight loss'),
    FabAnswerItem(vi: 'các công cụ cần thiết', en: 'the tools you need'),
    FabAnswerItem(vi: 'cam kết cung cấp', en: 'committed to providing'),
    FabAnswerItem(vi: 'kết quả nhanh chóng', en: 'fast results'),
    FabAnswerItem(vi: 'cam kết 40 ngày', en: '40-day guarantee'),
  ];
  // ═══════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS DAY 2
  // ═══════════════════════════════════════════════════════════════
  static List<QuizQuestion> get _practice1Questions => [
    const QuizQuestion(
      id: 'theme13_q01',
      questionText: 'Where is this conversation taking place?',
      options: [
        '(A) In a doctor\'s office',
        '(B) At a tennis court',
        '(C) In a massage room',
        '(D) In a hospital operating room',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_52',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme13_q02',
      questionText: 'What does the man say about the pain?',
      options: [
        '(A) It happened in the middle of a tennis game.',
        '(B) It is constant.',
        '(C) It is getting worse.',
        '(D) It is getting better.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_52',
      practiceNumber: 'practice1',
    ),
    const QuizQuestion(
      id: 'theme13_q03',
      questionText: 'What does the woman advise the man to do?',
      options: [
        '(A) Not to play tennis again',
        '(B) See a therapist',
        '(C) Keep playing tennis on a regular basis',
        '(D) Have surgery on his arm',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_52',
      practiceNumber: 'practice1',
    ),
  ];

  static List<QuizQuestion> get _practice2Questions => [
    const QuizQuestion(
      id: 'theme13_q04',
      questionText: 'Where is this conversation or talk taking place?',
      options: [
        '(A) In a medical clinic',
        '(B) In an insurance office',
        '(C) In a school',
        '(D) In a sports equipment store',
      ],
      correctIndex: 0,
      audioTrackKey: 'track_53',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme13_q05',
      questionText: 'What information should be included on the form?',
      options: [
        '(A) Height and weight',
        '(B) Blood pressure chart',
        '(C) Names of medications being taken',
        '(D) Home address',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_53',
      practiceNumber: 'practice2',
    ),
    const QuizQuestion(
      id: 'theme13_q06',
      questionText: 'What will happen after the form has been filled out?',
      options: [
        '(A) The bill must be paid in full.',
        '(B) Laboratory tests will be run.',
        '(C) Blood pressure and temperature will be taken.',
        '(D) The doctor will prescribe new medication.',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_53',
      practiceNumber: 'practice2',
    ),
  ];

  static List<QuizQuestion> get _practice3Questions => [
    const QuizQuestion(
      id: 'theme13_q07',
      questionText: 'Who most likely is the speaker?',
      options: [
        '(A) A doctor',
        '(B) A dietitian',
        '(C) A salesperson',
        '(D) A chef',
      ],
      correctIndex: 2,
      audioTrackKey: 'track_54',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme13_q08',
      questionText: 'How is this program different?',
      options: [
        '(A) It provides a weight gain guarantee.',
        '(B) It is specifically designed for each customer.',
        '(C) It is less expensive than its competitor.',
        '(D) It was designed by health and fitness experts.',
      ],
      correctIndex: 1,
      audioTrackKey: 'track_54',
      practiceNumber: 'practice3',
    ),
    const QuizQuestion(
      id: 'theme13_q09',
      questionText: 'What does the program guarantee?',
      options: [
        '(A) The lowest price',
        '(B) Lots of heavy exercises',
        '(C) Transportation',
        '(D) Short-time period',
      ],
      correctIndex: 3,
      audioTrackKey: 'track_54',
      practiceNumber: 'practice3',
    ),
  ];

  // ═══════════════════════════════════════════════════════════════
  // MIND GAME SEGMENTS DAY 2
  // ═══════════════════════════════════════════════════════════════
  static List<MixedSegment> get _day2ConversationSegments => [
    const MixedSegment.english('W: OK, Mr. Thomas, I '),
    const MixedSegment.vietnamese(
      'nhận thấy không có chỗ nào bị gãy',
      'see no breaks',
    ),
    const MixedSegment.english(' in your arm or '),
    const MixedSegment.vietnamese('khuỷu tay', 'elbow'),
    const MixedSegment.english('. And there are no '),
    const MixedSegment.vietnamese(
      'dấu hiệu viêm nhiễm',
      'signs of inflammation',
    ),
    const MixedSegment.english(', but it is '),
    const MixedSegment.vietnamese('rõ ràng khá đau', 'obviously quite painful'),
    const MixedSegment.english(' for you. When did you say this happened?'),
    const MixedSegment.english(
      'M: Exactly 5 days ago. I was having a game of tennis ',
    ),
    const MixedSegment.vietnamese(
      'với các đồng nghiệp của tôi',
      'with my colleagues',
    ),
    const MixedSegment.english(' and shortly after the game, I '),
    const MixedSegment.vietnamese(
      'bắt đầu cảm thấy đau nhức',
      'began to feel sore',
    ),
    const MixedSegment.english(' all over my arm. It '),
    const MixedSegment.vietnamese('đã biến mất', 'did go away'),
    const MixedSegment.english(' after a few hours but '),
    const MixedSegment.vietnamese('lần tiếp theo', 'the next time'),
    const MixedSegment.english(' I played it was '),
    const MixedSegment.vietnamese('thậm chí còn tệ hơn', 'even worse'),
    const MixedSegment.english('. That\'s how it has continued; '),
    const MixedSegment.vietnamese('tệ hơn một chút', 'a little bit worse'),
    const MixedSegment.english(
      ' and lasting a little bit longer each time I play.',
    ),
    const MixedSegment.english('W: Now I think I see what it is. It\'s '),
    const MixedSegment.vietnamese(
      'chứng đau nhức khuỷu tay do chơi tennis',
      'tennis elbow',
    ),
    const MixedSegment.english('. It\'s not something '),
    const MixedSegment.vietnamese('quá nghiêm trọng', 'too serious'),
    const MixedSegment.english('. What you should do now is to '),
    const MixedSegment.vietnamese(
      'gặp một bác sĩ trị liệu thể thao',
      'see a sports therapist',
    ),
    const MixedSegment.english(' who can '),
    const MixedSegment.vietnamese('xoa bóp nó', 'massage it'),
    const MixedSegment.english(', and remember to treat it with '),
    const MixedSegment.vietnamese('một túi chườm đá', 'an ice pack'),
    const MixedSegment.english(
      ' before you sleep. You should be okay after 3 or 4 days.',
    ),
    const MixedSegment.english(
      'M: You know, I think you\'re right. I guess I ',
    ),
    const MixedSegment.vietnamese(
      'phải dừng chơi tennis',
      'have to stop playing tennis',
    ),
    const MixedSegment.english(' for a few days.'),
  ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
    const MixedSegment.english('Now, Mr. Thomas, '),
    const MixedSegment.vietnamese(
      'theo hồ sơ của chúng tôi',
      'according to our records',
    ),
    const MixedSegment.english(', this is your '),
    const MixedSegment.vietnamese('lần thăm khám đầu tiên', 'first visit'),
    const MixedSegment.english(' to our '),
    const MixedSegment.vietnamese('phòng khám', 'clinic'),
    const MixedSegment.english('. Before Dr. James can '),
    const MixedSegment.vietnamese('khám cho ông', 'examine you'),
    const MixedSegment.english(', you\'ll have to '),
    const MixedSegment.vietnamese('điền đầy đủ', 'fill out'),
    const MixedSegment.english(' these '),
    const MixedSegment.vietnamese('tiểu sử bệnh', 'medical history'),
    const MixedSegment.english(' and insurance forms. Could you please '),
    const MixedSegment.vietnamese('liệt kê', 'list'),
    const MixedSegment.english(' all of '),
    const MixedSegment.vietnamese('các loại thuốc', 'the medications'),
    const MixedSegment.english(' you are taking and '),
    const MixedSegment.vietnamese('bất kỳ dị ứng nào', 'any allergies'),
    const MixedSegment.english(' you may have. After you '),
    const MixedSegment.vietnamese(
      'đã điền xong các mẫu đơn',
      'have filled out the forms',
    ),
    const MixedSegment.english(', a nurse will '),
    const MixedSegment.vietnamese(
      'đo huyết áp và thân nhiệt',
      'take your blood pressure and temperature',
    ),
    const MixedSegment.english('. I\'ll be here in my '),
    const MixedSegment.vietnamese('văn phòng', 'office'),
    const MixedSegment.english(' if you have '),
    const MixedSegment.vietnamese('bất kỳ câu hỏi nào', 'any questions'),
    const MixedSegment.english('.'),
  ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
    const MixedSegment.english('We all know that both exercise and diet '),
    const MixedSegment.vietnamese(
      'đóng vai trò quan trọng',
      'play an important part',
    ),
    const MixedSegment.english(' in our '),
    const MixedSegment.vietnamese('cuộc sống hàng ngày', 'daily lives'),
    const MixedSegment.english('. The importance of '),
    const MixedSegment.vietnamese(
      'duy trì sức khỏe tốt',
      'maintaining good health',
    ),
    const MixedSegment.english(' has long been '),
    const MixedSegment.vietnamese('được nhấn mạnh', 'emphasized'),
    const MixedSegment.english(' by '),
    const MixedSegment.vietnamese(
      'các chuyên gia y tế',
      'health and fitness experts',
    ),
    const MixedSegment.english('. We are here to offer you '),
    const MixedSegment.vietnamese('một sự khởi đầu mới', 'a fresh start'),
    const MixedSegment.english('. Our program, Fitness For All, '),
    const MixedSegment.vietnamese('kết hợp', 'combines'),
    const MixedSegment.english(' nutrition and diet with '),
    const MixedSegment.vietnamese('luyện tập thường xuyên', 'regular exercise'),
    const MixedSegment.english('. No two people are alike. So, '),
    const MixedSegment.vietnamese(
      'khác với các chương trình khác',
      'unlike other weight loss programs',
    ),
    const MixedSegment.english(', our '),
    const MixedSegment.vietnamese('huấn luyện viên', 'trainers'),
    const MixedSegment.english(' will '),
    const MixedSegment.vietnamese('cung cấp cho bạn', 'provide you with'),
    const MixedSegment.english(' a '),
    const MixedSegment.vietnamese(
      'kế hoạch dinh dưỡng và luyện tập',
      'nutrition and exercise plan',
    ),
    const MixedSegment.vietnamese(
      'thiết kế riêng cho',
      'tailored personally for',
    ),
    const MixedSegment.english(' you. We will '),
    const MixedSegment.vietnamese('hợp tác cùng nhau', 'work together'),
    const MixedSegment.english(' in order for you to '),
    const MixedSegment.vietnamese(
      'đạt được kết quả mong muốn',
      'obtain your desired results',
    ),
    const MixedSegment.english(' in '),
    const MixedSegment.vietnamese('việc giảm cân', 'weight loss'),
    const MixedSegment.english(' by providing you with '),
    const MixedSegment.vietnamese(
      'các công cụ cần thiết',
      'the tools you need',
    ),
    const MixedSegment.english('. We are '),
    const MixedSegment.vietnamese('cam kết cung cấp', 'committed to providing'),
    const MixedSegment.english(' you with '),
    const MixedSegment.vietnamese('kết quả nhanh chóng', 'fast results'),
    const MixedSegment.english(': it\'s our '),
    const MixedSegment.vietnamese('cam kết 40 ngày', '40-day guarantee'),
    const MixedSegment.english('.'),
  ];
}

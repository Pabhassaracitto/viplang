import '../models/mixed_segment_model.dart';
import '../models/lesson_model.dart';
import '../models/theme_model.dart';
import '../models/vocab_model.dart';

class Theme5Content {
  static ThemeModel get theme => ThemeModel(
        id: 'theme_05_entertainment',
        themeNumber: 5,
        titleEn: 'Entertainment',
        titleVi: 'Giải Trí',
        description:
            'Âm nhạc, phim ảnh, sân khấu, truyền thông, đánh giá (reviews), mua vé sự kiện, và các thông báo/khuyến mãi giải trí.',
        iconEmoji: '🎭',
        isUnlocked: false,
        totalDays: 2,
      );

  // ═══════════════════════════════════════════════════════════════
  // VOCABULARY LIST (đảm bảo bao phủ: Day1 + Conversation + ShortTalk1 + ShortTalk2)
  // ═══════════════════════════════════════════════════════════════
  static List<VocabModel> get vocabulary => [
        // --- Day 1 core vocabulary ---
        VocabModel(
          id: 'v05_01',
          wordEn: 'cover',
          wordVi: 'bao gồm, đề cập (tới)',
          pronunciation: '/ˈkʌvər/',
          partOfSpeech: 'v',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'This course covers a wide range of topics, from theater reviews to ticket purchases.',
          exampleVi:
              'Khoá học này bao gồm nhiều chủ đề, từ đánh giá sân khấu đến việc mua vé.',
        ),
        VocabModel(
          id: 'v05_02',
          wordEn: 'area',
          wordVi: 'lĩnh vực',
          pronunciation: '/ˈeriə/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'Entertainment is a broad area that includes music, film, and television.',
          exampleVi:
              'Giải trí là một lĩnh vực rộng, bao gồm âm nhạc, phim ảnh và truyền hình.',
        ),
        VocabModel(
          id: 'v05_03',
          wordEn: 'theatre',
          wordVi: 'rạp hát',
          pronunciation: '/ˈθiːətər/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The theatre was crowded because the lead actor was a celebrity.',
          exampleVi:
              'Rạp hát rất đông vì nam diễn viên chính là người nổi tiếng.',
        ),
        VocabModel(
          id: 'v05_04',
          wordEn: 'art',
          wordVi: 'nghệ thuật',
          pronunciation: '/ɑːrt/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The museum is featuring modern art and digital installations this week.',
          exampleVi:
              'Bảo tàng đang trưng bày nghệ thuật hiện đại và các tác phẩm kỹ thuật số tuần này.',
        ),
        VocabModel(
          id: 'v05_05',
          wordEn: 'museum',
          wordVi: 'bảo tàng',
          pronunciation: '/mjuˈziːəm/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The museum offers discounted tickets for students on weekends.',
          exampleVi:
              'Bảo tàng cung cấp vé giảm giá cho sinh viên vào cuối tuần.',
        ),
        VocabModel(
          id: 'v05_06',
          wordEn: 'media',
          wordVi: 'phương tiện truyền thông',
          pronunciation: '/ˈmiːdiə/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The media published a positive review of the performance the next day.',
          exampleVi:
              'Truyền thông đã đăng một bài đánh giá tích cực về buổi biểu diễn vào ngày hôm sau.',
        ),
        VocabModel(
          id: 'v05_07',
          wordEn: 'newspaper',
          wordVi: 'báo (in)',
          pronunciation: '/ˈnuːzˌpeɪpər/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'I read about the concert in the newspaper and bought tickets online.',
          exampleVi:
              'Tôi đọc về buổi hoà nhạc trên báo và mua vé qua mạng.',
        ),
        VocabModel(
          id: 'v05_08',
          wordEn: 'magazine',
          wordVi: 'tạp chí',
          pronunciation: '/ˌmæɡəˈziːn/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'A magazine critic wrote that the movie was thrilling but a bit sentimental.',
          exampleVi:
              'Một nhà phê bình của tạp chí viết rằng bộ phim ly kỳ nhưng hơi uỷ mị.',
        ),
        VocabModel(
          id: 'v05_09',
          wordEn: 'obtain',
          wordVi: 'kiếm được, có được',
          pronunciation: '/əbˈteɪn/',
          partOfSpeech: 'v',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'You can obtain tickets by telephone or at the box office.',
          exampleVi:
              'Bạn có thể mua/kiếm được vé qua điện thoại hoặc tại phòng vé.',
        ),
        VocabModel(
          id: 'v05_10',
          wordEn: 'performance',
          wordVi: 'buổi trình diễn, màn biểu diễn',
          pronunciation: '/pərˈfɔːrməns/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The performance started on time, so we arrived early to avoid missing the beginning.',
          exampleVi:
              'Buổi biểu diễn bắt đầu đúng giờ, vì vậy chúng tôi đến sớm để tránh bỏ lỡ phần đầu.',
        ),
        VocabModel(
          id: 'v05_11',
          wordEn: 'review',
          wordVi: 'bài đánh giá / phê bình',
          pronunciation: '/rɪˈvjuː/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The review recommended the play because of its moving storyline.',
          exampleVi:
              'Bài đánh giá gợi ý xem vở kịch vì cốt truyện cảm động.',
        ),
        VocabModel(
          id: 'v05_12',
          wordEn: 'mood',
          wordVi: 'tâm trạng',
          pronunciation: '/muːd/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The director used lighting and music to create a cheerful mood.',
          exampleVi:
              'Đạo diễn dùng ánh sáng và âm nhạc để tạo ra một bầu không khí vui vẻ.',
        ),
        VocabModel(
          id: 'v05_13',
          wordEn: 'emotion',
          wordVi: 'cảm xúc',
          pronunciation: '/ɪˈmoʊʃən/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The actor showed strong emotion during the final scene.',
          exampleVi:
              'Nam diễn viên thể hiện cảm xúc mạnh mẽ trong cảnh cuối.',
        ),
        VocabModel(
          id: 'v05_14',
          wordEn: 'performer',
          wordVi: 'người biểu diễn',
          pronunciation: '/pərˈfɔːrmər/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The performers received a standing ovation from the audience.',
          exampleVi:
              'Những người biểu diễn nhận được sự hoan nghênh nhiệt liệt từ khán giả.',
        ),
        VocabModel(
          id: 'v05_15',
          wordEn: 'audience',
          wordVi: 'khán giả',
          pronunciation: '/ˈɔːdiəns/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The audience was silent at first but later applauded loudly.',
          exampleVi:
              'Khán giả ban đầu im lặng nhưng sau đó vỗ tay rất lớn.',
        ),
        VocabModel(
          id: 'v05_16',
          wordEn: 'concert',
          wordVi: 'buổi hoà nhạc',
          pronunciation: '/ˈkɑːnsərt/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The concert tickets sold out within a few hours after the promotion.',
          exampleVi:
              'Vé hoà nhạc đã bán hết chỉ trong vài giờ sau chương trình quảng bá.',
        ),
        VocabModel(
          id: 'v05_17',
          wordEn: 'symphony',
          wordVi: 'bản giao hưởng',
          pronunciation: '/ˈsɪmfəni/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The symphony was performed with a full orchestra and a digital sound system.',
          exampleVi:
              'Bản giao hưởng được trình diễn với cả dàn nhạc và hệ thống âm thanh kỹ thuật số.',
        ),
        VocabModel(
          id: 'v05_18',
          wordEn: 'critic',
          wordVi: 'nhà phê bình',
          pronunciation: '/ˈkrɪtɪk/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'A famous critic praised the cinematography and special effects.',
          exampleVi:
              'Một nhà phê bình nổi tiếng khen ngợi kỹ thuật quay phim và hiệu ứng đặc biệt.',
        ),
        VocabModel(
          id: 'v05_19',
          wordEn: 'lead role',
          wordVi: 'vai chính',
          pronunciation: '/liːd roʊl/',
          partOfSpeech: 'np',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'She got the lead role after months of auditions.',
          exampleVi:
              'Cô ấy nhận được vai chính sau nhiều tháng thử vai.',
        ),
        VocabModel(
          id: 'v05_20',
          wordEn: 'supporting actor/actress',
          wordVi: 'diễn viên phụ (nam/nữ)',
          pronunciation: '/səˈpɔːrtɪŋ ˈæktər / ˈæktrəs/',
          partOfSpeech: 'np',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The supporting actor delivered an unforgettable performance.',
          exampleVi:
              'Nam diễn viên phụ đã có một màn diễn khó quên.',
        ),
        VocabModel(
          id: 'v05_21',
          wordEn: 'drama',
          wordVi: 'kịch / phim truyền hình',
          pronunciation: '/ˈdrɑːmə/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The drama received excellent reviews for its characters and dialogue.',
          exampleVi:
              'Bộ phim/vở kịch nhận đánh giá rất tốt về nhân vật và lời thoại.',
        ),
        VocabModel(
          id: 'v05_22',
          wordEn: 'tragedy',
          wordVi: 'bi kịch',
          pronunciation: '/ˈtrædʒədi/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'Although it was a tragedy, the ending was surprisingly moving.',
          exampleVi:
              'Dù là bi kịch, kết thúc lại bất ngờ rất cảm động.',
        ),
        VocabModel(
          id: 'v05_23',
          wordEn: 'comedy',
          wordVi: 'hài kịch',
          pronunciation: '/ˈkɑːmədi/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The comedy was so funny that the entire audience laughed throughout.',
          exampleVi:
              'Vở hài kịch hài hước đến mức cả khán phòng cười suốt.',
        ),
        VocabModel(
          id: 'v05_24',
          wordEn: 'standing ovation',
          wordVi: 'sự hoan nghênh nhiệt liệt (đứng dậy vỗ tay)',
          pronunciation: '/ˌstændɪŋ oʊˈveɪʃən/',
          partOfSpeech: 'np',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'After the final song, the singer received a standing ovation.',
          exampleVi:
              'Sau bài hát cuối, ca sĩ nhận được tràng pháo tay đứng dậy.',
        ),
        VocabModel(
          id: 'v05_25',
          wordEn: 'moving',
          wordVi: 'cảm động',
          pronunciation: '/ˈmuːvɪŋ/',
          partOfSpeech: 'adj',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The movie was moving, especially the scene when the family reunited.',
          exampleVi:
              'Bộ phim rất cảm động, đặc biệt là cảnh gia đình đoàn tụ.',
        ),
        VocabModel(
          id: 'v05_26',
          wordEn: 'sentimental',
          wordVi: 'uỷ mị, đa cảm',
          pronunciation: '/ˌsentɪˈmentl/',
          partOfSpeech: 'adj',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'Some viewers found the ending sentimental, but others loved it.',
          exampleVi:
              'Một số người xem thấy kết thúc uỷ mị, nhưng người khác lại rất thích.',
        ),
        VocabModel(
          id: 'v05_27',
          wordEn: 'thrilling',
          wordVi: 'gay cấn, ly kỳ',
          pronunciation: '/ˈθrɪlɪŋ/',
          partOfSpeech: 'adj',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The thriller was exciting, with special effects and tense music.',
          exampleVi:
              'Bộ phim ly kỳ hấp dẫn, với hiệu ứng đặc biệt và nhạc căng thẳng.',
        ),
        VocabModel(
          id: 'v05_28',
          wordEn: 'tedious',
          wordVi: 'buồn tẻ, chán ngắt',
          pronunciation: '/ˈtiːdiəs/',
          partOfSpeech: 'adj',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The first half was tedious, but the second half improved a lot.',
          exampleVi:
              'Nửa đầu khá chán, nhưng nửa sau cải thiện rất nhiều.',
        ),
        VocabModel(
          id: 'v05_29',
          wordEn: 'celebrity',
          wordVi: 'người nổi tiếng',
          pronunciation: '/səˈlebrəti/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'A celebrity attended the premiere, attracting many reporters.',
          exampleVi:
              'Một người nổi tiếng tham dự buổi công chiếu, thu hút nhiều phóng viên.',
        ),
        VocabModel(
          id: 'v05_30',
          wordEn: 'aisle',
          wordVi: 'lối đi giữa các hàng ghế',
          pronunciation: '/aɪl/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'Please keep the aisle clear during the performance.',
          exampleVi:
              'Vui lòng giữ lối đi thông thoáng trong khi biểu diễn.',
        ),
        VocabModel(
          id: 'v05_31',
          wordEn: 'lobby',
          wordVi: 'sảnh, hành lang',
          pronunciation: '/ˈlɑːbi/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'Let’s meet in the lobby before the play starts.',
          exampleVi:
              'Hãy gặp nhau ở sảnh trước khi vở kịch bắt đầu.',
        ),
        VocabModel(
          id: 'v05_32',
          wordEn: 'recommend',
          wordVi: 'giới thiệu, gợi ý',
          pronunciation: '/ˌrekəˈmend/',
          partOfSpeech: 'v',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'Would you recommend this movie to someone who likes comedies?',
          exampleVi:
              'Bạn có gợi ý bộ phim này cho người thích hài kịch không?',
        ),
        VocabModel(
          id: 'v05_33',
          wordEn: 'cinematography',
          wordVi: 'kỹ thuật quay phim',
          pronunciation: '/ˌsɪnəməˈtɑːɡrəfi/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The cinematography made the city look stunning at night.',
          exampleVi:
              'Kỹ thuật quay phim khiến thành phố trông tuyệt đẹp vào ban đêm.',
        ),
        VocabModel(
          id: 'v05_34',
          wordEn: 'director',
          wordVi: 'đạo diễn',
          pronunciation: '/dəˈrektər/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The director explained why the ending was changed during editing.',
          exampleVi:
              'Đạo diễn giải thích vì sao kết thúc được thay đổi trong quá trình biên tập.',
        ),
        VocabModel(
          id: 'v05_35',
          wordEn: 'producer',
          wordVi: 'nhà sản xuất',
          pronunciation: '/prəˈduːsər/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The producer approved the budget for the special effects.',
          exampleVi:
              'Nhà sản xuất đã duyệt ngân sách cho hiệu ứng đặc biệt.',
        ),
        VocabModel(
          id: 'v05_36',
          wordEn: 'special effects',
          wordVi: 'hiệu ứng đặc biệt',
          pronunciation: '/ˌspeʃl ɪˈfekts/',
          partOfSpeech: 'np',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The special effects were impressive, especially in the final scene.',
          exampleVi:
              'Hiệu ứng đặc biệt rất ấn tượng, nhất là trong cảnh cuối.',
        ),
        VocabModel(
          id: 'v05_37',
          wordEn: 'composer',
          wordVi: 'nhà soạn nhạc',
          pronunciation: '/kəmˈpoʊzər/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The composer wrote the soundtrack for more than ten movies.',
          exampleVi:
              'Nhà soạn nhạc đã viết nhạc phim cho hơn mười bộ phim.',
        ),
        VocabModel(
          id: 'v05_38',
          wordEn: 'microphone',
          wordVi: 'micro (mi-crô)',
          pronunciation: '/ˈmaɪkrəfoʊn/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The performer adjusted the microphone to improve the sound.',
          exampleVi:
              'Người biểu diễn chỉnh micro để cải thiện âm thanh.',
        ),
        VocabModel(
          id: 'v05_39',
          wordEn: 'sound system',
          wordVi: 'hệ thống âm thanh',
          pronunciation: '/saʊnd ˈsɪstəm/',
          partOfSpeech: 'np',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The theater upgraded its sound system to a new digital model.',
          exampleVi:
              'Rạp hát nâng cấp hệ thống âm thanh lên mẫu kỹ thuật số mới.',
        ),
        VocabModel(
          id: 'v05_40',
          wordEn: 'digital',
          wordVi: 'kỹ thuật số',
          pronunciation: '/ˈdɪdʒɪtl/',
          partOfSpeech: 'adj',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'Digital ticketing makes it easier to obtain tickets online.',
          exampleVi:
              'Bán vé kỹ thuật số giúp mua vé online dễ hơn.',
        ),
        VocabModel(
          id: 'v05_41',
          wordEn: 'advertisement',
          wordVi: 'quảng cáo',
          pronunciation: '/ˌædvərˈtaɪzmənt/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The advertisement mentioned special prices for children.',
          exampleVi:
              'Quảng cáo đề cập mức giá đặc biệt cho trẻ em.',
        ),
        VocabModel(
          id: 'v05_42',
          wordEn: 'promotion',
          wordVi: 'chương trình quảng bá/khuyến mãi',
          pronunciation: '/prəˈmoʊʃn/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The promotion offered complimentary tickets to early buyers.',
          exampleVi:
              'Chương trình quảng bá tặng vé miễn phí cho người mua sớm.',
        ),
        VocabModel(
          id: 'v05_43',
          wordEn: 'box office',
          wordVi: 'phòng vé',
          pronunciation: '/ˈbɑːks ˌɔːfɪs/',
          partOfSpeech: 'np',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'If online tickets are sold out, try purchasing at the box office.',
          exampleVi:
              'Nếu vé online bán hết, hãy thử mua tại phòng vé.',
        ),
        VocabModel(
          id: 'v05_44',
          wordEn: 'matinee',
          wordVi: 'suất diễn ban ngày (thường buổi chiều)',
          pronunciation: '/ˌmætɪˈneɪ/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'They scheduled a matinee on Saturday for families with children.',
          exampleVi:
              'Họ xếp một suất diễn ban ngày vào thứ Bảy cho gia đình có trẻ em.',
        ),

        // --- Day 2 Conversation / Short talks vocabulary ---
        VocabModel(
          id: 'v05_45',
          wordEn: 'sold out',
          wordVi: 'bán hết (vé)',
          pronunciation: '/soʊld aʊt/',
          partOfSpeech: 'adj',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The Monday show is sold out, so we should check next week’s shows.',
          exampleVi:
              'Suất diễn thứ Hai bán hết, nên ta nên xem các suất diễn tuần sau.',
        ),
        VocabModel(
          id: 'v05_46',
          wordEn: 'seat',
          wordVi: 'chỗ ngồi',
          pronunciation: '/siːt/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'There are still a few seats for the Thursday night show.',
          exampleVi:
              'Vẫn còn vài chỗ ngồi cho suất tối thứ Năm.',
        ),
        VocabModel(
          id: 'v05_47',
          wordEn: 'award',
          wordVi: 'giải thưởng',
          pronunciation: '/əˈwɔːrd/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The host presented an award to the composer of a popular song.',
          exampleVi:
              'Người dẫn chương trình trao giải cho nhà soạn nhạc của một bài hát nổi tiếng.',
        ),
        VocabModel(
          id: 'v05_48',
          wordEn: 'soundtrack',
          wordVi: 'nhạc phim',
          pronunciation: '/ˈsaʊndtræk/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'He has been the featured artist on the soundtracks for many movies.',
          exampleVi:
              'Ông ấy là nghệ sĩ nổi bật được mời tham gia trong nhạc phim của nhiều bộ phim.',
        ),
        VocabModel(
          id: 'v05_49',
          wordEn: 'screening',
          wordVi: 'buổi chiếu phim',
          pronunciation: '/ˈskriːnɪŋ/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The 7:30 p.m. screening was canceled due to a safety issue.',
          exampleVi:
              'Buổi chiếu 7:30 tối bị huỷ do vấn đề an toàn.',
        ),
        VocabModel(
          id: 'v05_50',
          wordEn: 'patron',
          wordVi: 'khách hàng thân thiết (của rạp)',
          pronunciation: '/ˈpeɪtrən/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'All patrons were asked to leave the building calmly.',
          exampleVi:
              'Tất cả khách xem phim được yêu cầu rời khỏi toà nhà một cách bình tĩnh.',
        ),
        VocabModel(
          id: 'v05_51',
          wordEn: 'fire alarm system',
          wordVi: 'hệ thống báo cháy',
          pronunciation: '/ˈfaɪər əˌlɑːrm ˈsɪstəm/',
          partOfSpeech: 'np',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The movie was canceled because the fire alarm system was not operating correctly.',
          exampleVi:
              'Buổi chiếu bị huỷ vì hệ thống báo cháy không hoạt động bình thường.',
        ),
        VocabModel(
          id: 'v05_52',
          wordEn: 'inconvenience',
          wordVi: 'sự bất tiện',
          pronunciation: '/ˌɪnkənˈviːniəns/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The theater apologized for the inconvenience and offered a refund.',
          exampleVi:
              'Rạp xin lỗi vì sự bất tiện và đề nghị hoàn tiền.',
        ),
        VocabModel(
          id: 'v05_53',
          wordEn: 'refund',
          wordVi: 'hoàn tiền',
          pronunciation: '/ˈriːfʌnd/',
          partOfSpeech: 'n',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'Customers can get a refund and complimentary tickets at the entrance.',
          exampleVi:
              'Khách hàng có thể nhận hoàn tiền và vé miễn phí tại lối vào.',
        ),
        VocabModel(
          id: 'v05_54',
          wordEn: 'complimentary',
          wordVi: 'miễn phí, biếu tặng',
          pronunciation: '/ˌkɑːmplɪˈmentri/',
          partOfSpeech: 'adj',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'The staff issued complimentary movie tickets to all ticket-holders.',
          exampleVi:
              'Nhân viên phát vé xem phim miễn phí cho tất cả người giữ vé.',
        ),
        VocabModel(
          id: 'v05_55',
          wordEn: 'evacuate',
          wordVi: 'sơ tán',
          pronunciation: '/ɪˈvækjueɪt/',
          partOfSpeech: 'v',
          themeId: 'theme_05_entertainment',
          exampleEn:
              'They had to evacuate the theater when the alarms were not operating correctly.',
          exampleVi:
              'Họ phải sơ tán rạp khi báo động không hoạt động bình thường.',
        ),
      ];

  // ═══════════════════════════════════════════════════════════════
  // FAB: Day 1 Reading
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get readingVocab => [
        FabVocabItem(
          wordEn: 'cover',
          pronunciation: '/ˈkʌvər/',
          wordVi: 'Bao gồm/đề cập',
          partOfSpeech: 'v',
        ),
        FabVocabItem(
          wordEn: 'media',
          pronunciation: '/ˈmiːdiə/',
          wordVi: 'Phương tiện truyền thông',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'obtain',
          pronunciation: '/əbˈteɪn/',
          wordVi: 'Kiếm được/có được',
          partOfSpeech: 'v',
        ),
        FabVocabItem(
          wordEn: 'times and days of performances',
          pronunciation: '/taɪmz ænd deɪz əv pərˈfɔːrmənsɪz/',
          wordVi: 'Ngày và giờ các buổi trình diễn',
          partOfSpeech: 'np',
        ),
        FabVocabItem(
          wordEn: 'review',
          pronunciation: '/rɪˈvjuː/',
          wordVi: 'Bài đánh giá/phê bình',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'mood',
          pronunciation: '/muːd/',
          wordVi: 'Tâm trạng',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'emotion',
          pronunciation: '/ɪˈmoʊʃən/',
          wordVi: 'Cảm xúc',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'performer',
          pronunciation: '/pərˈfɔːrmər/',
          wordVi: 'Người biểu diễn',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'audience',
          pronunciation: '/ˈɔːdiəns/',
          wordVi: 'Khán giả',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'standing ovation',
          pronunciation: '/ˌstændɪŋ oʊˈveɪʃən/',
          wordVi: 'Sự hoan nghênh nhiệt liệt',
          partOfSpeech: 'np',
        ),
        FabVocabItem(
          wordEn: 'cinematography',
          pronunciation: '/ˌsɪnəməˈtɑːɡrəfi/',
          wordVi: 'Kỹ thuật quay phim',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'special effects',
          pronunciation: '/ˌspeʃl ɪˈfekts/',
          wordVi: 'Hiệu ứng đặc biệt',
          partOfSpeech: 'np',
        ),
        FabVocabItem(
          wordEn: 'sound system',
          pronunciation: '/saʊnd ˈsɪstəm/',
          wordVi: 'Hệ thống âm thanh',
          partOfSpeech: 'np',
        ),
        FabVocabItem(
          wordEn: 'box office',
          pronunciation: '/ˈbɑːks ˌɔːfɪs/',
          wordVi: 'Phòng vé',
          partOfSpeech: 'np',
        ),
        FabVocabItem(
          wordEn: 'matinee',
          pronunciation: '/ˌmætɪˈneɪ/',
          wordVi: 'Suất diễn ban ngày',
          partOfSpeech: 'n',
        ),
      ];

  static List<FabPhraseItem> get readingPhrases => [
        FabPhraseItem(phrase: 'Arrange to meet', meaning: 'Sắp xếp để gặp gỡ'),
        FabPhraseItem(
          phrase: 'A significant number of + N',
          meaning: 'Một số lượng đáng kể',
        ),
        FabPhraseItem(
          phrase: 'Different kinds of + N',
          meaning: 'Các thể loại khác nhau',
        ),
        FabPhraseItem(
          phrase: 'Listen carefully for + N',
          meaning: 'Nghe kỹ để nắm (thông tin)',
        ),
        FabPhraseItem(
          phrase: 'Be obtained (online / by telephone / at the box office)',
          meaning: 'Được mua/kiếm được (online/điện thoại/phòng vé)',
        ),
        FabPhraseItem(
          phrase: 'As well as terms such as …',
          meaning: 'Cũng như các thuật ngữ như …',
        ),
      ];

  static List<FabAnswerItem> get readingAnswers => [
        FabAnswerItem(vi: 'Rất nhiều lĩnh vực', en: 'a lot of areas'),
        FabAnswerItem(vi: 'Rạp hát', en: 'theatre/theater'),
        FabAnswerItem(vi: 'Các bảo tàng', en: 'museums'),
        FabAnswerItem(vi: 'Phương tiện truyền thông', en: 'media'),
        FabAnswerItem(vi: 'Các báo và tạp chí', en: 'newspapers and magazines'),
        FabAnswerItem(vi: 'Kiếm được vé', en: 'obtaining tickets'),
        FabAnswerItem(vi: 'Các buổi biểu diễn', en: 'performances'),
        FabAnswerItem(vi: 'Các đánh giá', en: 'reviews'),
        FabAnswerItem(vi: 'Một sự kiện', en: 'an event'),
        FabAnswerItem(vi: 'Một số lượng đáng kể', en: 'a significant number'),
        FabAnswerItem(vi: 'Các tâm trạng và tình cảm', en: 'the moods and emotions'),
        FabAnswerItem(vi: 'Khán giả', en: 'the audience'),
        FabAnswerItem(vi: 'Nổi tiếng', en: 'popular'),
        FabAnswerItem(vi: 'Bản giao hưởng', en: 'symphony'),
        FabAnswerItem(vi: 'Vai chính', en: 'lead role'),
        FabAnswerItem(vi: 'Vở kịch', en: 'drama'),
        FabAnswerItem(vi: 'Sự hoan nghênh nồng nhiệt', en: 'standing ovation'),
        FabAnswerItem(vi: 'Uỷ mị', en: 'sentimental'),
        FabAnswerItem(vi: 'Nhàm chán', en: 'tedious'),
        FabAnswerItem(vi: 'Lối đi giữa các hàng ghế', en: 'aisle'),
        FabAnswerItem(vi: 'Cũng như là các thuật ngữ', en: 'as well as terms'),
        FabAnswerItem(vi: 'Kỹ thuật làm phim', en: 'cinematography'),
        FabAnswerItem(vi: 'Nhà sản xuất', en: 'producer'),
        FabAnswerItem(vi: 'Nhà soạn nhạc', en: 'composer'),
        FabAnswerItem(vi: 'Hệ thống âm thanh', en: 'sound system'),
        FabAnswerItem(
          vi: 'Những quảng cáo hoặc chương trình quảng bá',
          en: 'advertisements or promotions',
        ),
        FabAnswerItem(vi: 'Các sự kiện giải trí', en: 'entertainment events'),
        FabAnswerItem(vi: 'Giá các loại vé', en: 'cost of tickets'),
        FabAnswerItem(vi: 'Tại phòng bán vé', en: 'at the box office'),
        FabAnswerItem(vi: 'Các mức giá đặc biệt', en: 'special prices'),
        FabAnswerItem(vi: 'Những buổi diễn đặc biệt', en: 'special performances'),
        FabAnswerItem(vi: 'Một buổi diễn ban ngày', en: 'a matinee'),
      ];

  // ═══════════════════════════════════════════════════════════════
  // FAB: Day 2 - Conversation
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get conversationVocab => [
        FabVocabItem(
          wordEn: 'ticket',
          pronunciation: '/ˈtɪkɪt/',
          wordVi: 'Vé',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'play',
          pronunciation: '/pleɪ/',
          wordVi: 'Vở kịch',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'show',
          pronunciation: '/ʃoʊ/',
          wordVi: 'Suất diễn',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'sold out',
          pronunciation: '/soʊld aʊt/',
          wordVi: 'Bán hết',
          partOfSpeech: 'adj',
        ),
        FabVocabItem(
          wordEn: 'available',
          pronunciation: '/əˈveɪləbəl/',
          wordVi: 'Còn chỗ/có sẵn',
          partOfSpeech: 'adj',
        ),
        FabVocabItem(
          wordEn: 'meeting',
          pronunciation: '/ˈmiːtɪŋ/',
          wordVi: 'Cuộc họp',
          partOfSpeech: 'n',
        ),
      ];

  static List<FabPhraseItem> get conversationPhrases => [
        FabPhraseItem(phrase: 'Try to get the tickets', meaning: 'Cố gắng mua vé'),
        FabPhraseItem(phrase: 'Be sold out', meaning: 'Bị bán hết'),
        FabPhraseItem(phrase: 'What do you think?', meaning: 'Em nghĩ sao?'),
        FabPhraseItem(phrase: 'Be free', meaning: 'Rảnh'),
        FabPhraseItem(phrase: 'There\'s no way ...', meaning: 'Không có cách nào...'),
        FabPhraseItem(phrase: 'Make it on time', meaning: 'Tới kịp đúng giờ'),
        FabPhraseItem(
          phrase: 'Miss the beginning part',
          meaning: 'Bỏ lỡ phần đầu',
        ),
        FabPhraseItem(
          phrase: 'Let me see whether ...',
          meaning: 'Để anh xem liệu rằng ...',
        ),
        FabPhraseItem(
          phrase: 'Next week\'s shows',
          meaning: 'Các buổi biểu diễn tuần tới',
        ),
        FabPhraseItem(
          phrase: 'The only one I want to see',
          meaning: 'Vở kịch duy nhất mà em muốn xem',
        ),
      ];

  static List<FabAnswerItem> get conversationAnswers => [
        FabAnswerItem(vi: 'Đã cố gắng mua vé', en: 'tried to get the tickets'),
        FabAnswerItem(vi: 'Vở kịch', en: 'the play'),
        FabAnswerItem(
          vi: 'Các buổi diễn vào thứ Hai và thứ Tư',
          en: 'the Monday and Wednesday shows',
        ),
        FabAnswerItem(vi: 'Đã bán hết', en: 'sold out'),
        FabAnswerItem(vi: 'Tuy nhiên', en: 'However'),
        FabAnswerItem(vi: 'Các chỗ ngồi', en: 'seats'),
        FabAnswerItem(vi: 'Em nghĩ sao', en: 'What do you think'),
        FabAnswerItem(vi: 'Rảnh', en: 'free'),
        FabAnswerItem(vi: 'Có một cuộc họp dài', en: 'have a long meeting'),
        FabAnswerItem(vi: 'Sẽ không thể về nhà', en: 'won\'t be able to get home'),
        FabAnswerItem(
          vi: 'Kịp tới xem vở kịch đó đúng giờ',
          en: 'make it to the play on time',
        ),
        FabAnswerItem(vi: 'Bỏ lỡ phần đầu', en: 'miss the beginning part'),
        FabAnswerItem(vi: 'Để anh xem liệu rằng', en: 'let me see whether'),
        FabAnswerItem(
          vi: 'Các buổi biểu diễn tuần tới',
          en: 'next week\'s shows',
        ),
        FabAnswerItem(
          vi: 'Thực sự muốn đi xem vở kịch này',
          en: 'really want to go see this play',
        ),
        FabAnswerItem(vi: 'Vở kịch duy nhất', en: 'the only one'),
        FabAnswerItem(
          vi: 'Đã nói với em rất nhiều về vở kịch này rồi',
          en: 'have told me so much about the play already',
        ),
      ];

  // ═══════════════════════════════════════════════════════════════
  // FAB: Day 2 - Short Talk 1 (Award)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk1Vocab => [
        FabVocabItem(
          wordEn: 'award',
          pronunciation: '/əˈwɔːrd/',
          wordVi: 'Giải thưởng',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'present (an award)',
          pronunciation: '/prɪˈzent/',
          wordVi: 'Trao (giải thưởng)',
          partOfSpeech: 'v',
        ),
        FabVocabItem(
          wordEn: 'composer',
          pronunciation: '/kəmˈpoʊzər/',
          wordVi: 'Nhà soạn nhạc',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'hit',
          pronunciation: '/hɪt/',
          wordVi: 'Bài hát nổi tiếng/hit',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'be honored',
          pronunciation: '/bi ˈɑːnərd/',
          wordVi: 'Được vinh danh',
          partOfSpeech: 'vp',
        ),
        FabVocabItem(
          wordEn: 'featured artist',
          pronunciation: '/ˈfiːtʃərd ˈɑːrtɪst/',
          wordVi: 'Nghệ sĩ nổi bật/được mời',
          partOfSpeech: 'np',
        ),
        FabVocabItem(
          wordEn: 'soundtrack',
          pronunciation: '/ˈsaʊndtræk/',
          wordVi: 'Nhạc phim',
          partOfSpeech: 'n',
        ),
      ];

  static List<FabPhraseItem> get shortTalk1Phrases => [
        FabPhraseItem(
          phrase: 'It\'s my great pleasure to do sth',
          meaning: 'Tôi rất vui mừng được làm gì',
        ),
        FabPhraseItem(phrase: 'Over the past ... years', meaning: 'Trong ... năm qua'),
        FabPhraseItem(
          phrase: 'One of the most successful ...',
          meaning: 'Một trong những ... thành công nhất',
        ),
        FabPhraseItem(
          phrase: 'In addition to ...',
          meaning: 'Ngoài ... / Thêm vào đó',
        ),
        FabPhraseItem(
          phrase: 'Give a big hand for sb',
          meaning: 'Dành một tràng pháo tay cho ai',
        ),
      ];

  static List<FabAnswerItem> get shortTalk1Answers => [
        FabAnswerItem(vi: 'Tôi rất vui mừng', en: 'It\'s my great pleasure'),
        FabAnswerItem(vi: 'Trao tặng giải thưởng này', en: 'present this award'),
        FabAnswerItem(vi: 'Bài hát vô cùng nổi tiếng', en: 'the extremely popular song'),
        FabAnswerItem(vi: 'Qua hơn 20 năm qua', en: 'Over the past 20 years'),
        FabAnswerItem(vi: 'Hơn 40 bài hát nổi tiếng', en: 'over 40 hits'),
        FabAnswerItem(vi: 'Đã được vinh danh', en: 'has been honored'),
        FabAnswerItem(
          vi: 'Một trong những nhạc sĩ thành công nhất',
          en: 'one of the most successful composers',
        ),
        FabAnswerItem(
          vi: 'Ngoài những vinh dự này',
          en: 'In addition to these honors',
        ),
        FabAnswerItem(vi: 'Các bản nhạc phim', en: 'the soundtracks'),
        FabAnswerItem(vi: 'Trong 5 năm qua', en: 'in the past 5 years'),
        FabAnswerItem(
          vi: 'Hãy dành một tràng pháo tay cho',
          en: 'give a big hand for',
        ),
      ];

  // ═══════════════════════════════════════════════════════════════
  // FAB: Day 2 - Short Talk 2 (Movie Theater Announcement)
  // ═══════════════════════════════════════════════════════════════
  static List<FabVocabItem> get shortTalk2Vocab => [
        FabVocabItem(
          wordEn: 'patron',
          pronunciation: '/ˈpeɪtrən/',
          wordVi: 'Khách hàng thân thiết',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'screening',
          pronunciation: '/ˈskriːnɪŋ/',
          wordVi: 'Buổi chiếu phim',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'canceled',
          pronunciation: '/ˈkænsəld/',
          wordVi: 'Bị huỷ',
          partOfSpeech: 'adj',
        ),
        FabVocabItem(
          wordEn: 'fire alarm system',
          pronunciation: '/ˈfaɪər əˌlɑːrm ˈsɪstəm/',
          wordVi: 'Hệ thống báo cháy',
          partOfSpeech: 'np',
        ),
        FabVocabItem(
          wordEn: 'inconvenience',
          pronunciation: '/ˌɪnkənˈviːniəns/',
          wordVi: 'Sự bất tiện',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'refund',
          pronunciation: '/ˈriːfʌnd/',
          wordVi: 'Hoàn tiền',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'complimentary',
          pronunciation: '/ˌkɑːmplɪˈmentri/',
          wordVi: 'Miễn phí/biếu tặng',
          partOfSpeech: 'adj',
        ),
        FabVocabItem(
          wordEn: 'ticket-holder',
          pronunciation: '/ˈtɪkɪt ˌhoʊldər/',
          wordVi: 'Người có vé',
          partOfSpeech: 'np',
        ),
        FabVocabItem(
          wordEn: 'evacuate',
          pronunciation: '/ɪˈvækjueɪt/',
          wordVi: 'Sơ tán',
          partOfSpeech: 'v',
        ),
        FabVocabItem(
          wordEn: 'coupon',
          pronunciation: '/ˈkuːpɑːn/',
          wordVi: 'Phiếu giảm giá/ưu đãi',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'cooperation',
          pronunciation: '/koʊˌɑːpəˈreɪʃən/',
          wordVi: 'Sự hợp tác',
          partOfSpeech: 'n',
        ),
        FabVocabItem(
          wordEn: 'understanding',
          pronunciation: '/ˌʌndərˈstændɪŋ/',
          wordVi: 'Sự thông cảm',
          partOfSpeech: 'n',
        ),
      ];

  static List<FabPhraseItem> get shortTalk2Phrases => [
        FabPhraseItem(phrase: 'Apologize for sth', meaning: 'Xin lỗi vì điều gì'),
        FabPhraseItem(phrase: 'Offer a refund', meaning: 'Đề nghị hoàn tiền'),
        FabPhraseItem(phrase: 'Be able to do sth', meaning: 'Có thể làm gì'),
        FabPhraseItem(phrase: 'Leave the building', meaning: 'Rời toà nhà'),
        FabPhraseItem(
          phrase: 'Be required by law',
          meaning: 'Được yêu cầu theo luật',
        ),
        FabPhraseItem(phrase: 'Walk calmly', meaning: 'Đi một cách bình tĩnh'),
        FabPhraseItem(phrase: 'The nearest exit', meaning: 'Lối thoát gần nhất'),
        FabPhraseItem(phrase: 'Issue coupons', meaning: 'Phát phiếu giảm giá'),
        FabPhraseItem(
          phrase: 'Thank you for your cooperation',
          meaning: 'Cảm ơn sự hợp tác của quý vị',
        ),
      ];

  static List<FabAnswerItem> get shortTalk2Answers => [
        FabAnswerItem(vi: 'Tất cả các khách hàng thân thiết của rạp', en: 'all movie theater patrons'),
        FabAnswerItem(vi: 'Lưu ý rằng', en: 'note that'),
        FabAnswerItem(vi: 'Đã bị huỷ', en: 'has been canceled'),
        FabAnswerItem(vi: 'Hệ thống báo cháy của rạp chiếu phim', en: 'the theater\'s fire alarm system'),
        FabAnswerItem(vi: 'Xin lỗi vì sự bất tiện này', en: 'apologize for the inconvenience'),
        FabAnswerItem(vi: 'Xin hoàn lại tiền', en: 'offer a refund'),
        FabAnswerItem(vi: 'Các vé mời xem phim miễn phí', en: 'complimentary movie tickets'),
        FabAnswerItem(vi: 'Tất cả khách hàng', en: 'all customers'),
        FabAnswerItem(vi: 'Những người có vé', en: 'ticket-holders'),
        FabAnswerItem(vi: 'Xem phim miễn phí', en: 'see the movie for free'),
        FabAnswerItem(vi: 'Sẽ được chiếu', en: 'will be screened'),
        FabAnswerItem(vi: 'Rời toà nhà', en: 'leave the building'),
        FabAnswerItem(vi: 'Được yêu cầu theo luật', en: 'are required by law'),
        FabAnswerItem(vi: 'Sơ tán', en: 'evacuate'),
        FabAnswerItem(vi: 'Đang không hoạt động bình thường', en: 'are not operating correctly'),
        FabAnswerItem(vi: 'Đi bộ một cách bình tĩnh', en: 'walk calmly'),
        FabAnswerItem(vi: 'Lối thoát gần nhất', en: 'the nearest exit'),
        FabAnswerItem(vi: 'Tập hợp', en: 'gather'),
        FabAnswerItem(vi: 'Nhân viên của chúng tôi', en: 'Our staff'),
        FabAnswerItem(vi: 'Phát các phiếu giảm giá', en: 'issue coupons'),
        FabAnswerItem(vi: 'Cảm ơn vì sự hợp tác của quý vị', en: 'thank you for your cooperation'),
        FabAnswerItem(vi: 'Sự thông cảm', en: 'understanding'),
      ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 1
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day1 => LessonDay(
        id: 'theme05_day1',
        dayNumber: 1,
        themeId: 'theme_05_entertainment',
        titleVi: 'Phần 1: Giới thiệu chung về chuyên đề',
        phases: [
          LessonPhase(
            id: 'theme05_day1_phase1',
            phaseTypeStr: 'read_listen',
            titleEn: 'Step 1: Read & Listen',
            titleVi: 'Bước 1: Đọc và Nghe',
            audioTrackKey: 'track_19',
            contentEn: '''This theme covers a lot of areas such as music, film, theatre, art, television, museums and media such as newspapers and magazines. Conversations are about situations such as obtaining tickets for an event, listening to times and days of performances, reading or listening to reviews, arranging to meet before or after an event. This theme also introduces a significant number of adjectives to describe the moods and emotions of both the performers and the audience.

Some specific vocabulary would be: popular, concert, symphony, critic, review, lead role, supporting actor/actress, drama, tragedy, comedy, standing ovation, moving, sentimental, thrilling, tedious, celebrity, aisle, lobby, recommend, as well as terms such as cinematography, editor, director, producer, special effects, composer, microphone, sound system and digital.

Students will also read and hear advertisements/promotions for different kinds of entertainment events and will need to listen carefully for the cost of tickets and how they can be obtained (online, by telephone or at the 'box office') and whether there are special prices for children or if there are special performances at a special date and time such as a matinee.''',
            contentVi: '''Chuyên đề này đề cập tới rất nhiều lĩnh vực như là âm nhạc, phim, rạp hát, nghệ thuật, truyền hình, bảo tàng và các phương tiện truyền thông gồm báo và tạp chí. Các cuộc hội thoại tập trung vào các tình huống như mua vé tham dự một sự kiện, nghe về giờ giấc và ngày của các buổi trình diễn, đọc và nghe các bài đánh giá, sắp xếp việc gặp gỡ trước hoặc sau một sự kiện. Chuyên đề này cũng giới thiệu một số lượng đáng kể các tính từ để miêu tả tâm trạng và cảm xúc của cả người biểu diễn và khán giả.

Một vài thuật ngữ đặc trưng thường được dùng là: nổi tiếng, buổi hòa nhạc, bản giao hưởng, nhà phê bình, đánh giá, vai chính, các nam/nữ diễn viên phụ, kịch, bi kịch, hài kịch, sự hoan nghênh nhiệt liệt, xúc động, ủy mị, ly kỳ, nhàm chán, người nổi tiếng, lối đi giữa các hàng ghế, sảnh, giới thiệu, cùng với những thuật ngữ như kỹ thuật quay phim, biên tập viên, đạo diễn, nhà sản xuất, các hiệu ứng đặc biệt, nhà soạn nhạc, mi-crô, hệ thống âm thanh và kỹ thuật số.

Người học cũng sẽ đọc và nghe các bài quảng cáo/các chương trình quảng bá cho các loại hình sự kiện giải trí khác nhau và sẽ cần phải nghe kỹ về giá vé và cách thức để mua được vé (qua mạng, qua điện thoại hay tại phòng bán vé) và liệu có mức giá đặc biệt nào cho trẻ em hay có buổi biểu diễn đặc biệt vào một ngày và giờ đặc biệt nào không ví dụ như là một buổi diễn ban ngày.''',
            fabVocab: Theme5Content.readingVocab,
            fabPhrases: Theme5Content.readingPhrases,
          ),
          LessonPhase(
            id: 'theme05_day1_phase2',
            phaseTypeStr: 'translate',
            titleEn: 'Step 2: Listen & Translate',
            titleVi: 'Bước 2: Nghe và Dịch',
            audioTrackKey: 'track_19',
            contentEn: '''This theme covers a lot of areas such as music, film, theatre, art, television, museums and media such as newspapers and magazines. Conversations are about situations such as obtaining tickets for an event, listening to times and days of performances, reading or listening to reviews, arranging to meet before or after an event. This theme also introduces a significant number of adjectives to describe the moods and emotions of both the performers and the audience.

Some specific vocabulary would be: popular, concert, symphony, critic, review, lead role, supporting actor/actress, drama, tragedy, comedy, standing ovation, moving, sentimental, thrilling, tedious, celebrity, aisle, lobby, recommend, as well as terms such as cinematography, editor, director, producer, special effects, composer, microphone, sound system and digital.

Students will also read and hear advertisements/promotions for different kinds of entertainment events and will need to listen carefully for the cost of tickets and how they can be obtained (online, by telephone or at the 'box office') and whether there are special prices for children or if there are special performances at a special date and time such as a matinee.''',
            contentVi: '''Chuyên đề này đề cập tới rất nhiều lĩnh vực như là âm nhạc, phim, rạp hát, nghệ thuật, truyền hình, bảo tàng và các phương tiện truyền thông gồm báo và tạp chí. Các cuộc hội thoại tập trung vào các tình huống như mua vé tham dự một sự kiện, nghe về giờ giấc và ngày của các buổi trình diễn, đọc và nghe các bài đánh giá, sắp xếp việc gặp gỡ trước hoặc sau một sự kiện. Chuyên đề này cũng giới thiệu một số lượng đáng kể các tính từ để miêu tả tâm trạng và cảm xúc của cả người biểu diễn và khán giả.

Một vài thuật ngữ đặc trưng thường được dùng là: nổi tiếng, buổi hòa nhạc, bản giao hưởng, nhà phê bình, đánh giá, vai chính, các nam/nữ diễn viên phụ, kịch, bi kịch, hài kịch, sự hoan nghênh nhiệt liệt, xúc động, ủy mị, ly kỳ, nhàm chán, người nổi tiếng, lối đi giữa các hàng ghế, sảnh, giới thiệu, cùng với những thuật ngữ như kỹ thuật quay phim, biên tập viên, đạo diễn, nhà sản xuất, các hiệu ứng đặc biệt, nhà soạn nhạc, mi-crô, hệ thống âm thanh và kỹ thuật số.

Người học cũng sẽ đọc và nghe các bài quảng cáo/các chương trình quảng bá cho các loại hình sự kiện giải trí khác nhau và sẽ cần phải nghe kỹ về giá vé và cách thức để mua được vé (qua mạng, qua điện thoại hay tại phòng bán vé) và liệu có mức giá đặc biệt nào cho trẻ em hay có buổi biểu diễn đặc biệt vào một ngày và giờ đặc biệt nào không ví dụ như là một buổi diễn ban ngày.''',
          ),
          LessonPhase(
            id: 'theme05_day1_phase3',
            phaseTypeStr: 'mind_game',
            titleEn: 'Step 3: Mind Game - Say it in English!',
            titleVi: 'Bước 3: Trò chơi Tư duy - Nói to bằng tiếng Anh!',
            mixedSegments: _day1MindGameSegments,
            fabAnswers: Theme5Content.readingAnswers,
          ),
          LessonPhase(
            id: 'theme05_day1_phase4',
            phaseTypeStr: 'vocabulary',
            titleEn: 'Vocabulary Review',
            titleVi: 'Ôn tập Từ vựng',
          ),
        ],
      );

  static List<MixedSegment> get _day1MindGameSegments => [
        const MixedSegment.english('This theme covers '),
        const MixedSegment.vietnamese('rất nhiều lĩnh vực', 'a lot of areas'),
        const MixedSegment.english(' such as music, film, '),
        const MixedSegment.vietnamese('rạp hát', 'theatre'),
        const MixedSegment.english(', art, television, '),
        const MixedSegment.vietnamese('các bảo tàng', 'museums'),
        const MixedSegment.english(' and '),
        const MixedSegment.vietnamese('phương tiện truyền thông', 'media'),
        const MixedSegment.english(' such as '),
        const MixedSegment.vietnamese(
          'các báo và tạp chí',
          'newspapers and magazines',
        ),
        const MixedSegment.english(
          '. Conversations are about situations such as ',
        ),
        const MixedSegment.vietnamese('kiếm được vé', 'obtaining tickets'),
        const MixedSegment.english(' for an event, listening to times and days of '),
        const MixedSegment.vietnamese('các buổi biểu diễn', 'performances'),
        const MixedSegment.english(', reading or listening to '),
        const MixedSegment.vietnamese('các đánh giá', 'reviews'),
        const MixedSegment.english(', arranging to meet before or after '),
        const MixedSegment.vietnamese('một sự kiện', 'an event'),
        const MixedSegment.english('. This theme also introduces '),
        const MixedSegment.vietnamese(
          'một số lượng đáng kể',
          'a significant number',
        ),
        const MixedSegment.english(' of adjectives to describe '),
        const MixedSegment.vietnamese(
          'các tâm trạng và tình cảm',
          'the moods and emotions',
        ),
        const MixedSegment.english(' of both the performers and '),
        const MixedSegment.vietnamese('khán giả', 'the audience'),
        const MixedSegment.english('.\n\nSome specific vocabulary would be: '),
        const MixedSegment.vietnamese('nổi tiếng', 'popular'),
        const MixedSegment.english(', concert, '),
        const MixedSegment.vietnamese('bản giao hưởng', 'symphony'),
        const MixedSegment.english(', critic, review, '),
        const MixedSegment.vietnamese('vai chính', 'lead role'),
        const MixedSegment.english(', supporting actor/actress, '),
        const MixedSegment.vietnamese('vở kịch', 'drama'),
        const MixedSegment.english(', tragedy, comedy, '),
        const MixedSegment.vietnamese(
          'sự hoan nghênh nồng nhiệt',
          'standing ovation',
        ),
        const MixedSegment.english(', moving, '),
        const MixedSegment.vietnamese('ủy mị', 'sentimental'),
        const MixedSegment.english(', thrilling, '),
        const MixedSegment.vietnamese('nhàm chán', 'tedious'),
        const MixedSegment.english(', celebrity, '),
        const MixedSegment.vietnamese('lối đi giữa các hàng ghế', 'aisle'),
        const MixedSegment.english(', lobby, recommend, '),
        const MixedSegment.vietnamese(
          'cũng như là các thuật ngữ',
          'as well as terms',
        ),
        const MixedSegment.english(' such as '),
        const MixedSegment.vietnamese('kỹ thuật làm phim', 'cinematography'),
        const MixedSegment.english(', editor, director, '),
        const MixedSegment.vietnamese('nhà sản xuất', 'producer'),
        const MixedSegment.english(', special effects, '),
        const MixedSegment.vietnamese('nhà soạn nhạc', 'composer'),
        const MixedSegment.english(', microphone, '),
        const MixedSegment.vietnamese('hệ thống âm thanh', 'sound system'),
        const MixedSegment.english(' and digital.\n\nStudents will also read and hear '),
        const MixedSegment.vietnamese(
          'những quảng cáo hoặc chương trình quảng bá',
          'advertisements or promotions',
        ),
        const MixedSegment.english(' for different kinds of '),
        const MixedSegment.vietnamese(
          'các sự kiện giải trí',
          'entertainment events',
        ),
        const MixedSegment.english(' and will need to listen carefully for the '),
        const MixedSegment.vietnamese('giá các loại vé', 'cost of tickets'),
        const MixedSegment.english(
          ' and how they can be obtained (online, by telephone or ',
        ),
        const MixedSegment.vietnamese('tại phòng bán vé', 'at the box office'),
        const MixedSegment.english(') and whether there are '),
        const MixedSegment.vietnamese('các mức giá đặc biệt', 'special prices'),
        const MixedSegment.english(' for children or if there are '),
        const MixedSegment.vietnamese(
          'những buổi diễn đặc biệt',
          'special performances',
        ),
        const MixedSegment.english(' at a special date and time such as '),
        const MixedSegment.vietnamese('một buổi diễn ban ngày', 'a matinee'),
        const MixedSegment.english('.'),
      ];

  // ═══════════════════════════════════════════════════════════════
  // DAY 2
  // ═══════════════════════════════════════════════════════════════
  static LessonDay get day2 => LessonDay(
        id: 'theme05_day2',
        dayNumber: 2,
        themeId: 'theme_05_entertainment',
        titleVi: 'Phần 2: Nghe và Luyện Trí Nhớ',
        phases: [
          // QUIZ phases
          LessonPhase(
            id: 'theme05_day2_quiz1',
            phaseTypeStr: 'listening_quiz',
            titleEn: 'Practice 1: Conversation',
            titleVi: 'Luyện tập 1: Hội thoại',
            audioTrackKey: 'track_20',
            questions: _practice1Questions,
          ),
          LessonPhase(
            id: 'theme05_day2_quiz2',
            phaseTypeStr: 'listening_quiz',
            titleEn: 'Practice 2: Short Talk - Award Presentation',
            titleVi: 'Luyện tập 2: Bài ngắn - Trao giải',
            audioTrackKey: 'track_21',
            questions: _practice2Questions,
          ),
          LessonPhase(
            id: 'theme05_day2_quiz3',
            phaseTypeStr: 'listening_quiz',
            titleEn: 'Practice 3: Short Talk - Theater Announcement',
            titleVi: 'Luyện tập 3: Bài ngắn - Thông báo rạp chiếu phim',
            audioTrackKey: 'track_22',
            questions: _practice3Questions,
          ),

          // TRANSLATE phases
          LessonPhase(
            id: 'theme05_day2_translate1',
            phaseTypeStr: 'translate',
            titleEn: 'Listen & Translate: Conversation',
            titleVi: 'Nghe và Dịch: Hội thoại',
            audioTrackKey: 'track_20',
            contentEn: '''M: Susan, this morning I tried to get the tickets to the play you told me about but the Monday and Wednesday shows are both sold out. However, there are still seats for the Thursday night show. What do you think? Will you be free on Thursday?

W: No, we have a long meeting on Thursday afternoon so I won't be able to get home until 8 p.m. There's no way we are going to make it to the play on time and I don't want to miss the beginning part of the play.

M: Okay, let me see whether there are seats available for next week's shows. I know you really want to go see this play.

W: That is really the only one I want to see. My friends have told me so much about the play already.''',
            contentVi: '''M: Susan này, sáng nay anh cố gắng mua mấy vé xem vở kịch mà em bảo anh, nhưng những buổi diễn thứ Hai và thứ Tư đều bán hết vé rồi. Tuy nhiên, vẫn còn vài chỗ cho buổi diễn tối thứ Năm. Em nghĩ sao? Em có rảnh vào thứ Năm không?

W: Không. Chúng em có một cuộc họp dài vào chiều thứ Năm nên em không thể về nhà trước 8 giờ tối. Chúng ta sẽ không thể tới kịp để xem vở kịch và em không muốn bỏ lỡ đoạn đầu của vở kịch.

M: Được rồi, để anh xem liệu có còn chỗ cho các buổi diễn vào tuần sau không. Anh biết em thực sự muốn xem vở kịch này.

W: Đó thật sự là vở kịch duy nhất mà em muốn xem. Các bạn em đã nói với em rất nhiều về vở kịch này.''',
          ),
          LessonPhase(
            id: 'theme05_day2_translate2',
            phaseTypeStr: 'translate',
            titleEn: 'Listen & Translate: Award Presentation',
            titleVi: 'Nghe và Dịch: Trao giải',
            audioTrackKey: 'track_21',
            contentEn: '''Good evening everybody. It's my great pleasure to present this award to Jonathan Walters, composer of the extremely popular song "Forever with You". Over the past 20 years, Mr. Walters has written over 40 hits and has been honored as one of the most successful composers of our generation. In addition to these honors, he has been the featured artist on the soundtracks for more than 10 movies in the past 5 years. Ladies and gentlemen, give a big hand for Jonathan Walters!''',
            contentVi: '''Kính chào quý vị. Tôi rất vui mừng được trao giải thưởng này cho ông Jonathan Walters, tác giả của bài hát vô cùng nổi tiếng "Forever with You". Trong suốt hơn 20 năm qua, ông Walters đã viết hơn 40 bài hát được yêu thích và được vinh danh là một trong những nhạc sỹ thành công nhất của thế hệ chúng ta. Ngoài những vinh dự này, ông ấy cũng là nghệ sỹ được mời viết nhạc phim cho hơn mười bộ phim trong 5 năm qua. Thưa các quý ông và quý bà, xin quý vị hãy dành một tràng pháo tay thật lớn cho Jonathan Walters!''',
          ),
          LessonPhase(
            id: 'theme05_day2_translate3',
            phaseTypeStr: 'translate',
            titleEn: 'Listen & Translate: Theater Announcement',
            titleVi: 'Nghe và Dịch: Thông báo rạp chiếu phim',
            audioTrackKey: 'track_22',
            contentEn: '''Attention all movie theater patrons, please note that the 7:30 p.m. screening of No Country for Old Men has been canceled due to problems with the theater's fire alarm system. We apologize for the inconvenience and would like to offer a refund and complimentary movie tickets to all customers, which means ticket-holders will be able to see the movie for free. We hope that the movie will be screened at the same time tomorrow evening. We would ask that all patrons leave the building now as we are required by law to evacuate this movie theater when the fire alarms are not operating correctly. Please walk calmly to the nearest exit and gather in front of the side entrance to the theater. Our staff will then issue coupons to all tickets-holders. CinemaStar Luxury Theater would like to thank you for your cooperation and understanding on this matter.''',
            contentVi: '''Xin tất cả các khách hàng thân thiết của rạp hãy chú ý! Xin quý vị lưu ý rằng buổi chiếu của bộ phim No Country for Old Men vào lúc 7h30 phút tối đã bị hủy do sự cố trong hệ thống báo cháy của rạp chiếu phim. Chúng tôi xin lỗi về sự bất tiện này và xin đề nghị được hoàn lại tiền cũng như tặng các vé mời xem phim miễn phí tới tất cả khách hàng, điều đó có nghĩa là những người có vé sẽ được xem bộ phim này miễn phí. Chúng tôi hy vọng bộ phim sẽ được chiếu vào cùng thời gian này tối mai. Chúng tôi phải yêu cầu tất cả các khách xem phim rời khỏi tòa nhà ngay bây giờ vì theo luật định, chúng tôi buộc phải sơ tán rạp chiếu phim này khi hệ thống báo cháy không hoạt động bình thường. Xin vui lòng đi bộ một cách bình tĩnh tới cửa thoát hiểm gần nhất và tập hợp ở phía trước của lối vào bên cạnh rạp chiếu phim. Sau đó, nhân viên của chúng tôi sẽ phát phiếu ưu đãi cho tất cả các quý khách có giữ vé. CinemaStar Luxury Theater xin cảm ơn vì sự hợp tác và thông cảm của quý khách trong vấn đề này.''',
          ),

          // MIND GAME phases
          LessonPhase(
            id: 'theme05_day2_mindgame1',
            phaseTypeStr: 'mind_game',
            titleEn: 'Memory Training: Conversation',
            titleVi: 'Huấn luyện Trí nhớ: Hội thoại',
            mixedSegments: _day2ConversationSegments,
            fabVocab: Theme5Content.conversationVocab,
            fabPhrases: Theme5Content.conversationPhrases,
            fabAnswers: Theme5Content.conversationAnswers,
          ),
          LessonPhase(
            id: 'theme05_day2_mindgame2',
            phaseTypeStr: 'mind_game',
            titleEn: 'Memory Training: Award Presentation',
            titleVi: 'Huấn luyện Trí nhớ: Trao giải',
            mixedSegments: _day2ShortTalk1Segments,
            fabVocab: Theme5Content.shortTalk1Vocab,
            fabPhrases: Theme5Content.shortTalk1Phrases,
            fabAnswers: Theme5Content.shortTalk1Answers,
          ),
          LessonPhase(
            id: 'theme05_day2_mindgame3',
            phaseTypeStr: 'mind_game',
            titleEn: 'Memory Training: Theater Announcement',
            titleVi: 'Huấn luyện Trí nhớ: Thông báo rạp chiếu phim',
            mixedSegments: _day2ShortTalk2Segments,
            fabVocab: Theme5Content.shortTalk2Vocab,
            fabPhrases: Theme5Content.shortTalk2Phrases,
            fabAnswers: Theme5Content.shortTalk2Answers,
          ),
        ],
      );

  // ═══════════════════════════════════════════════════════════════
  // Quiz Questions (9) - suy luận đúng theo transcript đã cung cấp
  // ═══════════════════════════════════════════════════════════════

  static List<QuizQuestion> get _practice1Questions => [
        QuizQuestion(
          id: 'q05_p1_1',
          questionText: 'Why will the speakers not see the play on Monday?',
          options: [
            '(A) They are busy on Monday.',
            '(B) The woman has to attend a meeting on Monday.',
            '(C) The Monday show has been canceled.',
            '(D) They couldn\'t get the tickets.',
          ],
          correctIndex: 3,
          audioTrackKey: 'track_20',
          practiceNumber: 'practice1',
        ),
        QuizQuestion(
          id: 'q05_p1_2',
          questionText: 'Why does the woman not want to see the play on Thursday?',
          options: [
            '(A) Tickets are expensive.',
            '(B) She won\'t be able to get to the theater on time.',
            '(C) The man is busy on Thursday.',
            '(D) She has already seen the play.',
          ],
          correctIndex: 1,
          audioTrackKey: 'track_20',
          practiceNumber: 'practice1',
        ),
        QuizQuestion(
          id: 'q05_p1_3',
          questionText: 'What does the man suggest they do?',
          options: [
            '(A) See the play next week',
            '(B) See a different play',
            '(C) See a movie instead',
            '(D) Ask a few friends to join them',
          ],
          correctIndex: 0,
          audioTrackKey: 'track_20',
          practiceNumber: 'practice1',
        ),
      ];

  static List<QuizQuestion> get _practice2Questions => [
        QuizQuestion(
          id: 'q05_p2_1',
          questionText: 'What is Mr. Walters\' job?',
          options: [
            '(A) Musician',
            '(B) Poet',
            '(C) Actor',
            '(D) Model',
          ],
          correctIndex: 0,
          audioTrackKey: 'track_21',
          practiceNumber: 'practice2',
        ),
        QuizQuestion(
          id: 'q05_p2_2',
          questionText: 'How long has Mr. Walters been in the business?',
          options: [
            '(A) 5 years',
            '(B) 10 years',
            '(C) 20 years',
            '(D) 40 years',
          ],
          correctIndex: 2,
          audioTrackKey: 'track_21',
          practiceNumber: 'practice2',
        ),
        QuizQuestion(
          id: 'q05_p2_3',
          questionText: 'What has Mr. Walters written for movies?',
          options: [
            '(A) Screen plays',
            '(B) Soundtracks',
            '(C) Scripts',
            '(D) Two songs',
          ],
          correctIndex: 1,
          audioTrackKey: 'track_21',
          practiceNumber: 'practice2',
        ),
      ];

  static List<QuizQuestion> get _practice3Questions => [
        QuizQuestion(
          id: 'q05_p3_1',
          questionText: 'Why isn\'t the movie shown?',
          options: [
            '(A) There are not enough customers.',
            '(B) There is a worker\'s strike.',
            '(C) The ticketing system is down.',
            '(D) The theater isn\'t safe.',
          ],
          correctIndex: 3,
          audioTrackKey: 'track_22',
          practiceNumber: 'practice3',
        ),
        QuizQuestion(
          id: 'q05_p3_2',
          questionText: 'What are the customers asked to do?',
          options: [
            '(A) Collect a refund form',
            '(B) Stay until the movie is finished',
            '(C) Evacuate the theater',
            '(D) Check the schedule',
          ],
          correctIndex: 2,
          audioTrackKey: 'track_22',
          practiceNumber: 'practice3',
        ),
        QuizQuestion(
          id: 'q05_p3_3',
          questionText: 'What can the customers get at the entrance?',
          options: [
            '(A) An actor\'s autograph',
            '(B) A movie schedule',
            '(C) A coupon',
            '(D) A protective mask',
          ],
          correctIndex: 2,
          audioTrackKey: 'track_22',
          practiceNumber: 'practice3',
        ),
      ];

  // ═══════════════════════════════════════════════════════════════
  // Mind Game Segments Day 2
  // ═══════════════════════════════════════════════════════════════

  static List<MixedSegment> get _day2ConversationSegments => [
        const MixedSegment.english('M: Susan, this morning I '),
        const MixedSegment.vietnamese(
          'đã cố gắng mua vé',
          'tried to get the tickets',
        ),
        const MixedSegment.english(' to '),
        const MixedSegment.vietnamese('vở kịch', 'the play'),
        const MixedSegment.english(' you told me about but '),
        const MixedSegment.vietnamese(
          'các buổi diễn vào thứ Hai và thứ Tư',
          'the Monday and Wednesday shows',
        ),
        const MixedSegment.english(' are both '),
        const MixedSegment.vietnamese('đã bán hết', 'sold out'),
        const MixedSegment.english('. '),
        const MixedSegment.vietnamese('Tuy nhiên', 'However'),
        const MixedSegment.english(', there are still '),
        const MixedSegment.vietnamese('các chỗ ngồi', 'seats'),
        const MixedSegment.english(' for the Thursday night show. '),
        const MixedSegment.vietnamese('Em nghĩ sao', 'What do you think'),
        const MixedSegment.english('? Will you be '),
        const MixedSegment.vietnamese('rảnh', 'free'),
        const MixedSegment.english(' on Thursday?\n\nW: No, we '),
        const MixedSegment.vietnamese(
          'có một cuộc họp dài',
          'have a long meeting',
        ),
        const MixedSegment.english(' on Thursday afternoon so I '),
        const MixedSegment.vietnamese(
          'sẽ không thể về nhà',
          'won\'t be able to get home',
        ),
        const MixedSegment.english(
          ' until 8 p.m. There\'s no way we are going to ',
        ),
        const MixedSegment.vietnamese(
          'kịp tới xem vở kịch đó đúng giờ',
          'make it to the play on time',
        ),
        const MixedSegment.english(' and I don\'t want to '),
        const MixedSegment.vietnamese(
          'bỏ lỡ phần đầu',
          'miss the beginning part',
        ),
        const MixedSegment.english(' of the play.\n\nM: Okay, '),
        const MixedSegment.vietnamese(
          'để anh xem liệu rằng',
          'let me see whether',
        ),
        const MixedSegment.english(' there are seats available for '),
        const MixedSegment.vietnamese(
          'các buổi biểu diễn tuần tới',
          'next week\'s shows',
        ),
        const MixedSegment.english('. I know you '),
        const MixedSegment.vietnamese(
          'thực sự muốn đi xem vở kịch này',
          'really want to go see this play',
        ),
        const MixedSegment.english('.\n\nW: That is really '),
        const MixedSegment.vietnamese('vở kịch duy nhất', 'the only one'),
        const MixedSegment.english(' I want to see. My friends '),
        const MixedSegment.vietnamese(
          'đã nói với em rất nhiều về vở kịch này rồi',
          'have told me so much about the play already',
        ),
        const MixedSegment.english('.'),
      ];

  static List<MixedSegment> get _day2ShortTalk1Segments => [
        const MixedSegment.english('Good evening everybody. '),
        const MixedSegment.vietnamese(
          'Tôi rất vui mừng',
          'It\'s my great pleasure',
        ),
        const MixedSegment.english(' to '),
        const MixedSegment.vietnamese(
          'trao tặng giải thưởng này',
          'present this award',
        ),
        const MixedSegment.english(' to Jonathan Walters, composer of '),
        const MixedSegment.vietnamese(
          'bài hát vô cùng nổi tiếng',
          'the extremely popular song',
        ),
        const MixedSegment.english(
          ' "Forever with You". ',
        ),
        const MixedSegment.vietnamese(
          'Qua hơn 20 năm qua',
          'Over the past 20 years',
        ),
        const MixedSegment.english(', Mr. Walters has written '),
        const MixedSegment.vietnamese(
          'hơn 40 bài hát nổi tiếng',
          'over 40 hits',
        ),
        const MixedSegment.english(' and '),
        const MixedSegment.vietnamese(
          'đã được vinh danh',
          'has been honored',
        ),
        const MixedSegment.english(' as '),
        const MixedSegment.vietnamese(
          'một trong những nhạc sĩ thành công nhất',
          'one of the most successful composers',
        ),
        const MixedSegment.english(' of our generation. '),
        const MixedSegment.vietnamese(
          'Ngoài những vinh dự này',
          'In addition to these honors',
        ),
        const MixedSegment.english(', he has been the featured artist on '),
        const MixedSegment.vietnamese('các bản nhạc phim', 'the soundtracks'),
        const MixedSegment.english(' for more than 10 movies '),
        const MixedSegment.vietnamese(
          'trong 5 năm qua',
          'in the past 5 years',
        ),
        const MixedSegment.english('. Ladies and gentlemen, '),
        const MixedSegment.vietnamese(
          'hãy dành một tràng pháo tay cho',
          'give a big hand for',
        ),
        const MixedSegment.english(' Jonathan Walters!'),
      ];

  static List<MixedSegment> get _day2ShortTalk2Segments => [
        const MixedSegment.english('Attention '),
        const MixedSegment.vietnamese(
          'tất cả các khách hàng thân thiết của rạp',
          'all movie theater patrons',
        ),
        const MixedSegment.english(', please '),
        const MixedSegment.vietnamese('lưu ý rằng', 'note that'),
        const MixedSegment.english(
          ' the 7:30 p.m. screening of No Country for Old Men ',
        ),
        const MixedSegment.vietnamese('đã bị hủy', 'has been canceled'),
        const MixedSegment.english(' due to problems with '),
        const MixedSegment.vietnamese(
          'hệ thống báo cháy của rạp chiếu phim',
          'the theater\'s fire alarm system',
        ),
        const MixedSegment.english('. We '),
        const MixedSegment.vietnamese(
          'xin lỗi vì sự bất tiện này',
          'apologize for the inconvenience',
        ),
        const MixedSegment.english(' and would like to '),
        const MixedSegment.vietnamese('xin hoàn lại tiền', 'offer a refund'),
        const MixedSegment.english(' and '),
        const MixedSegment.vietnamese(
          'các vé mời xem phim miễn phí',
          'complimentary movie tickets',
        ),
        const MixedSegment.english(' to '),
        const MixedSegment.vietnamese('tất cả khách hàng', 'all customers'),
        const MixedSegment.english(', which means '),
        const MixedSegment.vietnamese('những người có vé', 'ticket-holders'),
        const MixedSegment.english(' will be able to '),
        const MixedSegment.vietnamese('xem phim miễn phí', 'see the movie for free'),
        const MixedSegment.english('. We hope that the movie '),
        const MixedSegment.vietnamese('sẽ được chiếu', 'will be screened'),
        const MixedSegment.english(
          ' at the same time tomorrow evening. We would ask that all patrons ',
        ),
        const MixedSegment.vietnamese('rời toà nhà', 'leave the building'),
        const MixedSegment.english(' now as we '),
        const MixedSegment.vietnamese(
          'được yêu cầu theo luật',
          'are required by law',
        ),
        const MixedSegment.english(
          ' to ',
        ),
        const MixedSegment.vietnamese('sơ tán', 'evacuate'),
        const MixedSegment.english(
          ' this movie theater when the fire alarms ',
        ),
        const MixedSegment.vietnamese(
          'đang không hoạt động bình thường',
          'are not operating correctly',
        ),
        const MixedSegment.english('. Please '),
        const MixedSegment.vietnamese(
          'đi bộ một cách bình tĩnh',
          'walk calmly',
        ),
        const MixedSegment.english(' to '),
        const MixedSegment.vietnamese('lối thoát gần nhất', 'the nearest exit'),
        const MixedSegment.english(' and '),
        const MixedSegment.vietnamese('tập hợp', 'gather'),
        const MixedSegment.english(
          ' in front of the side entrance to the theater. ',
        ),
        const MixedSegment.vietnamese(
          'Nhân viên của chúng tôi',
          'Our staff',
        ),
        const MixedSegment.english(' will then '),
        const MixedSegment.vietnamese('phát các phiếu giảm giá', 'issue coupons'),
        const MixedSegment.english(' to all tickets-holders. CinemaStar Luxury Theater would like to '),
        const MixedSegment.vietnamese(
          'cảm ơn vì sự hợp tác của quý vị',
          'thank you for your cooperation',
        ),
        const MixedSegment.english(' and '),
        const MixedSegment.vietnamese('sự thông cảm', 'understanding'),
        const MixedSegment.english(' on this matter.'),
      ];
}

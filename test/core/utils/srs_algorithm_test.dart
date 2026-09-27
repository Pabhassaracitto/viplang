import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:viplang/core/utils/srs_algorithm.dart';
import 'package:viplang/data/models/vocab_model.dart';

VocabModel _makeVocab({
  String id = 'test_001',
  int repetitionCount = 0,
  double easeFactor = 2.5,
  int intervalDays = 0,
  DateTime? nextReview,
}) {
  return VocabModel(
    id: id,
    wordEn: 'meeting',
    wordVi: 'cuộc họp',
    pronunciation: '/ˈmiːtɪŋ/',
    partOfSpeech: 'n',
    themeId: 'theme_01_offices',
    exampleEn: 'We have a meeting at 9.',
    exampleVi: 'Chúng tôi có cuộc họp lúc 9 giờ.',
  )
    ..repetitionCount = repetitionCount
    ..easeFactor = easeFactor
    ..intervalDays = intervalDays
    ..nextReview = nextReview;
}

void main() {
  late Box<VocabModel> box;

  setUpAll(() async {
    Hive.init('/tmp/viplang_srs_test');
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(VocabModelAdapter());
    }
    box = await Hive.openBox<VocabModel>('srs_test_box');
  });

  tearDown(() async {
    await box.clear();
  });

  tearDownAll(() async {
    await box.close();
  });

  /// Put vào box để vocab.save() trong SrsAlgorithm hoạt động.
  VocabModel seed(VocabModel v) {
    box.put(v.id, v);
    return box.get(v.id)!;
  }

  group('SrsAlgorithm.calculateNextReview (SM-2)', () {
    test('lần đầu trả lời đúng (quality ≥ 3) → interval = 1 ngày', () {
      final v = seed(_makeVocab());
      SrsAlgorithm.calculateNextReview(v, 4); // good
      expect(v.repetitionCount, 1);
      expect(v.intervalDays, 1);
      expect(v.nextReview, isNotNull);
      expect(
        v.nextReview!.difference(DateTime.now()).inDays,
        inInclusiveRange(0, 1),
      );
    });

    test('lần thứ 2 trả lời đúng → interval = 6 ngày', () {
      final v = seed(_makeVocab(repetitionCount: 1, intervalDays: 1));
      SrsAlgorithm.calculateNextReview(v, 4);
      expect(v.repetitionCount, 2);
      expect(v.intervalDays, 6);
    });

    test('lần ≥ 3 trả lời đúng → interval = round(interval × EF)', () {
      final v = seed(
        _makeVocab(repetitionCount: 2, intervalDays: 6, easeFactor: 2.5),
      );
      SrsAlgorithm.calculateNextReview(v, 4);
      expect(v.repetitionCount, 3);
      // 6 × EF(≈2.58 sau quality=4) ≈ 15
      expect(v.intervalDays, greaterThanOrEqualTo(14));
    });

    test('trả lời sai (quality < 3) → reset repetition, interval = 1', () {
      final v = seed(
        _makeVocab(repetitionCount: 5, intervalDays: 30, easeFactor: 2.8),
      );
      final efBefore = v.easeFactor;
      SrsAlgorithm.calculateNextReview(v, 1); // wrong
      expect(v.repetitionCount, 0);
      expect(v.intervalDays, 1);
      expect(v.easeFactor, efBefore);
    });

    test('EF không bao giờ xuống dưới 1.3', () {
      final v = seed(
        _makeVocab(repetitionCount: 3, intervalDays: 10, easeFactor: 1.31),
      );
      SrsAlgorithm.calculateNextReview(v, 3);
      expect(v.easeFactor, greaterThanOrEqualTo(1.3));
      SrsAlgorithm.calculateNextReview(v, 3);
      expect(v.easeFactor, greaterThanOrEqualTo(1.3));
    });

    test('quality=5 (perfect) tăng EF', () {
      final v = seed(_makeVocab(repetitionCount: 2, intervalDays: 6));
      final efBefore = v.easeFactor;
      SrsAlgorithm.calculateNextReview(v, 5);
      expect(v.easeFactor, greaterThan(efBefore));
    });
  });

  group('SrsAlgorithm.getDueCards', () {
    test('nextReview = null được coi là due', () {
      final v = _makeVocab();
      expect(v.isDueForReview, isTrue);
      final due = SrsAlgorithm.getDueCards([v]);
      expect(due.length, 1);
    });

    test('sắp xếp thẻ overdue theo nextReview tăng dần', () {
      final now = DateTime.now();
      final overdueA = _makeVocab(id: 'a')
        ..nextReview = now.subtract(const Duration(days: 3));
      final overdueB = _makeVocab(id: 'b')
        ..nextReview = now.subtract(const Duration(days: 1));
      final future = _makeVocab(id: 'f')
        ..nextReview = now.add(const Duration(days: 5));

      final result = SrsAlgorithm.getDueCards([overdueB, future, overdueA]);
      // future bị loại (chưa đến hạn)
      expect(result.length, 2);
      expect(result.first.id, 'a'); // cũ hơn xếp trước
      expect(result.last.id, 'b');
    });
  });

  group('SrsAlgorithm.calculateRetention', () {
    test('nextReview = null → 0', () {
      final v = _makeVocab();
      expect(SrsAlgorithm.calculateRetention(v), 0.0);
    });

    test('vừa review (còn tương lai) → 1', () {
      final v = _makeVocab(intervalDays: 6)
        ..nextReview = DateTime.now().add(const Duration(days: 6));
      expect(SrsAlgorithm.calculateRetention(v), 1.0);
    });

    test('retention nằm trong [0, 1] với interval > 0', () {
      final v = _makeVocab(intervalDays: 10)
        ..nextReview = DateTime.now().subtract(const Duration(days: 15));
      final r = SrsAlgorithm.calculateRetention(v);
      expect(r, inInclusiveRange(0.0, 1.0));
    });

    test('interval = 0 không chia cho 0 → an toàn', () {
      final v = _makeVocab(intervalDays: 0)
        ..nextReview = DateTime.now().subtract(const Duration(days: 1));
      final r = SrsAlgorithm.calculateRetention(v);
      expect(r, inInclusiveRange(0.0, 1.0));
    });
  });
}

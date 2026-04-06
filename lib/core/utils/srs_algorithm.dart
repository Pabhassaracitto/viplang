import '../../data/models/vocab_model.dart';

/// SM-2 Spaced Repetition Algorithm
class SrsAlgorithm {
  static const double _minEaseFactor = 1.3;

  /// quality: 0=blackout, 1=wrong, 2=hard, 3=good, 4=easy, 5=perfect
  static void calculateNextReview(VocabModel vocab, int quality) {
    assert(quality >= 0 && quality <= 5);

    double ef = vocab.easeFactor;
    int n = vocab.repetitionCount;
    int interval;

    if (quality >= 3) {
      // Correct response
      if (n == 0) {
        interval = 1;
      } else if (n == 1) {
        interval = 6;
      } else {
        interval = (vocab.intervalDays * ef).round();
      }
      n++;
      // Update EF
      ef = ef + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02));
      if (ef < _minEaseFactor) ef = _minEaseFactor;
    } else {
      // Incorrect - reset repetitions
      n = 0;
      interval = 1;
    }

    vocab.repetitionCount = n;
    vocab.easeFactor = ef;
    vocab.intervalDays = interval;
    vocab.nextReview = DateTime.now().add(Duration(days: interval));
    vocab.save();
  }

  /// Get due cards from a list
  static List<VocabModel> getDueCards(List<VocabModel> allVocabs) {
    return allVocabs
        .where((v) => v.isDueForReview)
        .toList()
      ..sort((a, b) {
        if (a.nextReview == null) return -1;
        if (b.nextReview == null) return 1;
        return a.nextReview!.compareTo(b.nextReview!);
      });
  }

  /// Calculate retention percentage (Ebbinghaus curve approximation)
  static double calculateRetention(VocabModel vocab) {
    if (vocab.nextReview == null) return 0.0;
    final daysSinceReview = DateTime.now()
        .difference(
            vocab.nextReview!.subtract(Duration(days: vocab.intervalDays)))
        .inDays;
    if (daysSinceReview <= 0) return 1.0;

    // R = e^(-t/S) where S = stability (interval in days)
    final stability = vocab.intervalDays.toDouble();
    final retention = _exp(-daysSinceReview / (stability * 1.5));
    return retention.clamp(0.0, 1.0);
  }

  static double _exp(double x) => x >= 0 ? 1.0 : (1.0 / (1.0 - x));
}

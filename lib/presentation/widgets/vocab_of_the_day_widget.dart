// lib/presentation/widgets/vocab_of_the_day_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/progress/progress_bloc.dart';
import '../blocs/progress/progress_state.dart';
import '../screens/vocab/srs_review_screen.dart';
import 'vocabulary_speaker_button.dart';

class VocabOfTheDayWidget extends StatelessWidget {
  const VocabOfTheDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      builder: (context, state) {
        // Handle loading/error
        if (state is ProgressLoading) {
          return _buildLoadingState();
        }

        if (state is ProgressError) {
          return const SizedBox.shrink();
        }

        // ✅ FIX: Type guard
        if (state is! ProgressLoaded) {
          return const SizedBox.shrink();
        }

        final vocab = state.todayVocab;
        if (vocab == null) {
          return const SizedBox.shrink();
        }

        return _buildVocabCard(context, vocab, state.todayGoal);
      },
    );
  }

  Widget _buildLoadingState() {
    return const Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget _buildVocabCard(BuildContext context, vocab, int todayGoal) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Icon(Icons.auto_awesome, size: 16, color: Colors.amber),
                const SizedBox(width: 6),
                Text(
                  'Từ vựng hôm nay',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                const Spacer(),
                // ✅ NEW: Hiển thị chỉ tiêu hôm nay
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Chỉ tiêu: $todayGoal',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Từ chính + nút loa
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  vocab.wordEn,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                VocabularySpeakerButton(text: vocab.wordEn, size: 22),
                const SizedBox(width: 8),
                Text(
                  vocab.pronunciation,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),
            Text(vocab.wordVi, style: Theme.of(context).textTheme.bodyLarge),

            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (vocab.exampleEn != null)
                    Text(
                      vocab.exampleEn!,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  if (vocab.exampleEn != null && vocab.exampleVi != null)
                    const SizedBox(height: 4),
                  if (vocab.exampleVi != null)
                    Text(
                      vocab.exampleVi!,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Action: Ôn lại ngay
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // ✅ FIX: Điều hướng đến SRS screen thay vì BLoC event
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SrsReviewScreen()),
                  );
                },
                icon: const Icon(Icons.replay, size: 16),
                label: const Text('Ôn lại ngay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

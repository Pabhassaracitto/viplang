// lib/presentation/blocs/progress/progress_state.dart

import 'package:equatable/equatable.dart';
import '../../../data/models/vocab_model.dart';

abstract class ProgressState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProgressInitial extends ProgressState {}

class ProgressLoading extends ProgressState {}

class ProgressLoaded extends ProgressState {
  final VocabModel? todayVocab;
  final int dueCount;
  final int masteredCount;

  // ✅ FIX: Bỏ const
  ProgressLoaded({this.todayVocab, this.dueCount = 0, this.masteredCount = 0});

  @override
  List<Object?> get props => [todayVocab, dueCount, masteredCount];
}

class ProgressError extends ProgressState {
  final String message;
  ProgressError(this.message);
  @override
  List<Object?> get props => [message];
}

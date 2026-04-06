import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/mixed_segment_model.dart';

// Events
abstract class MindGameEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMindGameEvent extends MindGameEvent {
  final List<MixedSegment> segments;
  LoadMindGameEvent(this.segments);
  @override
  List<Object?> get props => [segments];
}

class RevealAnswerEvent extends MindGameEvent {
  final int segmentIndex;
  RevealAnswerEvent(this.segmentIndex);
  @override
  List<Object?> get props => [segmentIndex];
}

class RevealAllEvent extends MindGameEvent {}
class ResetGameEvent extends MindGameEvent {}
class MarkCorrectEvent extends MindGameEvent {
  final int segmentIndex;
  MarkCorrectEvent(this.segmentIndex);
  @override
  List<Object?> get props => [segmentIndex];
}

// States
abstract class MindGameState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MindGameInitial extends MindGameState {}

class MindGameActive extends MindGameState {
  final List<MixedSegment> segments;
  final Set<int> revealedIndices;
  final Set<int> correctIndices;
  final int totalViSegments;
  final double progressPercent;

  MindGameActive({
    required this.segments,
    required this.revealedIndices,
    required this.correctIndices,
    required this.totalViSegments,
    required this.progressPercent,
  });

  bool isRevealed(int index) => revealedIndices.contains(index);
  bool isCorrect(int index) => correctIndices.contains(index);

  bool get isAllRevealed => revealedIndices.length >= totalViSegments;

  @override
  List<Object?> get props => [
        segments,
        revealedIndices,
        correctIndices,
        progressPercent,
      ];
}

class MindGameCompleted extends MindGameState {
  final int correctCount;
  final int totalCount;
  final double score;
  MindGameCompleted({
    required this.correctCount,
    required this.totalCount,
    required this.score,
  });
  @override
  List<Object?> get props => [correctCount, totalCount, score];
}

// BLoC
class MindGameBloc extends Bloc<MindGameEvent, MindGameState> {
  MindGameBloc() : super(MindGameInitial()) {
    on<LoadMindGameEvent>(_onLoad);
    on<RevealAnswerEvent>(_onReveal);
    on<RevealAllEvent>(_onRevealAll);
    on<ResetGameEvent>(_onReset);
    on<MarkCorrectEvent>(_onMarkCorrect);
  }

  List<MixedSegment> _segments = [];
  Set<int> _revealed = {};
  Set<int> _correct = {};
  int _totalVi = 0;

  void _onLoad(LoadMindGameEvent event, Emitter<MindGameState> emit) {
    _segments = event.segments;
    _revealed = {};
    _correct = {};
    _totalVi = _segments
        .where((s) => s.segmentType == SegmentType.vietnamese)
        .length;
    emit(_buildActiveState());
  }

  void _onReveal(RevealAnswerEvent event, Emitter<MindGameState> emit) {
    _revealed.add(event.segmentIndex);
    emit(_buildActiveState());
  }

  void _onRevealAll(RevealAllEvent event, Emitter<MindGameState> emit) {
    for (int i = 0; i < _segments.length; i++) {
      if (_segments[i].segmentType == SegmentType.vietnamese) {
        _revealed.add(i);
      }
    }
    emit(_buildActiveState());
  }

  void _onMarkCorrect(MarkCorrectEvent event, Emitter<MindGameState> emit) {
    _correct.add(event.segmentIndex);
    final progress = _totalVi == 0 ? 0.0 : _correct.length / _totalVi;
    if (_correct.length >= _totalVi) {
      emit(MindGameCompleted(
        correctCount: _correct.length,
        totalCount: _totalVi,
        score: progress,
      ));
    } else {
      emit(_buildActiveState());
    }
  }

  void _onReset(ResetGameEvent event, Emitter<MindGameState> emit) {
    _revealed = {};
    _correct = {};
    emit(_buildActiveState());
  }

  MindGameActive _buildActiveState() {
    final progress = _totalVi == 0 ? 0.0 : _revealed.length / _totalVi;
    return MindGameActive(
      segments: _segments,
      revealedIndices: Set.from(_revealed),
      correctIndices: Set.from(_correct),
      totalViSegments: _totalVi,
      progressPercent: progress,
    );
  }
}

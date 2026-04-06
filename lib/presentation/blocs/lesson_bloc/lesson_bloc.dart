import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/lesson_model.dart';
import '../../../data/content/theme1_content.dart';

// Events
abstract class LessonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLessonEvent extends LessonEvent {
  final String themeId;
  final int dayNumber;
  LoadLessonEvent(this.themeId, this.dayNumber);
  @override
  List<Object?> get props => [themeId, dayNumber];
}

class CompletePhaseEvent extends LessonEvent {
  final String phaseId;
  CompletePhaseEvent(this.phaseId);
  @override
  List<Object?> get props => [phaseId];
}

class NextPhaseEvent extends LessonEvent {}
class PreviousPhaseEvent extends LessonEvent {}

// States
abstract class LessonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LessonInitial extends LessonState {}
class LessonLoading extends LessonState {}

class LessonLoaded extends LessonState {
  final LessonDay lessonDay;
  final int currentPhaseIndex;
  final bool isCompleted;

  LessonLoaded({
    required this.lessonDay,
    required this.currentPhaseIndex,
    this.isCompleted = false,
  });

  LessonPhase get currentPhase =>
      lessonDay.phases[currentPhaseIndex];

  bool get isLastPhase =>
      currentPhaseIndex >= lessonDay.phases.length - 1;

  bool get isFirstPhase => currentPhaseIndex == 0;

  @override
  List<Object?> get props => [lessonDay, currentPhaseIndex, isCompleted];
}

class LessonCompleted extends LessonState {
  final LessonDay lessonDay;
  final int xpEarned;
  LessonCompleted(this.lessonDay, this.xpEarned);
  @override
  List<Object?> get props => [lessonDay, xpEarned];
}

class LessonError extends LessonState {
  final String message;
  LessonError(this.message);
  @override
  List<Object?> get props => [message];
}

// BLoC
class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(LessonInitial()) {
    on<LoadLessonEvent>(_onLoadLesson);
    on<CompletePhaseEvent>(_onCompletePhase);
    on<NextPhaseEvent>(_onNextPhase);
    on<PreviousPhaseEvent>(_onPreviousPhase);
  }

  Future<void> _onLoadLesson(
    LoadLessonEvent event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonLoading());
    try {
      LessonDay? lesson;
      if (event.themeId == 'theme_01_offices') {
        lesson = event.dayNumber == 1
            ? Theme1Content.day1
            : Theme1Content.day2;
      }
      if (lesson == null) throw Exception('Lesson not found');
      emit(LessonLoaded(lessonDay: lesson, currentPhaseIndex: 0));
    } catch (e) {
      emit(LessonError(e.toString()));
    }
  }

  void _onCompletePhase(
    CompletePhaseEvent event,
    Emitter<LessonState> emit,
  ) {
    final state = this.state;
    if (state is LessonLoaded) {
      final phases = state.lessonDay.phases;
      final idx = phases.indexWhere((p) => p.id == event.phaseId);
      if (idx != -1) {
        phases[idx].isCompleted = true;
      }
      emit(LessonLoaded(
        lessonDay: state.lessonDay,
        currentPhaseIndex: state.currentPhaseIndex,
      ));
    }
  }

  void _onNextPhase(NextPhaseEvent event, Emitter<LessonState> emit) {
    final state = this.state;
    if (state is LessonLoaded) {
      if (state.isLastPhase) {
        emit(LessonCompleted(state.lessonDay, _calcXP(state.lessonDay)));
      } else {
        emit(LessonLoaded(
          lessonDay: state.lessonDay,
          currentPhaseIndex: state.currentPhaseIndex + 1,
        ));
      }
    }
  }

  void _onPreviousPhase(PreviousPhaseEvent event, Emitter<LessonState> emit) {
    final state = this.state;
    if (state is LessonLoaded && !state.isFirstPhase) {
      emit(LessonLoaded(
        lessonDay: state.lessonDay,
        currentPhaseIndex: state.currentPhaseIndex - 1,
      ));
    }
  }

  int _calcXP(LessonDay lesson) {
    int xp = 0;
    for (final phase in lesson.phases) {
      if (phase.isCompleted) xp += 20;
    }
    return xp;
  }
}

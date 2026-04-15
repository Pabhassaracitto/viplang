// lib/presentation/blocs/lesson_bloc/lesson_bloc.dart

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/content/all_themes_registry.dart';
import '../../../data/models/lesson_model.dart';

// ══════════════════════════════════════════════════════════════════════════════
// EVENTS
// ══════════════════════════════════════════════════════════════════════════════

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

// ✅ NEW: Nhảy tới phase bất kỳ
class GoToPhaseEvent extends LessonEvent {
  final int phaseIndex;
  GoToPhaseEvent(this.phaseIndex);
  @override
  List<Object?> get props => [phaseIndex];
}

// ✅ NEW: Load lesson ở chế độ review (không reset progress)
class LoadLessonForReviewEvent extends LessonEvent {
  final String themeId;
  final int dayNumber;
  final int? startPhaseIndex;

  LoadLessonForReviewEvent(
    this.themeId,
    this.dayNumber, {
    this.startPhaseIndex,
  });
  @override
  List<Object?> get props => [themeId, dayNumber, startPhaseIndex];
}

// ══════════════════════════════════════════════════════════════════════════════
// STATES
// ══════════════════════════════════════════════════════════════════════════════

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
  final bool isReviewMode; // ✅ NEW

  LessonLoaded({
    required this.lessonDay,
    required this.currentPhaseIndex,
    this.isCompleted = false,
    this.isReviewMode = false, // ✅ NEW
  });

  LessonPhase get currentPhase => lessonDay.phases[currentPhaseIndex];

  bool get isLastPhase => currentPhaseIndex >= lessonDay.phases.length - 1;

  bool get isFirstPhase => currentPhaseIndex == 0;

  @override
  List<Object?> get props => [
    lessonDay,
    currentPhaseIndex,
    isCompleted,
    isReviewMode,
  ];
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

// ══════════════════════════════════════════════════════════════════════════════
// BLOC
// ══════════════════════════════════════════════════════════════════════════════

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(LessonInitial()) {
    on<LoadLessonEvent>(_onLoadLesson);
    on<LoadLessonForReviewEvent>(_onLoadLessonForReview); // ✅ NEW
    on<CompletePhaseEvent>(_onCompletePhase);
    on<NextPhaseEvent>(_onNextPhase);
    on<PreviousPhaseEvent>(_onPreviousPhase);
    on<GoToPhaseEvent>(_onGoToPhase); // ✅ NEW
  }

  Future<void> _onLoadLesson(
    LoadLessonEvent event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonInitial());
    emit(LessonLoading());

    try {
      final lesson = AllThemesRegistry.getLesson(
        event.themeId,
        event.dayNumber,
      );
      if (lesson == null) {
        throw Exception('Nội dung đang được phát triển!');
      }

      // Reset tất cả phases về chưa hoàn thành
      for (final phase in lesson.phases) {
        phase.isCompleted = false;
      }

      emit(
        LessonLoaded(
          lessonDay: lesson,
          currentPhaseIndex: 0,
          isReviewMode: false,
        ),
      );
    } catch (e) {
      emit(LessonError(e.toString()));
    }
  }

  // ✅ NEW: Load lesson cho chế độ review
  Future<void> _onLoadLessonForReview(
    LoadLessonForReviewEvent event,
    Emitter<LessonState> emit,
  ) async {
    emit(LessonLoading());

    try {
      final lesson = AllThemesRegistry.getLesson(
        event.themeId,
        event.dayNumber,
      );
      if (lesson == null) {
        throw Exception('Nội dung không tồn tại!');
      }

      // KHÔNG reset isCompleted - giữ nguyên trạng thái

      emit(
        LessonLoaded(
          lessonDay: lesson,
          currentPhaseIndex: event.startPhaseIndex ?? 0,
          isReviewMode: true, // ✅ Mark as review mode
        ),
      );
    } catch (e) {
      emit(LessonError(e.toString()));
    }
  }

  void _onCompletePhase(CompletePhaseEvent event, Emitter<LessonState> emit) {
    final state = this.state;
    if (state is LessonLoaded) {
      final phases = state.lessonDay.phases;
      final idx = phases.indexWhere((p) => p.id == event.phaseId);
      if (idx != -1) {
        phases[idx].isCompleted = true;
      }
      emit(
        LessonLoaded(
          lessonDay: state.lessonDay,
          currentPhaseIndex: state.currentPhaseIndex,
          isReviewMode: state.isReviewMode,
        ),
      );
    }
  }

  void _onNextPhase(NextPhaseEvent event, Emitter<LessonState> emit) {
    final state = this.state;
    if (state is LessonLoaded) {
      if (state.isLastPhase) {
        // ✅ Nếu đang review mode, không emit LessonCompleted
        if (state.isReviewMode) {
          // Có thể quay về phase 0 hoặc giữ nguyên
          emit(
            LessonLoaded(
              lessonDay: state.lessonDay,
              currentPhaseIndex: state.currentPhaseIndex,
              isCompleted: true,
              isReviewMode: true,
            ),
          );
        } else {
          emit(LessonCompleted(state.lessonDay, _calcXP(state.lessonDay)));
        }
      } else {
        emit(
          LessonLoaded(
            lessonDay: state.lessonDay,
            currentPhaseIndex: state.currentPhaseIndex + 1,
            isReviewMode: state.isReviewMode,
          ),
        );
      }
    }
  }

  void _onPreviousPhase(PreviousPhaseEvent event, Emitter<LessonState> emit) {
    final state = this.state;
    if (state is LessonLoaded && !state.isFirstPhase) {
      emit(
        LessonLoaded(
          lessonDay: state.lessonDay,
          currentPhaseIndex: state.currentPhaseIndex - 1,
          isReviewMode: state.isReviewMode,
        ),
      );
    }
  }

  // ✅ NEW: Nhảy tới phase cụ thể
  void _onGoToPhase(GoToPhaseEvent event, Emitter<LessonState> emit) {
    final state = this.state;
    if (state is LessonLoaded) {
      final maxIndex = state.lessonDay.phases.length - 1;
      final targetIndex = event.phaseIndex.clamp(0, maxIndex);

      emit(
        LessonLoaded(
          lessonDay: state.lessonDay,
          currentPhaseIndex: targetIndex,
          isReviewMode: state.isReviewMode,
        ),
      );
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

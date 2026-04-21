import 'package:equatable/equatable.dart';

abstract class ProgressEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Load vocab cần ôn hôm nay
class LoadTodayVocabEvent extends ProgressEvent {}

/// Refresh sau khi hoàn thành SRS session
class RefreshAfterSrsEvent extends ProgressEvent {}

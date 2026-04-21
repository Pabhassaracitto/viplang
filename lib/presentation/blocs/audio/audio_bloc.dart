import 'package:equatable/equatable.dart';

// ─── Events ────────────────────────────────────────────────────
abstract class AudioEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlayListeningAudio extends AudioEvent {
  final String assetPath;
  PlayListeningAudio(this.assetPath);
  @override
  List<Object?> get props => [assetPath];
}

class SpeakText extends AudioEvent {
  final String text;
  SpeakText(this.text);
  @override
  List<Object?> get props => [text];
}

class StopAllAudio extends AudioEvent {}

// ─── States ────────────────────────────────────────────────────
abstract class AudioState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AudioIdle extends AudioState {}

class AudioPlayingListening extends AudioState {
  final String path;
  AudioPlayingListening(this.path);
  @override
  List<Object?> get props => [path];
}

class AudioSpeakingTts extends AudioState {
  final String text;
  AudioSpeakingTts(this.text);
  @override
  List<Object?> get props => [text];
}

class AudioError extends AudioState {
  final String message;
  AudioError(this.message);
  @override
  List<Object?> get props => [message];
}

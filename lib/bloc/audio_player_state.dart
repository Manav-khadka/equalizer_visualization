part of 'audio_player_bloc.dart';

abstract class AudioPlayerState extends Equatable {
  const AudioPlayerState();

  @override
  List<Object?> get props => [];
}

class AudioPlayerInitial extends AudioPlayerState {}

class AudioLoadingState extends AudioPlayerState {}

class AudioLoadedState extends AudioPlayerState {
  final String audioPath;

  const AudioLoadedState({required this.audioPath});

  @override
  List<Object?> get props => [audioPath];
}

class AudioPlayingState extends AudioPlayerState {}

class AudioPausedState extends AudioPlayerState {}

class AudioErrorState extends AudioPlayerState {
  final String message;

  const AudioErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
class AudioResetState extends AudioPlayerState {}


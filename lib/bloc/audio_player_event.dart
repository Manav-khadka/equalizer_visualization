part of 'audio_player_bloc.dart';

abstract class AudioPlayerEvent extends Equatable {
  const AudioPlayerEvent();

  @override
  List<Object?> get props => [];
}

class LoadAudioEvent extends AudioPlayerEvent {
  final String audioPath;

  const LoadAudioEvent(this.audioPath);

  @override
  List<Object?> get props => [audioPath];
}

class PlayPauseAudioEvent extends AudioPlayerEvent {}
class ResetAudioEvent extends AudioPlayerEvent {}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AudioPlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event to start playing audio
class PlayAudioEvent extends AudioPlayerEvent {
  final String audioUrl;

  PlayAudioEvent({
    required this.audioUrl,
  });

  @override
  List<Object?> get props => [audioUrl];
}

/// Event to pause the audio playback
class PauseAudioEvent extends AudioPlayerEvent {
  @override
  List<Object?> get props => [];
}

/// Event to resume audio playback
class ResumeAudioEvent extends AudioPlayerEvent {
  @override
  List<Object?> get props => [];
}

/// Event to stop the audio playback
class StopAudioEvent extends AudioPlayerEvent {
  @override
  List<Object?> get props => [];
}

/// Event to update the waveform data
class UpdateWaveformEvent extends AudioPlayerEvent {
  final List<int> waveform;

  UpdateWaveformEvent({required this.waveform});

  @override
  List<Object?> get props => [waveform];
}

/// Event for buffering state changes
class BufferingAudioEvent extends AudioPlayerEvent {
  final bool isBuffering;

  BufferingAudioEvent({required this.isBuffering});

  @override
  List<Object?> get props => [isBuffering];
}

/// Event to handle errors during playback
class AudioErrorEvent extends AudioPlayerEvent {
  final String errorMessage;

  AudioErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

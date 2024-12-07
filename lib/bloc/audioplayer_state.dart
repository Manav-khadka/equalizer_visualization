import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

@immutable
abstract class AudioPlayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Initial state when the player is idle
class AudioInitial extends AudioPlayerState {}

/// State when the audio is Loading
class AudioLoading extends AudioPlayerState {
  final String message;

  AudioLoading({this.message = "Loading..."});

  @override
  List<Object?> get props => [message];
}

/// State when the audio is playing
class AudioPlaying extends AudioPlayerState {
  final AudioPlayer audioPlayer;

  AudioPlaying({
    required this.audioPlayer,
  });

  @override
  List<Object?> get props => [audioPlayer];
}

/// State when the audio is paused
class AudioPaused extends AudioPlayerState {
  final AudioPlayer audioPlayer;

  AudioPaused({required this.audioPlayer});

  @override
  List<Object?> get props => [audioPlayer];
}

/// State when the waveform is updated
class AudioWaveformUpdated extends AudioPlayerState {
  final List<int> waveform;

  AudioWaveformUpdated({required this.waveform});

  @override
  List<Object?> get props => [waveform];
}

/// State when the audio is stopped
class AudioStopped extends AudioPlayerState {}

/// State when an error occurs
class AudioError extends AudioPlayerState {
  final String message;

  AudioError({required this.message});

  @override
  List<Object?> get props => [message];
}

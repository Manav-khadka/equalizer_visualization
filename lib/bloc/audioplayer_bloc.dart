import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import '../repositories/audio_repository.dart';
import '../bloc/audioplayer_event.dart';
import '../bloc/audioplayer_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final AudioRepository _audioRepository = AudioRepository();
  StreamSubscription? _waveformSubscription;

  AudioPlayerBloc() : super(AudioInitial()) {
    on<PlayAudioEvent>(_onPlayAudio);
    on<PauseAudioEvent>(_onPauseAudio);
    on<UpdateWaveformEvent>(_onUpdateWaveform);
  }

  // Handle PlayAudioEvent to start audio playback
  Future<void> _onPlayAudio(
      PlayAudioEvent event, Emitter<AudioPlayerState> emit) async {
    try {
      emit(AudioLoading());
      await _audioRepository.playAudio(event.audioUrl); // Play the audio

      emit(AudioPlaying(
          audioPlayer: _audioRepository.audioPlayer)); // Emit playing state
    } catch (e) {
      emit(AudioError(
          message: e.toString())); // Emit error if anything goes wrong
    }
  }

  // Handle PauseAudioEvent to pause audio playback
  Future<void> _onPauseAudio(
      PauseAudioEvent event, Emitter<AudioPlayerState> emit) async {
    try {
      await _audioRepository.pauseAudio(); // Pause the audio
      emit(AudioPaused(
          audioPlayer: _audioRepository.audioPlayer)); // Emit paused state
    } catch (e) {
      emit(AudioError(
          message: e.toString())); // Emit error if anything goes wrong
    }
  }

 // Handle waveform data update
  void _onUpdateWaveform(
      UpdateWaveformEvent event, Emitter<AudioPlayerState> emit) {
    emit(AudioWaveformUpdated(waveform: event.waveform));
  }
  
  // Clean up resources when the bloc is closed
  @override
  Future<void> close() {
    _audioRepository.dispose(); // Dispose the AudioPlayer to free up resources
    _waveformSubscription
        ?.cancel(); // Cancel any waveform subscriptions (if used)
    return super.close();
  }
}

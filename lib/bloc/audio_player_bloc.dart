import 'dart:async';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final PlayerController playerController;
  String? _currentAudioPath; // Store the current audio path

  AudioPlayerBloc()
      : playerController = PlayerController(),
        super(AudioPlayerInitial()) {
    on<ResetAudioEvent>(_onResetAudio);
    on<LoadAudioEvent>(_onLoadAudio);
    on<PlayPauseAudioEvent>(_onPlayPauseAudio);

    // Listen for playback completion
    playerController.onCompletion.listen((_) {
      add(ResetAudioEvent());
    });
  }

  Future<void> _onResetAudio(
      ResetAudioEvent event, Emitter<AudioPlayerState> emit) async {
    try {
      await playerController.stopPlayer(); // Stop the player to reset state
      await playerController.seekTo(0); // Reset position to the beginning
      if (_currentAudioPath != null) {
        await playerController.preparePlayer(
          path: _currentAudioPath!,
        ); // Re-prepare the audio
      }
      emit(AudioResetState());
    } catch (e) {
      emit(AudioErrorState(message: "Error resetting audio: $e"));
    }
  }

  Future<void> _onLoadAudio(
      LoadAudioEvent event, Emitter<AudioPlayerState> emit) async {
    try {
      emit(AudioLoadingState());

      _currentAudioPath = event.audioPath; // Store the audio path
      await playerController.preparePlayer(
        path: event.audioPath,
        shouldExtractWaveform: true,
      );

      emit(AudioLoadedState(audioPath: event.audioPath));
    } catch (e) {
      emit(AudioErrorState(message: "Failed to load audio: $e"));
    }
  }

  Future<void> _onPlayPauseAudio(
      PlayPauseAudioEvent event, Emitter<AudioPlayerState> emit) async {
    if (playerController.playerState == PlayerState.playing) {
      await playerController.pausePlayer();
      emit(AudioPausedState());
    } else {
      try {
        if (playerController.playerState == PlayerState.stopped) {
          // Re-prepare the player if it's stopped
          if (_currentAudioPath != null) {
            await playerController.preparePlayer(
              path: _currentAudioPath!,
              shouldExtractWaveform: true,
            );
          }
        }
        await playerController.startPlayer(forceRefresh: true);
        emit(AudioPlayingState());
      } catch (e) {
        emit(AudioErrorState(message: "Error starting audio: $e"));
      }
    }
  }

  @override
  Future<void> close() {
    playerController.dispose(); // Dispose the player controller
    return super.close();
  }
}

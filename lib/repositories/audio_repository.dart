import 'dart:io';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;

class AudioRepository {
  final AudioPlayer audioPlayer = AudioPlayer();
  String? _audioUrl;
  late AudioWaveforms _audioWaveforms;

  // Method to play the audio directly from the URL (streaming)
  Future<void> playAudio(String audioUrl) async {
    try {
      // Save the URL to be used later for pause/resume
      _audioUrl = audioUrl;

      // Set the URL to stream the audio
      await audioPlayer.setUrl(audioUrl);
      // Start playing the audio
      audioPlayer.play();
    } catch (e) {
      throw Exception('Error playing audio: $e');
    }
  }

  // Method to pause the audio
  Future<void> pauseAudio() async {
    try {
      await audioPlayer.pause();
    } catch (e) {
      throw Exception('Error pausing audio: $e');
    }
  }

  // Method to stop the audio
  Future<void> stopAudio() async {
    try {
      await audioPlayer.stop();
    } catch (e) {
      throw Exception('Error stopping audio: $e');
    }
  }

  // Dispose the player to release resources
  void dispose() {
    audioPlayer.dispose();
  }
}

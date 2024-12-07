import 'package:equalizer_visualization/bloc/audio_player_bloc.dart';
import 'package:equalizer_visualization/repositories/audio_repository.dart';
import 'package:equalizer_visualization/ui/widgets/music_card.dart';
import 'package:equalizer_visualization/utils/image_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final audioRepository = AudioRepository();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    const audioUrl =
        "https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3";
    try {
      // Load audio file and generate waveform
      final audioPath = await audioRepository.loadAudio(audioUrl);
      context.read<AudioPlayerBloc>().add(LoadAudioEvent(audioPath));
    } catch (e) {
      debugPrint("Error loading audio: $e");
    } finally {
      // Set loading to false once done
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              ImageUrls.backGroundImage,
              fit: BoxFit.cover,
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MusicCard(),
            ),
        ],
      ),
    );
  }
}

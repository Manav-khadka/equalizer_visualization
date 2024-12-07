import 'package:equalizer_visualization/bloc/audioplayer_bloc.dart';
import 'package:equalizer_visualization/bloc/audioplayer_event.dart';
import 'package:equalizer_visualization/bloc/audioplayer_state.dart';
import 'package:equalizer_visualization/ui/widgets/music_card.dart';
import 'package:equalizer_visualization/utils/image_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AudioPlayerBloc, AudioPlayerState>(
        listener: (context, state) {
          if (state is AudioError) {
            // Show an error message if needed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  ImageUrls.backGroundImage,
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: MusicCard(),
              ),
              if (state is AudioLoading) // Show loader if audio is loading
                ...[
                Positioned.fill(
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.5), // Semi-transparent overlay
                  ),
                ),
                const Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

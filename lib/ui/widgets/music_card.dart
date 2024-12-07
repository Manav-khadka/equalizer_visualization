import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:equalizer_visualization/bloc/audio_player_bloc.dart';
import 'package:equalizer_visualization/utils/app_text.dart';
import 'package:equalizer_visualization/utils/colors.dart';
import 'package:equalizer_visualization/utils/dimensions.dart';
import 'package:equalizer_visualization/utils/image_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
      builder: (context, state) {
        final playerController =
            context.read<AudioPlayerBloc>().playerController;

        return Container(
          height: Dimensions.height(368),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.gradientColor1,
                AppColors.gradientColor2,
                AppColors.gradientColor3
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.size(40)),
              topRight: Radius.circular(Dimensions.size(40)),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Song details
              Padding(
                padding: EdgeInsets.all(Dimensions.size(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.titleLarge("Instant Crush"),
                    AppText.subTitleLarge("feat. Julian Casablancas"),
                  ],
                ),
              ),
              // Audio waveform
              AudioFileWaveforms(
                  size: Size(Dimensions.screenWidth, 100.0),
                  playerWaveStyle: const PlayerWaveStyle(
                    showSeekLine: false,
                  ),
                  playerController: playerController),
              // Playback controls
              Center(
                child: GestureDetector(
                  onTap: () {
                    context.read<AudioPlayerBloc>().add(PlayPauseAudioEvent());
                  },
                  child: state is AudioPlayingState
                      ? SvgPicture.asset(ImageUrls.pauseIcon)
                      : SvgPicture.asset(ImageUrls.playIcon),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

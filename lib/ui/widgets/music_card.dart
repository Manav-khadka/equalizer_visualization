import 'package:equalizer_visualization/bloc/audioplayer_bloc.dart';
import 'package:equalizer_visualization/bloc/audioplayer_event.dart';
import 'package:equalizer_visualization/bloc/audioplayer_state.dart';
import 'package:equalizer_visualization/utils/app_text.dart';
import 'package:equalizer_visualization/utils/colors.dart';
import 'package:equalizer_visualization/utils/dimensions.dart';
import 'package:equalizer_visualization/utils/image_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.all(Dimensions.size(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
                  builder: (context, state) {
                    String title = 'Instant Crush';
                    String subtitle = 'feat. Julian Casablancas';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.titleLarge(title),
                        AppText.subTitleLarge(subtitle),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          // Playback Controls
          BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
            builder: (context, state) {
              return Center(
                child: GestureDetector(
                  onTap: () {
                    // Toggle between play and pause
                    if (state is AudioPlaying) {
                      context.read<AudioPlayerBloc>().add(PauseAudioEvent());
                    } else {
                      context.read<AudioPlayerBloc>().add(PlayAudioEvent(
                            audioUrl:
                                "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
                          ));
                    }
                  },
                  child: state is AudioPlaying
                      ? SvgPicture.asset(
                          ImageUrls.pauseIcon,
                        )
                      : SvgPicture.asset(
                          ImageUrls.playIcon,
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

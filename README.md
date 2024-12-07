# Flutter MP3 Player with Equalizer Visualization

This Flutter app implements an MP3 player with a dynamic equalizer visualization. The player supports basic audio playback functionality with "Play" and "Pause" controls. It also visualizes the audio's frequency using a waveform, which is dynamically updated based on the audio playback. The app follows the BLoC pattern for state management and uses the `http` package to stream audio files.

## Features

- **Audio Playback**: Play and pause MP3 audio files.
- **Waveform Visualization**: Displays a dynamic equalizer visualization of the audio's frequency using a waveform.
- **BLoC State Management**: Manages state transitions using the `flutter_bloc` package.
- **UI Design**: Follows a design similar to the provided Figma design with a clean and responsive interface.

## demo
[Demo Video Link]!https://drive.google.com/file/d/1MEUk7DPRA2kD7gEBQZpvM6a8ukH2dWon/view?pli=1

## Requirements

- Flutter 2.x or higher
- `flutter_bloc` package for state management
- `http` package for streaming audio
- `audio_waveforms` package to visualize audio frequency as a waveform

## Setup & Installation

1. Clone the repository:
   ```
    git clone https://github.com/your-username/flutter-mp3-player.git
   cd flutter-mp3-player
2. Install dependencies:
   ```
   flutter pub get
3. Run the app on a device or emulator:
   ```
   flutter run
State Management with BLoC
The app uses the BLoC (Business Logic Component) pattern for state management. The following BLoC events and states are used:

Events:
LoadAudioEvent: Triggers the loading of the audio file.
PlayPauseAudioEvent: Toggles between play and pause states.
ResetAudioEvent: Resets the audio player to the initial state.
States:
AudioPlayerInitial: Initial state of the audio player.
AudioLoadingState: Displays a loading indicator while the audio is being fetched.
AudioLoadedState: The audio file has been successfully loaded.
AudioPlayingState: The audio is currently playing.
AudioPausedState: The audio is paused.
AudioErrorState: An error occurred while loading the audio.
AudioResetState: Resets the audio player to the initial state.
BLoC Structure
AudioPlayerBloc: Handles audio playback state transitions and interactions with the player controller.
AudioPlayerEvent: Defines all events that trigger state changes in the audio player.
AudioPlayerState: Defines all possible states of the audio player.
Packages Used
flutter_bloc: State management using the BLoC pattern.
http: Fetches and streams the MP3 file from a remote URL.
audio_waveforms: Displays the waveform visualization of the audio file.
 # Installed dependencies
 ```
  http: ^1.2.2 # for network requests.
  equatable: ^2.0.7 # For comparing objects by properties rather than by reference
  flutter_bloc: ^8.1.6 # For State management
  just_audio: ^0.9.42 # For audio playback
  flutter_svg: ^2.0.16 # For rendering svgs
  audio_waveforms: ^1.2.0 # for visualizing audio
  path_provider: ^2.1.5

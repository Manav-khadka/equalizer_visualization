import 'package:equalizer_visualization/bloc/audioplayer_bloc.dart';
import 'package:equalizer_visualization/ui/screens/home_screen.dart';
import 'package:equalizer_visualization/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: AudioPlayerBloc(),
        ),

        // Add more BlocProvider.value as needed
      ],
      child: MaterialApp(
        title: 'Audio Visualizer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

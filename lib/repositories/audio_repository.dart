import 'dart:io';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AudioRepository {
  String? path;
  // Method to download the audio file and store it locally
  Future<String> loadAudio(String audioUrl) async {
    try {
      final fileName = basename(audioUrl).replaceAll('%20', ' ');
      final dir = await getApplicationDocumentsDirectory();
      path = '${dir.path}/$fileName';

      // Check if the file exists locally
      final fileExists = await File(path!).exists();
      if (!fileExists) {
        final response = await http.get(Uri.parse(audioUrl));

        if (response.statusCode == 200) {
          final file = File(path!);
          await file.writeAsBytes(response.bodyBytes);
        } else {
          throw Exception('Failed to download audio');
        }
      }
      return path!;
    } catch (e) {
      throw Exception('Error downloading audio: $e');
    }
  }
}

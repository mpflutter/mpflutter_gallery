import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AudioPlayer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: ModalRoute.of(context)?.settings.arguments != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                final audioPlayer = AudioPlayer(playerId: "yay1");
                audioPlayer.play(AssetSource("assets/yay1.mp3"));
              },
              color: Colors.blue,
              child: const Text('Play Sound'),
            ),
          ],
        ),
      ),
    );
  }
}

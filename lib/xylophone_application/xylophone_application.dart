import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class XylophoneApplication extends StatelessWidget {
  const XylophoneApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return Scaffold(
      body: Column(
        children: [
          ExpandedForWavPlay(player: player, index: 1, color: Colors.red),
          ExpandedForWavPlay(player: player, index: 2, color: Colors.blue),
          ExpandedForWavPlay(player: player, index: 3, color: Colors.orange),
          ExpandedForWavPlay(
            player: player,
            index: 4,
            color: Colors.cyanAccent,
          ),
          ExpandedForWavPlay(player: player, index: 5, color: Colors.yellow),
          ExpandedForWavPlay(player: player, index: 6, color: Colors.pink),
          ExpandedForWavPlay(player: player, index: 7, color: Colors.cyan),
        ],
      ),
    );
  }
}

class ExpandedForWavPlay extends StatelessWidget {
  const ExpandedForWavPlay({
    super.key,
    required this.player,
    required this.index,
    required this.color,
  });

  final AudioPlayer player;
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          player.play(AssetSource('audio/assets_note$index.wav'));
        },
        child: Container(color: color),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final AudioPlayer player = AudioPlayer();

  final List<Color> noteColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
  ];

  Future<void> playNote(int noteNumber) async {
    await player.stop();
    await player.play(
      AssetSource('note$noteNumber.wav'),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(7, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => playNote(index + 1),
                  child: Container(
                    color: noteColors[index],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
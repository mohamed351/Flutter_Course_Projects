import 'package:audioplayers/audioplayers.dart';
import "package:flutter/material.dart";

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> playSound(int number) async {
    AudioPlayer player = AudioPlayer();
    await player.play(AssetSource("note$number.wav"));
  }

  Widget buildKey(Color color, int soundNumber) {
    return Expanded(
      child: GestureDetector(
          onTap: () async {
            playSound(1);
          },
          child: Container(color: color)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        buildKey(Colors.red, 1),
        buildKey(Colors.orange, 2),
        buildKey(Colors.yellow, 3),
        buildKey(Colors.green, 4),
        buildKey(Colors.teal, 5),
        buildKey(Colors.blue, 6),
        buildKey(Colors.purple, 7)
      ]),
    );
  }
}

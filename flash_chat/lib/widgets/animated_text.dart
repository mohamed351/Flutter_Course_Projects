import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final String text;
  AnimatedText({required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          this.text,
          textStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      pause: const Duration(milliseconds: 100),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}

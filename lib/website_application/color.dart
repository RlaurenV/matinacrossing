import 'package:flutter/material.dart';

class TextColor extends StatelessWidget {
  @override
  const TextColor(this.text, {super.key});

  final String text;
  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontStyle: FontStyle.italic, fontSize: 40),
    );
  }
}

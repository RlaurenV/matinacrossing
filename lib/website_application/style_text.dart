import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  @override
  const StyleText(this.text, {super.key});

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

import 'package:flutter/material.dart';

class ProgramPageContent extends StatelessWidget {
  const ProgramPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            opacity: 0.5,
          ),
        ),
        child: ListView(children: []),
      ),
    );
  }
}

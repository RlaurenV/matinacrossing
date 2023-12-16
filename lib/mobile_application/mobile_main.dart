import 'package:flutter/material.dart';
import 'package:profiling_system/mobile_application/mobile_login_screen.dart';

class MobileMain extends StatelessWidget {
  const MobileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MobileLoginScreen(),
      ),
    );
  }
}

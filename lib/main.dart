import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:profiling_system/mobile_application/mobile_main.dart';
import 'package:profiling_system/website_application/website_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const WebsiteMain() : const MobileMain();
  }
}

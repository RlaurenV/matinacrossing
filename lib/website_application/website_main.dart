import 'package:flutter/material.dart';
import 'package:profiling_system/website_application/website_home_screen.dart';
import 'package:profiling_system/website_application/website_login_screen.dart';

class WebsiteMain extends StatelessWidget {
  const WebsiteMain({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => WebsiteForm(), // Set the initial route to WebsiteForm
        '/home': (context) => WebsiteHomeScreen(), // Define your other routes
      },
    );
  }
}

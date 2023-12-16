import 'package:flutter/material.dart';
import 'package:profiling_system/mobile_application/mobile_barangay_information_screen.dart';
import 'package:profiling_system/mobile_application/mobile_content/event_page_content.dart';
import 'package:profiling_system/mobile_application/mobile_content/news_page_content.dart';
import 'package:profiling_system/mobile_application/mobile_content/program_page_content.dart';
import 'package:profiling_system/mobile_application/mobile_feedback_screen.dart';
import 'package:profiling_system/mobile_application/mobile_home_screen.dart';
import 'package:profiling_system/style/css/gradient.dart';

import '../style/css/padding.dart';

class MobileUpdateScreen extends StatefulWidget {
  const MobileUpdateScreen({super.key});

  @override
  State<MobileUpdateScreen> createState() => _MobileUpdateScreenState();
}

class _MobileUpdateScreenState extends State<MobileUpdateScreen> {
  late int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const GradientAppBar(),
        title: const Text('Updates'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Notification icon onPressed logic
              print('Notification icon pressed');
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              // decoration: BoxDecoration(
              //   color: Colors.green,
              // ),
              child: Column(
                children: [
                  Image(
                    height: 100,
                    width: 100,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  PaddingStyle(),
                  Text('Barangay 74-A Matina Crossing'),
                ],
              ),
              //Text('User Logo Here'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const MobileHomeScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              tileColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
              title: const Text('Updates'),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const MobileUpdateScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Barangay Information'),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const BrgyInformationScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const MobileFeedbackScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            )
          ],
        ),
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/news.png',
              width: 20,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/event.png',
              width: 20,
            ),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/program.png',
              width: 20,
            ),
            label: 'Program',
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return const NewsPageContent();
      case 1:
        return const EventPageContent();
      case 2:
        return const ProgramPageContent();
      default:
        return Container();
    }
  }
}

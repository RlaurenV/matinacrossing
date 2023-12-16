import 'package:flutter/material.dart';
import 'package:profiling_system/mobile_application/mobile_content/fqa_page_content.dart';
import 'package:profiling_system/mobile_application/mobile_content/generalinformation_page_content.dart';
import 'package:profiling_system/mobile_application/mobile_content/officials_page_content.dart';
import 'package:profiling_system/mobile_application/mobile_feedback_screen.dart';
import 'package:profiling_system/mobile_application/mobile_home_screen.dart';
import 'package:profiling_system/style/css/gradient.dart';
import 'package:profiling_system/style/css/padding.dart';
import 'mobile_update_screen.dart';

class BrgyInformationScreen extends StatefulWidget {
  const BrgyInformationScreen({super.key});

  @override
  State<BrgyInformationScreen> createState() => _BrgyInformationScreenState();
}

class _BrgyInformationScreenState extends State<BrgyInformationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const GradientAppBar(),
        title: const Text('Information'),
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
              tileColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
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
              'assets/images/geninfo.png',
              width: 20,
            ),
            label: 'General info',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/officials.png',
              width: 20,
            ),
            label: 'Officals',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/FAQ.png',
              width: 20,
            ),
            label: 'FAQ',
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return const GeneralInformationPageContent();
      case 1:
        return const OfficialsPageContent();
      case 2:
        return const FqaPageContent();
      default:
        return Container();
    }
  }
}

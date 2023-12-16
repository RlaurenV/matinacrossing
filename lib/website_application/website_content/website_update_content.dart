import 'package:flutter/material.dart';
import 'package:profiling_system/website_application/website_content/news_program_event_tabs/news_tab.dart';
import 'package:profiling_system/website_application/website_content/news_program_event_tabs/events_tab.dart';
import 'package:profiling_system/website_application/website_content/news_program_event_tabs/program_tab.dart';

class UpdateContent extends StatefulWidget {
  const UpdateContent({Key? key}) : super(key: key);

  @override
  _UpdateContentState createState() => _UpdateContentState();
}

class _UpdateContentState extends State<UpdateContent> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    NewsTab(),
    EventsTab(),
    ProgramTab(),
  ];

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Program',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({Key? key});

  @override
  _SettingsContentState createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  List<bool> _sectionExpandedList = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(_getSectionTitle(index)),
              leading: _getIconForSection(index),
              children: <Widget>[
                _getSettingsList(index),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _sectionExpandedList[index] = expanded;
                });
              },
              initiallyExpanded: _sectionExpandedList[index],
            ),
          );
        },
      ),
    );
  }

  String _getSectionTitle(int index) {
    switch (index) {
      case 0:
        return 'Profile Settings';
      case 1:
        return 'Notification Settings';
      case 2:
        return 'Privacy Settings';
      case 3:
        return 'Language Settings';
      case 4:
        return 'Theme Settings';
      case 5:
        return 'Location Settings';
      default:
        return '';
    }
  }

  Icon _getIconForSection(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.person);
      case 1:
        return Icon(Icons.notifications);
      case 2:
        return Icon(Icons.security);
      case 3:
        return Icon(Icons.language);
      case 4:
        return Icon(Icons.dark_mode);
      case 5:
        return Icon(Icons.location_on);
      default:
        return Icon(Icons.settings);
    }
  }

  Widget _getSettingsList(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting 1'),
            onTap: () {
              // Handle setting 1
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting 2'),
            onTap: () {
              // Handle setting 2
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting 3'),
            onTap: () {
              // Handle setting 3
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting 4'),
            onTap: () {
              // Handle setting 4
            },
          ),
        ],
      ),
    );
  }
}

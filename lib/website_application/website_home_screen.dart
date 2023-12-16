import 'package:flutter/material.dart';
import 'package:profiling_system/website_application/website_login_screen.dart';
import 'export_packages.dart';

class HomePageContent extends StatelessWidget {
  final String title;

  const HomePageContent(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class WebsiteHomeScreen extends StatefulWidget {
  @override
  _WebsiteHomeScreenState createState() => _WebsiteHomeScreenState();
}

class _WebsiteHomeScreenState extends State<WebsiteHomeScreen> {
  String currentOption = 'Home';
  String currentTitle = 'Home';

  Widget getContentForOption(String option) {
    switch (option) {
      case 'Home':
        return const WebsiteContent();
      case 'Dashboard':
        return DashboardContent();
      case 'Profiling':
        return ProfilingContent();
      case 'Updates':
        return const UpdateContent();
      case 'FAQ':
        return const InformationContent();
      case 'Officials':
        return const OfficialContent();
      case 'Message':
        return const MessageContent();
      case 'Notification':
        return const NotificationContent();
      case 'Settings':
        return const SettingsContent();
      case 'Admin':
        return Container(); // Remove 'Admin' option from the content
      default:
        return Container();
    }
  }

  void updateCurrentOption(String option, String title) {
    setState(() {
      currentOption = option;
      currentTitle = title;
    });
  }

  void logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => WebsiteForm()), // Replace with your login page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Sidebar(
            currentOption: currentOption,
            onOptionSelected: (option, title) {
              updateCurrentOption(option, title);
            },
            onLogoutSelected: logout, // Assign the logout callback
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(0),
              child: getContentForOption(currentOption),
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatefulWidget {
  final String currentOption;
  final Function(String, String) onOptionSelected;
  final VoidCallback onLogoutSelected;

  Sidebar({
    required this.currentOption,
    required this.onOptionSelected,
    required this.onLogoutSelected,
  });

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: 200,
      color: Colors.grey[300],
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 8),
                const Text(
                  'matina',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                if (option == 'Admin') {
                  return GestureDetector(
                    onTap: widget.onLogoutSelected, // Call the logout callback
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.currentOption == option
                            ? Colors.blue.withOpacity(0.2)
                            : null,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(getIconForOption(option)),
                        title: Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: widget.currentOption == option
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        selected: widget.currentOption == option,
                      ),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () => widget.onOptionSelected(option, option),
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.currentOption == option
                            ? Colors.blue.withOpacity(0.2)
                            : null,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(getIconForOption(option)),
                        title: Text(
                          option,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: widget.currentOption == option
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        selected: widget.currentOption == option,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<String> options = [
    'Home',
    'Dashboard',
    'Profiling',
    'Updates',
    'FAQ',
    'Officials',
    'Message',
    'Notification',
    'Settings',
    'Admin',
  ];

  IconData getIconForOption(String option) {
    switch (option) {
      case 'Home':
        return Icons.home;
      case 'Dashboard':
        return Icons.dashboard;
      case 'Profiling':
        return Icons.person;
      case 'Updates':
        return Icons.update;
      case 'FAQ':
        return Icons.info;
      case 'Officials':
        return Icons.people;
      case 'Message':
        return Icons.message;
      case 'Notification':
        return Icons.notifications;
      case 'Settings':
        return Icons.settings;
      default:
        return Icons.logout;
    }
  }
}

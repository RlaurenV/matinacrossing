import 'package:flutter/material.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        children: [
          _buildNotificationCard(
            context,
            icon: Icons.warning,
            title: 'New Complaint',
            message: 'A new complaint has been filed regarding an issue.',
            time: '10:30 AM',
            notificationCount: 3,
          ),
          _buildNotificationCard(
            context,
            icon: Icons.help,
            title: 'Concern Raised',
            message: 'A concern has been raised that requires attention.',
            time: 'Yesterday',
            notificationCount: 1,
          ),
          _buildNotificationCard(
            context,
            icon: Icons.event,
            title: 'Upcoming Event',
            message:
                'Don\'t forget about the community event happening this weekend.',
            time: '2 days ago',
            notificationCount: 0,
          ),
          _buildNotificationCard(
            context,
            icon: Icons.question_answer,
            title: 'Inquiry Received',
            message: 'An inquiry has been received. Please respond promptly.',
            time: '3 days ago',
            notificationCount: 2,
          ),
          _buildNotificationCard(
            context,
            icon: Icons.lightbulb,
            title: 'Suggestion',
            message:
                'We have received a suggestion. Take a look and provide feedback.',
            time: '4 days ago',
            notificationCount: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String message,
    required String time,
    required int notificationCount,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (notificationCount > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '$notificationCount',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

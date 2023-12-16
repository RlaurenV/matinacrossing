import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MessageContent extends StatefulWidget {
  const MessageContent({Key? key});

  @override
  _MessageContentState createState() => _MessageContentState();
}

class _MessageContentState extends State<MessageContent> {
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  Future<void> fetchMessages() async {
    final response = await http.get(
      Uri.parse('http://192.168.254.115:5000/fetch-messages'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> messageData = json.decode(response.body);
      final List<Message> messageList = messageData.map((data) {
        return Message(
          senderName: data['name'],
          subject: data['title'],
          preview: data['body'],
        );
      }).toList();

      setState(() {
        messages = messageList;
      });
    } else {
      // Handle the error, e.g., show an error message
      print('Failed to fetch messages: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Inbox'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];

          return Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 2.0,
            child: ListTile(
              title: Text(
                message.subject,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From: ${message.senderName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message.preview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              onTap: () {
                // Implement navigation to the message/email details page
              },
            ),
          );
        },
      ),
    );
  }
}

class Message {
  final String senderName;
  final String subject;
  final String preview;

  Message({
    required this.senderName,
    required this.subject,
    required this.preview,
  });
}

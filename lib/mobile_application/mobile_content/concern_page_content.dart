import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'thankyou_message.dart';

class ConcernPageContent extends StatefulWidget {
  const ConcernPageContent({Key? key}) : super(key: key);

  @override
  _ConcernPageContentState createState() => _ConcernPageContentState();
}

class _ConcernPageContentState extends State<ConcernPageContent> {
  TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 340,
              height: 40,
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(5.0),
                  hintText: 'From: User',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 5.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 340,
              height: 40,
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // Corrected property name
                  contentPadding: EdgeInsets.all(5.0),
                  hintText: 'To: Admin',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 5.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 340,
              height: 40,
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(5.0),
                  hintText: 'Subject: Concern',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 5.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 340,
              height: 200,
              child: TextField(
                controller: _bodyController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(bottom: 500.0, left: 10.0),
                  hintText: "What's on your mind....",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 5.0),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () {
              submitConcern();
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                fontFamily: 'Times new roman',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submitConcern() async {
    final body = _bodyController.text;
    final title = 'Concern'; // Default title
    final name = 'User'; // Default name

    // Create a JSON object with concern data
    final concernData = {
      'title': title,
      'body': body,
      'name': name,
    };

    // Use your API URL here
    final response = await http.post(
      Uri.parse(
          'http://192.168.254.115:5000/message'), // Replace with your API URL
      headers: {'Content-Type': 'application/json'},
      body: json.encode(concernData),
    );

    if (response.statusCode == 200) {
      // Concern submitted successfully
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThankYouMessage()),
      );
    } else {
      // Handle error, e.g., show an error message
      print('Failed to submit concern: ${response.reasonPhrase}');
    }
  }
}

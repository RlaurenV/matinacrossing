import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProgramTab extends StatefulWidget {
  const ProgramTab({Key? key}) : super(key: key);

  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<ProgramTab> {
  bool isEditing = false;
  String headline = '';
  String body = '';
  List<NewsItem> newsItems = [];

  Future<void> postMessage(String headline, String body) async {
    final Map<String, dynamic> messageData = {
      'headline': headline, // Match the keys used in the Flask API
      'body': body,
    };

    final response = await http.post(
      Uri.parse(
          'http://192.168.254.115:5000/update_news'), // Use the correct API URL
      headers: {'Content-Type': 'application/json'},
      body: json.encode(messageData),
    );

    if (response.statusCode == 200) {
      // Message successfully posted
    } else {
      // Handle API error
      print('Failed to post message: ${response.reasonPhrase}');
    }
  }

  Future<void> fetchNewsItems() async {
    final response = await http.get(
      Uri.parse('http://192.168.254.115:5000/fetch-updates'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<NewsItem> items = data.map((item) {
        return NewsItem(
          headline: item['headline'],
          body: item['body'],
        );
      }).toList();

      setState(() {
        newsItems = items;
      });
    } else {
      // Handle the error, e.g., show an error message
      print('Failed to fetch news items: ${response.reasonPhrase}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNewsItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Programs',
          style: TextStyle(fontSize: 20.0),
        ),
        actions: [
          if (!isEditing)
            TextButton(
              onPressed: () {
                setState(() {
                  isEditing = true;
                });
              },
              child: Text('Post', style: TextStyle(color: Colors.white)),
            ),
          if (isEditing)
            TextButton(
              onPressed: () {
                setState(() {
                  isEditing = false;
                  if (headline.isNotEmpty && body.isNotEmpty) {
                    postMessage(headline, body);
                    headline = '';
                    body = '';
                  }
                });
              },
              child: Text('Done', style: TextStyle(color: Colors.white)),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (isEditing)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          headline = value;
                        });
                      },
                      decoration: InputDecoration(labelText: 'Headline'),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          body = value;
                        });
                      },
                      decoration: InputDecoration(labelText: 'Body'),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEditing = false;
                            if (headline.isNotEmpty && body.isNotEmpty) {
                              postMessage(headline, body);
                              headline = '';
                              body = '';
                            }
                          });
                        },
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            for (var news in newsItems)
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    news.headline,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  subtitle: Text(
                    news.body,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class NewsItem {
  final String headline;
  final String body;

  NewsItem({
    required this.headline,
    required this.body,
  });
}

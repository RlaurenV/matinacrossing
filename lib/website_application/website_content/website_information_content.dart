import 'package:flutter/material.dart';

class InformationContent extends StatefulWidget {
  const InformationContent({Key? key}) : super(key: key);

  @override
  _InformationContentState createState() => _InformationContentState();
}

class _InformationContentState extends State<InformationContent> {
  List<Item> _faqItems = [
    Item(
      question: 'What are the operating hours of the barangay office?',
      answer:
          'The barangay office is open from Monday to Friday, 8:00 AM to 5:00 PM.',
      icon: Icons.access_time,
    ),
    Item(
      question: 'How can I request a barangay clearance?',
      answer:
          'To request a barangay clearance, visit the barangay office and submit the necessary documents and payment.',
      icon: Icons.description,
    ),
    Item(
      question: 'What services does the barangay offer?',
      answer:
          'The barangay offers various services such as issuance of certificates, assistance for community programs, and maintenance of peace and order.',
      icon: Icons.business,
    ),
    Item(
      question: 'How can I report a concern or complaint?',
      answer:
          'You can report your concern or complaint to the barangay office either in person or through the official hotline number.',
      icon: Icons.report,
    ),
    Item(
      question: 'Are there any upcoming barangay events?',
      answer:
          'Yes, the barangay regularly organizes events and programs. Stay updated by following our official social media accounts.',
      icon: Icons.event,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('FAQs'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: _buildFAQList(),
        ),
      ),
    );
  }

  Widget _buildFAQList() {
    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _faqItems[index].isExpanded = !isExpanded;
        });
      },
      children: _faqItems.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Icon(
                item.icon,
                color: Colors.blue,
              ),
              title: Text(
                item.question,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(item.answer),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  final String question;
  final String answer;
  final IconData icon;
  bool isExpanded;

  Item({
    required this.question,
    required this.answer,
    required this.icon,
    this.isExpanded = false,
  });
}

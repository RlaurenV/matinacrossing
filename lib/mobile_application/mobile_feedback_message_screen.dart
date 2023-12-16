import 'package:flutter/material.dart';
import 'package:profiling_system/mobile_application/mobile_content/complaints_page_content.dart';
import 'package:profiling_system/mobile_application/mobile_content/concern_page_content.dart';
import 'package:profiling_system/mobile_application/mobile_content/inquiry_page_content.dart';
import 'package:profiling_system/mobile_application/mobile_content/suggestion_page_content.dart';
import 'package:profiling_system/style/css/gradient.dart';

class MobileFeedbackMessageScreen extends StatefulWidget {
  const MobileFeedbackMessageScreen({Key? key, required this.current})
      : super(key: key);

  final int current;

  @override
  _MobileFeedbackMessageScreenState createState() =>
      _MobileFeedbackMessageScreenState();
}

class _MobileFeedbackMessageScreenState
    extends State<MobileFeedbackMessageScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const GradientAppBar(),
        title: const Text('Feedback'),
      ),
      body: SingleChildScrollView(
        child: _getBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/Inquiry.png',
              width: 20,
            ),
            label: 'Inquiry',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/Concern.png',
              width: 20,
            ),
            label: 'Concern',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/Suggestion.png',
              width: 20,
            ),
            label: 'Suggestions',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/Complaint.png',
              width: 20,
            ),
            label: 'Complaints',
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return const InquiryPageContent();
      case 1:
        return const ConcernPageContent();
      case 2:
        return const SuggestionPageContent();
      case 3:
        return const ComplaintsPageContent();
      default:
        return Container();
    }
  }
}

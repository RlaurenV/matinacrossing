import 'package:flutter/material.dart';
import 'package:profiling_system/mobile_application/mobile_home_screen.dart';
import 'package:profiling_system/style/css/gradient.dart';

class ThankYouMessage extends StatelessWidget {
  const ThankYouMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const GradientAppBar(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2.0)),
                child: const Text(
                  "Thank You for sending us a messsage, We will review your message right away."
                  '\n'
                  '\n'
                  "Have a great day ahead!",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'times new roman',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: SizedBox(
                width: 130,
                height: 40,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MobileHomeScreen()), // Replace OtherPage with the actual name of the other page you want to navigate to
                    );
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        fontFamily: 'Times new roman',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

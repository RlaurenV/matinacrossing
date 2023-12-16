import 'package:flutter/material.dart';

class NewsPageContent extends StatelessWidget {
  const NewsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            opacity: 0.5,
          ),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Container(
              height: 400,
              color: Colors.green.withOpacity(0.5),
              child: Column(
                children: [
                  const Text("Bakuna Alert",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center),
                  Image.asset(
                    "assets/images/bakuna.jpeg",
                    height: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const Text(
                    "Citizen group launches Bakuna Iloilo to raise Covid-19 vaccine awareness",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              height: 400,
              color: Colors.green.withOpacity(0.5),
              child: Column(
                children: [
                  const Text("TEST",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center),
                  Image.asset(
                    "assets/images/bakuna.jpeg",
                    height: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const Text(
                    "Citizen group launches Bakuna Iloilo to raise Covid-19 vaccine awareness",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

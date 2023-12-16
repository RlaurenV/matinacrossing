import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:profiling_system/mobile_application/registration_form.dart';
import 'package:profiling_system/style/css/padding.dart';
import 'mobile_home_screen.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/home': (context) => const MobileHomeScreen(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginUser(BuildContext context) async {
    final url = Uri.parse('http://192.168.254.115:5000/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': _usernameController.text, // Use 'name' instead of 'username'
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Login successful, clear text fields and navigate to the home screen
        _usernameController.clear();
        _passwordController.clear();
        Navigator.pushNamed(context, '/home');
      } else if (response.statusCode == 401) {
        // Handle invalid username or password
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Invalid username or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Handle other errors (e.g., server error)
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('An error occurred while logging in.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      print('Error: $error');
      // Handle network or other errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.greenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                width: 150,
              ),
              const PaddingStyle(),
              const SizedBox(
                child: Text(
                  'Barangay 24-A Matina Crossing',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const PaddingStyle(),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const PaddingStyle(),
              SizedBox(
                width: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                    _loginUser(context); // Pass the context to _loginUser
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 87, 183, 90),
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Times New Roman',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the RegistrationForm
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationForm(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Customize the button color
                    padding: const EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Times New Roman',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextButton.icon(
                onPressed: () {
                  // Implement the Gmail login functionality
                },
                icon: Image.asset(
                  'assets/images/google.png',
                  height: 20,
                ),
                label: const Text(
                  'Log in with Gmail',
                  style: TextStyle(fontSize: 14.0),
                ),
                style: TextButton.styleFrom(
                  primary: const Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ), // Customize the text color if needed
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

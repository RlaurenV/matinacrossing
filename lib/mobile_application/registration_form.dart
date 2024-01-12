import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _registerUser(
    String name,
    String password,
  ) async {
    final url = Uri.parse('https://matinacrossing.azurewebsites.net/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Show a success dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Registration Successful'),
            content: const Text('You have successfully registered.'),
          ),
        );

        // Clear the input fields
        _nameController.clear();
        _passwordController.clear();
      } else if (response.statusCode == 409) {
        // User already exists
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Registration Failed'),
            content:
                Text('User already exists. Please choose a different name.'),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Registration Failed'),
            content: Text('An error occurred during registration.'),
          ),
        );
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text.trim();
                final password = _passwordController.text.trim();
                if (name.isNotEmpty && password.isNotEmpty) {
                  _registerUser(name, password);
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

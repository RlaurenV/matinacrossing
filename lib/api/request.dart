import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl; // Your API base URL

  ApiService(this.baseUrl);

  Future registerUser(Map<String, String> userData) async {
    final url = Uri.parse('$baseUrl/register'); // Update with your API endpoint

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  }
}

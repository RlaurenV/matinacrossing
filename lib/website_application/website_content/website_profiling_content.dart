import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Resident {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  Resident({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });
}

class ProfilingContent extends StatefulWidget {
  @override
  _ProfilingContentState createState() => _ProfilingContentState();
}

class _ProfilingContentState extends State<ProfilingContent> {
  bool _showAddTab = false;
  bool _showSuccessDialog = false;

  void _toggleAddTab() {
    setState(() {
      _showAddTab = !_showAddTab;
    });
  }

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  List<Resident> _residents = [];
  List<Resident> _searchedResidents = [];

  @override
  void initState() {
    super.initState();
    _fetchResidents();
  }

  Future<void> _fetchResidents() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.254.115:5000/fetch-user-profiles'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> residentsData = json.decode(response.body);
        final residents = residentsData
            .map((data) => Resident(
                  firstName: data['F_Name'],
                  lastName: data['L_Name'],
                  email: data['Email'],
                  phone: data['Phone'],
                ))
            .toList();

        setState(() {
          _residents = residents;
          _searchedResidents = residents;
        });
      } else {
        // Handle error, e.g., show an error message
        print('Failed to fetch residents: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle error, e.g., show an error message
      print('Error fetching residents: $e');
    }
  }

  void _searchResidents(String query) {
    // Filter the residents based on the search query
    if (query.isEmpty) {
      setState(() {
        _searchedResidents = _residents;
      });
      return;
    }

    setState(() {
      _searchedResidents = _residents.where((resident) {
        final fullName = '${resident.firstName} ${resident.lastName}';
        return fullName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _clearForm() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneController.clear();
  }

  void _saveResident() async {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;

    // Create a JSON object with resident data
    final residentData = {
      'F_Name': firstName,
      'L_Name': lastName,
      'Email': email,
      'Phone': phone,
    };

    final response = await http.post(
      Uri.parse('http://192.168.254.115:5000/add-user-profile'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(residentData),
    );

    if (response.statusCode == 200) {
      // Successfully saved resident
      _clearForm();
      _showSuccessDialog = true; // Show the success dialog
    } else {
      // Handle error, e.g., show an error message
    }
  }

  // Build the success dialog
  Widget _buildSuccessDialog() {
    return AlertDialog(
      title: Text('Success!'),
      content: Text('The resident has been successfully saved.'),
      actions: [
        ElevatedButton(
          onPressed: () {
            _showSuccessDialog = false;
            _clearForm();
          },
          child: Text('OK'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search residents',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                _searchResidents('');
              },
            ),
          ),
          onChanged: (value) {
            _searchResidents(value);
          },
        ),
      ),
      body: Stack(
        children: [
          if (_residents.isEmpty) Center(child: CircularProgressIndicator()),
          if (_residents.isNotEmpty)
            ListView.builder(
              itemCount: _searchedResidents.length,
              itemBuilder: (context, index) {
                final resident = _searchedResidents[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      print(
                          'Viewing information for ${resident.firstName} ${resident.lastName}');
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.green, // Adjust as needed
                      child: Text(
                        resident.firstName[0].toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      '${resident.firstName} ${resident.lastName}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone: ${resident.phone}',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Email: ${resident.email}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          if (_showAddTab)
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.grey[200],
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Resident',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                  TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _saveResident();
                    },
                    child: Text('Save Resident'),
                  ),
                ],
              ),
            ),
          if (_showSuccessDialog) _buildSuccessDialog(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleAddTab,
        child: Icon(_showAddTab ? Icons.close : Icons.add),
      ),
    );
  }
}

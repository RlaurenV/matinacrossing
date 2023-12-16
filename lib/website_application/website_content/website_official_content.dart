import 'package:flutter/material.dart';

class OfficialContent extends StatelessWidget {
  const OfficialContent({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Barangay Officials'),
      ),
      body: ListView(
        children: [
          _buildOfficialTile(
            context,
            'Barangay Captain',
            'John Doe',
            Icons.person,
            'information here',
          ),
          _buildOfficialTile(
            context,
            'Barangay Councilor',
            'Jane Smith',
            Icons.person,
            'information here',
          ),
          _buildOfficialTile(
            context,
            'Barangay Councilor',
            'Mark Johnson',
            Icons.person,
            'information here',
          ),
          _buildOfficialTile(
            context,
            'Barangay Councilor',
            'Sarah Davis',
            Icons.person,
            'information here',
          ),
          _buildOfficialTile(
            context,
            'Barangay Councilor',
            'Robert Brown',
            Icons.person,
            'information here',
          ),
          _buildOfficialTile(
            context,
            'Barangay Councilor',
            'Karen Wilson',
            Icons.person,
            'information here',
          ),
          _buildOfficialTile(
            context,
            'Barangay Secretary',
            'Michael Thompson',
            Icons.person,
            'information here',
          ),
          _buildOfficialTile(
            context,
            'Barangay Treasurer',
            'Emily Anderson',
            Icons.person,
            'information here',
          ),
        ],
      ),
    );
  }

  Widget _buildOfficialTile(
    BuildContext context,
    String position,
    String name,
    IconData icon,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 2,
        child: ExpansionTile(
          leading: CircleAvatar(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
          ),
          title: Text(
            position,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

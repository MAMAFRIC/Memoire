import 'package:flutter/material.dart';

class AideScreen extends StatelessWidget {
  const AideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aide'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[800],),
          onPressed: () {
            // Add back button functionality here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue[800],),
            onPressed: () {
              // Add notification functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'), // Replace with your image asset path
            ),
            SizedBox(height: 20),
            Text(
              'Bonjour, Prénom',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'En quoi pouvons-nous vous aider aujourd\'hui ?',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add chat functionality here
              },
              child: Text('Discutons'),
            ),
            SizedBox(height: 40),
            Text(
              'Contactez-nous',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 10),
            ContactInfo(
              icon: Icons.email,
              label: 'ÉCRIVEZ-NOUS',
              info: 'mail@domain.com',
            ),
            ContactInfo(
              icon: Icons.web,
              label: 'NOTRE SITE INTERNET',
              info: 'https://www.domain.com',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String info;

  ContactInfo({required this.icon, required this.label, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 30),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Add functionality to open email or website
                },
                child: Text(
                  info,
                  style: TextStyle(fontSize: 14, color: Colors.black87, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
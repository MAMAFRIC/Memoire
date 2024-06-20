import 'package:flutter/material.dart';

class RemboursementScreen extends StatelessWidget {
  const RemboursementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remboursement'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[800],),
          onPressed: () {
            Navigator.pop(context); // Action pour le bouton retour
          },
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.notifications, color: Colors.blue[800],),
          //   onPressed: () {
          //     // Add notification functionality here
          //   },
          // ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(Icons.upload, color: Colors.blue[800],),
              title: Text('ID Rbsm : 22535251'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Montant : 200 000 FCFA'),
                  Text('Date : 06/06/2025 15h20min'),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Status'),
                  Text(
                    'Payé',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
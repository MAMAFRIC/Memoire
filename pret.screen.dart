import 'package:flutter/material.dart';
import 'package:mamafrica/presentation/formulaire0/formulaire0.screen.dart';

class PretScreen extends StatelessWidget {
       PretScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prêt'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[800],),
          onPressed: () {
            Navigator.pop(context);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blue,
              child: ListTile(
                title: Text(
                  'Demander un prêt',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Merci de remplir ce formulaire pour soumettre votre demande de prêt.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Formulaire0Screen()),
                );
              },
              child: Text('Formulaire de demande de prêt'),
            ),
            SizedBox(height: 20),
            Text(
              'Historiques des Prêts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Consultez ci-dessous l\'historique complet de vos prêts.',
              style: TextStyle(color: Colors.black54),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: loanStatuses.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.download),
                      title: Text('ID PRET : 22535251'),
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
                            loanStatuses[index],
                            style: TextStyle(color: statusColors[index]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> loanStatuses = [
    'Approuvé',
    'En attente',
    'En cours de traitement',
    'Rejeté',
  ];

  final List<Color> statusColors = [
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.red,
  ];
}
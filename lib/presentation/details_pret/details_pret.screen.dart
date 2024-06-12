
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details_PretScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails Prêt'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Action pour le bouton retour
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Action pour le bouton de notification
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenue sur la page de détails de votre prêt. Vous y trouverez toutes les informations nécessaires concernant votre prêt',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 45,
                  child: Icon(Icons.person, size: 50, color: Colors.blue[800]),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nom: XXXXXXXXXX', style: TextStyle(fontSize: 16, color: Colors.blue[800])),
                    Text('Prénoms: XXXXXXXXX', style: TextStyle(fontSize: 16, color: Colors.blue[800])),
                    Text('ID: XXXXXXXXX', style: TextStyle(fontSize: 16, color: Colors.blue[800])),
                    Text('Adresse: XXXXXXXXX', style: TextStyle(fontSize: 16, color: Colors.blue[800])),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Color(0xFF0D47A1),),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.teal),
                      SizedBox(width: 10),
                      Text('ID PRÊT : 22535251', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Montant: 200 000 FCFA', style: TextStyle(fontSize: 16, color: Colors.white)),
                  SizedBox(height: 10),
                  Text('Date : 06/06/2023-,.ll15h20min', style: TextStyle(fontSize: 16, color: Colors.white)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status', style: TextStyle(fontSize: 16)),
                      Text('Approuvé', style: TextStyle(fontSize: 16, color: Colors.green)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Attachments', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  buildAttachmentItem(context, 'Contrat_de_travail.pdf', '313 KB', '31 Aug, 2022'),
                  buildAttachmentItem(context, 'Carte.pdf', '313 KB', '31 Aug, 2022'),
                  buildAttachmentItem(context, 'Fiche_de_paie.pdf', '313 KB', '31 Aug, 2022'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAttachmentItem(BuildContext context, String title, String size, String date) {
    return Card(
      color: Colors.blue[800],
      child: ListTile(
        leading: Icon(Icons.picture_as_pdf, color: Colors.red),
        title: Text(title),
        subtitle: Text('$size, $date'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {
                // Action pour voir le fichier
              },
            ),
            IconButton(
              icon: Icon(Icons.download),
              onPressed: () {
                // Action pour télécharger le fichier
              },
            ),
          ],
        ),
      ),
    );
  }
}
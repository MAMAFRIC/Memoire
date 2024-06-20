import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Details_PretScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails Prêt'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.notifications),
          //   onPressed: () {
          //     // Action pour le bouton de notification
          //   },
          // ),
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
                    Text('Nom: Mohamed', style: TextStyle(fontSize: 16, color: Colors.blue[800])),
                    Text('Prénoms: Yao', style: TextStyle(fontSize: 16, color: Colors.blue[800])),
                    Text('ID: 111175804', style: TextStyle(fontSize: 16, color: Colors.blue[800])),
                    Text('Adresse: Gondwana', style: TextStyle(fontSize: 16, color: Colors.blue[800])),
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
                  buildAttachmentItem(context, 'Domiciliation.pdf', '400 KB', '30 Aug, 2022'),
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
               onPressed: () async {
                 // Action pour télécharger le fichier

                final url = 'https://example.com/path/to/file.pdf';
                final response = await http.get(Uri.parse(url));
                final bytes = response.bodyBytes;

                final dir = await getApplicationDocumentsDirectory();
                final file = File('${dir.path}/file.pdf');
                await file.writeAsBytes(bytes);

                // Show a snackbar to confirm that the file was downloaded
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('File downloaded to ${file.path}')),
                );
              },
             ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ReleveScreen extends StatefulWidget {
  const ReleveScreen({super.key});

  @override
  _ReleveScreenState createState() => _ReleveScreenState();
}

class _ReleveScreenState extends State<ReleveScreen> {
  String selectedOperation = 'Prêt';
  String selectedYear = '2024';
  String selectedMonth = 'Janvier';
  String selectedFileType = 'Pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[800],),
          onPressed: () {
            // Action pour le bouton retour
            Navigator.pop(context);
          },
        ),
        title: Text('Relevé'),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.notifications, color: Colors.blue[800],),
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
            Center(
              child: Text(
                'Générer un relever',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800],),
              ),
            ),
            SizedBox(height: 20),
            buildDropdown(
              label: 'Type d\'opération',
              value: selectedOperation,
              items: ['Prêt'],
              onChanged: (value) {
                setState(() {
                  selectedOperation = value!;
                });
              },
            ),
            buildDropdown(
              label: 'Année',
              value: selectedYear,
              items: ['2025','2024', '2023', '2022','2021', '2020', '2019', '2018', '2017', '2016'],
              onChanged: (value) {
                setState(() {
                  selectedYear = value!;
                });
              },
            ),
            buildDropdown(
              label: 'Mois',
              value: selectedMonth,
              items: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai','Juin', 'Juillet', 'Aout', 'septembre', 'Octobre', 'Novembre', 'Décembre'],
              onChanged: (value) {
                setState(() {
                  selectedMonth = value!;
                });
              },
            ),
            buildDropdown(
              label: 'Type de fichier',
              value: selectedFileType,
              items: ['Pdf'],
              onChanged: (value) {
                setState(() {
                  selectedFileType = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Action pour télécharger le fichier
                },
                label: Text('Télécharger'),
                icon: Icon(Icons.download),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.blue,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
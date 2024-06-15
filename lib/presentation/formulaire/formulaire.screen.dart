import 'package:flutter/material.dart';

/*class FormulaireScreen extends StatelessWidget {
  const FormulaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire de Prêt'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Action pour le bouton retour
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_rounded),
            onPressed: () {
              // Action pour le bouton de notification
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Formulaire de demande de prêt',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800],),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.looks_one),
                Container(width: 50, height: 2, color: Colors.grey),
                Icon(Icons.looks_two),
              ],
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView(
                children: [
                  buildButton(context, Icons.photo, 'Photo'),
                  buildButton(context, Icons.work, 'Contrat de travail'),
                  buildButton(context, Icons.credit_card, 'Carte d’identité National'),
                  buildButton(context, Icons.receipt, 'Fiche de paie'),
                  buildButton(context, Icons.attach_money, 'Investissement'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action pour le bouton Précédent
                  },
                  child: Text('Précédent'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action pour le bouton Envoyé
                  },
                  child: Text('Envoyé'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          // Action pour le bouton
        },
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.teal,
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }
}*/

class FormulaireScreen extends StatelessWidget {
  const FormulaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2èmeFormulaire de Prêt'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[800],
            shadows: const [
              Shadow(
                offset: Offset(0.5, 0.5),
                blurRadius: 25.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],),
          onPressed: () {
            // Action pour le bouton retour
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue[800],
              shadows: const [
                Shadow(
                  offset: Offset(0.5, 0.5),
                  blurRadius: 45.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],),
            onPressed: () {
              // Action pour le bouton de notification
            },
          ),
        ],
      ),
        //backgroundColor: Color.fromRGBO(0, 107, 156, 1), // Utiliser la couleur de votre choix
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Formulaire de demande de prêt',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800],),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  width: 180,
                  height: 3,
                  color: Colors.blue[800],
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue[800],
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 56),
            _buildTextField(Icons.photo, 'Photo'),
            SizedBox(height: 10),
            _buildTextField(Icons.work, 'Contrat de travail'),
            SizedBox(height: 10),
            _buildTextField(Icons.credit_card, 'Carte d’identité National'),
            SizedBox(height: 10),
            _buildTextField(Icons.receipt, 'Fiche de paie'),
            SizedBox(height: 10),
            _buildTextField(Icons.attach_money, 'Investissement'),
            SizedBox(height: 80),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(37, 174, 135, 1), // background
                    ),
                    onPressed: () {
                      // Action pour le bouton Annuler
                    },
                    child: Text('Précédant',
                        style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(width:   80),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // background
                    ),
                    onPressed: () {
                      // Action pour le bouton Suivant
                    },
                    child: Text('Envoyé',
                      style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String label) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white,),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        fillColor: Color.fromRGBO(21, 101, 192, 1), // Utiliser la couleur de votre choix
        labelStyle: TextStyle(color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
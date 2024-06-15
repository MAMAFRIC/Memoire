import 'package:flutter/material.dart';

class Formulaire0Screen extends StatelessWidget {
  const Formulaire0Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1erFormulaire de Prêt'),
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
              blurRadius: 25.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],),
            onPressed: () {
              // Action pour le bouton de notification
            },
          ),
        ],
      ),
        /*backgroundColor: Color.fromRGBO(0, 107, 156, 1),*/ // Utiliser la couleur de votre choix
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
            _buildTextField(Icons.person_sharp, 'Nom'),
            SizedBox(height: 10),
            _buildTextField(Icons.person_outline, 'Prénoms'),
            SizedBox(height: 10),
            _buildTextField(Icons.phone, 'Téléphone'),
            SizedBox(height: 10),
            _buildTextField(Icons.attach_money, 'Montant'),
            SizedBox(height: 10),
            _buildTextField(Icons.folder_shared_outlined, 'Domiciliation'),
            SizedBox(height: 80),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // background
                    ),
                    onPressed: () {
                      // Action pour le bouton Annuler
                    },
                    child: Text('Annuler',
                      style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(width: 80),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // background
                    ),
                    onPressed: () {
                      // Action pour le bouton Suivant
                    },
                    child: Text('Suivant',
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
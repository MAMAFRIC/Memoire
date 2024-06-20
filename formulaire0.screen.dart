import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mamafrica/presentation/formulaire/formulaire.screen.dart';

//
// class Formulaire0Screen extends StatelessWidget {
//   const Formulaire0Screen({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('1erFormulaire de Prêt'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue[800],
//             shadows: const [
//               Shadow(
//                 offset: Offset(0.5, 0.5),
//                 blurRadius: 25.0,
//                 color: Color.fromARGB(255, 0, 0, 0),
//               ),
//             ],),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.blue[800],
//           shadows: const [
//             Shadow(
//               offset: Offset(0.5, 0.5),
//               blurRadius: 25.0,
//               color: Color.fromARGB(255, 0, 0, 0),
//             ),
//           ],),
//             onPressed: () {
//               // Action pour le bouton de notification
//             },
//           ),
//         ],
//       ),
//         /*backgroundColor: Color.fromRGBO(0, 107, 156, 1),*/ // Utiliser la couleur de votre choix
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(45.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Formulaire de demande de prêt',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800],),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 15,
//                   backgroundColor: Colors.white,
//                   child: Text(
//                     '1',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//                 Container(
//                   width: 180,
//                   height: 3,
//                   color: Colors.blue[800],
//                 ),
//                 CircleAvatar(
//                   radius: 15,
//                   backgroundColor: Colors.blue[800],
//                   child: Text(
//                     '2',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 56),
//             _buildTextField(Icons.person_sharp, 'Nom'),
//             SizedBox(height: 10),
//             _buildTextField(Icons.person_outline, 'Prénoms'),
//             SizedBox(height: 10),
//             _buildTextField(Icons.phone, 'Téléphone'),
//             SizedBox(height: 10),
//             _buildTextField(Icons.attach_money, 'Montant'),
//             SizedBox(height: 10),
//             _buildTextField(Icons.folder_shared_outlined, 'Domiciliation'),
//             SizedBox(height: 80),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red, // background
//                     ),
//                     onPressed: () {
//                       // Action pour le bouton Annuler
//                     },
//                     child: Text('Annuler',
//                       style: TextStyle(color: Colors.white),),
//                   ),
//                 ),
//                 SizedBox(width: 70),
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green, // background
//                     ),
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => FormulaireScreen(data: data),
//                       //   ),
//                       // );
//                     },
//                     child: Text('Suivant',
//                       style: TextStyle(color: Colors.white),),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(IconData icon, String label) {
//     return TextField(
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.white,),
//         labelText: label,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         filled: true,
//         fillColor: Color.fromRGBO(21, 101, 192, 1), // Utiliser la couleur de votre choix
//         labelStyle: TextStyle(color: Colors.white),
//       ),
//
//       style: TextStyle(color: Colors.white),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Formulaire0Screen extends StatefulWidget {
  @override
  _Formulaire0ScreenState createState() => _Formulaire0ScreenState();
}

class _Formulaire0ScreenState extends State<Formulaire0Screen> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomsController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController montantController = TextEditingController();
  final TextEditingController domiciliationController = TextEditingController();

  void _nextPage(BuildContext context) {
    // Création du Map pour stocker les données du premier formulaire
    Map<String, dynamic> data = {
      'Nom': nomController.text,
      'Prénoms': prenomsController.text,
      'Téléphone': telephoneController.text,
      'Montant': double.tryParse(montantController.text) ?? 0.0,
      'Domiciliation': domiciliationController.text,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FormulaireScreen(data: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1er Formulaire de Prêt'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Formulaire de demande de prêt',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            _buildTextField(Icons.person_sharp, 'Nom', nomController),
            SizedBox(height: 10),
            _buildTextField(Icons.person_outline, 'Prénoms', prenomsController),
            SizedBox(height: 10),
            _buildTextField(Icons.phone, 'Téléphone', telephoneController),
            SizedBox(height: 10),
            _buildTextField(Icons.attach_money, 'Montant', montantController),
            SizedBox(height: 10),
            _buildTextField(Icons.folder_shared_outlined, 'Domiciliation', domiciliationController),
            SizedBox(height: 80),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      // Action pour le bouton Annuler
                    },
                    child: Text(
                      'Annuler',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 70),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      _nextPage(context);
                    },
                    child: Text(
                      'Suivant',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String label, TextEditingController controller) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          filled: true,
          fillColor: Color.fromRGBO(21, 101, 192, 1),
          labelStyle: TextStyle(color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
        );
    }
}
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

// class FormulaireScreen extends StatelessWidget {
//   const FormulaireScreen({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('2èmeFormulaire de Prêt'),
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
//               shadows: const [
//                 Shadow(
//                   offset: Offset(0.5, 0.5),
//                   blurRadius: 45.0,
//                   color: Color.fromARGB(255, 0, 0, 0),
//                 ),
//               ],),
//             onPressed: () {
//               // Action pour le bouton de notification
//             },
//           ),
//         ],
//       ),
//         //backgroundColor: Color.fromRGBO(0, 107, 156, 1), // Utiliser la couleur de votre choix
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
//             _buildTextField(Icons.photo, 'Photo'),
//             SizedBox(height: 10),
//             _buildTextField(Icons.work, 'Contrat de travail'),
//             SizedBox(height: 10),
//             _buildTextField(Icons.credit_card, 'Carte d’identité National'),
//             SizedBox(height: 10),
//             _buildTextField(Icons.receipt, 'Fiche de paie'),
//             SizedBox(height: 10),
//             _buildTextField(Icons.attach_money, 'Investissement'),
//             SizedBox(height: 80),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromRGBO(37, 174, 135, 1), // background
//                     ),
//                     onPressed: () {
//                       // Action pour le bouton Annuler
//                     },
//                     child: Text('Précédant',
//                         style: TextStyle(color: Colors.white),),
//                   ),
//                 ),
//                 SizedBox(width:   80),
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green, // background
//                     ),
//                     onPressed: () {
//
//                     },
//                     child: Text('Envoyé',
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


// class FormulaireScreen extends StatelessWidget {
//   final Map<String, dynamic> data;
//   final String nom;
//   final String prenoms;
//   final String telephone;
//   final double montant;
//   final String domiciliation;
//
//   FormulaireScreen({
//     Key? key,
//     required this.data,
//     required this.nom,
//     required this.prenoms,
//     required this.telephone,
//     required this.montant,
//     required this.domiciliation,
//   }) : super(key: key);
//
//   final TextEditingController photoController = TextEditingController();
//   final TextEditingController contratTravailController = TextEditingController();
//   final TextEditingController carteIdentiteController = TextEditingController();
//   final TextEditingController fichePaieController = TextEditingController();
//   final TextEditingController investissementController = TextEditingController();
//
//   Widget _buildTextField(IconData icon, String label, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.white),
//         labelText: label,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         filled: true,
//         fillColor: Color.fromRGBO(21, 101, 192, 1),
//         labelStyle: TextStyle(color: Colors.white),
//       ),
//       style: TextStyle(color: Colors.white),
//     );
//   }
//
//   void _submitData(BuildContext context) async {
//     data['Approuver'] = false;
//     data['Codem'] = 1;
//     data['DateDem'] = DateTime.now().toIso8601String();
//     data['Messagerie'] = '';
//     data['Montant'] = montant;
//     data['StatutDem'] = 3;
//     data['CarteIdentite'] = carteIdentiteController.text;
//     data['ContratTravail'] = contratTravailController.text;
//     data['FichePaie'] = fichePaieController.text;
//     data['Investissement'] = investissementController.text;
//     data['Photo'] = photoController.text;
//
//     try {
//       await FirebaseFirestore.instance.collection('demandedepret').add(data);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Demande de prêt envoyée avec succès!')),
//       );
//       Navigator.popUntil(context, (route) => route.isFirst);
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Une erreur est survenue. Veuillez réessayer.')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('2ème Formulaire de Prêt'),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.blue[800]),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: SingleChildScrollView(
//             padding: const EdgeInsets.all(45.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   'Formulaire de demande de prêt - Page 2',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 16),
//                 _buildTextField(Icons.perm_identity, 'Carte d\'Identité', carteIdentiteController),
//                 SizedBox(height: 10),
//                 _buildTextField(Icons.work, 'Contrat de Travail', contratTravailController),
//                 SizedBox(height: 10),
//                 _buildTextField(Icons.payments, 'Fiche de Paie', fichePaieController),
//                 SizedBox(height: 10),
//                 _buildTextField(Icons.monetization_on, 'Investissement', investissementController),
//                 SizedBox(height: 10),
//                 _buildTextField(Icons.photo, 'Photo', photoController),
//                 SizedBox(height: 80),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           'Retour',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 70),
//                     Expanded(
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                         ),
//                         onPressed: () {
//                           _submitData(context);
//                         },
//                         child: Text(
//                           'Soumettre',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mamafrica/presentation/pret/pret.screen.dart';



class FormulaireScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  FormulaireScreen({required this.data});

  @override
  _FormulaireScreenState createState() => _FormulaireScreenState();
}

class _FormulaireScreenState extends State<FormulaireScreen> {
  final TextEditingController photoController = TextEditingController();
  final TextEditingController contratTravailController = TextEditingController();
  final TextEditingController carteIdentiteController = TextEditingController();
  final TextEditingController fichePaieController = TextEditingController();
  final TextEditingController investissementController = TextEditingController();


  void _submitData(BuildContext context) async {
    print('Submitting data...');

    widget.data['Approuver'] = false;
    widget.data['Codem'] = 1;
    widget.data['DateDem'] = DateTime.now().toIso8601String();
    widget.data['Messagerie'] = '';
    widget.data['Montant'] = double.tryParse(widget.data['Montant'].toString()) ?? 0.0;
    widget.data['StatutDem'] = 3;
    widget.data['carte_identite'] = carteIdentiteController.text;
    widget.data['contra_travail'] = contratTravailController.text;
    widget.data['fiche_paie'] = fichePaieController.text;
    widget.data['investissement'] = investissementController.text;
    widget.data['photo'] = photoController.text;

    print('Data prepared: $widget.data');

    try {
      await FirebaseFirestore.instance.collection('DemandDePret').add(widget.data);
      print('Data added to Firestore successfully.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Demande de prêt envoyée avec succès!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PretScreen()),
      );
    } catch (error) {
      print('Error adding document to Firestore: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur est survenue. Veuillez réessayer.')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2ème Formulaire de Prêt'),
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
            _buildTextField(Icons.photo, 'Photo', photoController),
            SizedBox(height: 10),
            _buildTextField(Icons.work, 'Contrat de travail', contratTravailController),
            SizedBox(height: 10),
            _buildTextField(Icons.credit_card, 'Carte d’identité National', carteIdentiteController),
            SizedBox(height: 10),
            _buildTextField(Icons.receipt, 'Fiche de paie', fichePaieController),
            SizedBox(height: 10),
            _buildTextField(Icons.attach_money, 'Investissement', investissementController),
            SizedBox(height: 80),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(37, 174, 135, 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Précédent',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 80),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      _submitData(context);
                    },
                    child: Text(
                      'Envoyer',
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

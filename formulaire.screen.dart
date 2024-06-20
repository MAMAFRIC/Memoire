//code pour uploader les fichers
//add this dependencies in pubspec.yaml
//file_picker: ^8.0.5
//firebase_storage: ^12.0.1



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:mamafrica/presentation/pret/pret.screen.dart';
import 'package:file_picker/file_picker.dart';

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

  String? photoPath;
  String? contratTravailPath;
  String? carteIdentitePath;
  String? fichePaiePath;

  Future<void> _pickFile(TextEditingController controller, String fieldName) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String filePath = result.files.single.path!;
      setState(() {
        controller.text = filePath;
      });

      widget.data[fieldName] = filePath;
    }
  }

  Future<String?> _uploadFile(String fieldName, String filePath) async {
    File file = File(filePath);
    try {
      TaskSnapshot snapshot = await FirebaseStorage.instance
          .ref('uploads/${DateTime.now().millisecondsSinceEpoch}_$fieldName')
          .putFile(file);

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading $fieldName: $e');
      return null;
    }
  }

  void _submitData(BuildContext context) async {
    print('Submitting data...');

    widget.data['Approuver'] = false;
    widget.data['Codem'] = 1;
    widget.data['DateDem'] = DateTime.now().toIso8601String();
    widget.data['Messagerie'] = '';
    widget.data['Montant'] = double.tryParse(widget.data['Montant'].toString()) ?? 0.0;
    widget.data['StatutDem'] = 3;

    // Upload files and get URLs
    widget.data['photo'] = await _uploadFile('photo', widget.data['photo']);
    widget.data['contra_travail'] = await _uploadFile('contra_travail', widget.data['contra_travail']);
    widget.data['carte_identite'] = await _uploadFile('carte_identite', widget.data['carte_identite']);
    widget.data['fiche_paie'] = await _uploadFile('fiche_paie', widget.data['fiche_paie']);
    widget.data['investissement'] = investissementController.text;

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
            _buildFilePicker(Icons.photo, 'Photo', photoController, 'photo'),
            SizedBox(height: 10),
            _buildFilePicker(Icons.work, 'Contrat de travail', contratTravailController, 'contra_travail'),
            SizedBox(height: 10),
            _buildFilePicker(Icons.credit_card, 'Carte d’identité National', carteIdentiteController, 'carte_identite'),
            SizedBox(height: 10),
            _buildFilePicker(Icons.receipt, 'Fiche de paie', fichePaieController, 'fiche_paie'),
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

  Widget _buildFilePicker(IconData icon, String label, TextEditingController controller, String fieldName) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(Icons.attach_file, color: Colors.white),
          onPressed: () => _pickFile(controller, fieldName),
        ),
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



//code sans upload fichers
//je le commente d'abord pour que vous fassiez le test pour l'autre

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:mamafrica/presentation/pret/pret.screen.dart';



// class FormulaireScreen extends StatefulWidget {
//   final Map<String, dynamic> data;

//   FormulaireScreen({required this.data});

//   @override
//   _FormulaireScreenState createState() => _FormulaireScreenState();
// }

// class _FormulaireScreenState extends State<FormulaireScreen> {
//   final TextEditingController photoController = TextEditingController();
//   final TextEditingController contratTravailController = TextEditingController();
//   final TextEditingController carteIdentiteController = TextEditingController();
//   final TextEditingController fichePaieController = TextEditingController();
//   final TextEditingController investissementController = TextEditingController();


//   void _submitData(BuildContext context) async {
//     print('Submitting data...');

//     widget.data['Approuver'] = false;
//     widget.data['Codem'] = 1;
//     widget.data['DateDem'] = DateTime.now().toIso8601String();
//     widget.data['Messagerie'] = '';
//     widget.data['Montant'] = double.tryParse(widget.data['Montant'].toString()) ?? 0.0;
//     widget.data['StatutDem'] = 3;
//     widget.data['carte_identite'] = carteIdentiteController.text;
//     widget.data['contra_travail'] = contratTravailController.text;
//     widget.data['fiche_paie'] = fichePaieController.text;
//     widget.data['investissement'] = investissementController.text;
//     widget.data['photo'] = photoController.text;

//     print('Data prepared: $widget.data');

//     try {
//       await FirebaseFirestore.instance.collection('DemandDePret').add(widget.data);
//       print('Data added to Firestore successfully.');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Demande de prêt envoyée avec succès!')),
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => PretScreen()),
//       );
//     } catch (error) {
//       print('Error adding document to Firestore: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Une erreur est survenue. Veuillez réessayer.')),
//       );
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('2ème Formulaire de Prêt'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(45.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Formulaire de demande de prêt',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 16),
//             _buildTextField(Icons.photo, 'Photo', photoController),
//             SizedBox(height: 10),
//             _buildTextField(Icons.work, 'Contrat de travail', contratTravailController),
//             SizedBox(height: 10),
//             _buildTextField(Icons.credit_card, 'Carte d’identité National', carteIdentiteController),
//             SizedBox(height: 10),
//             _buildTextField(Icons.receipt, 'Fiche de paie', fichePaieController),
//             SizedBox(height: 10),
//             _buildTextField(Icons.attach_money, 'Investissement', investissementController),
//             SizedBox(height: 80),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromRGBO(37, 174, 135, 1),
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       'Précédent',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 80),
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                     ),
//                     onPressed: () {
//                       _submitData(context);
//                     },
//                     child: Text(
//                       'Envoyer',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

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
// }

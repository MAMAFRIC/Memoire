import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mamafrica/presentation/formulaire/formulaire.screen.dart';

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

  String? domiciliationPath;

  Future<void> _pickFile(TextEditingController controller) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String filePath = result.files.single.path!;
      setState(() {
        controller.text = filePath;
        domiciliationPath = filePath;
      });
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

  void _nextPage(BuildContext context) async {
    String? domiciliationUrl;
    if (domiciliationPath != null) {
      domiciliationUrl = await _uploadFile('domiciliation', domiciliationPath!);
    }

    // Création du Map pour stocker les données du premier formulaire
    Map<String, dynamic> data = {
      'Nom': nomController.text,
      'Prénoms': prenomsController.text,
      'Téléphone': telephoneController.text,
      'Montant': double.tryParse(montantController.text) ?? 0.0,
      'Domiciliation': domiciliationUrl ?? domiciliationController.text,
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
            _buildFilePicker(Icons.folder_shared_outlined, 'Domiciliation', domiciliationController),
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

  Widget _buildFilePicker(IconData icon, String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(Icons.attach_file, color: Colors.white),
          onPressed: () => _pickFile(controller),
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
}


//code fonctionnel commenter pour tester upload
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mamafrica/presentation/formulaire/formulaire.screen.dart';


// class Formulaire0Screen extends StatefulWidget {
//   @override
//   _Formulaire0ScreenState createState() => _Formulaire0ScreenState();
// }

// class _Formulaire0ScreenState extends State<Formulaire0Screen> {
//   final TextEditingController nomController = TextEditingController();
//   final TextEditingController prenomsController = TextEditingController();
//   final TextEditingController telephoneController = TextEditingController();
//   final TextEditingController montantController = TextEditingController();
//   final TextEditingController domiciliationController = TextEditingController();

//   void _nextPage(BuildContext context) {
//     // Création du Map pour stocker les données du premier formulaire
//     Map<String, dynamic> data = {
//       'Nom': nomController.text,
//       'Prénoms': prenomsController.text,
//       'Téléphone': telephoneController.text,
//       'Montant': double.tryParse(montantController.text) ?? 0.0,
//       'Domiciliation': domiciliationController.text,
//     };

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => FormulaireScreen(data: data),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('1er Formulaire de Prêt'),
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
//             _buildTextField(Icons.person_sharp, 'Nom', nomController),
//             SizedBox(height: 10),
//             _buildTextField(Icons.person_outline, 'Prénoms', prenomsController),
//             SizedBox(height: 10),
//             _buildTextField(Icons.phone, 'Téléphone', telephoneController),
//             SizedBox(height: 10),
//             _buildTextField(Icons.attach_money, 'Montant', montantController),
//             SizedBox(height: 10),
//             _buildTextField(Icons.folder_shared_outlined, 'Domiciliation', domiciliationController),
//             SizedBox(height: 80),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                     ),
//                     onPressed: () {
//                       // Action pour le bouton Annuler
//                     },
//                     child: Text(
//                       'Annuler',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 70),
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                     ),
//                     onPressed: () {
//                       _nextPage(context);
//                     },
//                     child: Text(
//                       'Suivant',
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
//         controller: controller,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: Colors.white),
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           filled: true,
//           fillColor: Color.fromRGBO(21, 101, 192, 1),
//           labelStyle: TextStyle(color: Colors.white),
//         ),
//         style: TextStyle(color: Colors.white),
//         );
//     }
// }

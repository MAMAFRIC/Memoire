import 'package:get/get.dart';

class HomeController extends GetxController {
  // Déclaration des variables pour stocker les informations du profil
  // RxString displayNom = RxString('');
  // RxString displayPrenom = RxString('');

  // Méthode pour récupérer les informations du profil depuis Firestore
  // void getProfileData() {
  //   try {
  //     // Récupération de l'UID de l'utilisateur connecté
  //     String uid = FirebaseAuth.instance.currentUser!.uid;

  //     // Écoute des changements en temps réel du document utilisateur depuis Firestore en utilisant l'UID de l'utilisateur connecté
  //     FirebaseFirestore.instance
  //         .collection('users_clients')
  //         .doc(uid)
  //         .snapshots()
  //         .listen((DocumentSnapshot<Map<String, dynamic>> userDoc) {
  //       // Vérification si le document existe
  //       if (userDoc.exists) {
  //         // Extraction des données du document
  //         Map<String, dynamic> userData = userDoc.data()!;
  //         // Mise à jour des variables avec les données du profil
  //         displayNom.value = userData['nom'] ?? '';
  //         displayPrenom.value = userData['prenom'] ?? '';
  //       }
  //     });
  //   } catch (e) {
  //     displaySnackBar (message: 'Erreur lors de la récupération des données du profil: $e');
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    // Appel de la méthode pour récupérer les informations du profil lors de l'initialisation du contrôleur
    // getProfileData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

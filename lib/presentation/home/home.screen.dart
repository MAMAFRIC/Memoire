/*import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    DemandePret(),
    SuivieDemande(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MamAfrica'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('MamAfrica'),
            ),
            ListTile(
              title: const Text('Demande'),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            ListTile(
              title: const Text('Suivie'),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
          ],
        ),

      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Demande'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Suivie'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        ],
      ),
    );
  }
}

class DemandePret extends StatefulWidget {
  @override
  _DemandePretState createState() => _DemandePretState();
}

class _DemandePretState extends State<DemandePret> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nom = '';
  String postnom = '';
  String prenom = '';
  double montantEmprunte = 0.0;
  String zoneDeTexte = '';
  late File imageFile;
  String telephone = '';
  late File contratDeTravailFile;
  late File domiciliationSigneeFile;
  late File cniFile;
  late File ficheDePaieFile;

  void _getFromGallery(String type) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        switch (type) {
          case 'photo':
            imageFile = File(pickedFile.path);
            break;
          case 'contratDeTravail':
            contratDeTravailFile = File(pickedFile.path);
            break;
          case 'domiciliationSignee':
            domiciliationSigneeFile = File(pickedFile.path);
            break;
          case 'cni':
            cniFile = File(pickedFile.path);
            break;
          case 'ficheDePaie':
            ficheDePaieFile = File(pickedFile.path);
            break;
        }
      });
    }
  }

  void _submitDemande() {
    // TODO: implement submission logic
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Entrer votre nom',
                labelText: 'Nom',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
                return null;
              },
              onSaved: (value) => nom = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Entrer votre postnom',
                labelText: 'Postnom',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre postnom';
                }
                return null;
              },
              onSaved: (value) => postnom = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Entrer votre prénom',
                labelText: 'Prénom',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre prénom';
                }
                return null;
              },
              onSaved: (value) => prenom = value!,
            ),
            TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                icon: Icon(Icons.money),
                hintText: 'Entrer le montant emprunté',
                labelText: 'Montant emprunté',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer le montant emprunté';
                }
                if (double.tryParse(value) == null) {
                  return 'Veuillez entrer un montant valide';
                }
                return null;
              },
              onSaved: (value) => montantEmprunte = double.tryParse(value!)!,
            ),
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                icon: Icon(Icons.note),
                hintText: 'Entrer les détails de votre demande',
                labelText: 'Détails de la demande',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer les détails de votre demande';
                }
                return null;
              },
              onSaved: (value) => zoneDeTexte = value!,
            ),
            GestureDetector(
              onTap: () => _getFromGallery('photo'),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.camera_alt),
                    hintText: 'Ajouter une photo',
                    labelText: 'Photo',
                  ),
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Entrer votre numéro de téléphone',
                labelText: 'Téléphone',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre numéro de téléphone';
                }
                return null;
              },
              onSaved: (value) => telephone = value!,
            ),
            GestureDetector(
              onTap: () => _getFromGallery('contratDeTravail'),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.description),
                    hintText: 'Ajouter votre contrat de travail',
                    labelText: 'Contrat de travail',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _getFromGallery('domiciliationSignee'),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.home),
                    hintText: 'Ajouter votre domiciliation signée',
                    labelText: 'Domiciliation signée',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _getFromGallery('cni'),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.credit_card),
                    hintText: 'Ajouter votre CNI',
                    labelText: 'CNI',
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _getFromGallery('ficheDePaie'),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.receipt),
                    hintText: 'Ajouter votre fiche de paie',
                    labelText: 'Fiche de paie',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    _submitDemande();
                  }
                },
                child: const Text('Soumettre la demande'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuivieDemande extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Suivie de votre demande de prêt',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          const Text(
            'En attente',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Votre demande de prêt est en attente de traitement. Nous vous contacterons sous peu pour vous fournir plus de détails.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: implement navigation logic
            },
            child: const Text('Retour'),
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MamAfrica'),
      ),
      drawer: CustomDrawer(),
      body: const Center(
        child: Text('Welcome to MamAfrica Home Screen'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Action pour le bouton menu
          },
        ),
        title: Image.asset('assets/ecobank_logo.png', height: 40), // Assurez-vous d'ajouter le logo dans le dossier assets et de l'inclure dans pubspec.yaml
        centerTitle: true,
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
              'Bienvenu,',
              style: TextStyle(fontSize: 20, color: Colors.teal),
            ),
            Text(
              'Prénoms et Nom',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Compte de Prêt',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '26563232',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Action pour le bouton Voir mes Prêts
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.teal, backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Voir mes Prêts'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(4.0),
        color: Colors.blue[800],
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Nom:",
                style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold, fontSize: 25,),
              ),
              accountEmail: Text(
                "Tél:",
                style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold, fontSize: 16,),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 55.0,
                  color: Colors.blue[800],

                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(40.0),
                children: <Widget>[
                  DrawerItem(
                    icon: Icons.request_page,
                    text: 'Prêt',
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.payments,
                    text: 'Remboursement',
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.receipt_long,
                    text: 'Relevé',
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.message,
                    text: 'Messagerie',
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.help,
                    text: 'Aide',
                    onTap: () {},
                  ),
                  DrawerItem(
                    icon: Icons.logout,
                    text: 'Déconnexion',
                    onTap: () {},
                    textColor: Colors.red,
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/ecobank.jpeg', height: 180, width: 199, color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;
  final Color? textColor;
  final Color? iconColor;

  DrawerItem({
    required this.icon,
    required this.text,
    required this.onTap,
    this.textColor,
    this.iconColor,
  });

  get color => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListTile(
            leading: FaIcon(icon, color: color),
            title: Text(
              text,
              style: TextStyle(color: color),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: color),
          ),
        ),
      ),
    );
  }
}




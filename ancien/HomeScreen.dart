/*//import 'dart:html';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    DemandePret(),
    SuivieDemande(),
  ];

  get labelText => null;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MamAfrica'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('MamaAfrica'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Demande de prêt'),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            ListTile(
              title: Text('Suivie de votre demande de prêt'),
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Demande'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label:'Suivie'

          ),
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
  String _nom = '';
  String _postnom = '';
  String _prenom = '';
  double _montantEmprunte = 0.0;
  String _zoneDeTexte = '';
  late File _imageFile;
  String _telephone = '';
  late File _contratDeTravailFile;
  late File _domiciliationSigneeFile;
  late File _cniFile;
  late File _ficheDePaieFile;

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
                  labelText: 'Nom'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
                return null;
              },
              onSaved: (value) => _nom = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Entrer votre postnom',
                  labelText: 'Postnom'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre postnom';
                }
                return null;
              },
              onSaved: (value) => _postnom = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Entrer votre prénom',
                  labelText: 'Prénom'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre prénom';
                }
                return null;
              },
              onSaved: (value) => _prenom = value!,
            ),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  icon: Icon(Icons.money),
                  hintText: 'Entrer le montant emprunté',
                  labelText: 'Montant emprunté'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer le montant emprunté';
                }
                if (double.tryParse(value!) == null) {
                  return 'Veuillez entrer un montant valide';
                }
                return null;
              },
              onSaved: (value) => _montantEmprunte = double.tryParse(value!)!,
            ),
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                  icon: Icon(Icons.note),
                  hintText: 'Entrer les détails de votre demande',
                  labelText: 'Détails de la demande'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer les détails de votre demande';
                }
                return null;
              },
              onSaved: (value) => _zoneDeTexte = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.camera_alt),
                  hintText: 'Ajouter une photo',
                  labelText: 'Photo'
              ),
              onTap: () {
                _getFromGallery();
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'Entrer votre numéro de téléphone',
                  labelText: 'Téléphone'
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer votre numéro de téléphone';
                }
                return null;
              },
              onSaved: (value) => _telephone = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: 'Ajouter votre contrat de travail',
                  labelText: 'Contrat de travail'
              ),
              onTap: () {
                _getFromGallery();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.home),
                  hintText: 'Ajouter votre domiciliation signée',
                  labelText: 'Domiciliation signée'
              ),
              onTap: () {
                _getFromGallery();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.credit_card),
                  hintText: 'Ajouter votre CNI',
                  labelText: 'CNI'
              ),
              onTap: () {
                _getFromGallery();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.receipt),
                  hintText: 'Ajouter votre fiche de paie',
                  labelText: 'Fiche de paie'
              ),
              onTap: () {
                _getFromGallery();
              },
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
                  child: Text('Soumettre la demande')
              ),
            )
          ],
        ),
      ),
    );
  }

  /*void _getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path as List<Object>);
    }
  }*/

  void _getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      //_imageFile = File(pickedFile.path as List<Object>);
    }
  }


  void _submitDemande() {
    // TODO: implement submission logic
  }
}

class SuivieDemande extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Suivie de votre demande de prêt',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            'En attente',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Votre demande de prêt est en attente de traitement. Nous vous contacterons sous peu pour vous fournir plus de détails.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: implement navigation logic
            },
            child: Text('Retour'),
          ),
        ],
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              child: Text('MamaAfrica'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Demande de prêt'),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            ListTile(
              title: const Text('Suivie de votre demande de prêt'),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Demande'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Suivie'
          ),
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
  String _nom = '';
  String _postnom = '';
  String _prenom = '';
  double _montantEmprunte = 0.0;
  String _zoneDeTexte = '';
  late File _imageFile;
  String _telephone = '';
  late File _contratDeTravailFile;
  late File _domiciliationSigneeFile;
  late File _cniFile;
  late File _ficheDePaieFile;

  void _getFromGallery(String type) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        switch (type) {
          case 'photo':
            _imageFile = File(pickedFile.path);
            break;
          case 'contratDeTravail':
            _contratDeTravailFile = File(pickedFile.path);
            break;
          case 'domiciliationSignee':
            _domiciliationSigneeFile = File(pickedFile.path);
            break;
          case 'cni':
            _cniFile = File(pickedFile.path);
            break;
          case 'ficheDePaie':
            _ficheDePaieFile = File(pickedFile.path);
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
              onSaved: (value) => _nom = value!,
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
              onSaved: (value) => _postnom = value!,
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
              onSaved: (value) => _prenom = value!,
            ),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                icon: Icon(Icons.money),
                hintText: 'Entrer le montant emprunté',
                labelText: 'Montant emprunté',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer le montant emprunté';
                }
                if (double.tryParse(value!) == null) {
                  return 'Veuillez entrer un montant valide';
                }
                return null;
              },
              onSaved: (value) => _montantEmprunte = double.tryParse(value!)!,
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
              onSaved: (value) => _zoneDeTexte = value!,
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
              onSaved: (value) => _telephone = value!,
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
}


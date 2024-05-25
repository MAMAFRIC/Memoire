/*import 'package:flutter/cupertino.dart';

@override
Widget build(BuildContext context) {
  return Stack(
    children: [
      VideoPlayerWidget(),
      Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            "assets/images/ecobank.jpeg", //logo de demarrage
            width: 300,
          ),
        ),
      ),
    ],
  );
}

Widget VideoPlayerWidget() {
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/my_video.mp4')
      ..initialize().then((_) {
        _controller!.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller != null && _controller!.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller!.value.aspectRatio,
      child: VideoPlayer(_controller!),
    )
        : Container();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}*/

//formulaire

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Formul extends StatefulWidget {
  @override
  _FormulState createState() => _FormulState();
}

class _FormulState extends State<Formul> {
  final _formKey = GlobalKey<FormState>();
  String _nom = '';
  String _postnom = '';
  String _prenom = '';
  double _montantEmprunte = 0.0;
  String _zoneDeTexte = '';
  File _photo = File('');
  String _telephone = '';
  File _contratDeTravail = File('');
  File _domiciliationSignee = File('');
  File _cni = File('');
  File _ficheDePaie = File('');

  Future<void> _chooseImage(String type) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Your logic here
    }
    {
      /*setState(() {
        if (type == 'photo') {
          _photo = File(pickedFile.path);
        } else if (type == 'contratDeTravail') {
          _contratDeTravail = File(pickedFile.path);
        } else if (type == 'domiciliationSignee') {
          _domiciliationSignee = File(pickedFile.path);
        } else if (type == 'cni') {
          _cni = File(pickedFile.path);
        } else if (type == 'ficheDePaie') {
          _ficheDePaie = File(pickedFile.path);
        }
      });*/

      setState(() {
        switch (type) {
          case 'photo':
            _photo = File(pickedFile!.path);
            break;
          case 'contratDeTravail':
            _contratDeTravail = File(pickedFile!.path);
            break;
          case 'domiciliationSignee':
            _domiciliationSignee = File(pickedFile!.path);
            break;
          case 'cni':
            _cni = File(pickedFile!.path);
            break;
          case 'ficheDePaie':
            _ficheDePaie = File(pickedFile!.path);
            break;
          default:
          // Handle unexpected type here if necessary
            break;
        }
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formulaire de demande de prêt'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
            onSaved: (value) => _nom = value!),
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
            onSaved: (value) => _postnom = value!),
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
            onSaved: (value) => _prenom = value!),
        TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
    decoration: const InputDecoration(
    icon: Icon(Icons.money),
    hintText: 'Entrer le montant emprunté',
    labelText: 'Montant emprunté',
    ),
    validator: (value) {
    if (value!.isEmpty) {
    return 'Veuillez entrer le montant emprunté';
    }
    }
    )
    ]
    )
    )
    )
    );
        }

  }

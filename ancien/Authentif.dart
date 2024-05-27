/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';


class formul extends StatefulWidget {
  const formul({Key? key}) : super (key:key);
  @override
  State<formul> createState() => _formulState();
}

class _formulState extends State<formul> {

  String textPresentation = "";
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordControler = TextEditingController();
  final _professionController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(5, 94, 95, 1),
        title: Center(
            child: Text(
              "AUTHENTIFICATION",
              style: TextStyle(color: Colors.white),
            )
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _nameController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Votre code client",
                  hintText: "Entrez votre code client"),
              validator: (value) {
                return value == null || value == ""
                    ? "Ce champ est obligatoire"
                    : null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _nameController,
              //obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                icon: Icon(Icons.lock_open_outlined),
                labelText: "E-mail",
                hintText: "Entrez votre E-mail",
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible
                      ?Icons.visibility
                      :Icons.visibility_off
                  ),
                  onPressed: (){
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Ce champ est obligatoire"
                    : null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _professionController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.work),
                  labelText: "Téléphone",
                  hintText: "Entrez votre téléphone"),
              validator: (value) {
                return value == null || value == ""
                    ? "Ce champ est obligatoire"
                    : null;
              },
            ),
          ]),
        ),
        ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Vérifiez les informations d'identification ici
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => loan()));
              }
            },
            child: const Text(
              'Validez',
              style: TextStyle(color: Colors.blue),
            )),
      ]),
    );
  }*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class AuthenticationForm extends StatefulWidget {
  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  String _clientCode = '';
  String _phone = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = DateFormat.Hm().format(DateTime.now());
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Code client',
              hintText: 'Entrez le code client',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer le code client';
              }
              return null;
            },
            onSaved: (value) => _clientCode = value!,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Téléphone',
              hintText: 'Entrez le numéro de téléphone',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer le numéro de téléphone';
              }
              return null;
            },
            onSaved: (value) => _phone = value!,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Entrez l\'adresse email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Veuillez entrer l\'adresse email';
              }
              return null;
            },
            onSaved: (value) => _email = value!,
          ),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'Date d\'authentification',
                      hintText: 'Entrez la date d\'authentification',
                    ),
                    onSaved: (value) => _clientCode = value!,
                  )),
              SizedBox(width: 10),
              Expanded(
                  child: TextFormField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      labelText: 'Heure d\'authentification',
                      hintText: 'Entrez l\'heure d\'authentification',
                    ),
                    onSaved: (value) => _clientCode = value!,
                  )),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Annuler'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: authenticate user
                  }
                },
                child: Text('Valider'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

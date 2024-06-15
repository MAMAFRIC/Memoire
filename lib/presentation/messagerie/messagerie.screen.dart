import 'package:flutter/material.dart';

class MessagerieScreen extends StatelessWidget {
  const MessagerieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[800],),
          onPressed: () {
            // Action pour le bouton retour
          },
        ),

        title: Text('Messagerie', style: TextStyle(color: Colors.blue),),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue[800],),
            onPressed: () {
              // Action pour le bouton de notification
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                buildChatMessage(
                  message: "Bonjour cher client! MamAfrica est à votre service...",
                  isSentByUser: false,
                ),
                buildChatMessage(
                  message: "Bonjour MamAfrica",
                  isSentByUser: true,
                ),
                buildChatMessage(
                  message: "J'ai appeller votre service client. Le service client m'a demandé de m'adresser a vous, cher gestionnaire de mon compte. En effet j'ai un projet de construire sur mon terrain a Calavi. Je voulais deplacer mes parents.",
                  isSentByUser: true,
                ),
                buildChatMessage(
                  message: "Cher client ici tu parles au gestionnaire de compte de Ecobank de l'agence de Fidjrosse. Ta demande sera analysee par la hyerarchie et Ecobank vous reviendras. Merci",
                  isSentByUser: false,
                ),
                buildChatMessage(
                  message: " J'espere une reponse favorable a ma requette.",
                  isSentByUser: true,
                ),
                buildChatMessage(
                  message: "Merci de nous choisir. Nous sommes à votre disposition pour vous aider.",
                  isSentByUser: true,
                ),
                buildChatMessage(
                  message: "Merci",
                  isSentByUser: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: () {
                    // Action pour ajouter un fichier ou autre
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ("Taper votre message..." ),
                      filled: true, // Remplir le TextField
                      fillColor: Colors.white, // Couleur de fond du TextField
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45.0),
                        borderSide: BorderSide.none, // Aucun bordure par défaut
                      ),
                    ),
                    style: TextStyle(color: Colors.blue), // Couleur du texte
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Action pour envoyer le message
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildChatMessage({required String message, required bool isSentByUser}) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.white : Colors.blue[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
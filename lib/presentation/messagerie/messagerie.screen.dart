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
        title: Text('Messagerie'),
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
                  message: "Je vous remercie pour votre service.",
                  isSentByUser: true,
                ),
                buildChatMessage(
                  message: "Merci de nous choisir. Nous sommes à votre disposition pour vous aider.",
                  isSentByUser: false,
                ),
                buildChatMessage(
                  message: "Lorem ipsum",
                  isSentByUser: true,
                ),
                buildChatMessage(
                  message: "Lorem ipsum dolor sit amet cotur.",
                  isSentByUser: true,
                ),
                buildChatMessage(
                  message: "Lorem ipsum dolor sit amet consectetur. Dictu",
                  isSentByUser: false,
                ),
                buildChatMessage(
                  message: "Lorem ipsum dolor.",
                  isSentByUser: false,
                ),
                buildChatMessage(
                  message: "Lorem ipsum",
                  isSentByUser: true,
                ),
                buildChatMessage(
                  message: "Lorem ipsum dolor sit amet cotur.",
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
                  icon: Icon(Icons.add_circle, color: Colors.teal),
                  onPressed: () {
                    // Action pour ajouter un fichier ou autre
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Taper votre message...",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.teal),
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
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.teal : Colors.teal.shade100,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
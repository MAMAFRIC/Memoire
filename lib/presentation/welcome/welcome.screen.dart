
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home.screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/imgintro.jpeg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenue à MamAfrica',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Votre application de prêt déjà disponible',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the home screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 82, 136, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      "C'est parti",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
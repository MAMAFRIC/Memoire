import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mamafrica/infrastructure/utils/app_colors.dart';
import 'package:mamafrica/presentation/login/controllers/login.controller.dart';

/*class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text('login'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}*/

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(45.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ecobank.jpeg', // replace with your logo image path
                height: 200,width: 200,
              ),
              SizedBox(height: 80),
              Text(
                'Connectez-vous à votre compte',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(21, 101, 192, 1),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                icon: FontAwesomeIcons.solidUser,
                hintText: 'Code du client',
              ),
              SizedBox(height: 10),
              _buildTextField(
                icon: FontAwesomeIcons.volumeControlPhone,
                hintText: 'N° de téléphone',
              ),
              SizedBox(height: 10),
              _buildTextField(
                icon: FontAwesomeIcons.envelopeOpenText,
                hintText: 'Email',
              ),
              SizedBox(height: 80),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // background
                      ),
                      onPressed: () {
                        // Action pour le bouton Annuler
                      },
                      child: Text('Annuler',
                        style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  SizedBox(width: 80),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // background
                      ),
                      onPressed: () {
                        // Action pour le bouton Suivant
                      },
                      child: Text('Valider',
                        style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required IconData icon, required String hintText}) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(21, 101, 192, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          decoration: InputDecoration(
            icon: FaIcon(icon, color: Colors.black),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildButton({required String text, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

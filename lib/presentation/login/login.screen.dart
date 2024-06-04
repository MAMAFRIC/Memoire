import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamafrica/infrastructure/utils/app_colors.dart';
import 'package:mamafrica/presentation/login/controllers/login.controller.dart';
import 'package:mamafrica/widget/textFieldWidget.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final codeClientController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final dateHeureController = TextEditingController(text: DateTime.now().toString()); // Initialize with current date and time


  bool _isLoading = false;

  void _handleLogin() {
    setState(() {
      _isLoading = true;
    });

    if (codeClientController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        dateHeureController.text.isNotEmpty) {
      final mockData = {
        'codeClient': codeClientController.text,
        'phoneNumber': phoneNumberController.text,
        'email': emailController.text,
        'dateHeure': dateHeureController.text,
      };

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        Navigator.of(context).pushReplacementNamed('/next-page', arguments: mockData); //change the route
      });
    } else {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Image.asset("assets/images/ecobank.jpeg",
                width: 250,
              ),
              const SizedBox(height: 50),
              const Text(
                'Connectez vous à votre compte !',
                style: TextStyle(
                  color: Colors.blue, //mettre le bleu d'Ecobank
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: codeClientController,
                hintText: 'Code Client ',
                obscureText: false,
                iconData: Icons.people,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: phoneNumberController,
                hintText: 'Numéro de téléphone',
                obscureText: false,
                iconData: Icons.phone,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                iconData: Icons.mail,
              ),
              MyTextField(
                controller: dateHeureController,
                hintText: 'Date et Heure',
                obscureText: false,
                iconData: Icons.calendar_today,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Se connecter'),
              ),
              const SizedBox(height: 20),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}




// class LoginScreen extends GetView<LoginController> {
//
//
//   LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       appBar: AppBar(
//         title: Text('login'),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//           child: Column(
//             children: [
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

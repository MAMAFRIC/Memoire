import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamafrica/infrastructure/navigation/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _navigateToForm();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(32, 41, 46, 1),
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            "assets/images/ecobank.jpeg", //logo de demarrage
            width: 300,
          ),
        ),
      ),
    );
  }

  void _navigateToForm() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.HOME);
    });
  }
}

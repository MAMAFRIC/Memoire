import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamafrica/infrastructure/utils/app_colors.dart';
import 'package:mamafrica/presentation/login/controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
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
}

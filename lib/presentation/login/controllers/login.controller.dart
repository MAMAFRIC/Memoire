import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mamafrica/domain/core/dto/login_request.dart';
import 'package:mamafrica/domain/core/enums/loading_state.dart';
import 'package:mamafrica/infrastructure/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final checkBoxValue = false.obs;
  final formKey = GlobalKey<FormState>();

  final isLoading = LoadingState.initial.obs;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final obscureText = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Charger l'état de la case à cocher lors de l'initialisation du contrôleur
    loadRememberMeState();
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  Future<void> loadRememberMeState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMe = prefs.getBool('rememberMe') ?? false;
    checkBoxValue.value = rememberMe;
  }

  Future<void> saveRememberMeState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
  }

  Future<void> login(LoginRequest loginRequest) async {
    isLoading.value = LoadingState.loading;
    isLoading.value = LoadingState.loaded;
    Get.offAllNamed(Routes.HOME);
  }
}

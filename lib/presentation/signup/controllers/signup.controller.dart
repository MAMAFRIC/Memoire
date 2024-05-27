import 'package:mamafrica/domain/core/dto/register_request.dart';
import 'package:mamafrica/domain/core/enums/loading_state.dart';
import 'package:mamafrica/infrastructure/navigation/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final checkBoxValue = false.obs;
  final formKey = GlobalKey<FormState>();

  final isLoadingRegister = LoadingState.initial.obs;

  final obscureText = true.obs;

  Future<void> register(RegisterRequest registerRequest) async {
    isLoadingRegister.value = LoadingState.loading;

    Get.offNamed(Routes.HOME); // Assuming 'HOME' is your home screen
  }

  @override
  void dispose() {
    super.dispose();
  }
}

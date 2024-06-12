import 'package:get/get.dart';

import '../../../../presentation/formulaire0/controllers/formulaire0.controller.dart';

class Formulaire0ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Formulaire0Controller>(
          () => Formulaire0Controller(),
    );
  }
}
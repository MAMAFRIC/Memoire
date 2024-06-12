import 'package:get/get.dart';

import '../../../../presentation/formulaire/controllers/formulaire.controller.dart';

class FormulaireControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormulaireController>(
          () => FormulaireController(),
    );
  }
}
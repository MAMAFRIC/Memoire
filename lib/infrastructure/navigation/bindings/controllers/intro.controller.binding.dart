import 'package:get/get.dart';

import '../../../../presentation/intro/controllers/intro.controller.dart';

class IntroControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(
      () => IntroController(),
    );
  }
}

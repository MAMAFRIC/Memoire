import 'package:get/get.dart';
import '../../../../presentation/aide/controllers/aide.controller.dart';

class AideControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AideController>(
          () => AideController(),
    );
  }
}
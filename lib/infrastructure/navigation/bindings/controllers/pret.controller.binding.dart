import 'package:get/get.dart';
import '../../../../presentation/pret/controllers/pret.controller.dart';

class PretControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PretController>(
          () => PretController(),
    );
  }
}
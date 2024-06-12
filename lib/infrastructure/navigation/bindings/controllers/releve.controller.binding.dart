import 'package:get/get.dart';
import '../../../../presentation/releve/controllers/releve.controller.dart';

class ReleveControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReleveController>(
          () => ReleveController(),
    );
  }
}
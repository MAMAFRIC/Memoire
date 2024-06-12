import 'package:get/get.dart';
import '../../../../presentation/remboursement/controllers/remboursement.controller.dart';

class RemboursementControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemboursementController>(
          () => RemboursementController(),
    );
  }
}
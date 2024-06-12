import 'package:get/get.dart';
import '../../../../presentation/messagerie/controllers/messagerie.controller.dart';

class MessagerieControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagerieController>(
          () => MessagerieController(),
    );
  }
}
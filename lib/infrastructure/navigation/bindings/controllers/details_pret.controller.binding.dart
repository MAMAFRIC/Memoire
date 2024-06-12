import 'package:get/get.dart';

import '../../../../presentation/details_pret/controllers/details_pret.controller.dart';

class Details_PretControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Details_PretController>(
          () => Details_PretController(),
    );
  }
}
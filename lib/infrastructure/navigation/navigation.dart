import 'package:mamafrica/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:get/get.dart';
import 'package:mamafrica/presentation/screens.dart';

import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.INDEX,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupScreen(),
      binding: SignupControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
      binding: IntroControllerBinding(),
    ),
  ];
}

import 'package:mamafrica/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:get/get.dart';
import 'package:mamafrica/presentation/screens.dart';

import '../../presentation/aide/aide.screen.dart';
import '../../presentation/details_pret/details_pret.screen.dart';
import '../../presentation/formulaire/formulaire.screen.dart';
import '../../presentation/formulaire0/formulaire0.screen.dart';
import '../../presentation/pret/pret.screen.dart';
import '../../presentation/remboursement/remboursement.screen.dart';
import '../../presentation/welcome/welcome.screen.dart';
import 'bindings/controllers/messagerie.controller.binding.dart';
import 'bindings/controllers/pret.controller.binding.dart';
import 'bindings/controllers/releve.controller.binding.dart';
import 'bindings/controllers/remboursement.controller.binding.dart';
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
      name: Routes.WELCOME,
      page: () => WelcomeScreen(),
      binding: WelcomeControllerBinding(),
    ),
    GetPage(
      name: Routes.FORMULAIRE0,
      page: () => Formulaire0Screen(),
      binding: Formulaire0ControllerBinding(),
    ),
    GetPage(
      name: Routes.FORMULAIRE,
      page: () => FormulaireScreen(),
      binding: FormulaireControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAILS_PRET,
      page: () => Details_PretScreen(),
      binding: Details_PretControllerBinding(),
    ),
    GetPage(
      name: Routes.REMBOURSEMENT,
      page: () => RemboursementScreen(),
      binding: RemboursementControllerBinding(),
    ),
    GetPage(
      name: Routes.PRET,
      page: () => PretScreen(),
      binding: PretControllerBinding(),
    ),
    GetPage(
      name: Routes.AIDE,
      page: () => AideScreen(),
      binding: AideControllerBinding(),
    ),
    GetPage(
      name: Routes.MESSAGERIE,
      page: () => MessagerieScreen(),
      binding: MessagerieControllerBinding(),
    ),
    GetPage(
      name: Routes.RELEVE,
      page: () => ReleveScreen(),
      binding: ReleveControllerBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => IntroScreen(),
      binding: IntroControllerBinding(),
    ),
  ];
}

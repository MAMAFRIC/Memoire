import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamafrica/infrastructure/utils/app_colors.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Afficher un indicateur de chargement pendant l'initialisation
          return const MaterialApp(
            home: Scaffold(
              backgroundColor: AppColors.primary,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: Nav.routes,
            // Déterminer la route initiale en fonction de l'état de connexion de l'utilisateur
            initialRoute: Routes.INTRO,
          );
        }
      },
      future: null,
    );
  }
}

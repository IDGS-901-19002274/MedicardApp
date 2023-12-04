import 'package:flutter/material.dart';
import 'package:medicard_app/routes/screens.dart';
import 'package:medicard_app/screens/settings_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/Login': (BuildContext context) => const LoginScreen(),
    '/Register': (BuildContext context) => const RegisterScreen(),
    '/Home': (BuildContext context) => const HomeScreen(),
    '/AddMed': (BuildContext context) => const AddMedScreen(),
    '/AddGroup': (BuildContext context) => const AddGropuScreen(),
    '/Settings': (BuildContext context) => const SettingsScreen()
  };

  static const String initialRoute = '/Login';

  static onUknownRoute(settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}

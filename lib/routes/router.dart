import 'package:flutter/material.dart';
import 'package:medicard_app/routes/screens.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/Login': (BuildContext context) => const LoginScreen(),
    '/Register': (BuildContext context) => const RegisterScreen(),
    '/Home': (BuildContext context) => const HomeScreen(),
  };

  static const String initialRoute = '/Login';

  static onUknownRoute(settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
import 'package:flutter/material.dart';
import 'package:medicard_app/routes/router.dart';
import 'package:medicard_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
      onUnknownRoute: (settings) => AppRoutes.onUknownRoute(settings),
    );
  }
}

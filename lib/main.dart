import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medicard_app/Database/database_helper.dart';
import 'package:medicard_app/providers/horario_provider.dart';
import 'package:medicard_app/providers/provider_exports.dart';
import 'package:medicard_app/routes/router.dart';
import 'package:medicard_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.init();
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GrupoProvider()),
        ChangeNotifierProvider(create: (_) => MedicamentoProvider()),
        ChangeNotifierProvider(create: (_) => TratamientoProvider()),
        ChangeNotifierProvider(create: (_) => HorarioProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medicard',
        theme: AppTheme.lightTheme,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.initialRoute,
        onUnknownRoute: (settings) => AppRoutes.onUknownRoute(settings),
      ),
    );
  }
}

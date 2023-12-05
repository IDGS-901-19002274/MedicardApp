import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:medicard_app/Database/database_helper.dart';
import 'package:medicard_app/dao/dao_exports.dart';
import 'package:medicard_app/models/model_exports.dart';
import 'package:medicard_app/providers/horario_provider.dart';
import 'package:medicard_app/providers/provider_exports.dart';
import 'package:medicard_app/providers/usuario_provider.dart';
import 'package:medicard_app/routes/router.dart';
import 'package:medicard_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.init();
  await initializeDateFormatting();
  UsuarioDao dao = UsuarioDao();
  UsuarioModel? pochi = await dao.getUser();
  runApp(MyApp(
    usuario: pochi,
  ));
}

class MyApp extends StatelessWidget {
  final UsuarioModel? usuario;
  const MyApp({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GrupoProvider()),
        ChangeNotifierProvider(create: (_) => MedicamentoProvider()),
        ChangeNotifierProvider(create: (_) => TratamientoProvider()),
        ChangeNotifierProvider(create: (_) => HorarioProvider()),
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medicard',
        theme: AppTheme.lightTheme,
        routes: AppRoutes.routes,
        initialRoute: usuario == null
            ? AppRoutes.initialRoute
            : AppRoutes.alternativeRoute,
        onUnknownRoute: (settings) => AppRoutes.onUknownRoute(settings),
      ),
    );
  }
}

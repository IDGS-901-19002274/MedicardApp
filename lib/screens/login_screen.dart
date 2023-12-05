import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:medicard_app/dao/dao_exports.dart';
import 'package:medicard_app/providers/medicamento_provider.dart';
import 'package:provider/provider.dart';
import '../custom/custom_widgets.dart';
import '../providers/usuario_provider.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UsuarioDao dao = UsuarioDao();
  bool waiting = false;
  String loadingText = 'Cargando...';
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    MedicamentoProvider medprov =
        Provider.of<MedicamentoProvider>(context, listen: false);
    return Scaffold(
      body: waiting
          ? Center(
              child: Text(loadingText),
            )
          : Container(
              decoration: backgroundImage(image: 'background1'),
              child: Center(
                child: RoundedBox(
                  bgColor: AppTheme.transparentLight,
                  maxHeight: 500,
                  child: CustomFormSession(
                    context: context,
                    fields: [
                      BasicTextField(
                        hint: insertEmail,
                        inputType: TextInputType.emailAddress,
                        onchange: (String value) {
                          email = value;
                        },
                      ),
                      BasicTextField(
                        hint: insertPass,
                        shadow: true,
                        inputType: TextInputType.visiblePassword,
                        onchange: (String value) {
                          password = value;
                        },
                      ),
                    ],
                    mainbuttontext: txtLogin,
                    bottomtext: txtInviteRegister,
                    title: txtLogin,
                    mbFunction: () async {
                      UsuarioProvider provider =
                          Provider.of<UsuarioProvider>(context, listen: false);
                      Map<String, String> loginData = {
                        'correo': email,
                        'contrasena': _encrypted_password(password: password)
                      };
                      if (await provider.login(logData: loginData)) {
                        setState(() {
                          waiting = true;
                        });
                        await medprov.setListaMedicamentos();
                        if (medprov.listaMedicamentos.isEmpty) {
                          setState(() {
                            loadingText = 'Obteniendo datos del servidor...';
                          });
                          await medprov.setListaMedicamentosFromServer();
                        }
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/Home', (route) => false);
                      }
                    },
                    changer: '/Register',
                  ),
                ),
              ),
            ),
    );
  }

  // ignore: non_constant_identifier_names
  String _encrypted_password({required String password}) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}

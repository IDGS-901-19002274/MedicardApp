import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:medicard_app/providers/usuario_provider.dart';
import 'package:medicard_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../custom/custom_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    String nombre = '';
    String aPaterno = '';
    String aMaterno = '';
    String email = '';
    String password = '';
    return Scaffold(
      body: Container(
        decoration: backgroundImage(image: 'background3'),
        child: SafeArea(
          child: Center(
            child: RoundedBox(
              bgColor: AppTheme.transparentLight,
              maxHeight: double.infinity,
              child: CustomFormSession(
                context: context,
                changer: '/Login',
                fields: [
                  BasicTextField(
                    hint: insname,
                    inputType: TextInputType.name,
                    onchange: (String value) {
                      nombre = value;
                    },
                  ),
                  BasicTextField(
                    hint: 'Inserte su apellido paterno',
                    inputType: TextInputType.name,
                    onchange: (String value) {
                      aPaterno = value;
                    },
                  ),
                  BasicTextField(
                      hint: 'Inserte su apellido materno',
                      inputType: TextInputType.name,
                      onchange: (String value) {
                        aMaterno = value;
                      }),
                  BasicTextField(
                      hint: insertEmail,
                      inputType: TextInputType.emailAddress,
                      onchange: (String value) {
                        email = value;
                      }),
                  BasicTextField(
                      hint: insertPass,
                      shadow: true,
                      inputType: TextInputType.visiblePassword,
                      onchange: (String value) {
                        password = value;
                      }),
                ],
                mainbuttontext: txtRegister,
                bottomtext: txtInviteLogin,
                title: txtRegister,
                mbFunction: () async {
                  UsuarioProvider provider =
                      Provider.of<UsuarioProvider>(context, listen: false);
                  Map<String, String> regObject = {
                    'nombre': nombre,
                    'apellidoP': aPaterno,
                    'apellidoM': aMaterno,
                    'correo': email,
                    'contrasena': encryptedpassword(password: password)
                  };
                  if (await provider.register(regData: regObject)) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/Login', (route) => false);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  String encryptedpassword({required String password}) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}

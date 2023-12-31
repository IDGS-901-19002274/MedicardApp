//String Constants
import 'package:flutter/material.dart';
import 'package:medicard_app/theme/app_theme.dart';

const String txtLogin = 'Iniciar Sesion';
const String txtRegister = 'Registrarse';
const String txtInviteLogin = '¿Ya cuentas con una cuenta? |Inicia Sesion';
const String txtInviteRegister = '¿Aun no cuentas con una cuenta? |Registrate';
const String logWithGoogle = '  Iniciar sesión con Google';
const String insertEmail = 'Inserte su E-mail';
const String insertPass = 'Inserte su contraseña';
const String confirmpass = 'Confirme contraseña';
const String insname = 'Inserte su nombre(s)';
const String willSound = 'La alarma sonará cada';
const String txtHours = 'horas.';

//Inputs Constants
const TextStyle inputTextStyle = TextStyle(fontSize: 18);
const EdgeInsets inputPaddingConstraints = EdgeInsets.all(20);
BorderSide inputBorderside =
    const BorderSide(color: AppTheme.secundary, width: 2);
BorderSide inputBordersideFocused =
    const BorderSide(color: AppTheme.primary, width: 2);
BorderRadius inputBorderRadius = BorderRadius.circular(10);

//Buttons Constans
const EdgeInsets buttonPadding = EdgeInsets.all(15);
BorderRadius buttonBorderRadius = BorderRadius.circular(10);

BoxDecoration backgroundImage({required String image}) {
  return BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover, image: AssetImage('assets/img/$image.jpeg')));
}

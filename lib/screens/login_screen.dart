import 'package:flutter/material.dart';
import '../custom/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RoundedBox(
          maxHeight: 500,
          child: CustomFormSession(
            context: context,
            fields: const [
              BasicTextField(
                hint: insertEmail,
                inputType: TextInputType.emailAddress,
              ),
              BasicTextField(
                hint: insertPass,
                shadow: true,
                inputType: TextInputType.visiblePassword,
              ),
            ],
            mainbuttontext: txtLogin,
            bottomtext: txtInviteRegister,
            title: txtLogin,
            mbFunction: () {
              Navigator.pushNamed(context, '/Home');
            },
            changer: '/Register',
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../custom/custom_widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RoundedBox(
          maxHeight: 600,
          child: CustomFormSession(
            context: context,
            changer: '/Login',
            fields: const [
              BasicTextField(
                hint: insname,
                inputType: TextInputType.name,
              ),
              BasicTextField(
                hint: insertEmail,
                inputType: TextInputType.emailAddress,
              ),
              BasicTextField(
                hint: insertPass,
                shadow: true,
                inputType: TextInputType.visiblePassword,
              ),
              BasicTextField(
                hint: confirmpass,
                shadow: true,
                inputType: TextInputType.visiblePassword,
              ),
            ],
            mainbuttontext: txtRegister,
            bottomtext: txtInviteLogin,
            title: txtRegister,
            mbFunction: () {},
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medicard_app/providers/medicamento_provider.dart';
import 'package:provider/provider.dart';
import '../custom/custom_widgets.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool waiting = false;
  String loadingText = 'Cargando...';
  @override
  Widget build(BuildContext context) {
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
                    mbFunction: () async {
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
                    },
                    changer: '/Register',
                  ),
                ),
              ),
            ),
    );
  }
}

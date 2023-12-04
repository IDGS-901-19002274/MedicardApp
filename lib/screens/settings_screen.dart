import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_texts.dart';
import 'package:medicard_app/dao/dao_exports.dart';
import 'package:medicard_app/providers/medicamento_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isEverythingOk = true;
  String title = 'Configuración';
  String screenText = 'Trabajando en ello...';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: isEverythingOk,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isEverythingOk
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TitleText(
                    text: 'Sincronizar medicamentos',
                    fontSize: 25,
                  ),
                  const Text(
                      'Sincroniza los medicamentos para que tengas siempre tu lista actualizada y puedas agregar tus medicamentos favoritos :)'),
                  ElevatedButton(
                      onPressed: () async {
                        MedicamentoDao dao = MedicamentoDao();
                        MedicamentoProvider provider = MedicamentoProvider();
                        setState(() {
                          isEverythingOk = false;
                          title = 'Sincronizando...';
                        });
                        await dao.deleteAllMedicamentos();
                        setState(() {
                          screenText =
                              'Se han eliminado los medicamentos, obteniendo de nuevo...';
                        });
                        await provider.setListaMedicamentosFromServer();
                        setState(() {
                          screenText = 'Listo!';
                        });
                        Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          isEverythingOk = true;
                          title = 'Configuración';
                          screenText = 'Trabajando en ello...';
                        });
                      },
                      child: const Text('Sincronizar')),
                  const Divider(),
                  const TitleText(
                    text: 'Sincronizar datos de usuario',
                    fontSize: 25,
                  ),
                  const Text(
                      'Mantenemos tus datos seguros en nuestros servidores, este proceso puede tomar un tiempo, pero ten por seguro que cada que regreses a tu Medicard desde cualquier dispositivo, tus datos estarán esperándote :)'),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Sincronizar'))
                ],
              )
            : Center(child: Text(screenText)),
      ),
    );
  }
}

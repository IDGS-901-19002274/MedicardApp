// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_texts.dart';
import 'package:medicard_app/dao/dao_exports.dart';
import 'package:medicard_app/models/model_exports.dart';
import 'package:medicard_app/providers/horario_provider.dart';
import 'package:medicard_app/providers/provider_exports.dart';
import 'package:medicard_app/providers/usuario_provider.dart';
import 'package:provider/provider.dart';

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
                      onPressed: syncroMedicamentos,
                      child: const Text('Sincronizar')),
                  const Divider(),
                  const TitleText(
                    text: 'Sincronizar datos de usuario',
                    fontSize: 25,
                  ),
                  const Text(
                      'Mantenemos tus datos seguros en nuestros servidores, este proceso puede tomar un tiempo, pero ten por seguro que cada que regreses a tu Medicard desde cualquier dispositivo, tus datos estarán esperándote :)'),
                  ElevatedButton(
                      onPressed: () async {
                        GrupoProvider grp =
                            Provider.of<GrupoProvider>(context, listen: false);
                        HorarioProvider hrp = Provider.of<HorarioProvider>(
                            context,
                            listen: false);
                        TratamientoProvider trp =
                            Provider.of<TratamientoProvider>(context,
                                listen: false);
                        UsuarioProvider usp = Provider.of<UsuarioProvider>(
                            context,
                            listen: false);

                        UsuarioDao usuarioDao = UsuarioDao();

                        setState(() {
                          isEverythingOk = false;
                          title = 'Sincronizando...';
                          screenText = 'Se están obteniendo los datos...';
                        });

                        List<GroupModel> listaGrupos = grp.listaGrupos;
                        List<HorarioModel> listaHorarios =
                            await hrp.setListaAllHorarios();
                        List<TratamientoModel> listaTratamientos =
                            trp.listaTratamientos;

                        UsuarioModel? usuario = await usuarioDao.getUser();

                        setState(() {
                          screenText = 'Se está organizando la información...';
                        });

                        List<Map<String, dynamic>> listaGruposMapa = [];
                        List<Map<String, dynamic>> listaHorariosMapa = [];
                        List<Map<String, dynamic>> listaTratamientosMapa = [];

                        for (final grupo in listaGrupos) {
                          listaGruposMapa.add(grupo.toMap());
                        }
                        for (final horario in listaHorarios) {
                          listaHorariosMapa.add(horario.toMap());
                        }
                        for (final tratamiento in listaTratamientos) {
                          listaTratamientosMapa.add(tratamiento.toMap());
                        }

                        Map<String, dynamic> body = {
                          "usuario": usuario?.toMap(),
                          "grupos": listaGruposMapa,
                          "horarios": listaHorariosMapa,
                          "tratamientos": listaTratamientosMapa
                        };

                        setState(() {
                          screenText = 'Enviando información al servidor...';
                        });

                        await usp.syncroData(data: body);

                        setState(() {
                          isEverythingOk = false;
                          title = '¡Éxito!...';
                          screenText = 'Se ha respaldado la información';
                        });

                        grp.clearData();
                        trp.clearData();
                        hrp.clearData();

                        Future.delayed(const Duration(seconds: 2));

                        Navigator.pushNamedAndRemoveUntil(
                            context, '/Home', (route) => false);
                      },
                      child: const Text('Sincronizar')),
                  const Divider(),
                  const TitleText(
                    text: 'Cerrar Sesión',
                    fontSize: 25,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        GrupoDao grupoDao = GrupoDao();
                        TratamientoDao tratamientoDao = TratamientoDao();
                        HorarioDao horarioDao = HorarioDao();
                        UsuarioDao usuarioDao = UsuarioDao();

                        setState(() {
                          isEverythingOk = false;
                          title = 'Cerrando la sesión...';
                          screenText = 'Eliminando datos...';
                        });

                        await grupoDao.deleteAllGrupos();
                        await tratamientoDao.deleteAllTratamientos();
                        await horarioDao.deleteAllHorarios();
                        await usuarioDao.deleteUser();

                        Navigator.pushNamedAndRemoveUntil(
                            context, '/Login', (route) => false);
                      },
                      child: const Text('Cerrar Sesión')),
                ],
              )
            : Center(child: Text(screenText)),
      ),
    );
  }

  syncroMedicamentos() async {
    MedicamentoDao dao = MedicamentoDao();
    MedicamentoProvider provider = MedicamentoProvider();
    setState(() {
      isEverythingOk = false;
      title = 'Sincronizando...';
    });
    await dao.deleteAllMedicamentos();
    setState(() {
      screenText = 'Se han eliminado los medicamentos, obteniendo de nuevo...';
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
  }
}

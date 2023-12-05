import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicard_app/dao/dao_exports.dart';
import 'package:medicard_app/models/model_exports.dart';
import 'package:medicard_app/providers/api/util_provider.dart';

class UsuarioProvider extends ChangeNotifier {
  String urlLogin = 'http://192.168.1.6:666/medicardapi/login';
  String urlRegister = 'http://192.168.1.6:666/medicardapi/register';
  String urlSyncro = 'http://192.168.1.6:666/medicardapi/syncro';

  Future<bool> register({required Map<String, String> regData}) async {
    final response =
        await UtilProvider.rtp.postHTTP(url: urlRegister, body: regData);
    return response.body == 'OK';
  }

  Future<bool> login({required Map<String, String> logData}) async {
    final response =
        await UtilProvider.rtp.postHTTP(url: urlLogin, body: logData);
    final UsuarioDao dao = UsuarioDao();
    final GrupoDao grudao = GrupoDao();
    final TratamientoDao tradao = TratamientoDao();
    final HorarioDao hordao = HorarioDao();
    if (response.body != 'NO') {
      var jResponse = jsonDecode(response.body) as dynamic;
      final usuario = jResponse['usuario'];
      await dao.insertUser(
          user: UsuarioModel(
        id_usuario: int.parse(usuario['id_usuario']),
        nombre: usuario['nombre'],
        apellidoP: usuario['apellidoP'],
        apellidoM: usuario['apellidoM'],
        correo: usuario['correo'],
      ));

      final grupos = jResponse['grupos'];
      for (final grupo in grupos) {
        print(grupo);
        await grudao.insertGroupWithId(
            group: GroupModel(
          id_grupo: int.parse(grupo['id_en_app']),
          nombre: grupo['nombre'],
          tema: grupo['tema'],
        ));
      }

      if (grupos.isEmpty) {
        await grudao.createDefaultGroup();
      }

      final tratamientos = jResponse['tratamientos'];
      for (final tratamiento in tratamientos) {
        await tradao.insertTratamientoById(
            tratamiento: TratamientoModel(
                id_tratamiento: int.parse(tratamiento['id_en_app']),
                fk_id_medicamento: int.parse(tratamiento['fk_id_medicamento']),
                precio: double.parse(tratamiento['precio']),
                dosis: int.parse(tratamiento['dosis']),
                periodo_en_horas: int.parse(tratamiento['periodo_en_horas']),
                fecha_inicio: DateTime.parse(tratamiento['fecha_inicio']),
                fecha_final: DateTime.parse(tratamiento['fecha_final']),
                fk_id_grupo: int.parse(tratamiento['fk_id_grupo']),
                rigtone: 'Rigtone #1'));
      }

      final horarios = jResponse['horarios'];
      for (final horario in horarios) {
        await hordao.insertHorarioWithId(
            horario: HorarioModel(
                id_horario: int.parse(horario['id_en_app']),
                fk_id_tratamiento: int.parse(horario['fk_id_tratamiento']),
                medicina_tomada: int.parse(horario['medicina_tomada']),
                fecha: DateTime.parse(horario['fecha'])));
      }
    }
    return response.body != 'NO';
  }

  Future syncroData({required Map<String, dynamic> data}) async {
    await UtilProvider.rtp.postHTTP(url: urlSyncro, body: data);
  }
}

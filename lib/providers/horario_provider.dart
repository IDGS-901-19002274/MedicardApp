import 'package:flutter/material.dart';

import '../dao/dao_exports.dart';
import '../models/model_exports.dart';

class HorarioProvider extends ChangeNotifier {
  List<HorarioModel> listaHorarios = [];

  Future<void> clearData() async {
    listaHorarios = [];
    notifyListeners();
  }

  Future<void> setListaHorarios({required idTrat}) async {
    HorarioDao dao = HorarioDao();
    listaHorarios = await dao.readHorariosById(fkIdtratamiento: idTrat);
    notifyListeners();
  }
}

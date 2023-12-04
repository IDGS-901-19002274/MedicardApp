import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medicard_app/dao/medicamento_dao.dart';
import 'package:medicard_app/models/medicamento_model.dart';
import 'package:medicard_app/providers/api/util_provider.dart';

class MedicamentoProvider extends ChangeNotifier {
  final medicamentosUrl = 'http://192.168.1.6:666/medicardapi/medicamentos';
  List<MedicamentoModel> listaMedicamentos = [];

  Future<void> setListaMedicamentos() async {
    MedicamentoDao dao = MedicamentoDao();
    listaMedicamentos = await dao.readMedicamentos();
    notifyListeners();
  }

  Future<void> setListaMedicamentosFromServer() async {
    final MedicamentoDao dao = MedicamentoDao();
    final response =
        await UtilProvider.rtp.responseHTTP(urlBase: medicamentosUrl);
    if (response.statusCode == 200) {
      var jResponse = jsonDecode(response.body) as List<dynamic>;
      for (dynamic objeto in jResponse) {
        MedicamentoModel medicamento = MedicamentoModel(
            idMedicamento: int.parse(objeto['id_medicamento']),
            nombre: objeto['nombre'],
            fabricante: objeto['fabricante'],
            cantidad: int.parse(objeto['cantidad']),
            medida: objeto['medida']);
        await dao.insertMedicamento(med: medicamento);
      }
    }
    notifyListeners();
  }
}

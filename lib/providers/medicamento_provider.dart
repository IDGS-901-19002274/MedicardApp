import 'package:flutter/material.dart';
import 'package:medicard_app/dao/medicamento_dao.dart';
import 'package:medicard_app/models/medicamento_model.dart';

class MedicamentoProvider extends ChangeNotifier {
  List<MedicamentoModel> listaMedicamentos = [];

  Future<void> setListaMedicamentos() async {
    MedicamentoDao dao = MedicamentoDao();
    listaMedicamentos = await dao.readMedicamentos();
    notifyListeners();
  }
}

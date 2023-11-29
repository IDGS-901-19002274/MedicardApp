import 'package:flutter/material.dart';
import 'package:medicard_app/dao/dao_exports.dart';
import 'package:medicard_app/models/model_exports.dart';

class TratamientoProvider extends ChangeNotifier {
  List<TratamientoModel> listaTratamientos = [];

  void clearData() {
    listaTratamientos = [];
    notifyListeners();
  }

  Future<void> setListaTratamientos() async {
    TratamientoDao dao = TratamientoDao();
    listaTratamientos = await dao.readTratamientos();
    notifyListeners();
  }
}

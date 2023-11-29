import 'package:flutter/material.dart';
import 'package:medicard_app/dao/grupo_dao.dart';
import 'package:medicard_app/models/group_model.dart';

class GrupoProvider extends ChangeNotifier {
  List<GroupModel> listaGrupos = [];

  void clearData() {
    listaGrupos = [];
    notifyListeners();
  }

  Future<void> setListaGrupos() async {
    GrupoDao dao = GrupoDao();
    listaGrupos = await dao.readGroups();
    notifyListeners();
  }
}

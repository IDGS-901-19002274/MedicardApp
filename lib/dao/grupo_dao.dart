import 'package:medicard_app/Database/database_helper.dart';
import 'package:medicard_app/models/group_model.dart';

class GrupoDao {
  final database = DatabaseHelper.instance.db;
  final String table = 'tbl_grupos';

  final Map<String, dynamic> grupoDefault = {
    'id_grupo': 1,
    'nombre': 'Sin Grupo',
    'tema': 'default'
  };

  Future<List<GroupModel>> readGroups() async {
    final data = await database.query(table);
    return data.map((e) => GroupModel.fromMap(e)).toList();
  }

  Future<int> insertGroup({required GroupModel group}) async {
    return await database.insert(table, {
      "nombre": group.nombre,
      "tema": group.tema,
    });
  }

  Future<int> insertGroupWithId({required GroupModel group}) async {
    return await database.insert(table, {
      'id_grupo': group.id_grupo,
      "nombre": group.nombre,
      "tema": group.tema,
    });
  }

  Future update({required GroupModel group}) async {
    await database.update(
        table,
        {
          "nombre": group.nombre,
          "tema": group.tema,
        },
        where: 'id = ?',
        whereArgs: [group.id_grupo]);
  }

  Future delete({required int idGroup}) async {
    await database.delete(table, where: 'id_grupo = ?', whereArgs: [idGroup]);
  }

  Future deleteAllGrupos() async {
    await database.delete(table);
  }

  Future createDefaultGroup() async {
    await database.insert(table, grupoDefault);
  }
}

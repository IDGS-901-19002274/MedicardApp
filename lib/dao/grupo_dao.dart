import 'package:medicard_app/Database/database_helper.dart';
import 'package:medicard_app/models/group_model.dart';

class GrupoDao {
  final database = DatabaseHelper.instance.db;
  final String table = 'tbl_grupos';

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

  Future delete({required GroupModel group}) async {
    await database.delete(table, where: 'id = ?', whereArgs: [group.id_grupo]);
  }
}

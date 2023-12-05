import 'package:medicard_app/Database/database_helper.dart';
import 'package:medicard_app/models/horario_model.dart';

class HorarioDao {
  final database = DatabaseHelper.instance.db;
  final String table = 'tbl_horarios';

  Future<List<HorarioModel>> readHorarios() async {
    final data = await database.query(table);
    return data.map((e) => HorarioModel.fromMap(e)).toList();
  }

  Future<List<HorarioModel>> readHorariosById(
      {required int fkIdtratamiento}) async {
    final data = await database.query(table,
        where: 'fk_id_tratamiento = ?', whereArgs: [fkIdtratamiento]);
    return data.map((e) => HorarioModel.fromMap(e)).toList();
  }

  Future<int> insertHorario({required HorarioModel horario}) async {
    return await database.insert(table, {
      "fk_id_tratamiento": horario.fk_id_tratamiento,
      "medicina_tomada": horario.medicina_tomada,
      "fecha": horario.fecha.toIso8601String(),
    });
  }

  Future<int> insertHorarioWithId({required HorarioModel horario}) async {
    return await database.insert(table, {
      "id_horario": horario.id_horario,
      "fk_id_tratamiento": horario.fk_id_tratamiento,
      "medicina_tomada": horario.medicina_tomada,
      "fecha": horario.fecha.toIso8601String(),
    });
  }

  Future update({required HorarioModel horario}) async {
    await database.update(
      table,
      {
        "fk_id_tratamiento": horario.fk_id_tratamiento,
        "medicina_tomada": horario.medicina_tomada,
        "fecha": horario.fecha.toIso8601String(),
      },
      where: 'id_horario = ?',
      whereArgs: [horario.id_horario],
    );
  }

  Future deleteAllHorarios() async {
    await database.delete(table);
  }
}

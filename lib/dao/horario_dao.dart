import 'package:medicard_app/Database/database_helper.dart';
import 'package:medicard_app/models/horario_model.dart';

class HorarioDao {
  final database = DatabaseHelper.instance.db;
  final String table = 'tbl_horarios';

  Future<List<HorarioModel>> readHorarios(
      {required int fkIdMedicamento}) async {
    final data = await database.query(table,
        where: 'fk_id_medicamento = ?', whereArgs: [fkIdMedicamento]);
    return data.map((e) => HorarioModel.fromMap(e)).toList();
  }

  Future<int> insertHorario({required HorarioModel horario}) async {
    return await database.insert(table, {
      "fk_id_medicamento": horario.fk_id_medicamento,
      "medicina_tomada": horario.medicina_tomada,
      "fecha": horario.fecha.toIso8601String(),
    });
  }

  Future update({required HorarioModel horario}) async {
    await database.update(
      table,
      {
        "fk_id_medicamento": horario.fk_id_medicamento,
        "medicina_tomada": horario.medicina_tomada,
        "fecha": horario.fecha.toIso8601String(),
      },
      where: 'id_horario = ?',
      whereArgs: [horario.id_horario],
    );
  }
}

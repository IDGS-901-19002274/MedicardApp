import 'package:medicard_app/Database/database_helper.dart';
import 'package:medicard_app/models/tratamiento_model.dart';

class TratamientoDao {
  final database = DatabaseHelper.instance.db;
  final String table = 'tbl_tratamientos';

  Future<List<TratamientoModel>> readTratamientos() async {
    final data = await database.query(table);
    return data.map((e) => TratamientoModel.fromMap(e)).toList();
  }

  Future<int> insertTratamiento({required TratamientoModel tratamiento}) async {
    return await database.insert(table, {
      "fk_id_medicamento": tratamiento.fk_id_medicamento,
      "precio": tratamiento.precio,
      "dosis": tratamiento.dosis,
      "periodo_en_horas": tratamiento.periodo_en_horas,
      "fecha_inicio": tratamiento.fecha_inicio.toIso8601String(),
      "fecha_final": tratamiento.fecha_final.toIso8601String(),
      "fk_id_grupo": tratamiento.fk_id_grupo,
      "rigtone": tratamiento.rigtone,
    });
  }

  Future update({required TratamientoModel tratamiento}) async {
    await database.update(
      table,
      {
        "fk_id_medicamento": tratamiento.fk_id_medicamento,
        "precio": tratamiento.precio,
        "dosis": tratamiento.dosis,
        "periodo_en_horas": tratamiento.periodo_en_horas,
        "fecha_inicio": tratamiento.fecha_inicio.toIso8601String(),
        "fecha_final": tratamiento.fecha_final.toIso8601String(),
        "fk_id_grupo": tratamiento.fk_id_grupo,
        "rigtone": tratamiento.rigtone,
      },
      where: 'id_tratamiento = ?',
      whereArgs: [tratamiento.id_tratamiento],
    );
  }

  Future delete({required TratamientoModel tratamiento}) async {
    await database.delete(
      table,
      where: 'id_tratamiento = ?',
      whereArgs: [tratamiento.id_tratamiento],
    );
  }
}

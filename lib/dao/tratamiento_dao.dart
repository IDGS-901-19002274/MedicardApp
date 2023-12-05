import 'package:medicard_app/Database/database_helper.dart';
import 'package:medicard_app/models/tratamiento_model.dart';

class TratamientoDao {
  final database = DatabaseHelper.instance.db;
  final String table = 'tbl_tratamientos';

  Future<List<TratamientoModel>> readTratamientos() async {
    final data = await database.query(table);
    return data.map((e) => TratamientoModel.fromMap(e)).toList();
  }

  Future<List<TratamientoModel>> readTratamientosById({required int id}) async {
    final data =
        await database.query(table, where: 'fk_id_grupo = ?', whereArgs: [id]);
    return data.map((e) => TratamientoModel.fromMap(e)).toList();
  }

  Future<int> insertTratamiento({required TratamientoModel tratamiento}) async {
    final int tratId = await database.insert(table, {
      "fk_id_medicamento": tratamiento.fk_id_medicamento,
      "precio": tratamiento.precio,
      "dosis": tratamiento.dosis,
      "periodo_en_horas": tratamiento.periodo_en_horas,
      "fecha_inicio": tratamiento.fecha_inicio.toIso8601String(),
      "fecha_final": tratamiento.fecha_final.toIso8601String(),
      "fk_id_grupo": tratamiento.fk_id_grupo,
      "rigtone": tratamiento.rigtone,
    });

    // Insertar todos los horarios
    DateTime fechaActual = tratamiento.fecha_inicio;
    while (fechaActual.isBefore(tratamiento.fecha_final)) {
      await database.insert('tbl_horarios', {
        "fk_id_tratamiento": tratId,
        "medicina_tomada": 2,
        "fecha": fechaActual.toIso8601String(),
      });

      // Incrementar la fecha según el periodo_en_horas
      fechaActual =
          fechaActual.add(Duration(hours: tratamiento.periodo_en_horas));
    }

    return tratId;
  }

  Future insertTratamientoById({required TratamientoModel tratamiento}) async {
    await database.insert(table, {
      "id_tratamiento": tratamiento.id_tratamiento,
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

  Future update({required int grupoId, required int idTratamiento}) async {
    await database.update(
      table,
      {
        "fk_id_grupo": grupoId,
      },
      where: 'id_tratamiento = ?',
      whereArgs: [idTratamiento],
    );
  }

  Future delete({required TratamientoModel tratamiento}) async {
    await database.delete(
      table,
      where: 'id_tratamiento = ?',
      whereArgs: [tratamiento.id_tratamiento],
    );
  }

  Future deleteAllTratamientos() async {
    await database.delete(table);
  }
}

import 'package:medicard_app/Database/database_helper.dart';
import '../models/model_exports.dart';

class UsuarioDao {
  final database = DatabaseHelper.instance.db;
  final String table = 'tbl_datos_usuario';

  Future<UsuarioModel?> getUser() async {
    final data = await database.query(table, limit: 1);
    if (data.isNotEmpty) {
      return UsuarioModel.fromMap(data.first);
    } else {
      return null;
    }
  }

  Future<int> insertUser({required UsuarioModel user}) async {
    return await database.insert(table, {
      "id_usuario": user.id_usuario,
      "nombre": user.nombre,
      "apellidoP": user.apellidoP,
      "apellidoM": user.apellidoM,
      "correo": user.correo,
    });
  }

  Future<void> deleteUser() async {
    await database.delete(table);
  }
}

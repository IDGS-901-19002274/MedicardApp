import 'package:medicard_app/Database/database_helper.dart';
import 'package:medicard_app/models/medicamento_model.dart';

class MedicamentoDao {
  final database = DatabaseHelper.instance.db;
  final String table = 'tbl_medicamento';

  Future<List<MedicamentoModel>> readMedicamentos() async {
    final data = await database.query(table);
    return data.map((e) => MedicamentoModel.fromMap(e)).toList();
  }
}

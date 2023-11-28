import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  Database? _db;
  Database get db => _db!;

  Future<void> init() async {
    _db = await openDatabase('database.medicard', version: 1,
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE tbl_medicamento (id_medicamento INTEGER PRIMARY KEY AUTOINCREMENT,nombre VARCHAR(64) NOT NULL,fabricante VARCHAR(64) NOT NULL,cantidad INTEGER NOT NULL,medida VARCHAR(16) NOT NUL);');
      db.execute(
          'CREATE TABLE tbl_grupos (id_grupo INTEGER PRIMARY KEY AUTOINCREMENT,nombre VARCHAR(32) NOT NULL,tema VARCHAR(32) NOT NULL);');
      db.execute(
          'CREATE TABLE tbl_tratamientos (id_tratamiento INTEGER PRIMARY KEY AUTOINCREMENT,fk_id_medicamento INTEGER NOT NULL,precio REAL NOT NULL,dosis INTEGER NOT NULL,periodo_en_horas INTEGER NOT NULL,fecha_inicio DATETIME NOT NULL,fecha_final DATETIME NOT NULL,fk_id_grupo INTEGER NOT NULL,FOREIGN KEY (fk_id_medicamento) REFERENCES tbl_medicamento(id_medicamento),FOREIGN KEY (fk_id_grupo) REFERENCES tbl_grupos(id_grupo));');
    });
  }
}

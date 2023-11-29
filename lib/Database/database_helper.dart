import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  static Database? _db;
  Database get db => _db!;

  static Future<void> init() async {
    _db = await openDatabase('database.medicard', version: 1,
        onCreate: (db, version) async {
      db.execute(
          'CREATE TABLE tbl_medicamento (id_medicamento INTEGER PRIMARY KEY AUTOINCREMENT,nombre VARCHAR(64) NOT NULL,fabricante VARCHAR(64) NOT NULL,cantidad INTEGER NOT NULL,medida VARCHAR(16) NOT NULL);');
      db.execute(
          'CREATE TABLE tbl_grupos (id_grupo INTEGER PRIMARY KEY AUTOINCREMENT,nombre VARCHAR(32) NOT NULL,tema VARCHAR(32) NOT NULL);');
      db.execute(
          'CREATE TABLE tbl_tratamientos (id_tratamiento INTEGER PRIMARY KEY AUTOINCREMENT,fk_id_medicamento INTEGER NOT NULL,precio REAL,dosis INTEGER NOT NULL,periodo_en_horas INTEGER NOT NULL,fecha_inicio DATETIME NOT NULL,fecha_final DATETIME NOT NULL,fk_id_grupo INTEGER, rigtone VARCHAR(64) NOT NULL, FOREIGN KEY (fk_id_medicamento) REFERENCES tbl_medicamento(id_medicamento));');
      db.execute(
          'CREATE TABLE IF NOT EXISTS tbl_horarios (id_horario INTEGER PRIMARY KEY NOT NULL,fk_id_medicamento INTEGER NOT NULL,medicina_tomada INTEGER NOT NULL,fecha DATETIME NOT NULL,FOREIGN KEY (fk_id_medicamento) REFERENCES tbl_medicamento(id_medicamento));');
      // Insertar 50 medicamentos
      for (int i = 1; i <= 50; i++) {
        await db.insert('tbl_medicamento', {
          'nombre': 'medicamento #$i',
          'fabricante': 'fabricante #$i',
          'cantidad': i * 10,
          'medida': 'medida #$i',
        });
      }

      await db.insert('tbl_grupos',
          {'id_grupo': 1, 'nombre': 'Sin Grupo', 'tema': 'default'});
    });
  }
}

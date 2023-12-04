// ignore_for_file: non_constant_identifier_names
class HorarioModel {
  final int? id_horario;
  final int fk_id_tratamiento;
  final int medicina_tomada;
  final DateTime fecha;

  HorarioModel({
    this.id_horario,
    required this.fk_id_tratamiento,
    required this.medicina_tomada,
    required this.fecha,
  });

  HorarioModel copyWith(
      {int? id,
      int? fk_id_tratamiento,
      int? medicina_tomada,
      DateTime? fecha}) {
    return HorarioModel(
      id_horario: id ?? id_horario,
      fk_id_tratamiento: fk_id_tratamiento ?? this.fk_id_tratamiento,
      medicina_tomada: medicina_tomada ?? this.medicina_tomada,
      fecha: fecha ?? this.fecha,
    );
  }

  factory HorarioModel.fromMap(Map<String, dynamic> map) {
    return HorarioModel(
      id_horario: map['id_horario'],
      fk_id_tratamiento: map['fk_id_tratamiento'],
      medicina_tomada: map['medicina_tomada'],
      fecha: DateTime.parse(map['fecha']),
    );
  }

  Map<String, dynamic> toMap() => {
        "id_horario": id_horario,
        "fk_id_tratamiento": fk_id_tratamiento,
        "medicina_tomada": medicina_tomada,
        "fecha": fecha.toIso8601String()
      };
}

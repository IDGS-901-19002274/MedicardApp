// ignore_for_file: non_constant_identifier_names
class TratamientoModel {
  final int id_tratamiento;
  final int fk_id_medicamento;
  final double precio;
  final int dosis;
  final int periodo_en_horas;
  final DateTime fecha_inicio;
  final DateTime fecha_final;
  final int fk_id_grupo;
  final String rigtone;

  TratamientoModel(
      {required this.id_tratamiento,
      required this.fk_id_medicamento,
      required this.precio,
      required this.dosis,
      required this.periodo_en_horas,
      required this.fecha_inicio,
      required this.fecha_final,
      required this.fk_id_grupo,
      required this.rigtone});

  TratamientoModel copyWith(
      {int? id,
      int? fk_id_medicamento,
      double? precio,
      int? dosis,
      int? periodo_en_horas,
      DateTime? fecha_inicio,
      DateTime? fecha_final,
      int? fk_id_grupo,
      String? rigtone}) {
    return TratamientoModel(
        id_tratamiento: id ?? id_tratamiento,
        fk_id_medicamento: fk_id_medicamento ?? this.fk_id_medicamento,
        precio: precio ?? this.precio,
        dosis: dosis ?? this.dosis,
        periodo_en_horas: periodo_en_horas ?? this.periodo_en_horas,
        fecha_inicio: fecha_inicio ?? this.fecha_inicio,
        fecha_final: fecha_final ?? this.fecha_final,
        fk_id_grupo: fk_id_grupo ?? this.fk_id_grupo,
        rigtone: rigtone ?? this.rigtone);
  }

  factory TratamientoModel.fromMap(Map<String, dynamic> map) {
    return TratamientoModel(
      id_tratamiento: map['id_tratamiento'],
      fk_id_medicamento: map['fk_id_medicamento'],
      precio: map['precio'],
      dosis: map['dosis'],
      periodo_en_horas: map['periodo_en_horas'],
      fecha_inicio: DateTime.parse(map['fecha_inicio']),
      fecha_final: DateTime.parse(map['fecha_final']),
      fk_id_grupo: map['fk_id_grupo'],
      rigtone: map['rigtone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_tratamiento': id_tratamiento,
      'fk_id_medicamento': fk_id_medicamento,
      'precio': precio,
      'dosis': dosis,
      'periodo_en_horas': periodo_en_horas,
      'fecha_inicio': fecha_inicio.toIso8601String(),
      'fecha_final': fecha_final.toIso8601String(),
      'fk_id_grupo': fk_id_grupo,
      'rigtone': rigtone
    };
  }
}

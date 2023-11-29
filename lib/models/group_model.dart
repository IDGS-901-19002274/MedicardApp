// ignore_for_file: non_constant_identifier_names
class GroupModel {
  final int? id_grupo;
  final String nombre;
  final String tema;

  GroupModel({
    this.id_grupo,
    required this.nombre,
    required this.tema,
  });

  GroupModel copyWith({int? id, String? nombre, String? tema}) {
    // ignore: unnecessary_this
    return GroupModel(
        id_grupo: id ?? id_grupo,
        nombre: nombre ?? this.nombre,
        tema: tema ?? this.tema);
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id_grupo: map['id_grupo'],
      nombre: map['nombre'],
      tema: map['tema'],
    );
  }

  Map<String, dynamic> toMap() =>
      {"id_grupo": id_grupo, "nombre": nombre, "tema": tema};
}

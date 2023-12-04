// ignore_for_file: non_constant_identifier_names
class UsuarioModel {
  final int? id_usuario;
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final String correo;

  UsuarioModel({
    this.id_usuario,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.correo,
  });

  UsuarioModel copyWith({
    int? id,
    String? nombre,
    String? apellidoP,
    String? apellidoM,
    String? correo,
  }) {
    return UsuarioModel(
      id_usuario: id ?? id_usuario,
      nombre: nombre ?? this.nombre,
      apellidoP: apellidoP ?? this.apellidoP,
      apellidoM: apellidoM ?? this.apellidoM,
      correo: correo ?? this.correo,
    );
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id_usuario: map['id_usuario'],
      nombre: map['nombre'],
      apellidoP: map['apellidoP'],
      apellidoM: map['apellidoM'],
      correo: map['correo'],
    );
  }

  Map<String, dynamic> toMap() => {
        "id_usuario": id_usuario,
        "nombre": nombre,
        "apellidoP": apellidoP,
        "apellidoM": apellidoM,
        "correo": correo,
      };
}

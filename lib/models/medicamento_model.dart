// ignore_for_file: non_constant_identifier_names
class MedicamentoModel {
  final int idMedicamento;
  final String nombre;
  final String fabricante;
  final int cantidad;
  final String medida;

  MedicamentoModel({
    required this.idMedicamento,
    required this.nombre,
    required this.fabricante,
    required this.cantidad,
    required this.medida,
  });

  MedicamentoModel copyWith({
    int? idMedicamento,
    String? nombre,
    String? fabricante,
    int? cantidad,
    String? medida,
  }) {
    return MedicamentoModel(
      idMedicamento: idMedicamento ?? this.idMedicamento,
      nombre: nombre ?? this.nombre,
      fabricante: fabricante ?? this.fabricante,
      cantidad: cantidad ?? this.cantidad,
      medida: medida ?? this.medida,
    );
  }

  factory MedicamentoModel.fromMap(Map<String, dynamic> map) {
    return MedicamentoModel(
      idMedicamento: map['id_medicamento'],
      nombre: map['nombre'],
      fabricante: map['fabricante'],
      cantidad: map['cantidad'],
      medida: map['medida'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_medicamento': idMedicamento,
      'nombre': nombre,
      'fabricante': fabricante,
      'cantidad': cantidad,
      'medida': medida,
    };
  }
}

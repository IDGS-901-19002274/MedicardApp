import 'package:flutter/material.dart';
import 'package:medicard_app/interfaces/color_interface.dart';

import '../models/model_exports.dart';
import 'custom_widgets.dart';

class MedicineRecorder extends StatelessWidget {
  final CardColors colorPallette;
  final TratamientoModel tratamiento;
  final MedicamentoModel medicamento;
  const MedicineRecorder(
      {super.key,
      required this.colorPallette,
      required this.tratamiento,
      required this.medicamento});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HourText(
              time: tratamiento.fecha_inicio, color: colorPallette.textColor),
          Expanded(
            child: AlarmCard(
              colors: colorPallette,
              medicine: medicamento.nombre,
              frecuency: tratamiento.periodo_en_horas,
            ),
          )
        ],
      ),
    );
  }
}

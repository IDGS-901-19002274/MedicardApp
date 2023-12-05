// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/interfaces/color_interface.dart';
import 'package:medicard_app/providers/horario_provider.dart';
import 'package:medicard_app/screens/show_alarms_screen.dart';
import 'package:provider/provider.dart';

class AlarmCard extends StatelessWidget {
  final String medicine;
  final int frecuency;
  final CardColors colors;
  final int idTratamiento;
  const AlarmCard({
    super.key,
    required this.medicine,
    required this.frecuency,
    required this.colors,
    required this.idTratamiento,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colors.detailColor1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: MiddleCardTitle(text: medicine, color: colors.bgColor),
        subtitle: MedicineText(
          text: '$willSound $frecuency $txtHours',
          color: colors.cardColor,
        ),
        trailing: IconButton(
          onPressed: () async {
            await Provider.of<HorarioProvider>(context, listen: false)
                .clearData();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShwoAlarmsScreen(
                        idHorarios: idTratamiento, colorPallette: colors)));
          },
          icon: const Icon(Icons.chevron_right_outlined),
          color: colors.bgColor,
        ),
      ),
    );
  }
}

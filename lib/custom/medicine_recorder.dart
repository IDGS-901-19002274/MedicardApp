import 'package:flutter/material.dart';
import 'package:medicard_app/interfaces/color_interface.dart';

import 'custom_widgets.dart';

class MedicineRecorder extends StatelessWidget {
  final CardColors colorPallette;
  const MedicineRecorder({super.key, required this.colorPallette});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HourText(time: DateTime.now(), color: colorPallette.textColor),
          Expanded(
            child: AlarmCard(
              colors: colorPallette,
              medicine: 'Paracetamol',
              frecuency: 8,
            ),
          )
        ],
      ),
    );
  }
}

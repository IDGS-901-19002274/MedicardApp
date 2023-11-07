import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/interfaces/color_interface.dart';

class AlarmCard extends StatelessWidget {
  final String medicine;
  final int frecuency;
  final CardColors colors;
  const AlarmCard({
    super.key,
    required this.medicine,
    required this.frecuency,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colors.detailColor1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                MiddleCardTitle(text: medicine, color: colors.bgColor),
                MedicineText(
                  text: '$willSound $frecuency $txtHours',
                  color: colors.cardColor,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right_outlined),
              color: colors.bgColor,
            )
          ],
        ),
      ),
    );
  }
}

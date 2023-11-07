import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_buttons.dart';
import 'package:medicard_app/interfaces/color_interface.dart';
import 'custom_widgets.dart';

class GroupCard extends StatelessWidget {
  final CardColors colorPallette;
  const GroupCard({super.key, required this.colorPallette});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: RoundedBox(
        shadow: 50,
        shadowColor: colorPallette.cardColor,
        bgColor: colorPallette.bgColor,
        padding: const EdgeInsets.only(bottom: 30, left: 5, right: 5),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardTitle(
                  text: 'Titulo',
                  fontColor: colorPallette.textColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  iconSize: 30,
                  color: colorPallette.detailColor2,
                )
              ],
            ),
          ),
          subtitle: Container(
            constraints: const BoxConstraints(minHeight: 110),
            decoration: BoxDecoration(color: colorPallette.cardColor),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MedicineRecorder(colorPallette: colorPallette),
                  MedicineRecorder(colorPallette: colorPallette),
                  MedicineRecorder(colorPallette: colorPallette),
                  AddGroupMedButton(
                    bgColor: colorPallette.detailColor1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

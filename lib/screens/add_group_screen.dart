import 'package:flutter/material.dart';
import 'package:medicard_app/constants/color_pallettes.dart';
import 'package:medicard_app/custom/custom_inputs.dart';
import '../custom/custom_form_2.dart';

class AddGropuScreen extends StatefulWidget {
  const AddGropuScreen({super.key});

  @override
  State<AddGropuScreen> createState() => _AddGropuScreenState();
}

class _AddGropuScreenState extends State<AddGropuScreen> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<String>> colorLists = [];
    colorPalletes.forEach(
      (key, value) {
        colorLists.add(
          DropdownMenuEntry(
            value: key,
            label: key,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(value.detailColor1),
              foregroundColor: MaterialStateProperty.all<Color>(value.bgColor),
            ),
          ),
        );
      },
    );
    return Scaffold(
      body: AddForm(
        maxHeight: 400,
        fields: [
          const RowedForm(
            label: 'Nombre',
            hint: 'Nombre del grupo',
            inputType: TextInputType.name,
          ),
          MedDropDown(items: colorLists, label: 'Paleta de Colores')
        ],
        focus: FocusNode(),
        title: 'Grupo',
      ),
    );
  }
}

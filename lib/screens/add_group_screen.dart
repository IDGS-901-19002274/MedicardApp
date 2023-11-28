import 'package:flutter/material.dart';
import 'package:medicard_app/constants/color_pallettes.dart';
import 'package:medicard_app/constants/constants.dart';
import 'package:medicard_app/custom/custom_inputs.dart';
import '../custom/custom_form_2.dart';

class AddGropuScreen extends StatefulWidget {
  const AddGropuScreen({super.key});

  @override
  State<AddGropuScreen> createState() => _AddGropuScreenState();
}

class _AddGropuScreenState extends State<AddGropuScreen> {
  String nombre = '';
  String tema = '';
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
                  MaterialStateProperty.all<Color>(value.detailColor2),
              foregroundColor: MaterialStateProperty.all<Color>(value.bgColor),
            ),
          ),
        );
      },
    );
    return Scaffold(
      body: Container(
        decoration: backgroundImage(image: 'background2'),
        child: AddForm(
          maxHeight: 400,
          function: () {
            //dynamic newGroup =
            //  Database.setGroup(id: 1, nombre: nombre, tema: tema);
            //print(newGroup);
          },
          fields: [
            RowedForm(
              label: 'Nombre',
              hint: 'Nombre del grupo',
              inputType: TextInputType.name,
              onchange: (String value) {
                nombre = value;
              },
            ),
            MedDropDown(
              items: colorLists,
              label: 'Paleta de Colores',
              onchange: (value) {
                tema = value;
              },
            )
          ],
          focus: FocusNode(),
          title: 'Grupo',
        ),
      ),
    );
  }
}

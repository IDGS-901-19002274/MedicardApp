import 'package:flutter/material.dart';
import 'package:medicard_app/constants/color_pallettes.dart';
import 'package:medicard_app/constants/constants.dart';
import 'package:medicard_app/custom/custom_inputs.dart';
import 'package:medicard_app/models/group_model.dart';
import 'package:medicard_app/providers/grupo_provider.dart';
import 'package:provider/provider.dart';
import '../custom/custom_form_2.dart';
import '../dao/grupo_dao.dart';

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
            GrupoDao dao = GrupoDao();
            final provider = Provider.of<GrupoProvider>(context, listen: false);
            provider.clearData();
            GroupModel nuevoGrupo = GroupModel(nombre: nombre, tema: tema);
            dao.insertGroup(group: nuevoGrupo);
            provider.setListaGrupos();
            Navigator.pop(context);
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
              initial: 'default',
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

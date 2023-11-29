import 'package:flutter/material.dart';
import 'package:medicard_app/interfaces/color_interface.dart';
import 'package:medicard_app/models/group_model.dart';
import 'package:medicard_app/models/medicamento_model.dart';
import 'package:medicard_app/models/tratamiento_model.dart';
import 'package:medicard_app/providers/provider_exports.dart';
import 'package:provider/provider.dart';
import 'custom_widgets.dart';

class GroupCard extends StatelessWidget {
  final CardColors colorPallette;
  final GroupModel grupo;
  const GroupCard(
      {super.key, required this.colorPallette, required this.grupo});

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
                  text: grupo.nombre.length > 20
                      ? '${grupo.nombre.substring(0, 20)}...'
                      : grupo.nombre,
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: createRecorders(
                    id: grupo.id_grupo!,
                    colorpallette: colorPallette,
                    context: context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> createRecorders(
      {required int id,
      required CardColors colorpallette,
      required BuildContext context}) {
    TratamientoProvider provider = Provider.of<TratamientoProvider>(context);
    MedicamentoProvider medprovider = Provider.of<MedicamentoProvider>(context);
    List<TratamientoModel> tratamientos = provider.listaTratamientos;
    List<MedicamentoModel> medicamentos = medprovider.listaMedicamentos;

    List<Widget> rtrn = [];

    for (TratamientoModel tratamiento in tratamientos) {
      if (tratamiento.fk_id_grupo == id) {
        MedicamentoModel medicamento = medicamentos.firstWhere((medicamento) =>
            medicamento.idMedicamento == tratamiento.fk_id_medicamento);
        rtrn.add(MedicineRecorder(
          colorPallette: colorPallette,
          tratamiento: tratamiento,
          medicamento: medicamento,
        ));
      }
    }

    rtrn.add(AddGroupMedButton(
      bgColor: colorPallette.detailColor1,
    ));

    return rtrn;
  }
}

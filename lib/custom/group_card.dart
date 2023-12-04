import 'package:flutter/material.dart';
import 'package:medicard_app/interfaces/color_interface.dart';
import 'package:medicard_app/models/group_model.dart';
import 'package:medicard_app/models/medicamento_model.dart';
import 'package:medicard_app/models/tratamiento_model.dart';
import 'package:medicard_app/providers/provider_exports.dart';
import 'package:provider/provider.dart';
import 'custom_widgets.dart';

class GroupCard extends StatefulWidget {
  final CardColors colorPallette;
  final GroupModel grupo;
  const GroupCard(
      {super.key, required this.colorPallette, required this.grupo});

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: RoundedBox(
        elevation: 3,
        shadowColor: widget.colorPallette.cardColor,
        bgColor: widget.colorPallette.bgColor,
        padding: const EdgeInsets.only(bottom: 30, left: 5, right: 5),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardTitle(
                  text: widget.grupo.nombre.length > 20
                      ? '${widget.grupo.nombre.substring(0, 20)}...'
                      : widget.grupo.nombre,
                  fontColor: widget.colorPallette.textColor,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  iconSize: 30,
                  color: widget.colorPallette.detailColor2,
                )
              ],
            ),
          ),
          subtitle: AnimatedContainer(
            duration: const Duration(seconds: 0),
            height: isOpen ? null : 0,
            decoration: BoxDecoration(color: widget.colorPallette.cardColor),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: createRecorders(
                            id: widget.grupo.id_grupo!,
                            nombre: widget.grupo.nombre,
                            colorpallette: widget.colorPallette,
                            context: context)
                        .isEmpty
                    ? [
                        const Center(
                          child: Text('Nada para mostrar'),
                        )
                      ]
                    : createRecorders(
                        id: widget.grupo.id_grupo!,
                        nombre: widget.grupo.nombre,
                        colorpallette: widget.colorPallette,
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
      required String nombre,
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
          colorPallette: widget.colorPallette,
          tratamiento: tratamiento,
          medicamento: medicamento,
        ));
      }
    }

    if (id != 1) {
      rtrn.add(AddGroupMedButton(
        idGrupo: id,
        nombre: nombre,
        collorPallette: widget.colorPallette,
      ));
    }

    return rtrn;
  }
}

import 'package:flutter/material.dart';
import 'package:medicard_app/constants/color_pallettes.dart';
import 'package:medicard_app/custom/drag_and_drop.dart';
import 'package:medicard_app/interfaces/color_interface.dart';
import 'package:medicard_app/interfaces/tratamiento_y_medicamento.dart';
import 'package:medicard_app/models/model_exports.dart';
import 'package:medicard_app/providers/provider_exports.dart';
import 'package:medicard_app/screens/edit_group_screen.dart';
import 'package:provider/provider.dart';

class DragToGroupScreen extends StatefulWidget {
  final int idGrupo;
  final String nombreGrupo;
  final CardColors colorPallette;
  const DragToGroupScreen(
      {super.key,
      required this.idGrupo,
      required this.nombreGrupo,
      required this.colorPallette});

  @override
  State<DragToGroupScreen> createState() => _DragToGroupScreenState();
}

class _DragToGroupScreenState extends State<DragToGroupScreen> {
  @override
  Widget build(BuildContext context) {
    List<TratamientoYMedicamento> groupList =
        getAllGroupList(id: widget.idGrupo);
    List<TratamientoYMedicamento> noGroupList = getAllGroupList(id: 1);
    return Scaffold(
      backgroundColor: widget.colorPallette.detailColor1,
      appBar: AppBar(
        backgroundColor: widget.colorPallette.cardColor,
        title: const Text('Editar grupo'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditGroupScreen(
                              idGrupo: widget.idGrupo,
                              colorPallette: widget.colorPallette,
                            )));
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DraggerContainer(
                groupName: widget.nombreGrupo,
                colorPallette: widget.colorPallette,
                child: DraggerZone(
                  colorPallette: widget.colorPallette,
                  tiles: groupList,
                  idGrupo: widget.idGrupo,
                ),
              ),
              const Divider(),
              DraggerContainer(
                  groupName: 'Tratamientos disponibles',
                  colorPallette: colorPalletes['default']!,
                  child: DragsGrid(tiles: noGroupList))
            ],
          ),
        ),
      ),
    );
  }

  List<TratamientoYMedicamento> getAllGroupList({required int id}) {
    List<TratamientoYMedicamento> rtrn = [];
    TratamientoProvider provider =
        Provider.of<TratamientoProvider>(context, listen: false);
    MedicamentoProvider provider2 =
        Provider.of<MedicamentoProvider>(context, listen: false);
    List<TratamientoModel> tratamientos = provider.listaTratamientos;
    List<MedicamentoModel> medicamentos = provider2.listaMedicamentos;

    for (TratamientoModel tratamiento in tratamientos) {
      if (tratamiento.fk_id_grupo == id) {
        MedicamentoModel thisMedicamento = medicamentos.firstWhere(
            (medicamento) =>
                medicamento.idMedicamento == tratamiento.fk_id_medicamento);
        rtrn.add(TratamientoYMedicamento(
            idTratamiento: tratamiento.id_tratamiento,
            nombreMedicamento: thisMedicamento.nombre));
      }
    }

    return rtrn;
  }
}

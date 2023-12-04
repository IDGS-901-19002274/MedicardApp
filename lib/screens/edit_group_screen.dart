import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_texts.dart';
import 'package:medicard_app/interfaces/color_interface.dart';
import 'package:medicard_app/interfaces/tratamiento_y_medicamento.dart';
import 'package:medicard_app/models/model_exports.dart';
import 'package:medicard_app/providers/provider_exports.dart';
import 'package:provider/provider.dart';

import '../dao/dao_exports.dart';

class EditGroupScreen extends StatefulWidget {
  final int idGrupo;
  final CardColors colorPallette;
  const EditGroupScreen(
      {super.key, required this.idGrupo, required this.colorPallette});

  @override
  State<EditGroupScreen> createState() => _EditGroupScreenState();
}

class _EditGroupScreenState extends State<EditGroupScreen> {
  List<TratamientoYMedicamento> tratamientos = [];
  List<int> tratamientosEnLista = [];

  @override
  void initState() {
    tratamientos = setTratamientos(idGrupo: widget.idGrupo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GrupoProvider gruprovider =
              Provider.of<GrupoProvider>(context, listen: false);
          TratamientoProvider tratProvider =
              Provider.of<TratamientoProvider>(context, listen: false);
          TratamientoDao dao = TratamientoDao();
          gruprovider.clearData();
          for (int tratamiento in tratamientosEnLista) {
            dao.update(grupoId: 1, idTratamiento: tratamiento);
          }
          tratProvider.clearData();
          tratProvider.setListaTratamientos();
          gruprovider.setListaGrupos();
          Navigator.pushNamedAndRemoveUntil(context, '/Home', (route) => false);
        },
        backgroundColor: widget.colorPallette.detailColor1,
        child: const Icon(Icons.save_rounded),
      ),
      backgroundColor: widget.colorPallette.detailColor2,
      appBar: AppBar(
        backgroundColor: widget.colorPallette.cardColor,
        title: const Text('Editar grupo'),
      ),
      body: SafeArea(
        child: tratamientos.isEmpty
            ? const Center(
                child: Text('Cargando'),
              )
            : ListView.builder(
                itemCount: tratamientos.length,
                itemBuilder: (context, item) {
                  TratamientoYMedicamento tratamiento = tratamientos[item];
                  return Card(
                      color: !tratamientosEnLista
                              .contains(tratamiento.idTratamiento)
                          ? widget.colorPallette.detailColor1
                          : Colors.white,
                      child: ListTile(
                        onTap: () {
                          if (tratamientosEnLista
                              .contains(tratamiento.idTratamiento)) {
                            setState(() {
                              tratamientosEnLista.removeWhere((element) =>
                                  element == tratamiento.idTratamiento);
                            });
                          } else {
                            setState(() {
                              tratamientosEnLista
                                  .add(tratamiento.idTratamiento);
                            });
                          }
                        },
                        title: CardTitle(
                            text: tratamiento.nombreMedicamento,
                            fontColor: !tratamientosEnLista
                                    .contains(tratamiento.idTratamiento)
                                ? widget.colorPallette.bgColor
                                : Colors.black),
                        leading: Icon(
                          !tratamientosEnLista
                                  .contains(tratamiento.idTratamiento)
                              ? Icons.check_box_rounded
                              : Icons.square,
                          color: !tratamientosEnLista
                                  .contains(tratamiento.idTratamiento)
                              ? widget.colorPallette.bgColor
                              : widget.colorPallette.detailColor2,
                        ),
                      ));
                }),
      ),
    );
  }

  List<TratamientoYMedicamento> setTratamientos({required int idGrupo}) {
    List<TratamientoYMedicamento> result = [];
    TratamientoProvider tratProv =
        Provider.of<TratamientoProvider>(context, listen: false);
    MedicamentoProvider medProv =
        Provider.of<MedicamentoProvider>(context, listen: false);
    List<TratamientoModel> tratamientosList = tratProv.listaTratamientos;
    List<MedicamentoModel> medicamentos = medProv.listaMedicamentos;

    for (TratamientoModel tratamiento in tratamientosList) {
      if (tratamiento.fk_id_grupo == idGrupo) {
        result.add(TratamientoYMedicamento(
            idTratamiento: tratamiento.id_tratamiento,
            nombreMedicamento: medicamentos
                .firstWhere((medicamento) =>
                    medicamento.idMedicamento == tratamiento.fk_id_medicamento)
                .nombre));
      }
    }

    return result;
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicard_app/custom/custom_texts.dart';
import 'package:medicard_app/interfaces/color_interface.dart';
import 'package:medicard_app/models/horario_model.dart';
import 'package:medicard_app/providers/horario_provider.dart';
import 'package:provider/provider.dart';

class ShwoAlarmsScreen extends StatefulWidget {
  final int idHorarios;
  final CardColors colorPallette;
  const ShwoAlarmsScreen(
      {super.key, required this.idHorarios, required this.colorPallette});

  @override
  State<ShwoAlarmsScreen> createState() => _ShwoAlarmsScreenState();
}

class _ShwoAlarmsScreenState extends State<ShwoAlarmsScreen> {
  @override
  void initState() {
    Provider.of<HorarioProvider>(context, listen: false)
        .setListaHorarios(idTrat: widget.idHorarios);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HorarioProvider provider = Provider.of<HorarioProvider>(context);
    List<HorarioModel> listaHorarios = provider.listaHorarios;
    final format = DateFormat('dd ' 'MMMM' ' y', 'es');

    return Scaffold(
      backgroundColor: widget.colorPallette.detailColor2,
      appBar: AppBar(
        title: const Text('Alarmas'),
        backgroundColor: widget.colorPallette.detailColor1,
      ),
      body: ListView.builder(
          itemCount: listaHorarios.length,
          itemBuilder: (context, item) {
            HorarioModel horario = listaHorarios[item];
            return Card(
              color: widget.colorPallette.cardColor,
              child: ListTile(
                leading: HourText(
                  color: widget.colorPallette.bgColor,
                  time: horario.fecha,
                ),
                trailing: MiddleCardTitle(
                    text: format.format(horario.fecha),
                    color: widget.colorPallette.textColor),
              ),
            );
          }),
    );
  }
}

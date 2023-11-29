import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:medicard_app/constants/constants.dart';
import 'package:medicard_app/custom/custom_inputs.dart';
import 'package:medicard_app/dao/dao_exports.dart';
import 'package:medicard_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:search_choices/search_choices.dart';
import '../custom/custom_form_2.dart';
import '../models/model_exports.dart';
import '../providers/provider_exports.dart';

class AddMedScreen extends StatefulWidget {
  const AddMedScreen({super.key});

  @override
  State<AddMedScreen> createState() => _AddMedScreenState();
}

class _AddMedScreenState extends State<AddMedScreen> {
  Time horainfin = Time(hour: 4, minute: 30);
  DateTime fechainicio = DateTime.now();
  DateTime fechafin = DateTime.now();
  final focus = FocusNode();

  //todo: variables de tratamiento
  String tratId = '';
  double tratPrecio = 0.0;
  int tratDosis = 0;
  int tratRepetir = 4;
  int tratGrupoId = 1;
  String tratRigtone = 'Rigtone #1';

  @override
  void initState() {
    Provider.of<MedicamentoProvider>(context, listen: false)
        .setListaMedicamentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Todo: Providers
    final medprovider = Provider.of<MedicamentoProvider>(context);
    final grouprovider = Provider.of<GrupoProvider>(context);
    //Todo: Listas de objetos
    final List<MedicamentoModel> medicamentos = medprovider.listaMedicamentos;
    final List<GroupModel> grupos = grouprovider.listaGrupos;
    //Todo: Listas de Strings y dropdowns
    final List<DropdownMenuItem<String>> medNombres =
        obtenerMedicamentos(medicamentos);
    final List<DropdownMenuEntry<String>> groups = obtenerGrupos(grupos);
    final List<DropdownMenuEntry<String>> rigtones = List.generate(
        10,
        (index) => DropdownMenuEntry(
            value: 'Rigtone #$index', label: 'Rigtone #$index'));

    const String firstgroupid = '1';
    return Container(
      decoration: backgroundImage(image: 'background2'),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AddForm(
          function: () {
            TratamientoDao dao = TratamientoDao();
            final provider = Provider.of<GrupoProvider>(context, listen: false);
            provider.clearData();
            TratamientoModel newTratamiento = TratamientoModel(
                id_tratamiento: 0,
                fk_id_medicamento: int.parse(tratId),
                precio: tratPrecio,
                dosis: tratDosis,
                periodo_en_horas: tratRepetir,
                fecha_inicio:
                    setNewFecha(fechaNormal: fechainicio, horas: horainfin),
                fecha_final:
                    setNewFecha(fechaNormal: fechafin, horas: horainfin),
                fk_id_grupo: tratGrupoId,
                rigtone: tratRigtone);
            dao.insertTratamiento(tratamiento: newTratamiento);
            provider.setListaGrupos();
            Navigator.pop(context);
          },
          fields: [
            SearchChoices.single(
              items: medNombres,
              value: tratId,
              hint: "Select one",
              searchHint: "Select one",
              onChanged: (value) {
                setState(() {
                  tratId = value;
                });
              },
              isExpanded: true,
            ),
            RowedForm(
              label: 'Dosis',
              hint: 'Inserte la dosis de su medicamento',
              inputType: TextInputType.number,
              onchange: (value) {
                tratDosis = int.parse(value);
              },
            ),
            RowedForm(
              label: 'Precio \$',
              hint: "Precio",
              inputType: TextInputType.number,
              onchange: (value) {
                tratPrecio = double.parse(value);
              },
            ),
            MedDropDown(
              label: 'Repetir medicamento cada ',
              initial: '4',
              items: const [
                DropdownMenuEntry(value: '8', label: '8 Horas'),
                DropdownMenuEntry(value: '6', label: '6 Horas'),
                DropdownMenuEntry(value: '4', label: '4 Horas'),
              ],
              onchange: (value) {
                tratRepetir = int.parse(value);
              },
            ),
            MedDropDown(
              items: groups,
              label: 'Agregar grupo:',
              initial: firstgroupid,
              onchange: (value) {
                tratGrupoId = int.parse(value);
              },
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fecha y hora'),
                Text('Fecha de finalizacion'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        List<DateTime?>? now = [fechainicio];
                        now = await showCalendarDatePicker2Dialog(
                          context: context,
                          config: CalendarDatePicker2WithActionButtonsConfig(),
                          dialogSize: const Size(325, 400),
                          value: now,
                          borderRadius: BorderRadius.circular(15),
                        );
                        fechainicio = now!.first!;
                      },
                      icon: const Icon(Icons.calendar_month,
                          color: AppTheme.primary),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          showPicker(
                              context: context,
                              value: horainfin,
                              sunrise: const TimeOfDay(
                                  hour: 6, minute: 0), // optional
                              sunset: const TimeOfDay(
                                  hour: 20, minute: 0), // optional
                              duskSpanInMinutes: 120, // optional
                              onChange: (time) {
                                horainfin = time;
                              }),
                        );
                      },
                      icon: const Icon(Icons.timer, color: AppTheme.primary),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () async {
                      List<DateTime?>? now = [fechafin];
                      now = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(),
                        dialogSize: const Size(325, 400),
                        value: now,
                        borderRadius: BorderRadius.circular(15),
                      );
                      fechafin = now!.first!;
                    },
                    icon: const Icon(Icons.calendar_month,
                        color: AppTheme.primary)),
              ],
            ),
            MedDropDown(
                items: rigtones, label: 'Tono de Alarma', initial: 'Rigtone #1')
          ],
          focus: focus,
          title: 'Tratamiento',
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> obtenerMedicamentos(
      List<MedicamentoModel> medicamentos) {
    List<DropdownMenuItem<String>> rtrn = [];

    for (MedicamentoModel medicamento in medicamentos) {
      rtrn.add(DropdownMenuItem(
        value: medicamento.idMedicamento.toString(),
        child: Text(medicamento.nombre),
      ));
    }

    return rtrn;
  }

  List<DropdownMenuEntry<String>> obtenerGrupos(List<GroupModel> grupos) {
    List<DropdownMenuEntry<String>> rtrn = [];

    for (GroupModel grupo in grupos) {
      rtrn.add(DropdownMenuEntry(
          value: grupo.id_grupo.toString(),
          label: grupo.nombre.length > 15
              ? '${grupo.nombre.substring(0, 15)}...'
              : grupo.nombre));
    }

    return rtrn;
  }

  DateTime setNewFecha({required DateTime fechaNormal, required Time horas}) {
    DateTime rtrn = DateTime(
      fechaNormal.year,
      fechaNormal.month,
      fechaNormal.day,
      horas.hour,
      horas.minute,
    );
    return rtrn;
  }
}

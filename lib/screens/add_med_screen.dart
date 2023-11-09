import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_inputs.dart';
import '../custom/custom_form_2.dart';
import '../custom/search_field.dart';

class AddMedScreen extends StatefulWidget {
  const AddMedScreen({super.key});

  @override
  State<AddMedScreen> createState() => _AddMedScreenState();
}

class _AddMedScreenState extends State<AddMedScreen> {
  int suggestionsCount = 12;
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = [];
    final suggestions =
        List.generate(suggestionsCount, (index) => 'Medicamento #$index');
    final List<DropdownMenuEntry<String>> groups = List.generate(
        suggestionsCount,
        (index) => DropdownMenuEntry(value: '$index', label: 'Grupo $index'));
    final List<DropdownMenuEntry<String>> rigtones = List.generate(
        suggestionsCount,
        (index) =>
            DropdownMenuEntry(value: '$index', label: 'Rigtone #$index'));
    return Scaffold(
      body: AddForm(
        fields: [
          SearchWidget(
            keyWord: 'medKey',
            suggestions: suggestions,
            suggestionsCount: suggestionsCount,
            focus: focus,
            hint: 'Indica el medicamento que quieres agregar',
          ),
          const RowedForm(
              label: 'Precio \$',
              hint: "Precio",
              inputType: TextInputType.number),
          const MedDropDown(
            label: 'Repetir medicamento cada ',
            items: [
              DropdownMenuEntry(value: '8', label: '8 Horas'),
              DropdownMenuEntry(value: '6', label: '6 Horas'),
              DropdownMenuEntry(value: '4', label: '4 Horas'),
            ],
          ),
          MedDropDown(items: groups, label: 'Agregar grupo:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(),
                    dialogSize: const Size(325, 400),
                    value: dates,
                    borderRadius: BorderRadius.circular(15),
                  );
                },
                child: const Text('Fecha de inicio'),
              ),
              TextButton(
                onPressed: () {
                  showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(),
                    dialogSize: const Size(325, 400),
                    value: dates,
                    borderRadius: BorderRadius.circular(15),
                  );
                },
                child: const Text('Fecha de finalizacion'),
              ),
            ],
          ),
          MedDropDown(items: rigtones, label: 'Tono de Alarma')
        ],
        focus: focus,
        title: 'Medicamento',
      ),
    );
  }
}

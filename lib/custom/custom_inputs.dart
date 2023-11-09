import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_widgets.dart';

class BasicTextField extends StatelessWidget {
  final bool shadow;
  final String hint;
  final TextInputType inputType;

  const BasicTextField({
    super.key,
    this.shadow = false,
    required this.hint,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: shadow,
      style: inputTextStyle,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: inputPaddingConstraints,
        enabledBorder: OutlineInputBorder(
          borderSide: inputBorderside,
          borderRadius: inputBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: inputBordersideFocused,
          borderRadius: inputBorderRadius,
        ),
      ),
    );
  }
}

class MedDropDown extends StatelessWidget {
  final String label;
  final List<DropdownMenuEntry<dynamic>> items;

  const MedDropDown({
    super.key,
    required this.items,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        DropdownMenu(
          dropdownMenuEntries: items,
        ),
      ],
    );
  }
}

class CalendarFormInput extends StatelessWidget {
  const CalendarFormInput({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(),
      onValueChanged: (dates) => [] = dates,
      value: const [],
    );
  }
}

class RowedForm extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType inputType;
  const RowedForm({
    super.key,
    required this.label,
    required this.hint,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        Flexible(child: BasicTextField(hint: hint, inputType: inputType))
      ],
    );
  }
}

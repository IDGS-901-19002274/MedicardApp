import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_buttons.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/theme/app_theme.dart';

class AddForm extends StatelessWidget {
  final List<Widget> fields;
  final FocusNode focus;
  final String title;
  final double maxHeight;

  const AddForm(
      {super.key,
      required this.focus,
      required this.title,
      required this.fields,
      this.maxHeight = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, bottom: 25),
      child: Center(
        child: RoundedBox(
          maxHeight: maxHeight,
          shadow: 40,
          shadowColor: AppTheme.ultraSoftDark,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const BackButton(),
                TitleText(text: title, fontSize: 40)
              ]),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _transform_form(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  List<Widget> _transform_form() {
    List<Widget> children = [];

    Row bottom = Row(
      children: [
        Expanded(child: TextButtonSuccess(text: 'Guardar', function: () {}))
      ],
    );

    children = children + fields;
    children.add(bottom);
    return children;
  }
}

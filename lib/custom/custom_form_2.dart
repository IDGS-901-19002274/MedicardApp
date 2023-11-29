import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/theme/app_theme.dart';

class AddForm extends StatelessWidget {
  final List<Widget> fields;
  final FocusNode focus;
  final String title;
  final double maxHeight;
  final VoidCallback function;

  const AddForm(
      {super.key,
      required this.focus,
      required this.title,
      required this.fields,
      this.maxHeight = double.infinity,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, bottom: 25),
      child: Center(
        child: RoundedBox(
          bgColor: AppTheme.transparentLight,
          maxHeight: maxHeight,
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
        Expanded(child: TextButtonSuccess(text: 'Guardar', function: function))
      ],
    );

    children = children + fields;
    children.add(bottom);
    return children;
  }
}

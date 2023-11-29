import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/theme/app_theme.dart';

class CustomFormSession extends StatelessWidget {
  final BuildContext context;
  final List<Widget> fields;
  final String mainbuttontext;
  final String bottomtext;
  final String title;
  final bool dark;
  final VoidCallback mbFunction;
  final String changer;

  const CustomFormSession({
    super.key,
    required this.fields,
    required this.mainbuttontext,
    required this.bottomtext,
    required this.title,
    this.dark = false,
    required this.mbFunction,
    required this.changer,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _create_Column_Children(),
    );
  }

  // ignore: non_constant_identifier_names
  List<Widget> _create_Column_Children() {
    List<Widget> children = [TitleText(text: title)];

    final TextButtonSuccess successButton = TextButtonSuccess(
      function: mbFunction,
      text: mainbuttontext,
    );

    final TextButtonSuccess logWithGoogleButton = TextButtonSuccess(
      function: () {},
      text: logWithGoogle,
      bgColor: AppTheme.tertiary,
      icon: Icons.login,
    );

    List botText = bottomtext.split('|');

    final Row bottomText = Row(
      children: [
        Text(botText[0]),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, changer);
            },
            child: Text(botText[1]))
      ],
    );

    children = children + fields;

    children.add(successButton);
    children.add(logWithGoogleButton);
    children.add(bottomText);

    return children;
  }
}

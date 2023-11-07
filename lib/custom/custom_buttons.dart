import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/theme/app_theme.dart';

class TextButtonSuccess extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final Color bgColor;
  final IconData? icon;

  const TextButtonSuccess({
    super.key,
    required this.text,
    required this.function,
    this.bgColor = AppTheme.fourth,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextButton(
            onPressed: function,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(bgColor),
              padding:
                  MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonIcon(icon: icon),
                      ButtonText(text: text),
                    ],
                  )
                : ButtonText(text: text),
          ),
        ),
      ],
    );
  }
}

class AddGroupMedButton extends StatelessWidget {
  final Color bgColor;
  const AddGroupMedButton({super.key, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  backgroundColor: MaterialStateProperty.all<Color>(bgColor)),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddFAButton extends StatelessWidget {
  const AddFAButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add),
          fabSize: ExpandableFabSize.regular,
          backgroundColor: AppTheme.primary),
      overlayStyle: ExpandableFabOverlayStyle(blur: 5),
      children: [
        FloatingActionButton.small(onPressed: () {}),
        FloatingActionButton.small(onPressed: () {}),
      ],
    );
  }
}

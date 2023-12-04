import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/interfaces/color_interface.dart';
import 'package:medicard_app/routes/screens.dart';
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
    this.bgColor = AppTheme.primary,
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
  final int idGrupo;
  final String nombre;
  final CardColors collorPallette;
  const AddGroupMedButton(
      {super.key,
      required this.idGrupo,
      required this.nombre,
      required this.collorPallette});

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
                  backgroundColor: MaterialStateProperty.all<Color>(
                      collorPallette.detailColor1)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DragToGroupScreen(
                            idGrupo: idGrupo,
                            nombreGrupo: nombre,
                            colorPallette: collorPallette)));
              },
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
        child: const Icon(Icons.edit),
        fabSize: ExpandableFabSize.regular,
        backgroundColor: AppTheme.primary,
      ),
      overlayStyle: ExpandableFabOverlayStyle(blur: 5),
      children: const [
        FABOption(
          icon: Icons.settings_rounded,
          route: '/Settings',
        ),
        FABOption(
          icon: Icons.medication_liquid_rounded,
          route: '/AddMed',
        ),
        FABOption(
          icon: Icons.medical_services_rounded,
          route: '/AddGroup',
        ),
      ],
    );
  }
}

class FABOption extends StatelessWidget {
  final IconData icon;
  final String route;
  const FABOption({super.key, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'fab_${icon.toString()}',
      onPressed: <Future>() {
        return Navigator.pushNamed(context, route);
      },
      backgroundColor: Colors.white,
      foregroundColor: AppTheme.primary,
      child: Icon(icon),
    );
  }
}

class SaveGroupButton extends StatelessWidget {
  final VoidCallback onTap;
  final CardColors collorPallette;

  const SaveGroupButton(
      {super.key, required this.onTap, required this.collorPallette});

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
                  backgroundColor: MaterialStateProperty.all<Color>(
                      collorPallette.detailColor1)),
              onPressed: onTap,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.savings_rounded,
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

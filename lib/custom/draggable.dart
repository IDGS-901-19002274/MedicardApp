import 'package:flutter/material.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/interfaces/color_interface.dart';

class DraggableBox extends StatelessWidget {
  final String name;
  final CardColors colorPallette;
  const DraggableBox(
      {super.key, required this.name, required this.colorPallette});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      padding: const EdgeInsets.all(15),
      bgColor: colorPallette.detailColor2,
      child: DragContainer(
        child: DragCardText(
          text: name,
          textColor: colorPallette.bgColor,
        ),
      ),
    );
  }
}

class DraggedElement extends StatelessWidget {
  final CardColors colorPallette;
  const DraggedElement({super.key, required this.colorPallette});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
        bgColor: colorPallette.detailColor2,
        child: Card(
          color: colorPallette.bgColor,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: DragContainer(child: null),
          ),
        ));
  }
}

class DragContainer extends StatelessWidget {
  final Widget? child;
  const DragContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 40),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final double maxHeight;
  final double minWidth;
  final EdgeInsets padding;
  final double shadow;
  final Color shadowColor;
  final double elevation;

  const RoundedBox(
      {super.key,
      required this.child,
      this.bgColor = Colors.white,
      this.maxHeight = double.infinity,
      this.minWidth = 0,
      this.padding = const EdgeInsets.all(30),
      this.shadow = 0.0,
      this.shadowColor = Colors.black,
      this.elevation = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadow != 0.0
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: shadow,
                  spreadRadius: 0.1,
                ),
              ],
            )
          : null,
      constraints: BoxConstraints(maxHeight: maxHeight, minWidth: minWidth),
      child: Card(
        elevation: elevation,
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

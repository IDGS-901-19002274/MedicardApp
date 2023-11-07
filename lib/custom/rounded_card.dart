import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final double maxHeight;
  final EdgeInsets padding;
  final double shadow;
  final Color shadowColor;

  const RoundedBox({
    super.key,
    required this.child,
    this.bgColor = Colors.white,
    this.maxHeight = double.infinity,
    this.padding = const EdgeInsets.all(30),
    this.shadow = 0.0,
    this.shadowColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadow != 0
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: shadow,
                  spreadRadius: 10,
                ),
              ],
            )
          : null,
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Card(
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
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData? icon;
  final double size;
  final Color color;

  const ButtonIcon(
      {super.key,
      required this.icon,
      this.size = 20,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}

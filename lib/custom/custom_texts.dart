import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  const TitleText({super.key, required this.text, this.fontSize = 45});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class ButtonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  const ButtonText(
      {super.key,
      required this.text,
      this.fontSize = 20,
      this.fontColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  const CardTitle({
    super.key,
    required this.text,
    this.fontSize = 25,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class HourText extends StatelessWidget {
  final DateTime time;
  final Color color;
  const HourText({
    super.key,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        '${time.hour}:${time.minute}',
        style: TextStyle(
          color: color,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MiddleCardTitle extends StatelessWidget {
  final String text;
  final Color color;
  const MiddleCardTitle({super.key, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MedicineText extends StatelessWidget {
  final String text;
  final Color color;
  const MedicineText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 15),
    );
  }
}

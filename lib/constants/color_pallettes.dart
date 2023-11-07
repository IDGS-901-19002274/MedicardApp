import 'package:flutter/material.dart';
import 'package:medicard_app/interfaces/color_interface.dart';

final Map<String, CardColors> colorPalletes = <String, CardColors>{
  'grayblue': CardColors(
    bgColor: const Color.fromARGB(255, 203, 218, 213),
    cardColor: const Color.fromARGB(255, 137, 167, 177),
    detailColor1: const Color.fromARGB(255, 86, 105, 129),
    detailColor2: const Color.fromARGB(255, 58, 65, 90),
    textColor: const Color.fromARGB(255, 52, 52, 78),
  ),
  'smashred': CardColors(
    bgColor: const Color.fromARGB(255, 255, 197, 193),
    cardColor: const Color.fromARGB(255, 249, 159, 169),
    detailColor1: const Color.fromARGB(255, 170, 101, 129),
    detailColor2: const Color.fromARGB(255, 80, 56, 80),
    textColor: const Color.fromARGB(255, 42, 30, 30),
  ),
};

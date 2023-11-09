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
  'bluesandroses': CardColors(
    bgColor: const Color.fromARGB(255, 255, 197, 193),
    cardColor: const Color.fromARGB(255, 249, 159, 169),
    detailColor1: const Color.fromARGB(255, 170, 101, 129),
    detailColor2: const Color.fromARGB(255, 80, 56, 80),
    textColor: const Color.fromARGB(255, 42, 30, 30),
  ),
  'mooooooooo': CardColors(
    bgColor: const Color.fromARGB(255, 147, 189, 154),
    cardColor: const Color.fromARGB(255, 124, 145, 127),
    detailColor1: const Color.fromARGB(255, 94, 75, 85),
    detailColor2: const Color.fromARGB(255, 61, 28, 51),
    textColor: const Color.fromARGB(255, 33, 5, 24),
  ),
  'blaze': CardColors(
    bgColor: const Color.fromARGB(255, 232, 216, 38),
    cardColor: const Color.fromARGB(255, 232, 167, 38),
    detailColor1: const Color.fromARGB(255, 232, 118, 36),
    detailColor2: const Color.fromARGB(255, 232, 70, 36),
    textColor: const Color.fromARGB(255, 51, 7, 8),
  ),
};

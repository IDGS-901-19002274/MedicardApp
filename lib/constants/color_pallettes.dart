import 'package:flutter/material.dart';
import 'package:medicard_app/interfaces/color_interface.dart';

final Map<String, CardColors> colorPalletes = <String, CardColors>{
  'default': CardColors(
    bgColor: const Color.fromARGB(255, 255, 255, 255),
    cardColor: const Color.fromARGB(255, 200, 200, 200),
    detailColor1: const Color.fromARGB(255, 150, 150, 150),
    detailColor2: const Color.fromARGB(255, 100, 100, 100),
    textColor: Colors.black,
  ),
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
  'nicetrykiddo': CardColors(
    bgColor: const Color.fromARGB(255, 171, 80, 94),
    cardColor: const Color.fromARGB(255, 217, 160, 113),
    detailColor1: const Color.fromARGB(255, 207, 200, 143),
    detailColor2: const Color.fromARGB(255, 165, 176, 144),
    textColor: Colors.black,
  ),
  'minnion': CardColors(
    bgColor: const Color.fromARGB(255, 107, 179, 142),
    cardColor: const Color.fromARGB(255, 164, 201, 114),
    detailColor1: const Color.fromARGB(255, 255, 180, 62),
    detailColor2: const Color.fromARGB(255, 223, 93, 46),
    textColor: Colors.black,
  ),
  'bar at night': CardColors(
    bgColor: const Color.fromARGB(255, 201, 173, 155),
    cardColor: const Color.fromARGB(255, 255, 189, 161),
    detailColor1: const Color.fromARGB(255, 224, 85, 118),
    detailColor2: const Color.fromARGB(255, 112, 57, 81),
    textColor: Colors.black,
  ),
  'chipin in': CardColors(
    bgColor: const Color.fromARGB(255, 235, 194, 136),
    cardColor: const Color.fromARGB(255, 72, 156, 121),
    detailColor1: const Color.fromARGB(255, 5, 103, 110),
    detailColor2: const Color.fromARGB(255, 77, 29, 77),
    textColor: Colors.black,
  ),
  'never fade away': CardColors(
    bgColor: const Color.fromARGB(255, 197, 247, 240),
    cardColor: const Color.fromARGB(255, 169, 194, 201),
    detailColor1: const Color.fromARGB(255, 142, 140, 163),
    detailColor2: const Color.fromARGB(255, 114, 87, 124),
    textColor: Colors.black,
  ),
  'stone ocean': CardColors(
    bgColor: const Color.fromARGB(255, 111, 149, 255),
    cardColor: const Color.fromARGB(255, 92, 101, 192),
    detailColor1: const Color.fromARGB(255, 65, 59, 107),
    detailColor2: const Color.fromARGB(255, 48, 28, 65),
    textColor: Colors.black,
  ),
  'dracula': CardColors(
    bgColor: const Color.fromARGB(255, 241, 242, 206),
    cardColor: const Color.fromARGB(255, 209, 180, 162),
    detailColor1: const Color.fromARGB(255, 169, 118, 122),
    detailColor2: const Color.fromARGB(255, 146, 57, 75),
    textColor: Colors.black,
  ),
  'sunset night': CardColors(
    bgColor: const Color.fromARGB(255, 246, 146, 29),
    cardColor: const Color.fromARGB(255, 177, 70, 35),
    detailColor1: const Color.fromARGB(255, 96, 39, 73),
    detailColor2: const Color.fromARGB(255, 62, 28, 51),
    textColor: Colors.black,
  ),
  'ice creancer': CardColors(
    bgColor: const Color.fromARGB(255, 255, 209, 179),
    cardColor: const Color.fromARGB(255, 255, 236, 209),
    detailColor1: const Color.fromARGB(255, 209, 179, 159),
    detailColor2: const Color.fromARGB(255, 133, 130, 126),
    textColor: Colors.black,
  ),
  'panda': CardColors(
    bgColor: const Color.fromARGB(255, 214, 213, 120),
    cardColor: const Color.fromARGB(255, 177, 191, 99),
    detailColor1: const Color.fromARGB(255, 157, 173, 66),
    detailColor2: const Color.fromARGB(255, 37, 138, 96),
    textColor: Colors.black,
  ),
  'batman': CardColors(
    bgColor: const Color.fromARGB(255, 240, 168, 24),
    cardColor: const Color.fromARGB(255, 24, 24, 72),
    detailColor1: const Color.fromARGB(255, 48, 72, 120),
    detailColor2: const Color.fromARGB(255, 120, 144, 168),
    textColor: Colors.white,
  ),
  'ugly as me': CardColors(
    bgColor: const Color.fromARGB(255, 237, 246, 238),
    cardColor: const Color.fromARGB(255, 209, 192, 137),
    detailColor1: const Color.fromARGB(255, 179, 32, 77),
    detailColor2: const Color.fromARGB(255, 65, 46, 40),
    textColor: Colors.black,
  ),
  'beautiful': CardColors(
    bgColor: const Color.fromARGB(255, 241, 222, 189),
    cardColor: const Color.fromARGB(255, 92, 110, 110),
    detailColor1: const Color.fromARGB(255, 51, 62, 80),
    detailColor2: const Color.fromARGB(255, 51, 27, 59),
    textColor: Colors.black,
  ),
  '2 more': CardColors(
    bgColor: const Color.fromARGB(255, 175, 22, 42),
    cardColor: const Color.fromARGB(255, 149, 0, 58),
    detailColor1: const Color.fromARGB(255, 131, 0, 36),
    detailColor2: const Color.fromARGB(255, 90, 14, 61),
    textColor: Colors.black,
  ),
};

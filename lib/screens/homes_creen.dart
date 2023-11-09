import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:medicard_app/constants/color_pallettes.dart';
import 'package:medicard_app/custom/custom_buttons.dart';
import 'package:medicard_app/custom/custom_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static List<String> arrays = [
    'grayblue',
    'bluesandroses',
    'mooooooooo',
    'blaze',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const AddFAButton(),
      body: ListView.builder(
        itemCount: arrays.length,
        itemBuilder: (context, item) {
          return GroupCard(
            colorPallette: colorPalletes[arrays[item]]!,
          );
        },
      ),
    );
  }
}

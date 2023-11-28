import 'package:flutter/material.dart';
import 'package:medicard_app/constants/color_pallettes.dart';
import 'package:medicard_app/custom/drag_and_drop.dart';

class DragToGroupScreen extends StatefulWidget {
  const DragToGroupScreen({super.key});

  @override
  State<DragToGroupScreen> createState() => _DragToGroupScreenState();
}

class _DragToGroupScreenState extends State<DragToGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar grupo'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: Icon(Icons.save)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DraggerContainer(
                groupName: 'Grupo 4',
                colorPallette: colorPalletes['mooooooooo']!,
                child: DraggerZone(
                  colorPallette: colorPalletes['mooooooooo']!,
                  tiles: const [
                    'Pedro',
                    'Juan',
                    'Amoxicilina-Ácido Clavulánico',
                    'Acetilsalicílico',
                    'ese',
                    'miaw'
                  ],
                ),
              ),
              const Divider(),
              DraggerContainer(
                  groupName: 'Tratamientos disponibles',
                  colorPallette: colorPalletes['default']!,
                  child: const DragsGrid(tiles: [
                    'Ele',
                    'Elemento',
                    'Tercero',
                    'De prueba',
                    '500mg'
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}

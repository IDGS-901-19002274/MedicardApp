import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medicard_app/constants/color_pallettes.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/custom/draggable.dart';
import 'package:medicard_app/dao/tratamiento_dao.dart';
import 'package:medicard_app/interfaces/color_interface.dart';
import 'package:medicard_app/interfaces/tratamiento_y_medicamento.dart';
import 'package:medicard_app/providers/provider_exports.dart';
import 'package:provider/provider.dart';

class DraggerElement extends StatelessWidget {
  final TratamientoYMedicamento elemento;
  final CardColors colorPallette;
  const DraggerElement(
      {super.key, required this.elemento, required this.colorPallette});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: elemento.nombreMedicamento.length > 25
          ? 4
          : elemento.nombreMedicamento.length > 13
              ? 3
              : elemento.nombreMedicamento.length > 4
                  ? 2
                  : 1,
      mainAxisCellCount: 1,
      child: Draggable(
        data: elemento,
        feedback: DraggedElement(
          colorPallette: colorPallette,
        ),
        child: DraggableBox(
          colorPallette: colorPallette,
          tym: elemento,
        ),
      ),
    );
  }
}

class DraggerContainer extends StatelessWidget {
  final String groupName;
  final CardColors colorPallette;
  final Widget child;
  const DraggerContainer(
      {super.key,
      required this.groupName,
      required this.colorPallette,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      bgColor: colorPallette.bgColor,
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: TitleText(
          fontColor: colorPallette.textColor,
          text: groupName,
          fontSize: 30,
        ),
        subtitle: child,
      ),
    );
  }
}

class DraggedCard extends StatelessWidget {
  final TratamientoYMedicamento tym;
  final CardColors colorPallette;
  final VoidCallback? ontap;
  const DraggedCard(
      {super.key, required this.tym, required this.colorPallette, this.ontap});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: tym.nombreMedicamento.length > 25
          ? 4
          : tym.nombreMedicamento.length > 13
              ? 3
              : tym.nombreMedicamento.length > 4
                  ? 2
                  : 1,
      mainAxisCellCount: 1,
      child: InkWell(
        onTap: ontap,
        child: DraggableBox(
          tym: tym,
          colorPallette: colorPallette,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DraggerZone extends StatefulWidget {
  final CardColors colorPallette;
  final List<TratamientoYMedicamento> tiles;
  final int idGrupo;

  const DraggerZone(
      {super.key,
      required this.colorPallette,
      required this.tiles,
      required this.idGrupo});

  @override
  State<DraggerZone> createState() => _DraggerZoneState();
}

class _DraggerZoneState extends State<DraggerZone> {
  List<DraggedCard> gridTiles = [];

  @override
  Widget build(BuildContext context) {
    gridTiles = _generate_grid_cards(widget.tiles);
    return DragTarget(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return Column(
          children: [
            RoundedBox(
              padding: const EdgeInsets.all(10),
              minWidth: double.infinity,
              bgColor: widget.colorPallette.cardColor,
              child: Container(
                constraints: const BoxConstraints(minHeight: 210),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  children: gridTiles,
                ),
              ),
            ),
            SaveGroupButton(
                onTap: () {
                  GrupoProvider gruprovider =
                      Provider.of<GrupoProvider>(context, listen: false);
                  TratamientoProvider tratProvider =
                      Provider.of<TratamientoProvider>(context, listen: false);
                  TratamientoDao dao = TratamientoDao();
                  gruprovider.clearData();
                  for (var element in gridTiles) {
                    dao.update(
                        grupoId: widget.idGrupo,
                        idTratamiento: element.tym.idTratamiento);
                  }
                  tratProvider.clearData();
                  tratProvider.setListaTratamientos();
                  gruprovider.setListaGrupos();
                  Navigator.pop(context);
                },
                collorPallette: widget.colorPallette)
          ],
        );
      },
      onAccept: (TratamientoYMedicamento data) {
        bool isInList = false;

        for (var element in gridTiles) {
          if (element.tym == data) {
            isInList = true;
          }
        }

        if (!isInList) {
          gridTiles.add(DraggedCard(
            colorPallette: widget.colorPallette,
            tym: data,
          ));
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  List<DraggedCard> _generate_grid_cards(List<TratamientoYMedicamento> tiles) {
    List<DraggedCard> cards = [];
    for (var tile in widget.tiles) {
      int index = tiles.indexOf(tile);
      cards.add(DraggedCard(
        tym: tiles[index],
        colorPallette: widget.colorPallette,
        ontap: () {},
      ));
    }
    return cards;
  }
}

class DragsGrid extends StatelessWidget {
  static CardColors colorPallette = colorPalletes['default']!;
  final List<TratamientoYMedicamento> tiles;
  const DragsGrid({super.key, required this.tiles});

  @override
  Widget build(BuildContext context) {
    List<DraggerElement> gridTiles = _generate_grid_cards();
    return RoundedBox(
      padding: const EdgeInsets.all(10),
      minWidth: double.infinity,
      bgColor: colorPallette.cardColor,
      child: Container(
        constraints: const BoxConstraints(minHeight: 210),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          children: gridTiles.isEmpty
              ? [
                  const Center(
                    child: Text('Nada para mostrar'),
                  )
                ]
              : gridTiles,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  List<DraggerElement> _generate_grid_cards() {
    List<DraggerElement> cards = [];
    for (var tile in tiles) {
      cards.add(DraggerElement(
        colorPallette: colorPallette,
        elemento: tile,
      ));
    }
    return cards;
  }
}

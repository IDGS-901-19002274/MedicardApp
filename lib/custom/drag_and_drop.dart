import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medicard_app/constants/color_pallettes.dart';
import 'package:medicard_app/custom/custom_widgets.dart';
import 'package:medicard_app/custom/draggable.dart';
import 'package:medicard_app/interfaces/color_interface.dart';

class DraggerElement extends StatelessWidget {
  final String name;
  final CardColors colorPallette;
  const DraggerElement(
      {super.key, required this.name, required this.colorPallette});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: name.length > 25
          ? 4
          : name.length > 13
              ? 3
              : name.length > 4
                  ? 2
                  : 1,
      mainAxisCellCount: 1,
      child: Draggable(
        data: name,
        feedback: DraggedElement(
          colorPallette: colorPallette,
        ),
        child: DraggableBox(
          colorPallette: colorPallette,
          name: name,
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
  final int index;
  final String name;
  final CardColors colorPallette;
  final VoidCallback ontap;
  const DraggedCard(
      {super.key,
      required this.name,
      required this.colorPallette,
      required this.index,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: name.length > 25
          ? 4
          : name.length > 13
              ? 3
              : name.length > 4
                  ? 2
                  : 1,
      mainAxisCellCount: 1,
      child: InkWell(
        onTap: ontap,
        child: DraggableBox(
          name: name,
          colorPallette: colorPallette,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DraggerZone extends StatefulWidget {
  final CardColors colorPallette;
  final List<String> tiles;

  const DraggerZone(
      {super.key, required this.colorPallette, required this.tiles});

  @override
  State<DraggerZone> createState() => _DraggerZoneState();
}

class _DraggerZoneState extends State<DraggerZone> {
  List<DraggedCard> gridTiles = [];

  @override
  Widget build(BuildContext context) {
    gridTiles = _generate_grid_cards();
    return DragTarget(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return RoundedBox(
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
        );
      },
      onAccept: (String data) {
        bool isInList = false;
        int index = gridTiles.length;

        for (var element in gridTiles) {
          if (element.name == data) {
            isInList = true;
          }
        }

        if (!isInList) {
          gridTiles.add(DraggedCard(
              name: data,
              colorPallette: widget.colorPallette,
              index: index,
              ontap: () {}));
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  List<DraggedCard> _generate_grid_cards() {
    List<DraggedCard> cards = [];
    for (var tile in widget.tiles) {
      int index = widget.tiles.indexOf(tile);
      cards.add(DraggedCard(
        name: tile,
        colorPallette: widget.colorPallette,
        index: index,
        ontap: () {},
      ));
    }
    return cards;
  }
}

class DragsGrid extends StatelessWidget {
  static CardColors colorPallette = colorPalletes['default']!;
  final List<String> tiles;
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
          children: gridTiles,
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
        name: tile,
      ));
    }
    return cards;
  }
}

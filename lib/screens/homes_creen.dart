import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:medicard_app/constants/color_pallettes.dart';
import 'package:medicard_app/dao/grupo_dao.dart';
import 'package:provider/provider.dart';

import '../custom/custom_widgets.dart';
import '../models/model_exports.dart';
import '../providers/provider_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<GroupModel> grupos = [];
  static List<MedicamentoModel> medicamentos = [];
  static List<TratamientoModel> tratamientos = [];
  final GrupoDao dao = GrupoDao();

  @override
  void initState() {
    Provider.of<MedicamentoProvider>(context, listen: false)
        .setListaMedicamentos();
    Provider.of<TratamientoProvider>(context, listen: false)
        .setListaTratamientos();
    Provider.of<GrupoProvider>(context, listen: false).setListaGrupos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gruprovider = Provider.of<GrupoProvider>(context);
    final medProvider = Provider.of<MedicamentoProvider>(context);
    final traProvider = Provider.of<TratamientoProvider>(context);
    grupos = gruprovider.listaGrupos.reversed.toList();
    medicamentos = medProvider.listaMedicamentos;
    tratamientos = traProvider.listaTratamientos;

    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const AddFAButton(),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: backgroundImage(image: 'background4'),
            ),
            CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/img/logo_banner.png'),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (medicamentos.isEmpty || tratamientos.isEmpty) {
                        return const Center(
                          child: Text('No hay elementos'),
                        );
                      } else {
                        GroupModel grupo = grupos[index];
                        return GroupCard(
                          grupo: grupo,
                          colorPallette: colorPalletes[grupo.tema]!,
                        );
                      }
                    },
                    childCount: grupos.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/build_description_point.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Trauma2 extends StatefulWidget {
  const Trauma2({super.key});

  @override
  State<Trauma2> createState() => _Trauma2State();
}

class _Trauma2State extends State<Trauma2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotification',
        enableBackButton: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Tentukan adanya salah satu cedera anatomis berikut',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const BuildDescriptionPoint(
              value:
                  'Luka tembus pada kepala, leher, badan dan ekstremitas proksimal sampai siku atau lutut.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'Deformitas dinding dada, seperti flail chest.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'Fraktur pada tulang panjang di dua tempat atau lebih.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value:
                  'Anggota tubuh yang hancur dan tidak teraba nadi ekstremitas.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value:
                  'Cedera amputasi pada proksimal sampai dengan pergelangan tangan atau kaki.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'Fraktur pelvis.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'Fraktur terbuka atau depressed pada tulang tengkorak.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'Kelumpuhan.',
            ),
            const Expanded(child: SizedBox()),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Ya',
                onTap: () {
                  context.pushNamed(AppRoute.traumaResult.name!, extra: true);
                },
              ),
              option2: ButtonOptionModel(
                title: 'Tidak',
                onTap: () => context.pushNamed(AppRoute.trauma3.name!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/data/model/non_trauma_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Nontrauma1 extends StatefulWidget {
  const Nontrauma1({super.key});

  @override
  State<Nontrauma1> createState() => _Nontrauma1State();
}

class _Nontrauma1State extends State<Nontrauma1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotification Non Trauma',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Apakah pasien mengkonsumsi anti koagulan? (Caumadine, Warfarin, Pradaxa, dll)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Ya',
                onTap: () => _openNextPage(context: context, koagulan: 1),
              ),
              option2: ButtonOptionModel(
                title: 'Tidak Tahu',
                onTap: () => _openNextPage(context: context, koagulan: 0),
              ),
              option3: ButtonOptionModel(
                title: 'Tidak',
                onTap: () => _openNextPage(context: context, koagulan: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openNextPage({
    required BuildContext context,
    required int koagulan,
  }) {
    final data = NonTraumaModel(koagulan: koagulan);
    context.pushNamed(AppRoute.nonTrauma2.name!, extra: data);
  }
}

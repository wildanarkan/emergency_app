import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/build_description_point.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Trauma4 extends StatefulWidget {
  const Trauma4({super.key});

  @override
  State<Trauma4> createState() => _Trauma4State();
}

class _Trauma4State extends State<Trauma4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotification',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Tentukan adanya salah satu pertimbangan khusus',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const BuildDescriptionPoint(
              value:
                  'Usia > 65 tahun dengan cedera kepala dengan impact yang signifikan.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value:
                  'Penggunaan anti koagulan / anti trombosit atau gangguan perdarahan dengan cedera kepala / badan yang signifikan.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'Korban hamil > 20 minggu.',
            ),
            const BuildDescriptionPoint(
              value:
                  'Keluhan lain berdasarkan pertimbangan petugas prehospital (Identifikasi keluhan lain yang belum masuk dalam nyeri dada hebat, nyeri kepala hebat pasien dibawah pengaruh obat)',
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
                onTap: () {
                  context.pushNamed(AppRoute.traumaResult.name!, extra: false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

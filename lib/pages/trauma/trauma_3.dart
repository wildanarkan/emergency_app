import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/build_description_point.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Trauma3 extends StatefulWidget {
  const Trauma3({super.key});

  @override
  State<Trauma3> createState() => _Trauma3State();
}

class _Trauma3State extends State<Trauma3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotifikasi Trauma',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Tentukan adanya salah satu mekanisme cidera berikut ini',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const BuildDescriptionPoint(
              value:
                  'Jatuh dari ketinggian 3 meter atau 2-3 kalo tinggi badan pada pasien anak.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value:
                  'Kecelakaan mobil resiko tinggi (kerusakan bagian dalam mobil).',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'Terlempar dari mobil.',
            ),
            const BuildDescriptionPoint(
              value: 'Terdapat penumpang yang meninggal dalam mobil yang sama.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value:
                  'Pengandara terlempar dari kendaraan (sepeda motor/sepeda) dengan dampak yang signifikan.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value:
                  'Pejalan kaki atau pengendara sepeda dengan kecepatan tertabrak kendaraan > 32 Km/Jam.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'Luka bakar dengan mekanisme trauma mendukung.',
            ),
            const Expanded(child: SizedBox()),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Ya',
                onTap: () => context.pushNamed(AppRoute.formInput.name!),
              ),
              option2: ButtonOptionModel(
                title: 'Tidak',
                onTap: () => context.pushNamed(AppRoute.trauma4.name!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

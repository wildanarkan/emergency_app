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
        title: 'Prenotification',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Tentukan adanya salah satu mekanisme cidera berikut ini',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    BuildDescriptionPoint(
                      value:
                          'Jatuh dari ketinggian 3 meter, pada pasien anak 2-3 x TB',
                    ),
                    SizedBox(height: 8),
                    BuildDescriptionPoint(
                      value: 'Kecelakaan mobil dengan potensi resiko tinggi :',
                    ),
                    BuildDescriptionPoint(
                      value:
                          'Kerusakan bagian dalam mobil, terlempar keluar dari mobil',
                      icon: Icons.check,
                    ),
                    BuildDescriptionPoint(
                      value: 'Terlempar dari kendaraan',
                      icon: Icons.check,
                    ),
                    BuildDescriptionPoint(
                      value:
                          'Terdapat penumpang yang meninggal dalam mobil yang sama',
                      icon: Icons.check,
                    ),
                    SizedBox(height: 8),
                    BuildDescriptionPoint(
                      value:
                          'Pengandara terlempar dari kendaraan (sepeda motor/sepeda) dengan dampak yang signifikan.',
                    ),
                    SizedBox(height: 8),
                    BuildDescriptionPoint(
                      value:
                          'Pejalan kaki atau pengendara sepeda tertabrak kendaraan dengan kecepatan 20 MPH (>32, 187 KM/ jam)',
                    ),
                    SizedBox(height: 8),
                    BuildDescriptionPoint(
                      value: 'Luka bakar dengan mekanisme trauma mendukung.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Ya',
                onTap: () {
                  context.pushNamed(AppRoute.traumaResult.name!, extra: true);
                },
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

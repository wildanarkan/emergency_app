import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TraumaNo extends StatefulWidget {
  const TraumaNo({super.key});

  @override
  State<TraumaNo> createState() => _TraumaNoState();
}

class _TraumaNoState extends State<TraumaNo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotifikasi Pasien Trauma',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bukan indikasi untuk prenotifikasi',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hubungi dispatcher PSC 119 untuk konfirmasi pasien ke fasilitas '
              'kesehatan terdekat',
              style: TextStyle(fontSize: 20),
            ),
            const Expanded(child: SizedBox()),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Buat Laporan',
                onTap: () => context.pushNamed(AppRoute.formInput.name!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

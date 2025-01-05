import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
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
        title: 'Prenotifikasi Trauma',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Lanjutkan dengan prenotifikasi ke IGD RSUD minimal tipe C',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Daftar Rumah Sakit Tujuan',
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

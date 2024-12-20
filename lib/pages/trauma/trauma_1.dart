import 'package:emergency_app/commons/app_color.dart';
import 'package:emergency_app/pages/trauma/trauma_2.dart';
import 'package:emergency_app/pages/trauma/trauma_no.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:emergency_app/widgets/build_header.dart';
import 'package:emergency_app/widgets/build_kriteria.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trauma1 extends StatelessWidget {
  const Trauma1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const BuildHeader(title: 'Penentuan prenotifikasi Pasien Trauma'),
          Column(
            children: [
              const BuildBox(
                  title:
                      'Pastikan apakah ada salah satu\n keadaan ini pada pasien'),
              const BuildKriteria(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BuildBox(
                    title: 'Ya',
                    onTap: () => Get.to(() => const Trauma2()),
                  ),
                  BuildBox(
                    title: 'Tidak',
                    onTap: () => Get.to(() => const TraumaNo()),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

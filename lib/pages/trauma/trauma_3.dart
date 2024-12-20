import 'package:emergency_app/commons/app_color.dart';
import 'package:emergency_app/pages/trauma/trauma_4.dart';
import 'package:emergency_app/pages/trauma/trauma_no.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:emergency_app/widgets/build_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trauma3 extends StatefulWidget {
  const Trauma3({super.key});

  @override
  State<Trauma3> createState() => _Trauma3State();
}

class _Trauma3State extends State<Trauma3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          const BuildHeader(title: 'Penentuan prenotifikasi Pasien Trauma'),
          const BuildBox(
              title: 'Apakah jalan nafas dan perdarahan dapat dikontrol?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildBox(
                title: 'Ya',
                onTap: () => Get.to(() => const Trauma4()),
              ),
              BuildBox(
                title: 'Tidak',
                onTap: () => Get.to(() => const TraumaNo()),
              ),
            ],
          )
        ],
      ),
    );
  }
}

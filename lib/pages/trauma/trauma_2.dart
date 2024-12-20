import 'package:emergency_app/commons/app_color.dart';
import 'package:emergency_app/pages/trauma/trauma_3.dart';
import 'package:emergency_app/pages/trauma/trauma_no.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:emergency_app/widgets/build_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trauma2 extends StatefulWidget {
  const Trauma2({super.key});

  @override
  State<Trauma2> createState() => _Trauma2State();
}

class _Trauma2State extends State<Trauma2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          const BuildHeader(title: 'Penentuan prenotifikasi Pasien Trauma'),
          const BuildBox(
              title:
                  'Dapatkan Pusat pelayanan Trauma Besar dicapai dalam 45 menit? '),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildBox(
                title: 'Ya',
                onTap: () => Get.to(() => const Trauma3()),
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

import 'package:emergency_app/commons/app_color.dart';
import 'package:emergency_app/pages/trauma/trauma_input.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:emergency_app/widgets/build_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trauma4 extends StatefulWidget {
  const Trauma4({super.key});

  @override
  State<Trauma4> createState() => _Trauma4State();
}

class _Trauma4State extends State<Trauma4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body:  Column(
        children: [
          const BuildHeader(title: 'Penentuan prenotifikasi Pasien Trauma'),
          const BuildBox(
              backgroundColor: Colors.red,
              title:
                  'Lanjutkan dengan prenotifikasi ke IGD RSUD minimal tipe C'),
        BuildBox(title: 'Daftar Rumah Sakit Tujuan', onTap: () => Get.to(()=> const TraumaInput()),)
        ],
      ),
    );
  }
}

import 'package:emergency_app/pages/form/form_input.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Result1 extends StatefulWidget {
  const Result1({super.key});

  @override
  State<Result1> createState() => _Result1State();
}

class _Result1State extends State<Result1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Column(
            children: [
              Text(
                'SKOR (hasil pemeriksaan)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Status : kritis',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const BuildBox(
            title: 'Skor >4',
            titleColor: Colors.red,
            center: true,
          ),
          const BuildBox(
            title:
                'Lanjutkan dengan prenotifikasi ke IGD RSUD minimal tipe C, dengan keterangan perlu Tindakan akut stroke',
            backgroundColor: Colors.red,
          ),
          BuildBox(
            title: 'Daftar rumah sakit Tujuan',
            center: true,
            onTap: () => Get.to(() => const FormInput()),
          ),
        ],
      ),
    );
  }
}

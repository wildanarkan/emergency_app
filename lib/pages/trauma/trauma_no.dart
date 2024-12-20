import 'package:emergency_app/commons/app_color.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:emergency_app/widgets/build_header.dart';
import 'package:flutter/material.dart';

class TraumaNo extends StatefulWidget {
  const TraumaNo({super.key});

  @override
  State<TraumaNo> createState() => _TraumaNoState();
}

class _TraumaNoState extends State<TraumaNo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: const Column(
        children: [
          BuildHeader(title: 'Penentuan prenotifikasi Pasien Trauma'),
          BuildBox(title: 'Bukan indikasi untuk prenotifikasi'),
          BuildBox(title: 'Hubungi dispatcher PSC 119 untuk konfirmasi pasien ke fasilitas kesehatan terdekat'),
        ],
      ),
    );
  }
}
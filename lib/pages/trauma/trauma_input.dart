import 'package:emergency_app/commons/app_color.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:emergency_app/widgets/build_header.dart';
import 'package:flutter/material.dart';

class TraumaInput extends StatefulWidget {
  const TraumaInput({super.key});

  @override
  State<TraumaInput> createState() => _TraumaInputState();
}

class _TraumaInputState extends State<TraumaInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: const [
          BuildHeader(title: 'Input data Prenotifikasi'),
          BuildBox(title: 'Isikan detail prenotifikasi pasien', backgroundColor: Colors.red,),
          BuildBox(title: 'Age (Usia)',center: true,),
          BuildBox(title: 'Time (Waktu Kejadian)',center: true,),
          BuildBox(title: 'Mechanism (Mekanisme Cedera)',center: true,),
          BuildBox(title: 'Injury (Cedera yang dialami)',center: true,),
          BuildBox(title: 'Treatment (Tindakan yang dilakukan)',center: true,),
          BuildBox(title: 'Estimasi waktu kedatangan',center: true,),
          BuildBox(title: 'Request (Permintaan atau pesan khusus)',center: true,),
          BuildBox(title: 'Submit',center: true,),
        ],
      ),
    );
  }
}
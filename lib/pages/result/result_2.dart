import 'package:emergency_app/widgets/build_box.dart';
import 'package:flutter/material.dart';

class Result2 extends StatefulWidget {
  const Result2({super.key});

  @override
  State<Result2> createState() => _Result2State();
}

class _Result2State extends State<Result2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Column(
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
          BuildBox(
            title: 'Skor >4',
            titleColor: Colors.red,
            center: true,
          ),
          BuildBox(title: 'Bukan indikasi untuk prenotifikasi'),
          BuildBox(title: 'Hubungi fasilitas pelayanan Kesehatan Tingkat pertama terdekat terdekat'),
        ],
      ),
    );
  }
}

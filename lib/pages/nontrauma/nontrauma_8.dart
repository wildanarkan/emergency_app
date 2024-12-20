import 'package:emergency_app/pages/result/result_1.dart';
import 'package:emergency_app/pages/result/result_2.dart';
import 'package:emergency_app/widgets/build_box_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nontrauma8 extends StatefulWidget {
  const Nontrauma8({super.key});

  @override
  State<Nontrauma8> createState() => _Nontrauma8State();
}

class _Nontrauma8State extends State<Nontrauma8> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertanyaan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Apakah pasien mengalami deviasi gaze utntuk mata yang sebelahnya?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const BuildBoxColumn(
                title: 'Normal',
                titleColor: Colors.red,
                subtitle:
                    'Tidak ada kelainan, mata bergerak ke kedua sisi',
              ),
              value: 'normal',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const BuildBoxColumn(
                title: 'Gaze preference',
                titleColor: Colors.red,
                subtitle:
                    'Pasien mengalami kesulitan jika melihat ke salah satu mata (kiri atau kanan)',
              ),
              value: 'gaze',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const BuildBoxColumn(
                title: 'Deviasi Forced',
                titleColor: Colors.red,
                subtitle:
                    'Pasien mengalami gangguan ke satu sisi dan tidak bergerak kesiisi lain (tidak dapat mengikuti jari)',
              ),
              value: 'deviasi',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.to(() => const Result1()),
              child: const Text('Skor >4'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => const Result2()),
              child: const Text('Skor <4'),
            ),
          ],
        ),
      ),
    );
  }
}

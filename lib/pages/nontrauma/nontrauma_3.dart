import 'package:emergency_app/pages/nontrauma/nontrauma_4.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nontrauma3 extends StatefulWidget {
  const Nontrauma3({super.key});

  @override
  State<Nontrauma3> createState() => _Nontrauma3State();
}

class _Nontrauma3State extends State<Nontrauma3> {
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
              'Berapa Lama gejala timbul?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const BuildBox(title: 'Silakan dilewati jika  tidak ada yang Bersama passien >24 jam'),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const Text('10 Jam'),
              value: '10_jam',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('<80 Tahun'),
              value: '80_lebih',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('10 Menit'),
              value: '10_menit',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.to(() => const Nontrauma4()),
              child: const Text('Ok'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => const Nontrauma4()),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}

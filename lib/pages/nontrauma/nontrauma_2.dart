import 'package:emergency_app/pages/nontrauma/nontrauma_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nontrauma2 extends StatefulWidget {
  const Nontrauma2({super.key});

  @override
  State<Nontrauma2> createState() => _Nontrauma2State();
}

class _Nontrauma2State extends State<Nontrauma2> {
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
              'Berapa Umur Pasien?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const Text('>80 Tahun'),
              value: '80_kurang',
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
              title: const Text('Umur Tidak diketahui'),
              value: 'tidak_tahu',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.to(() => const Nontrauma3()),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
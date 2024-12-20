import 'package:emergency_app/pages/nontrauma/nontrauma_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nontrauma1 extends StatefulWidget {
  const Nontrauma1({super.key});

  @override
  State<Nontrauma1> createState() => _Nontrauma1State();
}

class _Nontrauma1State extends State<Nontrauma1> {
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
              'Apakah pasien mengkonsumsi anti koagulan? (Caumadine, Warfarin, Pradaxa, dll)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const Text('Ya'),
              value: 'ya',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Tidak'),
              value: 'tidak',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Tidak Tahu'),
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
              onPressed: () => Get.to(() => const Nontrauma2()),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
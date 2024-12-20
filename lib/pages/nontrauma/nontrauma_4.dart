import 'package:emergency_app/pages/nontrauma/nontrauma_5.dart';
import 'package:emergency_app/widgets/build_box_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nontrauma4 extends StatefulWidget {
  const Nontrauma4({super.key});

  @override
  State<Nontrauma4> createState() => _Nontrauma4State();
}

class _Nontrauma4State extends State<Nontrauma4> {
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
              'Apakah pasien mengalami kelemahan wajah?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const BuildBoxColumn(
                title: 'Normal',
                subtitle:
                    'Kedua sisi wajah bergerak secara bersamaan atau tidak ada perubahan ',
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
                title: 'Abnormal',
                subtitle:
                    'Salah satu sisi wajah turun  atau jelas tampak  tidak simetris',
              ),
              value: 'abnormal',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.to(() => const Nontrauma5()),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:emergency_app/pages/nontrauma/nontrauma_8.dart';
import 'package:emergency_app/widgets/build_box_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nontrauma7 extends StatefulWidget {
  const Nontrauma7({super.key});

  @override
  State<Nontrauma7> createState() => _Nontrauma7State();
}

class _Nontrauma7State extends State<Nontrauma7> {
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
              'Katakan pada pasien “tunjukkan 2 jari ke saya”',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const BuildBoxColumn(
                title: 'Normal',
                titleColor: Colors.red,
                subtitle:
                    'Pasien menunjukkan 2 jari',
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
                titleColor: Colors.red,
                subtitle:
                    'Pasien kurang mengerti atau tidak menunjukkan 2 jarinya',
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
              onPressed: () => Get.to(() => const Nontrauma8()),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

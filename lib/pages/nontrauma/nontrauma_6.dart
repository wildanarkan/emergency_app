import 'package:emergency_app/pages/nontrauma/nontrauma_7.dart';
import 'package:emergency_app/widgets/build_box_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nontrauma6 extends StatefulWidget {
  const Nontrauma6({super.key});

  @override
  State<Nontrauma6> createState() => _Nontrauma6State();
}

class _Nontrauma6State extends State<Nontrauma6> {
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
              'Periksa kemampuan bicara pasien, tanyakan pada pasien 3 kata yang umum',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const BuildBoxColumn(
                title: 'Normal',
                titleColor: Colors.red,
                subtitle:
                    'Konten perkataan normal, dan 2-3 kata sesuai',
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
                    'Perkataan secara jelas tidak normal, kata yang sesuai, hanya 0-1 items yang tepat',
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
              onPressed: () => Get.to(() => const Nontrauma7()),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

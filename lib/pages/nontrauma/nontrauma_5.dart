import 'package:emergency_app/pages/nontrauma/nontrauma_6.dart';
import 'package:emergency_app/widgets/build_box_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nontrauma5 extends StatefulWidget {
  const Nontrauma5({super.key});

  @override
  State<Nontrauma5> createState() => _Nontrauma5State();
}

class _Nontrauma5State extends State<Nontrauma5> {
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
              'Apakah pasien mengalami kelemahan pada lengan?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            RadioListTile<String>(
              title: const BuildBoxColumn(
                title: 'Tidak ada kelemahan',
                titleColor: Colors.red,
                subtitle:
                    'Kedua stangan diangkat >10 detik atau lebih lambat, kemudian turun perlahan-lahan',
              ),
              value: 'tidak_ada',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const BuildBoxColumn(
                title: 'Kelemahan Ringan',
                titleColor: Colors.red,
                subtitle:
                    'Salah satu tangan yang diangkat turun < 10 detik, tapi ada kekuatan untuk melawan gravitasi',
              ),
              value: 'ringan',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const BuildBoxColumn(
                title: 'Sedang/berat',
                titleColor: Colors.red,
                subtitle:
                    'Satu atau kedua lengan yang diangkat jatuh dengan cepat, tidak ada Gerakan melawan gravitasi atau tidak ada gerakan',
              ),
              value: 'berat',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.to(() => const Nontrauma6()),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

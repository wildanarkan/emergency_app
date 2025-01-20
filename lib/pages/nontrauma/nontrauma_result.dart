import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/data/model/non_trauma_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NontraumaResult extends StatefulWidget {
  const NontraumaResult({super.key, required this.data});

  final NonTraumaModel data;

  @override
  State<NontraumaResult> createState() => _NontraumaResultState();
}

class _NontraumaResultState extends State<NontraumaResult> {
  @override
  Widget build(BuildContext context) {
    final point = widget.data.poin ?? 0;

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Hasil Pemeriksaan',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            if (point <= 4) ...[
              const Text(
                'Bukan indikasi untuk prenotification',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hubungi dispatcher PSC 119 untuk konfirmasi pasien ke fasilitas '
                'kesehatan terdekat',
                style: TextStyle(fontSize: 20),
              ),
              const Expanded(child: SizedBox()),
              buildButtonOption(
                option1: ButtonOptionModel(
                  title: 'Kembali ke Home',
                  onTap: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName(AppRoute.home.name!));
                  },
                ),
              )
            ],
            if (point > 4) ...[
              const Text(
                'Pasien dalam keadaan kritis',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Segera lanjutkan proses dengan mengisi form prenotification',
                style: TextStyle(fontSize: 20),
              ),
              const Expanded(child: SizedBox()),
              buildButtonOption(
                option1: ButtonOptionModel(
                  title: 'Isi format data prenotification',
                  onTap: () => context.pushNamed(AppRoute.formInput.name!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

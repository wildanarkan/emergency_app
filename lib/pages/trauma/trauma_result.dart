import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';

class TraumaResult extends StatefulWidget {
  const TraumaResult({super.key, required this.isPrenotif});

  final bool isPrenotif;

  @override
  State<TraumaResult> createState() => TraumaResultState();
}

class TraumaResultState extends State<TraumaResult> {
  @override
  Widget build(BuildContext context) {
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
            if (widget.isPrenotif == false) ...[
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
            if (widget.isPrenotif == true) ...[
              const Text(
                'Memenuhi kriteria Prenotification, pilih rumah sakit dengan pelayanan pasien.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Daftar Rumah Sakit :',
                style: TextStyle(fontSize: 20),
              ),
              const BuildBox(
                  title:
                      'Hospital list\n\n\n\n\n\nAfter choose hospital, hospital data (it can be only id or whole data) sended to form_input page'),
              const Expanded(child: SizedBox()),

              /// move to hospital item click
              // buildButtonOption(
              //   option1: ButtonOptionModel(
              //     title: 'Isi format data prenotification',
              //     onTap: () => context.pushNamed(AppRoute.formInput.name!),
              //   ),
              // ),
            ],
          ],
        ),
      ),
    );
  }
}

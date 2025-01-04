import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Buat Laporan',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BuildBox(
                      title: 'Age (Usia)',
                      center: true,
                    ),
                    BuildBox(
                      title: 'Time (Waktu Kejadian)',
                      center: true,
                    ),
                    BuildBox(
                      title: 'Mechanism (Mekanisme Cedera)',
                      center: true,
                    ),
                    BuildBox(
                      title: 'Injury (Cedera yang dialami)',
                      center: true,
                    ),
                    BuildBox(
                      title: 'Treatment (Tindakan yang dilakukan)',
                      center: true,
                    ),
                    BuildBox(
                      title: 'Estimasi waktu kedatangan',
                      center: true,
                    ),
                    BuildBox(
                      title: 'Request (Permintaan atau pesan khusus)',
                      center: true,
                    ),
                    BuildBox(
                      title: 'Submit',
                      center: true,
                    ),
                  ],
                ),
              ),
            ),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Kirim Laporan',
                onTap: () => showSnackBar(context, 'Send Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

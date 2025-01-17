import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/build_description_point.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Trauma1 extends StatelessWidget {
  const Trauma1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotifikasi Trauma',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Pastikan apakah ada salah satu keadaan ini pada pasien',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const BuildDescriptionPoint(
              value: 'Frekuensi nafas < 10 atau lebih dari 29.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'Tekanan darah sistolik < 90 mmhg.',
            ),
            const SizedBox(height: 8),
            const BuildDescriptionPoint(
              value: 'GCS < 13.',
            ),
            const Expanded(child: SizedBox()),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Ya',
                onTap: () => context.pushNamed(AppRoute.formInput.name!),
              ),
              option2: ButtonOptionModel(
                title: 'Tidak',
                onTap: () => context.pushNamed(AppRoute.trauma2.name!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

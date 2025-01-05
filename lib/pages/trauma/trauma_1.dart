import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/build_kriteria.dart';
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
          children: [
            const Expanded(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Pastikan apakah ada salah satu keadaan ini pada pasien',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  BuildKriteria(),
                ],
              ),
            ),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Ya',
                onTap: () => context.pushNamed(AppRoute.trauma2.name!),
              ),
              option2: ButtonOptionModel(
                title: 'Tidak',
                onTap: () => context.pushNamed(AppRoute.traumaNo.name!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

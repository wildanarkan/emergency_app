import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Trauma2 extends StatefulWidget {
  const Trauma2({super.key});

  @override
  State<Trauma2> createState() => _Trauma2State();
}

class _Trauma2State extends State<Trauma2> {
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
            const SizedBox(height: 20),
            const Text(
              'Dapatkan Pusat pelayanan Trauma Besar dicapai dalam 45 menit?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Expanded(child: SizedBox()),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Ya',
                onTap: () => context.pushNamed(AppRoute.trauma3.name!),
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

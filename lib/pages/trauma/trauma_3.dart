import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Trauma3 extends StatefulWidget {
  const Trauma3({super.key});

  @override
  State<Trauma3> createState() => _Trauma3State();
}

class _Trauma3State extends State<Trauma3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotifikasi Pasien Trauma',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Apakah jalan nafas dan perdarahan dapat dikontrol?',
              style: TextStyle(fontSize: 20),
            ),
            const Expanded(child: SizedBox()),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Ya',
                onTap: () => context.pushNamed(AppRoute.trauma4.name!),
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

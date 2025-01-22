import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/data/model/non_trauma_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Nontrauma8 extends StatefulWidget {
  final NonTraumaModel data;

  const Nontrauma8({super.key, required this.data});

  @override
  State<Nontrauma8> createState() => _Nontrauma8State();
}

class _Nontrauma8State extends State<Nontrauma8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotification Non Trauma',
        enableBackButton: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Apakah pasien mengalami deviasi gaze utntuk mata yang sebelahnya?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Normal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tidak ada kelainan, mata bergerak ke kedua sisi',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Gaze preference',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pasien mengalami kesulitan jika melihat ke salah satu mata (kiri atau kanan)',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Deviasi Forced',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pasien mengalami gangguan ke satu sisi dan tidak bergerak kesiisi lain (tidak dapat mengikuti jari)',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Normal',
                onTap: () => _openNextPage(context: context, point: 0),
              ),
              option2: ButtonOptionModel(
                title: 'Gaze',
                onTap: () => _openNextPage(context: context, point: 1),
              ),
              option3: ButtonOptionModel(
                title: 'Deviasi',
                onTap: () => _openNextPage(context: context, point: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openNextPage({
    required BuildContext context,
    required int point,
  }) {
    final lastPoint = widget.data.poin ?? 0;
    final updatePoint = lastPoint + point;
    final data = widget.data.copyWith(poin: updatePoint);
    context.pushNamed(AppRoute.nonTrauma9.name!, extra: data);
  }
}

import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/data/model/non_trauma_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Nontrauma9 extends StatefulWidget {
  final NonTraumaModel data;

  const Nontrauma9({super.key, required this.data});

  @override
  State<Nontrauma9> createState() => _Nontrauma9State();
}

class _Nontrauma9State extends State<Nontrauma9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotification Non Trauma',
        enableBackButton: true,
      ),
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
                    'Tanyakan pada pasien "Apakah merasa lemah pada bagian tubuh tertentu"',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Normal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pasien Mengatakan ya dan menunjukkan bagian tubuh yang lemah',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Abnormal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pasien tidak dapat menunjukkan bagian tubuh yang mengalami kelemahan',
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
                title: 'Abnormal',
                onTap: () => _openNextPage(context: context, point: 1),
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
    context.pushNamed(AppRoute.nonTrauma10.name!, extra: data);
  }
}

import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/data/model/non_trauma_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Nontrauma10 extends StatefulWidget {
  final NonTraumaModel data;

  const Nontrauma10({super.key, required this.data});

  @override
  State<Nontrauma10> createState() => _Nontrauma10State();
}

class _Nontrauma10State extends State<Nontrauma10> {
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
                    'Pegang tangan / bagian tubuh pasien yang mengalami kelemahan dan tanyakan'
                    '"Tangan siapa ini?"',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Normal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pasien mengatakan "Tangan saya',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Abnormal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pasien tidak dapat menjawab pertanyaan dengan tepat',
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
    context.pushNamed(AppRoute.nonTraumaResult.name!, extra: data);
  }
}

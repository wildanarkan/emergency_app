import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/data/model/non_trauma_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Nontrauma5 extends StatefulWidget {
  final NonTraumaModel data;

  const Nontrauma5({super.key, required this.data});

  @override
  State<Nontrauma5> createState() => _Nontrauma5State();
}

class _Nontrauma5State extends State<Nontrauma5> {
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
                    'Apakah pasien mengalami kelemahan pada lengan?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Tidak ada kelemahan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Kedua stangan diangkat >10 detik atau lebih lambat, kemudian turun perlahan-lahan',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Kelemahan Ringan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Salah satu tangan yang diangkat turun < 10 detik, tapi ada kekuatan untuk melawan gravitasi',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Kelemahan Berat',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Satu atau kedua lengan yang diangkat jatuh dengan cepat, tidak ada Gerakan melawan gravitasi atau tidak ada gerakan',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Tidak',
                onTap: () => _openNextPage(context: context, point: 0),
              ),
              option2: ButtonOptionModel(
                title: 'Ringan',
                onTap: () => _openNextPage(context: context, point: 1),
              ),
              option3: ButtonOptionModel(
                title: 'Berat',
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
    context.pushNamed(AppRoute.nonTrauma6.name!, extra: data);
  }
}

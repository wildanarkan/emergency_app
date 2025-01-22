import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/data/model/non_trauma_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Nontrauma3 extends StatefulWidget {
  final NonTraumaModel data;

  const Nontrauma3({super.key, required this.data});

  @override
  State<Nontrauma3> createState() => _Nontrauma3State();
}

class _Nontrauma3State extends State<Nontrauma3> {
  @override
  Widget build(BuildContext context) {
    final durationController = TextEditingController();
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Berapa Lama gejala timbul?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Silakan dilewati jika  tidak ada yang Bersama passien >24 jam',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: durationController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ],
              ),
            ),
            buildButtonOption(
              option1: ButtonOptionModel(
                title: 'Lewati',
                onTap: () => _openNextPage(
                  context: context,
                  sickDuration: 0,
                ),
              ),
              option2: ButtonOptionModel(
                title: 'Simpan',
                onTap: () {
                  if (durationController.text.isEmpty) {
                    showSnackBar(context, 'Kolom tidak boleh kosong');
                    return;
                  }

                  _openNextPage(
                    context: context,
                    sickDuration: int.parse(durationController.text),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openNextPage({
    required BuildContext context,
    required int sickDuration,
  }) {
    final data = widget.data.copyWith(lamaGejala: sickDuration);
    context.pushNamed(AppRoute.nonTrauma4.name!, extra: data);
  }
}

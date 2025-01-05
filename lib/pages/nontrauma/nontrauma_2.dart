import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/data/model/non_trauma_model.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Nontrauma2 extends StatefulWidget {
  final NonTraumaModel data;

  const Nontrauma2({super.key, required this.data});

  @override
  State<Nontrauma2> createState() => _Nontrauma2State();
}

class _Nontrauma2State extends State<Nontrauma2> {
  @override
  Widget build(BuildContext context) {
    final ageController = TextEditingController();
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Prenotifikasi Non Trauma',
        enableBackButton: true,
      ),
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
                    'Berapa Umur Pasien?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: ageController,
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
                title: 'Tidak Tahu',
                onTap: () => _openNextPage(
                  context: context,
                  age: 0,
                ),
              ),
              option2: ButtonOptionModel(
                  title: 'Simpan',
                  onTap: () {
                    if (ageController.text.isEmpty) {
                      showSnackBar(context, 'Kolom tidak boleh kosong');
                      return;
                    }

                    _openNextPage(
                      context: context,
                      age: int.parse(ageController.text),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _openNextPage({
    required BuildContext context,
    required int age,
  }) {
    final data = widget.data.copyWith(umur: age);
    context.pushNamed(AppRoute.nonTrauma3.name!, extra: data);
  }
}

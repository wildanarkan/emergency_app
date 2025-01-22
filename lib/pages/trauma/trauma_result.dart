import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/pages/form/form_provider.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class TraumaResult extends StatefulWidget {
  const TraumaResult({super.key, required this.isPrenotif});

  final bool isPrenotif;

  @override
  State<TraumaResult> createState() => TraumaResultState();
}

class TraumaResultState extends State<TraumaResult> {
  List<Map<String, dynamic>> hospitals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.isPrenotif) {
      _getHospital();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Hasil Pemeriksaan',
        enableBackButton: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            if (widget.isPrenotif == false) ...[
              const Text(
                'Bukan indikasi untuk prenotification',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hubungi dispatcher PSC 119 untuk konfirmasi pasien ke fasilitas '
                'kesehatan terdekat',
                style: TextStyle(fontSize: 20),
              ),
              const Expanded(child: SizedBox()),
              buildButtonOption(
                option1: ButtonOptionModel(
                  title: 'Kembali ke Home',
                  onTap: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName(AppRoute.home.name!));
                  },
                ),
              )
            ],
            if (widget.isPrenotif == true) ...[
              const Text(
                'Memenuhi kriteria Prenotification,\npilih rumah sakit dengan pelayanan pasien.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Daftar Rumah Sakit :',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: LiquidPullToRefresh(
                  color: Colors.white,
                  backgroundColor: Colors.white,
                  height: 20,
                  onRefresh: () => _getHospital(),
                  child: _hospitalList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _hospitalList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: hospitals.length,
      itemBuilder: (context, index) {
        final hospital = hospitals[index];
        return InkWell(
          onTap: () => context.pushNamed(AppRoute.formInput.name!,
              extra: hospital['id']),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: index != hospitals.length - 1
                  ? Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    )
                  : null,
            ),
            child: Text(
              hospital['name'],
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }

  Future<void> _getHospital() async {
    try {
      final data =
          await Provider.of<FormProvider>(context, listen: false).getHospital();
      final hospitalsList = data
          .map((hospital) => {
                'id': hospital['id'] as int,
                'name': hospital['name'] as String,
              })
          .toList();
      if (!mounted) return;

      setState(() {
        isLoading = false;
        hospitals = hospitalsList;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        'Failed to load hospitals. Please try again later.',
      );
    }
  }
}

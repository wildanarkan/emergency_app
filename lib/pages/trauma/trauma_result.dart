import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/pages/form/form_provider.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: isLoading && widget.isPrenotif
            ? const Center(child: CircularProgressIndicator())
            : Column(
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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: hospitals.isEmpty 
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Tidak ada rumah sakit tersedia',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: hospitals.length,
                            itemBuilder: (context, index) {
                              final hospital = hospitals[index];
                              return InkWell(
                                onTap:() => context.pushNamed(AppRoute.formInput.name!, extra: hospital['id']),
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
                          ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  _getHospital() async {
    try {
      final data = await Provider.of<FormProvider>(context, listen: false).getHospital();
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load hospitals. Please try again later.'),
        ),
      );
    }
  }
}
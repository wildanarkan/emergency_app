import 'dart:developer';
import 'dart:io';

import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/pages/form/form_provider.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/build_date.dart';
import 'package:emergency_app/widgets/build_dropdown.dart';
import 'package:emergency_app/widgets/build_field.dart';
import 'package:emergency_app/widgets/build_photo_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  List<String> hospitals = ['-'];
  String? selectedHospital = '-';
  bool isLoading = true;
  File? _imageFile;

  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _mechanismController = TextEditingController();
  final TextEditingController _injuryController = TextEditingController();
  final TextEditingController _treatmentController = TextEditingController();

  // Variables for dates and dropdowns
  DateTime? _arrivalDate;
  DateTime? _incidentDate;
  String _status = 'Menuju RS';
  String _case = 'Trauma';

  @override
  void initState() {
    super.initState();
    _getHospital();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _descController.dispose();
    _mechanismController.dispose();
    _injuryController.dispose();
    _treatmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Buat Laporan',
        enableBackButton: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          BuildField(
                            title: 'Name',
                            hintText: 'Ahmad Faisal',
                            controller: _nameController,
                          ),
                          BuildField(
                            title: 'Age',
                            hintText: '19',
                            keyboardType: TextInputType.number,
                            controller: _ageController,
                          ),
                          BuildField(
                            title: 'Desc',
                            hintText: 'Permintaan atau pesan khusus',
                            maxLines: 4,
                            controller: _descController,
                          ),
                          BuildDate(
                            title: 'Arrival',
                            hintText: 'Waktu Kedatangan',
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 40)),
                            initialDate:
                                DateTime.now().add(const Duration(days: 20)),
                            onChanged: (date) {
                              setState(() {
                                _arrivalDate = date;
                              });
                            },
                          ),
                          BuildDropdown(
                            title: 'Status',
                            hintText: 'Choose something',
                            items: const [
                              'Selesai',
                              'Menuju RS',
                            ],
                            selectedItem: _status,
                            onChanged: (selectedValue) {
                              setState(() {
                                _status = selectedValue ?? 'Menuju RS';
                              });
                            },
                            isRequired: true,
                          ),
                          BuildField(
                            title: 'Mechanism',
                            hintText: 'Mekanis Cedera',
                            controller: _mechanismController,
                          ),
                          BuildField(
                            title: 'Injury',
                            hintText: 'Cedera yang dialami',
                            controller: _injuryController,
                          ),
                          BuildField(
                            title: 'Treatment',
                            hintText: 'Tindakan yang di lakukan',
                            controller: _treatmentController,
                          ),
                          BuildDropdown(
                            title: 'Case',
                            hintText: 'Choose something',
                            items: const [
                              'Trauma',
                              'Non Trauma',
                            ],
                            selectedItem: _case,
                            onChanged: (selectedValue) {
                              setState(() {
                                _case = selectedValue ?? 'Trauma';
                              });
                            },
                            isRequired: true,
                          ),
                          BuildDate(
                            title: 'Time Incident',
                            hintText: 'Enter Date',
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 40)),
                            initialDate:
                                DateTime.now().add(const Duration(days: 20)),
                            onChanged: (date) {
                              setState(() {
                                _incidentDate = date;
                              });
                            },
                          ),
                          BuildDropdown(
                            title: 'Hospital',
                            hintText: 'Choose something',
                            items: hospitals,
                            selectedItem: selectedHospital,
                            onChanged: (selectedValue) {
                              setState(() {
                                selectedHospital = selectedValue;
                              });
                            },
                            isRequired: true,
                          ),
                          BuildPhotoField(
                            imageFile: _imageFile,
                            isRequired:
                                true, // Tambahkan indikator required jika dibutuhkan
                            onImageSelected: (File? image) {
                              setState(() {
                                _imageFile = image;
                              });
                            },
                          ),
                        ]
                            .expand((widget) =>
                                [widget, const SizedBox(height: 16)])
                            .toList()
                          ..removeLast(),
                      ),
                    ),
                  ),
                  buildButtonOption(
                    option1: ButtonOptionModel(
                      title: 'Kirim Laporan',
                      onTap: () {
                        // Add your submit report logic here
                        final formData = {
                          'name': _nameController.text,
                          'age': _ageController.text,
                          'description': _descController.text,
                          'arrival_date': _arrivalDate?.toIso8601String(),
                          'status': _status,
                          'mechanism': _mechanismController.text,
                          'injury': _injuryController.text,
                          'treatment': _treatmentController.text,
                          'case': _case,
                          'incident_date': _incidentDate?.toIso8601String(),
                          'hospital':
                              selectedHospital == '-' ? null : selectedHospital,
                          'photo_path': _imageFile?.path.split('/').last,
                        };
                        log('Form Data: $formData');
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  _getHospital() async {
    try {
      final hospitalsList =
          await Provider.of<FormProvider>(context, listen: false).getHospital();

      if (!mounted) return;

      setState(() {
        isLoading = false;
        if (hospitalsList.isNotEmpty) {
          hospitals = ['-', ...hospitalsList];
          selectedHospital = '-';
        } else {
          hospitals = ['-'];
          selectedHospital = '-';
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        hospitals = ['-'];
        selectedHospital = '-';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load hospitals. Please try again later.'),
        ),
      );
    }
  }
}

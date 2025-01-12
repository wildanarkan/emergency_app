import 'dart:io';

import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/pages/form/form_provider.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/build_date.dart';
import 'package:emergency_app/widgets/build_dropdown.dart';
import 'package:emergency_app/widgets/build_field.dart';
import 'package:emergency_app/widgets/build_photo_field.dart';
import 'package:emergency_app/widgets/build_symptom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> hospitals = [
    {'id': 0, 'name': '-'}
  ];
  int selectedHospitalId = 0;

  bool isLoading = true;
  File? _imageFile;
  DateTime? _arrivalDate;
  DateTime? _incidentDate;
  String _gender = 'Pria';
  String _mechanism = 'Jatuh dari ketinggian';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _requestController = TextEditingController();
  final TextEditingController _symptomController = TextEditingController();
  final TextEditingController _mechanismController = TextEditingController();
  final TextEditingController _injuryController = TextEditingController();
  final TextEditingController _treatmentController = TextEditingController();

  bool _showDateErrors = false;
  bool _showPhotoErrors = false;
  bool _showSymptomErrors = false;

  @override
  void initState() {
    super.initState();
    _getHospital();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _requestController.dispose();
    _mechanismController.dispose();
    _injuryController.dispose();
    _treatmentController.dispose();
    super.dispose();
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName harus diisi';
    }
    return null;
  }

  String? _validateNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName harus diisi';
    }
    if (int.tryParse(value) == null) {
      return '$fieldName harus angka';
    }
    return null;
  }

  void _submitForm(BuildContext context) async {
    final formProvider = Provider.of<FormProvider>(context, listen: false);

    setState(() {
      _showDateErrors = _incidentDate == null || _arrivalDate == null;
      _showPhotoErrors = _imageFile == null;
      _showSymptomErrors = _symptomController.text.isEmpty;
    });

    if (_formKey.currentState!.validate() &&
        _incidentDate != null &&
        _arrivalDate != null &&
        _imageFile != null &&
        _symptomController.text.isNotEmpty) {
      isLoading = true;
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString(Constant.tokenKey);
      final caseType = sharedPreferences.getInt(Constant.caseType);

      final success = await formProvider.addPatient(
        token: token!,
        name: _nameController.text,
        age: int.parse(_ageController.text),
        gender: _gender == 'Pria' ? 1 : 2,
        timeIncident: _incidentDate?.toIso8601String() ?? '',
        mechanism: _mechanism,
        injury: _injuryController.text,
        photoInjury: _imageFile,
        symptom: _symptomController.text,
        arrival: _arrivalDate?.toIso8601String() ?? '',
        status: selectedHospitalId == 0 ? 2 : 1,
        treatment: _treatmentController.text,
        hospitalId: selectedHospitalId == 0 ? null : selectedHospitalId,
        request: _requestController.text,
        caseType: caseType ?? 0,
      );

      setState(() {
        isLoading = false;
      });

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Patient added successfully')),
        );

        // Reset semua field dan controller
        _formKey.currentState?.reset();
        _nameController.clear();
        _ageController.clear();
        _injuryController.clear();
        _symptomController.clear();
        _treatmentController.clear();
        _requestController.clear();

        setState(() {
          _incidentDate = null;
          _arrivalDate = null;
          _imageFile = null;
          selectedHospitalId = 0;
          _gender = 'Pria'; // Jika ingin reset ke default
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add patient')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields correctly'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            BuildField(
                              title: 'Name',
                              hintText: 'Nama pasien',
                              controller: _nameController,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: BuildField(
                                    title: 'Age',
                                    hintText: 'Umur pasien',
                                    keyboardType: TextInputType.number,
                                    controller: _ageController,
                                    isRequired: true,
                                    validator: (value) =>
                                        _validateNumber(value, 'Usia'),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: BuildDropdown(
                                    title: 'Gender',
                                    items: const ['Pria', 'Wanita'],
                                    selectedItem: _gender,
                                    isRequired: true,
                                    onChanged: (selectedValue) {
                                      setState(() {
                                        _gender = selectedValue ?? 'Pria';
                                      });
                                    },
                                  ),
                                ),
                              ],
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
                                  _showDateErrors = false;
                                });
                              },
                              isRequired: true,
                              showError:
                                  _showDateErrors && _incidentDate == null,
                              errorText: 'Waktu kejadian harus diisi',
                            ),
                            BuildDropdown(
                              title: 'Mechanism',
                              items: const [
                                'Jatuh dari ketinggian',
                                'Kecelakaan mobil dengan potensi resiko cedera',
                                'Kecelakaan pejalan kaki/pesepeda dengan kendaraan',
                                'Pengendara sepeda/motor/sepeda terlempar dari kendaraan',
                                'Luka bakar dengan mekanisme trauma mendukung',
                              ],
                              selectedItem: _mechanism,
                              isRequired: true,
                              onChanged: (selectedValue) {
                                setState(() {
                                  _mechanism =
                                      selectedValue ?? 'Jatuh dari ketinggian';
                                });
                              },
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: BuildField(
                                    title: 'Injury',
                                    hintText: 'Cedera yang dialami',
                                    controller: _injuryController,
                                    isRequired: true,
                                    validator: (value) =>
                                        _validateRequired(value, 'Cedera'),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: BuildPhotoField(
                                    imageFile: _imageFile,
                                    onImageSelected: (File? image) {
                                      setState(() {
                                        _imageFile = image;
                                        _showPhotoErrors = false;
                                      });
                                    },
                                    isRequired: true,
                                    showError:
                                        _showPhotoErrors && _imageFile == null,
                                    errorText: 'Photo harus diisi',
                                  ),
                                ),
                              ],
                            ),
                            BuildSymptomSheet(
                              title: 'Symptom',
                              hintText: 'Isi data symptom',
                              isRequired: true,
                              controller: _symptomController,
                              showError: _showSymptomErrors,
                              errorText: 'Symptom data harus diisi',
                            ),
                            BuildField(
                              title: 'Treatment',
                              hintText: 'Tindakan yang di lakukan',
                              controller: _treatmentController,
                              isRequired: true,
                              validator: (value) =>
                                  _validateRequired(value, 'Tindakan'),
                            ),
                            BuildDate(
                              title: 'Estimate Time of Arrival',
                              hintText: 'Enter Date',
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 40)),
                              initialDate:
                                  DateTime.now().add(const Duration(days: 20)),
                              onChanged: (date) {
                                setState(() {
                                  _arrivalDate = date;
                                  _showDateErrors = false;
                                });
                              },
                              isRequired: true,
                              showError:
                                  _showDateErrors && _arrivalDate == null,
                              errorText: 'Waktu kedatangan harus diisi',
                            ),
                            BuildDropdown(
                              title: 'Hospital',
                              items: hospitals
                                  .map((hospital) => hospital['name'] as String)
                                  .toList(),
                              selectedItem: hospitals.firstWhere((hospital) =>
                                  hospital['id'] == selectedHospitalId)['name'],
                              onChanged: (selectedValue) {
                                setState(() {
                                  selectedHospitalId = hospitals.firstWhere(
                                      (hospital) =>
                                          hospital['name'] ==
                                          selectedValue)['id'] as int;
                                });
                              },
                            ),
                            BuildField(
                              title: 'Request',
                              hintText: 'Permintaan catatan khusus',
                              maxLines: 4,
                              controller: _requestController,
                              isRequired: true,
                              validator: (value) =>
                                  _validateRequired(value, 'Permintaan'),
                            ),
                          ]
                              .expand((widget) =>
                                  [widget, const SizedBox(height: 16)])
                              .toList()
                            ..removeLast(),
                        ),
                      ),
                    ),
                  ),
                  buildButtonOption(
                    option1: ButtonOptionModel(
                      title: 'Kirim Laporan',
                      onTap: () => _submitForm(context),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  _getHospital() async {
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
        if (hospitalsList.isNotEmpty) {
          hospitals = [
            {'id': 0, 'name': '-'},
            ...hospitalsList
          ];
          selectedHospitalId = 0;
        } else {
          hospitals = [
            {'id': 0, 'name': '-'}
          ];
          selectedHospitalId = 0;
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        hospitals = [
          {'id': 0, 'name': '-'}
        ];
        selectedHospitalId = 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load hospitals. Please try again later.'),
        ),
      );
    }
  }
}

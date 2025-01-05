import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/pages/form/form_provider.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_button_option.dart';
import 'package:emergency_app/widgets/build_date.dart';
import 'package:emergency_app/widgets/build_dropdown.dart';
import 'package:emergency_app/widgets/build_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  List<String> hospitals = ['-']; // Initialize with default value
  String? selectedHospital = '-';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Fetch hospitals when page loads
    _getHospital();
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
                          const BuildField(
                            title: 'Name',
                            hintText: 'Ahmad Faisal',
                          ),
                          const BuildField(
                            title: 'Age',
                            hintText: '19',
                            keyboardType: TextInputType.number,
                          ),
                          const BuildField(
                            title: 'Desc',
                            hintText: '',
                            maxLines: 4,
                          ),
                          BuildDate(
                            title: 'Arrival',
                            hintText: 'Enter Date',
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 40)),
                            initialDate:
                                DateTime.now().add(const Duration(days: 20)),
                            onChanged: (date) {
                              print('Selected Date: $date');
                            },
                          ),
                          BuildDropdown(
                            title: 'Status',
                            hintText: 'Choose something',
                            items: const [
                              'Menuju RS',
                              'Selesai',
                            ],
                            selectedItem: 'Menuju RS',
                            onChanged: (selectedValue) {
                              print('Selected: $selectedValue');
                            },
                            isRequired: true,
                          ),
                          const BuildField(
                            title: 'Mechanism',
                            hintText: '',
                          ),
                          const BuildField(
                            title: 'Injury',
                            hintText: '',
                          ),
                          const BuildField(
                            title: 'Treatment',
                            hintText: '',
                          ),
                          BuildDropdown(
                            title: 'Case',
                            hintText: 'Choose something',
                            items: const [
                              'Trauma',
                              'Non Trauma',
                            ],
                            selectedItem: 'Trauma',
                            onChanged: (selectedValue) {
                              print('Selected: $selectedValue');
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
                              print('Selected Date: $date');
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
                              print('Selected: $selectedValue');
                            },
                            isRequired: true,
                          ),
                          const BuildField(
                            title: 'Photo',
                            hintText: '',
                            prefixIcon: Icon(Icons.photo),
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
                        // You can check if selectedHospital == '-' to treat it as null
                        final hospitalValue =
                            selectedHospital == '-' ? null : selectedHospital;
                        print('Selected hospital value: $hospitalValue');
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // Modified _getHospital method to always include '-' option
  _getHospital() async {
    try {
      final hospitalsList =
          await Provider.of<FormProvider>(context, listen: false).getHospital();

      if (!mounted) return;

      setState(() {
        isLoading = false;
        if (hospitalsList.isNotEmpty) {
          // Add '-' at the beginning of the list
          hospitals = ['-', ...hospitalsList];
          selectedHospital = '-'; // Set default to '-'
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

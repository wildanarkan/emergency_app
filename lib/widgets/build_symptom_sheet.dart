import 'dart:developer';

import 'package:emergency_app/widgets/build_field.dart';
import 'package:flutter/material.dart';

class BuildSymptomSheet extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool isRequired;
  final bool showError; // New property
  final String? errorText; // New property

  const BuildSymptomSheet({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.isRequired = false,
    this.showError = false,
    this.errorText,
  });

  @override
  State<BuildSymptomSheet> createState() => _BuildSymptomSheetState();
}

class _BuildSymptomSheetState extends State<BuildSymptomSheet> {
  final TextEditingController _gejalaController = TextEditingController();
  final TextEditingController _nafasController = TextEditingController();
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _gcsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initializeFields();
  }

  void _initializeFields() {
    if (widget.controller.text.isNotEmpty) {
      final lines = widget.controller.text.split('\n');
      for (var line in lines) {
        if (line.startsWith('Symptom: ')) {
          _gejalaController.text = line.replaceFirst('Symptom: ', '').trim();
        } else if (line.startsWith('Nafas: ')) {
          _nafasController.text = line.replaceFirst('Nafas: ', '').trim();
        } else if (line.startsWith('Systolic: ')) {
          _systolicController.text = line.replaceFirst('Systolic: ', '').trim();
        } else if (line.startsWith('GCS: ')) {
          _gcsController.text = line.replaceFirst('GCS: ', '').trim();
        }
      }
    }
  }

  @override
  void dispose() {
    _gejalaController.dispose();
    _nafasController.dispose();
    _systolicController.dispose();
    _gcsController.dispose();
    super.dispose();
  }

  String? _validateNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName harus diisi';
    }
    if (int.tryParse(value) == null) {
      return '$fieldName harus berupa angka';
    }
    return null;
  }

  void _saveSymptoms() {
    if (_formKey.currentState!.validate()) {
      final symptomData =
          'Symptom: ${_gejalaController.text}\nNafas: ${_nafasController.text}\nSystolic: ${_systolicController.text}\nGCS: ${_gcsController.text}';

      log(symptomData);
      widget.controller.text = symptomData;

      Navigator.pop(context);
      setState(() {});
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Input Symptoms',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  BuildField(
                    title: 'Gejala',
                    controller: _gejalaController,
                    isRequired: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Gejala harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  BuildField(
                    title: 'Frekuensi nafas',
                    controller: _nafasController,
                    keyboardType: TextInputType.number,
                    isRequired: true,
                    validator: (value) =>
                        _validateNumber(value, 'Frekuensi nafas'),
                  ),
                  const SizedBox(height: 16),
                  BuildField(
                    title: 'Tekanan darah systolic',
                    controller: _systolicController,
                    keyboardType: TextInputType.number,
                    isRequired: true,
                    validator: (value) =>
                        _validateNumber(value, 'Tekanan darah systolic'),
                  ),
                  const SizedBox(height: 16),
                  BuildField(
                    title: 'GCS',
                    controller: _gcsController,
                    keyboardType: TextInputType.number,
                    isRequired: true,
                    validator: (value) => _validateNumber(value, 'GCS'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveSymptoms,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              if (widget.isRequired)
                const Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        ),
        InkWell(
          onTap: () => _showBottomSheet(context),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.showError ? Colors.red : Colors.black45,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.controller.text.isEmpty
                        ? widget.hintText
                        : widget.controller.text,
                    style: TextStyle(
                      color: widget.controller.text.isEmpty
                          ? Colors.grey[400]
                          : Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
        ),
        if (widget.showError && widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 3.0, left: 15),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class BuildDate extends StatelessWidget {
  final String title;
  final String hintText;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime initialDate;
  final void Function(DateTime?) onChanged;
  final bool isRequired;
  final String? errorText; // Add error text property
  final bool showError; // Add show error property

  const BuildDate({
    super.key,
    required this.title,
    required this.hintText,
    required this.firstDate,
    required this.lastDate,
    required this.initialDate,
    required this.onChanged,
    this.isRequired = false,
    this.errorText,
    this.showError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Section
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              if (isRequired)
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
        DateTimeFormField(
          decoration: InputDecoration(
            suffixIcon: const SizedBox(),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
            prefixIcon: const Icon(Icons.calendar_today),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: showError ? Colors.red : Colors.black45,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color:
                    showError ? Colors.red : Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            errorStyle: const TextStyle(
              color: Colors.red,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            errorText:
                showError ? (errorText ?? 'Field ini harus diisi') : null,
          ),
          firstDate: firstDate,
          lastDate: lastDate,
          initialPickerDateTime: initialDate,
          mode: DateTimeFieldPickerMode.dateAndTime,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

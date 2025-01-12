import 'dart:developer';
import 'dart:io';

import 'package:emergency_app/core/di/service_locator.dart';
import 'package:emergency_app/data/app_repository.dart';
import 'package:emergency_app/data/response/add_patient_response.dart';
import 'package:flutter/foundation.dart';

class FormProvider extends ChangeNotifier {
  final _repository = serviceLocator.get<AppRepository>();

  AddPatientResponse? _addPatientResponse;
  bool _isLoading = false;

  AddPatientResponse? get addPatientResponse => _addPatientResponse;
  bool get isLoading => _isLoading;

  Future<List<Map<String, dynamic>>> getHospital() async {
    final response = await _repository.getHospital();
    if (response.success != true) return [];

    final data =
        List<Map<String, dynamic>>.from(response.data?.map((hospital) => {
                  'id': hospital.id,
                  'name': hospital.name,
                }) ??
            []);
    log(data.toString());
    return data;
  }

  Future<bool> addPatient({
    required String token,
    required String name,
    required int age,
    required int gender,
    required String timeIncident,
    required String mechanism,
    required String injury,
    File? photoInjury,
    required String symptom,
    required String arrival,
    required int status,
    required String treatment,
    required int? hospitalId,
    required String request,
    required int caseType,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      if (token.isEmpty) {
        throw Exception('Token not found. Please login again.');
      }

      final response = await _repository.addPatient(
        token: token,
        name: name,
        age: age,
        gender: gender,
        timeIncident: timeIncident,
        mechanism: mechanism,
        injury: injury,
        photoInjury: photoInjury,
        symptom: symptom,
        arrival: arrival,
        status: status,
        treatment: treatment,
        hospitalId: hospitalId,
        request: request,
        caseType: caseType,
      );

      _addPatientResponse = response;

      if (response.success == true) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        debugPrint('Failed to add patient: ${response.data}');
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      debugPrint('Error while adding patient: $e');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}

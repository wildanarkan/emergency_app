import 'dart:io';

import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/core/di/service_locator.dart';
import 'package:emergency_app/data/app_repository.dart';
import 'package:emergency_app/data/response/add_patient_response.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormProvider extends ChangeNotifier {
  final _repository = serviceLocator.get<AppRepository>();

  AddPatientResponse? _addPatientResponse;
  bool _isLoading = false;

  AddPatientResponse? get addPatientResponse => _addPatientResponse;
  bool get isLoading => _isLoading;

  Future<List<String>> getHospital() async {
    final response = await _repository.getHospital();
    if(response.success != true) return [];
     return List<String>.from(response.data?.map((hospital) => hospital.name) ?? ['kosong']);
  }

  Future<bool> addPatient({
    required String name,
    required int age,
    required int gender,
    required String desc,
    required String arrival,
    required int status,
    required String mechanism,
    required String injury,
    required String treatment,
    required int caseType,
    required String timeIncident,
    required String hospitalId,
    required int userId,
    File? photoInjury,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Ambil token dari SharedPreferences
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString(Constant.tokenKey);

      if (token == null || token.isEmpty) {
        throw Exception('Token not found. Please login again.');
      }

      // Panggil metode addPatient dari repository
      final response = await _repository.addPatient(
        token: token,
        name: name,
        age: age,
        gender: gender,
        desc: desc,
        arrival: arrival,
        status: status,
        mechanism: mechanism,
        injury: injury,
        treatment: treatment,
        caseType: caseType,
        timeIncident: timeIncident,
        hospitalId: hospitalId,
        userId: userId,
        photoInjury: photoInjury,
      );

      // Simpan respons di provider
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

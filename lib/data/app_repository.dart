import 'dart:io';

import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/data/app_network.dart';
import 'package:emergency_app/data/response/add_patient_response.dart';
import 'package:emergency_app/data/response/get_hospital_response.dart';
import 'package:emergency_app/data/response/login_response.dart';
import 'package:emergency_app/data/response/logout_response.dart';
import 'package:emergency_app/data/response/register_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRepository {
  final AppNetwork _appNetwork;

  AppRepository(this._appNetwork);

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) {
    return _appNetwork.login(email: email, password: password);
  }

  Future<RegisterResponse> register({
    required String name,
    required String phone,
    required String email,
    required String team,
    required String password,
  }) {
    return _appNetwork.register(
      name: name,
      phone: phone,
      email: email,
      team: team,
      password: password,
    );
  }

  Future<LogoutResponse> logout() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(Constant.tokenKey);
    return _appNetwork.logout(token: token ?? '');
  }

  Future<GetHospitalResponse> getHospital() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(Constant.tokenKey);
    return _appNetwork.getHospital(token: token ?? '');
  }

  Future<AddPatientResponse> addPatient({
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
  }) {
    return _appNetwork.addPatient(
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
  }
}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:emergency_app/core/http/http_builder.dart';
import 'package:emergency_app/data/response/add_patient_response.dart';
import 'package:emergency_app/data/response/get_hospital_response.dart';
import 'package:emergency_app/data/response/login_response.dart';
import 'package:emergency_app/data/response/logout_response.dart';
import 'package:http/http.dart' as http;

class AppNetwork {
  final HttpBuilder _http;

  AppNetwork(this._http);

  static const _login = 'login-app';
  static const _logout = 'logout';
  static const _patient = 'patient';
  static const _hospital = 'hospital';

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final payload = {'email': email, 'password': password};
    final response = await _http.build(path: _login).post(payload);
    final jsonResponse = json.decode(response.body);
    final responseModel = LoginResponse.fromJson(jsonResponse);
    responseModel.code = response.statusCode;
    return responseModel;
  }

  Future<LogoutResponse> logout({
    required String token,
  }) async {
    final payload = {'Authorization': 'Bearer $token'};
    final response = await _http.build(path: _logout, headers: payload).post();
    final jsonResponse = json.decode(response.body);
    final responseModel = LogoutResponse.fromJson(jsonResponse);
    responseModel.code = response.statusCode;
    return responseModel;
  }

  Future<GetHospitalResponse> getHospital({
    required String token,
  }) async {
    final payload = {'Authorization': 'Bearer $token'};
    final response = await _http.build(path: _hospital, headers: payload).get();
    log(response.body.toString());
    final jsonResponse = json.decode(response.body);
    final responseModel = GetHospitalResponse.fromJson(jsonResponse);
    return responseModel;
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
  }) async {
    final headers = {'Authorization': 'Bearer $token'};

    if (photoInjury != null) {
      final fields = {
        'name': name.toString(),
        'age': age.toString(),
        'gender': gender.toString(),
        'time_incident': timeIncident,
        'mechanism': mechanism,
        'injury': injury,
        'symptom': symptom,
        'arrival': arrival,
        'status': status.toString(),
        'treatment': treatment,
        if (hospitalId != null) 'hospital_id': hospitalId.toString(),
        'request': request,
        'case': caseType.toString(),
      };

      log(fields.toString());

      final photoFile = await http.MultipartFile.fromPath(
          'photo_injury', photoInjury.path,
          filename: photoInjury.path.split('/').last);

      final streamedResponse =
          await _http.build(path: _patient, headers: headers).postMultipart(
        fields: fields,
        files: [photoFile],
      );

      final response = await http.Response.fromStream(streamedResponse);
      final jsonResponse = json.decode(response.body);
      return AddPatientResponse.fromJson(jsonResponse);
    } else {
      final payload = {
        'name': name,
        'age': age,
        'gender': gender,
        'time_incident': timeIncident,
        'mechanism': mechanism,
        'injury': injury,
        'symptom': symptom,
        'arrival': arrival,
        'status': status,
        'treatment': treatment,
        if (hospitalId != null) 'hospital_id': hospitalId,
        'request': request,
        'case': caseType,
      };

      final response =
          await _http.build(path: _patient, headers: headers).post(payload);

      final jsonResponse = json.decode(response.body);
      return AddPatientResponse.fromJson(jsonResponse);
    }
  }
}

import 'dart:convert';
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
    final jsonResponse = json.decode(response.body);
    final responseModel = GetHospitalResponse.fromJson(jsonResponse);
    return responseModel;
  }

  Future<AddPatientResponse> addPatient({
    required String token,
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
    final headers = {'Authorization': 'Bearer $token'};

    if (photoInjury != null) {
      // Handle multipart request when photo is present
      final fields = {
        'name': name.toString(),
        'age': age.toString(),
        'gender': gender.toString(),
        'desc': desc,
        'arrival': arrival,
        'status': status.toString(),
        'mechanism': mechanism,
        'injury': injury,
        'treatment': treatment,
        'case': caseType.toString(),
        'time_incident': timeIncident,
        'hospital_id': hospitalId,
        'user_id': userId.toString(),
      };

      // Create multipart file
      final photoFile = await http.MultipartFile.fromPath(
          'photo_injury', photoInjury.path,
          filename: photoInjury.path.split('/').last);

      // Use existing postMultipart method
      final streamedResponse =
          await _http.build(path: _patient, headers: headers).postMultipart(
        fields: fields,
        files: [photoFile],
      );

      // Convert StreamedResponse to normal response
      final response = await http.Response.fromStream(streamedResponse);
      final jsonResponse = json.decode(response.body);
      return AddPatientResponse.fromJson(jsonResponse);
    } else {
      // Handle normal JSON request when no photo
      final payload = {
        'name': name,
        'age': age,
        'gender': gender,
        'desc': desc,
        'arrival': arrival,
        'status': status,
        'mechanism': mechanism,
        'injury': injury,
        'treatment': treatment,
        'case': caseType,
        'time_incident': timeIncident,
        'hospital_id': hospitalId,
        'user_id': userId,
      };

      final response =
          await _http.build(path: _patient, headers: headers).post(payload);

      final jsonResponse = json.decode(response.body);
      return AddPatientResponse.fromJson(jsonResponse);
    }
  }
}

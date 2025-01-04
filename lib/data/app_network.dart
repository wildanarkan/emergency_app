import 'dart:convert';

import 'package:emergency_app/core/http/http_builder.dart';
import 'package:emergency_app/data/response/login_response.dart';
import 'package:emergency_app/data/response/logout_response.dart';

class AppNetwork {
  final HttpBuilder _http;

  AppNetwork(this._http);

  static const _login = 'login-app';
  static const _logout = 'logout';

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
}

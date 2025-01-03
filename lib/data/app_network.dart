import 'dart:convert';
import 'dart:developer';

import 'package:emergency_app/core/http/http_builder.dart';
import 'package:emergency_app/data/response/login_response.dart';
import 'package:emergency_app/data/response/logout_response.dart';

class AppNetwork {
  final HttpBuilder _http;

  AppNetwork(this._http);

  static const _login = 'login';
  static const _logout = 'logout';

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final payload = {'email': email, 'password': password};
    final response = await _http.build(path: _login).post(payload);
    final jsonResponse = json.decode(response.body);
    return LoginResponse.fromJson(jsonResponse);
  }

  Future<LogoutResponse?> logout({
    required String token,
  }) async {
    final payload = {'Authorization': 'Bearer $token'};
    final response = await _http.build(path: _logout, headers: payload).post();
    final jsonResponse = json.decode(response.body);

    final a = LogoutResponse.fromJson(jsonResponse);
    a.code = response.statusCode;
    return a;
    log(response.statusCode.toString());
    if (response.statusCode != 200) {
      return LogoutResponse.fromJson({});
    }
    return LogoutResponse.fromJson(jsonResponse);
  }
}

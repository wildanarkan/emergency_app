import 'package:emergency_app/core/http/api_response.dart';
import 'package:emergency_app/core/http/http_builder.dart';
import 'package:emergency_app/core/http/json_response.dart';
import 'package:emergency_app/data/response/login_response.dart';
import 'package:emergency_app/data/response/logout_response.dart';

class AppNetwork {
  final HttpBuilder _http;

  AppNetwork(this._http);

  static const _login = 'login';
  static const _logout = 'logout';

  Future<JsonResponse<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    final payload = {'email': email, 'password': password};
    final response = await _http.build(path: _login).post(payload);
    return ApiResponse.json(response, LoginResponse.fromJson);
  }

  Future<JsonResponse<LogoutResponse>> logout({
    required String token,
  }) async {
    final payload = {'token': token};
    final response = await _http.build(path: _logout, headers: payload).post();
    return ApiResponse.json(response, LogoutResponse.fromJson);
  }
}

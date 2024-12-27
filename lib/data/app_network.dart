import 'package:emergency_app/core/http/http_builder.dart';

class AppNetwork {
  final HttpBuilder _http;

  AppNetwork(this._http);

  static const _login = 'login';

  Future<String> login({
    required String email,
    required String password,
  }) async {
    Map payload = {'email': email, 'password': password};
    final response = await _http.build(path: _login).post(payload);
    return response.body;
  }
}

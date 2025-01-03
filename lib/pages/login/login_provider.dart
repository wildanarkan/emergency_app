import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/core/di/service_locator.dart';
import 'package:emergency_app/data/app_repository.dart';
import 'package:emergency_app/data/response/login_response.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final _repository = serviceLocator.get<AppRepository>();

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _repository.login(email: email, password: password);
    final token = response.data?.accessToken ?? '';
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(Constant.tokenKey, token);
    return response;
  }
}

import 'dart:developer';

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

    
    if (response.data?.accessToken?.isNotEmpty ?? false) {
      final sharedPreferences = await SharedPreferences.getInstance();
      log(response.message.toString());
      log(response.data.toString());
      await sharedPreferences.setString(
        Constant.tokenKey,
        response.data?.accessToken ?? '',
      );
    }
    return response;
  }
}

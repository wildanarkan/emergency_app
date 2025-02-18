import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/core/di/service_locator.dart';
import 'package:emergency_app/data/app_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  final _repository = serviceLocator.get<AppRepository>();

  Future<bool> logout() async {
    await _repository.logout();
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(Constant.tokenKey, '');
    return true;
  }
}

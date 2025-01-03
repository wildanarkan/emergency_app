import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/data/app_network.dart';
import 'package:emergency_app/data/response/login_response.dart';
import 'package:emergency_app/data/response/logout_response.dart';
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

  Future<LogoutResponse> logout() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(Constant.tokenKey);
    return _appNetwork.logout(token: token ?? '');
  }
}

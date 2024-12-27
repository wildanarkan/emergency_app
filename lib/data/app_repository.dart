import 'package:emergency_app/data/app_network.dart';

class AppRepository {
  final AppNetwork _appNetwork;

  AppRepository(this._appNetwork);

  Future<String> login({
    required String email,
    required String password,
  }) {
    return _appNetwork.login(email: email, password: password);
  }
}

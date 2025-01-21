import 'package:emergency_app/core/di/service_locator.dart';
import 'package:emergency_app/data/app_repository.dart';
import 'package:emergency_app/data/response/register_response.dart';
import 'package:flutter/foundation.dart';

class RegisterProvider extends ChangeNotifier {
  final _repository = serviceLocator.get<AppRepository>();

  Future<RegisterResponse> register({
    required String name,
    required String phone,
    required String email,
    required String team,
    required String password,
  }) async {
    final response = await _repository.register(
      name: name,
      phone: phone,
      email: email,
      team: team,
      password: password,
    );
    return response;
  }
}

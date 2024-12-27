import 'package:emergency_app/core/http/http_builder.dart';
import 'package:emergency_app/core/service_locator.dart';
import 'package:emergency_app/data/app_network.dart';
import 'package:emergency_app/data/app_repository.dart';

/// Register dependency injection here
Future configureAppDependencies() async {
  serviceLocator.registerFactory<AppNetwork>(
    () => AppNetwork(
      serviceLocator<HttpBuilder>(),
    ),
  );

  serviceLocator.registerLazySingleton<AppRepository>(
    () => AppRepository(
      serviceLocator<AppNetwork>(),
    ),
  );
}

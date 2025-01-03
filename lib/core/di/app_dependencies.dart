import 'package:emergency_app/core/http/http_builder.dart';
import 'package:emergency_app/core/di/service_locator.dart';
import 'package:emergency_app/data/app_network.dart';
import 'package:emergency_app/data/app_repository.dart';
import 'package:http_interceptor/http_interceptor.dart';

/// Register dependency injection here
Future configureAppDependencies() async {
  serviceLocator.registerFactory<HttpBuilder>(
    () => HttpBuilder(
      defaultHeaders: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      coreClient: () => InterceptedClient.build(
        interceptors: [],
      ),
    ),
  );

  serviceLocator.registerFactory<AppNetwork>(
    () => AppNetwork(
      serviceLocator<HttpBuilder>(),
    ),
  );

  serviceLocator.registerFactory<AppRepository>(
    () => AppRepository(
      serviceLocator<AppNetwork>(),
    ),
  );
}

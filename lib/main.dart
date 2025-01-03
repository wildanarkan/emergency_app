import 'package:emergency_app/core/di/app_dependencies.dart';
import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/pages/home/home_provider.dart';
import 'package:emergency_app/pages/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  );
  _initialization();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.route,
    );
  }
}

Future<bool> _initialization() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Register dependency injection here
  await configureAppDependencies();

  return true;
}

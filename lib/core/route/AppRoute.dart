import 'dart:developer';

import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/pages/home/home_page.dart';
import 'package:emergency_app/pages/login/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRoute {
  static final route = GoRouter(
    initialLocation: '/login',
    routes: [
      login,
      home,
    ],
  );

  static final login = GoRoute(
    name: 'login',
    path: '/login',
    builder: (context, state) => const LoginPage(),
    redirect: (context, state) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString(Constant.tokenKey);
      if (token != null && token.isNotEmpty) {
        log('token : $token');
        return home.path;
      }
      log('token null');
      return null;
    },
  );

  static final home = GoRoute(
    name: 'home',
    path: '/home',
    builder: (context, state) => const HomePage(),
  );
}

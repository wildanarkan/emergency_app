import 'dart:developer';

import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/pages/home/home_page.dart';
import 'package:emergency_app/pages/login/login_page.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_1.dart';
import 'package:emergency_app/pages/trauma/trauma_1.dart';
import 'package:emergency_app/pages/trauma/trauma_no.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRoute {
  static final route = GoRouter(
    initialLocation: '/login',
    routes: [
      login,
      home,
      trauma1,
      trauma2,
      trauma3,
      trauma4,
      traumaNo,
      nonTrauma,
    ],
  );

  static final login = GoRoute(
    name: 'login',
    path: '/login',
    builder: (context, state) => const LoginPage(),
    redirect: (context, state) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString(Constant.tokenKey);
      if (token?.isNotEmpty == true) {
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

  // =============================================================== Trauma
  static final trauma1 = GoRoute(
    name: 'trauma1',
    path: '/trauma1',
    builder: (context, state) => const Trauma1(),
  );

  static final trauma2 = GoRoute(
    name: 'trauma2',
    path: '/trauma2',
    builder: (context, state) => const Trauma1(),
  );

  static final trauma3 = GoRoute(
    name: 'trauma3',
    path: '/trauma3',
    builder: (context, state) => const Trauma1(),
  );

  static final trauma4 = GoRoute(
    name: 'trauma4',
    path: '/trauma4',
    builder: (context, state) => const Trauma1(),
  );

  static final traumaNo = GoRoute(
    name: 'traumaNo',
    path: '/traumaNo',
    builder: (context, state) => const TraumaNo(),
  );

  // =========================================================== Non Trauma
  static final nonTrauma = GoRoute(
    name: 'nonTrauma',
    path: '/nonTrauma',
    builder: (context, state) => const Nontrauma1(),
  );
}

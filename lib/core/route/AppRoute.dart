import 'dart:developer';

import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/data/model/non_trauma_model.dart';
import 'package:emergency_app/pages/form/form_input.dart';
import 'package:emergency_app/pages/home/home_page.dart';
import 'package:emergency_app/pages/login/login_page.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_1.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_10.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_2.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_3.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_4.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_5.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_6.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_7.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_8.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_9.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_result.dart';
import 'package:emergency_app/pages/trauma/trauma_1.dart';
import 'package:emergency_app/pages/trauma/trauma_2.dart';
import 'package:emergency_app/pages/trauma/trauma_3.dart';
import 'package:emergency_app/pages/trauma/trauma_4.dart';
import 'package:emergency_app/pages/trauma/trauma_result.dart';
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
      traumaResult,
      nonTrauma1,
      nonTrauma2,
      nonTrauma3,
      nonTrauma4,
      nonTrauma5,
      nonTrauma6,
      nonTrauma7,
      nonTrauma8,
      nonTrauma9,
      nonTrauma10,
      nonTraumaResult,
      formInput,
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
    builder: (context, state) => const Trauma2(),
  );

  static final trauma3 = GoRoute(
    name: 'trauma3',
    path: '/trauma3',
    builder: (context, state) => const Trauma3(),
  );

  static final trauma4 = GoRoute(
    name: 'trauma4',
    path: '/trauma4',
    builder: (context, state) => const Trauma4(),
  );

  static final traumaResult = GoRoute(
    name: 'traumaResult',
    path: '/traumaResult',
    builder: (context, state) {
      final isPrenotif = state.extra as bool;
      return TraumaResult(isPrenotif: isPrenotif);
    },
  );

  // =========================================================== Non Trauma
  static final nonTrauma1 = GoRoute(
    name: 'nonTrauma1',
    path: '/nonTrauma1',
    builder: (context, state) => const Nontrauma1(),
  );

  static final nonTrauma2 = GoRoute(
    name: 'nonTrauma2',
    path: '/nonTrauma2',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return Nontrauma2(data: data);
    },
  );

  static final nonTrauma3 = GoRoute(
    name: 'nonTrauma3',
    path: '/nonTrauma3',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return Nontrauma3(data: data);
    },
  );

  static final nonTrauma4 = GoRoute(
    name: 'nonTrauma4',
    path: '/nonTrauma4',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return Nontrauma4(data: data);
    },
  );

  static final nonTrauma5 = GoRoute(
    name: 'nonTrauma5',
    path: '/nonTrauma5',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return Nontrauma5(data: data);
    },
  );

  static final nonTrauma6 = GoRoute(
    name: 'nonTrauma6',
    path: '/nonTrauma6',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return Nontrauma6(data: data);
    },
  );

  static final nonTrauma7 = GoRoute(
    name: 'nonTrauma7',
    path: '/nonTrauma7',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return Nontrauma7(data: data);
    },
  );

  static final nonTrauma8 = GoRoute(
    name: 'nonTrauma8',
    path: '/nonTrauma8',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return Nontrauma8(data: data);
    },
  );

  static final nonTrauma9 = GoRoute(
    name: 'nonTrauma9',
    path: '/nonTrauma9',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return Nontrauma9(data: data);
    },
  );

  static final nonTrauma10 = GoRoute(
    name: 'nonTrauma10',
    path: '/nonTrauma10',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return Nontrauma10(data: data);
    },
  );

  static final nonTraumaResult = GoRoute(
    name: 'nonTraumaResult',
    path: '/nonTraumaResult',
    builder: (context, state) {
      final data = state.extra as NonTraumaModel;
      return NontraumaResult(data: data);
    },
  );

  // =========================================================== Form Inout
  static final formInput = GoRoute(
    name: 'formInput',
    path: '/formInput',
    builder: (context, state) => const FormInput(),
  );
}

import 'dart:developer';

import 'package:emergency_app/core/constant.dart';
import 'package:emergency_app/core/route/AppRoute.dart';
import 'package:emergency_app/pages/home/home_provider.dart';
import 'package:emergency_app/widgets/LoadingDialog.dart';
import 'package:emergency_app/widgets/build_app_bar.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Home',
        enableBackButton: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: BuildBox(
                      title: 'Kasus Trauma',
                      height: 100,
                      center: true,
                      onTap: () async {
                        final sharedPreferences =
                            await SharedPreferences.getInstance();
                        await sharedPreferences.setInt(Constant.caseType, 2);
                        final caseType =
                            sharedPreferences.getInt(Constant.caseType);
                        log(caseType.toString());
                        context.pushNamed(AppRoute.trauma1.name!);
                      }),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: BuildBox(
                    title: 'Kasus Non Trauma',
                    height: 100,
                    center: true,
                    onTap: () async {
                        final sharedPreferences =
                            await SharedPreferences.getInstance();
                        await sharedPreferences.setInt(Constant.caseType, 1);
                        final caseType =
                            sharedPreferences.getInt(Constant.caseType);
                        log(caseType.toString());
                      context.pushNamed(AppRoute.nonTrauma1.name!);
                    },
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                Expanded(
                  child: BuildBox(
                    title: 'Log Out',
                    center: true,
                    onTap: () => _handleLogOut(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _handleLogOut() async {
    LoadingDialog.runWithLoading(
      context,
      () {
        return Provider.of<HomeProvider>(context, listen: false).logout();
      },
    ).then(
      (value) {
        if (!mounted) return;
        if (value) {
          context.pushReplacementNamed(AppRoute.login.name!);
        }
      },
    );
  }
}

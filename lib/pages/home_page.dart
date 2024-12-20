import 'package:emergency_app/commons/app_color.dart';
import 'package:emergency_app/pages/nontrauma/nontrauma_1.dart';
import 'package:emergency_app/pages/trauma/trauma_1.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:emergency_app/widgets/build_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const BuildHeader(title: 'Selamat Datang',),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BuildBox(title: 'Pilih Kasus yang dialami pasien',),
              BuildBox(title: 'Kasus Trauma', onTap: () => Get.to(() => const Trauma1()),),
              BuildBox(title: 'Kasus Non Trauma',  onTap: () => Get.to(() => const Nontrauma1())),
            ],
          )
        ],
      ),
      backgroundColor: AppColor.background,
    );
  }
}





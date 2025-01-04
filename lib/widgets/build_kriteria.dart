import 'package:emergency_app/widgets/build_lightblue.dart';
import 'package:flutter/material.dart';

class BuildKriteria extends StatelessWidget {
  const BuildKriteria({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    height: 170,
                    color: Colors.blue,
                    child: const Text(
                      'Fisiologi',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      child: const Text(
                        'Anatomi',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    color: Colors.blue,
                    child: const Text(
                      'RR<10 atau lebih dari 29',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  const BuildBoxLightBlue(
                    text: 'SBP <90 mmhg atau nadi radial tidak teraba',
                  ),
                  const BuildBoxLightBlue(
                      text:
                          "Nilai GCS bagian motorik <4 (Menarik anggota gerak saat diberi rangsangan nyeri)"),
                  const BuildBoxLightBlue(
                      text: "Open pneumothorax atau flail chest"),
                  const BuildBoxLightBlue(
                      text: "Anggota tubuh hancur atau terlepas"),
                  const BuildBoxLightBlue(text: "Suspect fraktur pelvis mayor"),
                  const BuildBoxLightBlue(
                      text: "Cedera leher / tulang belakang dengan kelumpuhan"),
                  const BuildBoxLightBlue(
                      text:
                          "Patah tulang panjang proksimal lebih dari 1 tempat"),
                  const BuildBoxLightBlue(text: "Anggota tubuh teramputasi"),
                  const BuildBoxLightBlue(
                      text:
                          "Suspect fraktur tulang tengkorak terbuka atau depressed"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

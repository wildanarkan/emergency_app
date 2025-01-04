import 'package:emergency_app/data/model/button_option_model.dart';
import 'package:emergency_app/widgets/build_box.dart';
import 'package:flutter/material.dart';

Widget buildButtonOption({
  ButtonOptionModel? option1,
  ButtonOptionModel? option2,
  ButtonOptionModel? option3,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      if (option1 != null) ...[
        Expanded(
          child: BuildBox(
            backgroundColor: Colors.blueAccent,
            title: option1.title,
            onTap: option1.onTap,
            center: true,
            height: 40,
          ),
        ),
      ],
      if (option2 != null) ...[
        const SizedBox(width: 16),
        Expanded(
          child: BuildBox(
            backgroundColor: Colors.blueAccent,
            title: option2.title,
            onTap: option2.onTap,
            center: true,
            height: 40,
          ),
        ),
      ],
      if (option3 != null) ...[
        const SizedBox(width: 16),
        Expanded(
          child: BuildBox(
            backgroundColor: Colors.blueAccent,
            title: option3.title,
            onTap: option3.onTap,
            center: true,
            height: 40,
          ),
        ),
      ],
    ],
  );
}

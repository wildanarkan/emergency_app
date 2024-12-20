import 'package:flutter/material.dart';

class BuildBoxLightBlue extends StatelessWidget {
  const BuildBoxLightBlue({
    super.key, required this.text,
  });
  
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 5),
      width: double.infinity,
      color: Colors.blue[50],
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
        ),
      ),
    );
  }
}

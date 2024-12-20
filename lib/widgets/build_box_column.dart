import 'package:flutter/material.dart';

class BuildBoxColumn extends StatelessWidget {
  const BuildBoxColumn({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    required this.subtitle, this.titleColor,
  });

  final String title;
  final Color? titleColor;
  final String subtitle;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: backgroundColor ?? Colors.white,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 10, color: titleColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          )),
    );
  }
}

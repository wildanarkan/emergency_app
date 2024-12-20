import 'package:flutter/material.dart';

class BuildBox extends StatelessWidget {
  const BuildBox({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.center = false,
    this.titleColor,
  });

  final String title;
  final Color? titleColor;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool center;

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
        child: center
            ? Center(
                child: Text(
                title,
                style: TextStyle(color: titleColor),
              ))
            : Text(
                title,
                style: TextStyle(color: titleColor),
              ),
      ),
    );
  }
}

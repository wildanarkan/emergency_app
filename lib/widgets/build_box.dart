import 'package:flutter/material.dart';

class BuildBox extends StatelessWidget {
  const BuildBox({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.center = false,
    this.titleColor,
    this.alignment,
    this.height,
  });

  final String title;
  final Color? titleColor;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool center;
  final Alignment? alignment;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
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

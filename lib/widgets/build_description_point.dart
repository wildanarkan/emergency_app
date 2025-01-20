import 'package:flutter/material.dart';

class BuildDescriptionPoint extends StatelessWidget {
  const BuildDescriptionPoint({
    super.key,
    required this.value,
    this.icon = Icons.circle,
    this.iconSize = 8,
  });

  final String value;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6.0, right: 8.0),
            child: Icon(
              icon,
              size: icon == Icons.check ? 16 : iconSize,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
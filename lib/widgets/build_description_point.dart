import 'package:flutter/material.dart';

class BuildDescriptionPoint extends StatelessWidget {
  const BuildDescriptionPoint({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, size: 18),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

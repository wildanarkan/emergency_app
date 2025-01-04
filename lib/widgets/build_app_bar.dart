import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  required bool enableBackButton,
}) {
  return AppBar(
    backgroundColor: Colors.blueAccent,
    leading: enableBackButton
        ? IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
              color: Colors.white,
            ),
          )
        : null,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
  );
}

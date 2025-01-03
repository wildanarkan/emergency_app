import 'package:flutter/material.dart';

Future<void> showSnackBar(
  BuildContext context,
  String? message,
) async {
  final snackBar = ScaffoldMessenger.of(context);
  snackBar.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(message ?? 'Terjadi Kesalahan')),
          InkWell(
            onTap: () => snackBar.hideCurrentSnackBar(),
            child: const Icon(
              size: 16,
              color: Colors.white,
              Icons.close,
            ),
          ),
        ],
      ),
    ),
  );
}

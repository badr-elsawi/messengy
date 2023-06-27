import 'package:flutter/material.dart';

SnackBar mySnack({
  required String messege,
  String? actionText,
  Function()? onAction,
}) =>
    SnackBar(
      closeIconColor: Colors.red,
      duration: Duration(seconds: 4),
      content: Text(messege),
      action: actionText != null
          ? SnackBarAction(
              label: actionText,
              onPressed: onAction!,
            )
          : null,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
    );

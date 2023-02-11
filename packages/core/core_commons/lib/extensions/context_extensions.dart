import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

extension AppSnackBar on BuildContext {
  void showSnackBar({
    required String? message,
    VoidCallback? onActionPressed,
    bool error = false,
  }) {
    final snackBar = SnackBar(
      backgroundColor: error ? Colors.red[300] : CColors.background,
      content: CText.bodySmall(
        message ?? 'Oops! An error was occurred.',
        color: CColors.white,
      ),
      action: onActionPressed != null
          ? SnackBarAction(
              label: 'Ok',
              onPressed: onActionPressed,
            )
          : null,
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}

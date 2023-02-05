import 'package:flutter/material.dart';

import '../../core_ui.dart';

class CButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? labelText;
  final bool fullWidth;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;

  const CButton({
    super.key,
    this.onPressed,
    this.child,
    this.borderRadius = CBorderRadius.xl,
    this.padding = CSpacingInsets.sm,
    this.fullWidth = true,
    this.labelText,
  });

  const CButton.floating({
    super.key,
    this.onPressed,
    this.child,
    this.borderRadius = CBorderRadius.lg,
    this.padding = CSpacingInsets.sm,
    this.fullWidth = false,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: const MaterialStatePropertyAll(CColors.primary),
        padding: MaterialStatePropertyAll(padding),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide.none,
          ),
        ),
      ),
      child: fullWidth
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CIcons.refresh),
                if (labelText != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: CText.body(labelText!),
                  ),
              ],
            )
          : child,
    );
  }
}

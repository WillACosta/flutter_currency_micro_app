import 'package:core_ui/tokens/tokens.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;

  const CButton({
    super.key,
    this.onPressed,
    this.child,
    this.borderRadius = BorderRadius.zero,
    this.padding,
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
      child: child,
    );
  }
}

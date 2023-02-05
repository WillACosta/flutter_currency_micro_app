import 'package:core_ui/tokens/tokens.dart';
import 'package:flutter/material.dart';

class CPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;

  const CPrimaryButton({
    super.key,
    this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        elevation: MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(CColors.primary),
        padding: MaterialStatePropertyAll(CSpacingInsets.nano),
      ),
      child: child,
    );
  }
}

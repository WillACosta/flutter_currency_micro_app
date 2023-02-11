import 'package:flutter/material.dart';

import '../../core_ui.dart';

class CTextField extends StatelessWidget {
  final TextEditingController? textController;
  final String? labelText;
  final String? initialValue;
  final String hintText;
  final void Function(String)? onChanged;
  final bool enabled;

  const CTextField({
    super.key,
    this.textController,
    this.labelText,
    this.hintText = '0.00',
    this.onChanged,
    this.enabled = true,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: textController,
      cursorColor: CColors.text,
      maxLength: 10,
      inputFormatters: const [],
      keyboardType: TextInputType.number,
      textDirection: TextDirection.rtl,
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: CFontSize.headline,
        color: CColors.text,
        fontWeight: FontWeight.bold,
      ),
      enabled: enabled,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: CFontSize.headline,
          color: CColors.text,
          fontWeight: FontWeight.bold,
        ),
        hintTextDirection: TextDirection.rtl,
        border: InputBorder.none,
        counterText: '',
      ),
    );
  }
}

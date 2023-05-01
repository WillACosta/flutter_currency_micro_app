import 'package:core_domain/core_domain.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CDropdownButton extends StatelessWidget {
  final List<Currency> items;
  final void Function(Currency?)? onChanged;
  final Currency? initialValue;

  const CDropdownButton({
    super.key,
    required this.items,
    this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      onChanged: onChanged,
      value: initialValue,
      dropdownColor: CColors.background,
      icon: const Icon(CIcons.chevronDown),
      decoration: const InputDecoration(
        hintText: 'Select an Currency',
        hintStyle: TextStyle(
          color: CColors.text,
          fontSize: CFontSize.body,
        ),
        border: InputBorder.none,
      ),
      items: items
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: CText.body(e.displayCurrencyText),
            ),
          )
          .toList(),
    );
  }
}

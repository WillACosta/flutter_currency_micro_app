import 'package:flutter/material.dart';

import '../../core_ui.dart';

class CDropdownButton extends StatelessWidget {
  final List<String> items;

  const CDropdownButton({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      onChanged: (value) {},
      dropdownColor: CColors.background,
      icon: const Icon(CIcons.chevronDown),
      decoration: const InputDecoration(
        hintStyle: TextStyle(
          color: CColors.white,
          fontSize: CFontSize.body,
        ),
        border: InputBorder.none,
      ),
      items: items
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: CText.body(e),
            ),
          )
          .toList(),
    );
  }
}

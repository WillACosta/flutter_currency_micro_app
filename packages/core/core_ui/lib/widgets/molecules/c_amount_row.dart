import 'package:flutter/widgets.dart';

import '../../core_ui.dart';

class CAmountRow extends StatelessWidget {
  final String label;
  final bool enabled;
  final String? currencyCode;
  final void Function(String)? onChanged;

  const CAmountRow({
    super.key,
    this.onChanged,
    required this.label,
    this.currencyCode,
    this.enabled = true,
  });

  bool get _hasCurrencyCode => currencyCode != null;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CText.bodyHead(label),
        Expanded(
          child: _hasCurrencyCode
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CTextField(onChanged: onChanged),
                    CText.body(
                      currencyCode!.toUpperCase(),
                      color: CColors.text,
                    ),
                  ],
                )
              : CTextField(
                  onChanged: onChanged,
                  enabled: enabled,
                ),
        ),
      ],
    );
  }
}

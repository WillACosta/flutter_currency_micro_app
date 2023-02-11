import 'package:flutter/widgets.dart';

import '../../core_ui.dart';

class CAmountRow extends StatelessWidget {
  final String label;
  final bool enabled;
  final String? currencyCode;
  final void Function(String)? onChanged;
  final String? value;

  const CAmountRow({
    super.key,
    this.onChanged,
    required this.label,
    this.currencyCode,
    this.enabled = true,
    this.value,
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
                    CTextField(
                      initialValue: value,
                      onChanged: onChanged,
                    ),
                    CText.body(
                      currencyCode!.toUpperCase(),
                      color: CColors.text,
                    ),
                  ],
                )
              : CTextField(
                  initialValue: value,
                  onChanged: onChanged,
                  enabled: enabled,
                ),
        ),
      ],
    );
  }
}

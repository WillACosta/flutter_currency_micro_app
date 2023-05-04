import 'package:flutter/widgets.dart';

import '../../core_ui.dart';

class CAmountRow extends StatefulWidget {
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

  @override
  State<CAmountRow> createState() => _CAmountRowState();
}

class _CAmountRowState extends State<CAmountRow> {
  bool get _hasCurrencyCode => widget.currencyCode != null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CText.bodyHead(widget.label),
        Expanded(
          child: _hasCurrencyCode
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CText.headline(
                      widget.value!.toUpperCase(),
                      color: CColors.text,
                      fontWeight: FontWeight.bold,
                    ),
                    CText.body(
                      widget.currencyCode!.toUpperCase(),
                      color: CColors.text,
                    ),
                  ],
                )
              : CTextField(
                  onChanged: widget.onChanged,
                  enabled: widget.enabled,
                ),
        ),
      ],
    );
  }
}

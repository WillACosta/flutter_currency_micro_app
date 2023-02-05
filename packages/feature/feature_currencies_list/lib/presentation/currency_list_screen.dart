import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class CurrenciesListScreen extends StatelessWidget {
  const CurrenciesListScreen({super.key});

  static final _items = [
    'USD - United States Dollar',
    'EUR - Euro',
    'BRL - Brazilian Real',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.background,
      body: SafeArea(
        child: Container(
          padding: CSpacingInsets.sm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CText.headline('Currency\nConverter'),
              CSpacingStack.md,
              const CAmountRow(label: 'Amount'),
              CSpacingStack.lg,
              CDropdownButton(items: _items),
              CDropdownButton(items: _items),
              CSpacingStack.lg,
              CButton(
                onPressed: () {},
                labelText: 'Convert',
              ),
              CSpacingStack.lg,
              const CAmountRow(
                enabled: false,
                label: 'Result',
                currencyCode: 'BRL',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

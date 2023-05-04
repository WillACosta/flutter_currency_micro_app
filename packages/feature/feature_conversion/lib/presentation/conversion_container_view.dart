import 'package:core_dependency_injection/core_dependency_injection.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_currencies_list/presentation/currency_list_view.dart';
import 'package:flutter/material.dart';

import 'store/conversion_store.dart';

class ConversionContainerView extends StatefulWidget {
  const ConversionContainerView({Key? key}) : super(key: key);

  @override
  State<ConversionContainerView> createState() =>
      _ConversionContainerViewState();
}

class _ConversionContainerViewState extends State<ConversionContainerView> {
  final store = serviceLocator<ConversionStore>();

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
            CAmountRow(
              label: 'Amount',
              onChanged: store.setAmount,
            ),
            CSpacingStack.lg,
            CurrencyListView(onSelectedCurrency: store.onChangeOriginCurrency),
            const Divider(color: CColors.text),
            CurrencyListView(onSelectedCurrency: store.onChangeDesireCurrency),
            CSpacingStack.lg,
            CButton(
              onPressed: store.convertValue,
              labelText: 'Convert',
            ),
            CSpacingStack.lg,
            ValueListenableBuilder(
              valueListenable: store.ratesResult,
              builder: (_, value, __) {
                final currencyRates = value?.rates.values.first;
                final rateForAmount = currencyRates?.rateForAmount;
                final currencyCode = currencyRates?.currencyName;

                if (value == null) return const SizedBox.shrink();

                return CAmountRow(
                  value: rateForAmount!.toStringAsFixed(2),
                  enabled: false,
                  label: 'Result',
                  currencyCode: currencyCode,
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

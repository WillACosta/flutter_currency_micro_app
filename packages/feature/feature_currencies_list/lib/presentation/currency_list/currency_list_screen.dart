import 'package:core_commons/core_commons.dart';
import 'package:core_dependency_injection/core_dependency_injection.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'currency_list_vm.dart';

class CurrenciesListScreen extends StatefulWidget {
  const CurrenciesListScreen({super.key});

  @override
  State<CurrenciesListScreen> createState() => _CurrenciesListScreenState();
}

class _CurrenciesListScreenState extends State<CurrenciesListScreen> {
  final vm = serviceLocator<CurrencyListViewModel>();

  @override
  void initState() {
    super.initState();
    vm.errorStream.listen((event) {
      context.showSnackBar(message: event, error: true);
    });
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

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
                onChanged: vm.onChangeAmountValue,
              ),
              CSpacingStack.lg,
              StreamBuilder(
                stream: vm.currenciesStream,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return CDropdownButton(
                      items: snapshot.data!,
                      onChanged: vm.onChangeFromCurrency,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
              const Divider(color: CColors.text),
              StreamBuilder(
                stream: vm.currenciesStream,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return CDropdownButton(
                      items: snapshot.data!,
                      onChanged: vm.onChangeToCurrency,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
              CSpacingStack.lg,
              CButton(
                onPressed: vm.onConvert,
                labelText: 'Convert',
              ),
              CSpacingStack.lg,
              StreamBuilder(
                stream: vm.currencyRatesStream,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;

                    return CAmountRow(
                      value: data?.rates.values.first.rateForAmount
                          .toStringAsFixed(2),
                      enabled: false,
                      label: 'Result',
                      currencyCode: data?.rates.keys.first,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

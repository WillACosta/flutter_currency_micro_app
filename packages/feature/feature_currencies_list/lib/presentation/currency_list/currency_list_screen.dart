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
              StreamBuilder(
                stream: vm.stream,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return CDropdownButton(items: snapshot.data);
                  }

                  return const SizedBox.shrink();
                },
              ),
              const Divider(color: CColors.text),
              StreamBuilder(
                stream: vm.stream,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return CDropdownButton(items: snapshot.data);
                  }

                  return const SizedBox.shrink();
                },
              ),
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

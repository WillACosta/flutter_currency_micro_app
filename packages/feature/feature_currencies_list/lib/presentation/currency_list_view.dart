import 'package:core_dependency_injection/core_dependency_injection.dart';
import 'package:core_domain/core_domain.dart';
import 'package:feature_currencies_list/presentation/currency_list_store.dart';
import 'package:feature_currencies_list/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CurrencyListView extends StatefulWidget {
  final Function(Currency?)? onSelectedCurrency;
  const CurrencyListView({super.key, this.onSelectedCurrency});

  @override
  State<CurrencyListView> createState() => _CurrencyListViewState();
}

class _CurrencyListViewState extends State<CurrencyListView> {
  final store = serviceLocator<CurrencyListStore>();

  @override
  void initState() {
    store.init();
    _setListeners();

    super.initState();
  }

  _setListeners() {
    store.state.addListener(() {
      if (store.state.value == ListCurrenciesState.error) {
        // TODO: show snackbar
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store.state,
      builder: (_, state, __) {
        final shouldShowProgress = [
          ListCurrenciesState.loading,
          ListCurrenciesState.initial
        ].contains(state);

        if (shouldShowProgress) {
          return const LinearProgressIndicator();
        }

        return CDropdownButton(
          items: store.currencies,
          onChanged: (item) => widget.onSelectedCurrency?.call(item),
        );
      },
    );
  }
}

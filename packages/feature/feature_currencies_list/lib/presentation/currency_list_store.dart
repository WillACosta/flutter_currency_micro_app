import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';
import 'package:core_domain/core_domain.dart';
import 'package:flutter/material.dart';

enum ListCurrenciesState {
  initial,
  loading,
  success,
  error,
}

abstract class CurrencyListStore {
  late List<Currency> currencies;
  late ValueNotifier<ListCurrenciesState> state;
  void init();
}

@Injectable(as: CurrencyListStore)
class CCurrencyListStore implements CurrencyListStore {
  CCurrencyListStore(this._useCase);
  final ListAllCurrenciesUseCase _useCase;

  @override
  List<Currency> currencies = [];

  @override
  ValueNotifier<ListCurrenciesState> state = ValueNotifier(
    ListCurrenciesState.initial,
  );

  @override
  void init() {
    _listCurrencies();
  }

  void _setState(ListCurrenciesState state) {
    this.state.value = state;
  }

  Future<void> _listCurrencies() async {
    _setState(ListCurrenciesState.loading);

    final foldable = await _useCase(unit);
    return foldable.fold(
      (l) => _setState(ListCurrenciesState.error),
      (r) {
        currencies = r;
        _setState(ListCurrenciesState.success);
      },
    );
  }
}

import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';
import 'package:core_domain/core_domain.dart';
import 'package:flutter/material.dart';

abstract class CurrencyListStore {
  late List<Currency> currencies;
  late ValueNotifier<ViewState> state;
  late String? errorMessage;

  void init();
}

@Injectable(as: CurrencyListStore)
class CCurrencyListStore implements CurrencyListStore {
  CCurrencyListStore(this._useCase);
  final ListAllCurrenciesUseCase _useCase;

  @override
  List<Currency> currencies = [];

  @override
  String? errorMessage;

  @override
  ValueNotifier<ViewState> state = ValueNotifier(
    ViewState.initial,
  );

  @override
  void init() {
    _listCurrencies();
  }

  void _setState(ViewState state) {
    this.state.value = state;
  }

  Future<void> _listCurrencies() async {
    _setState(ViewState.loading);

    final foldable = await _useCase(unit);
    return foldable.fold(
      (l) {
        errorMessage = l.message;
        _setState(ViewState.error);
      },
      (r) {
        currencies = r;
        _setState(ViewState.success);
      },
    );
  }
}

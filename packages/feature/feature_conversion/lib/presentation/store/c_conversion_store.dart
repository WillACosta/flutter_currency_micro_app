import 'package:core_dependencies/injectable_dependencies.dart';
import 'package:core_domain/core_domain.dart';
import 'package:flutter/widgets.dart';

import 'conversion_store.dart';

@Singleton(as: ConversionStore)
class CConversionStore implements ConversionStore {
  final ConvertCurrencyUseCase _convertCurrencyUseCase;
  CConversionStore(this._convertCurrencyUseCase);

  @override
  ValueNotifier<CurrencyRates?> ratesResult = ValueNotifier(null);

  @override
  ValueNotifier<ViewState> uiState = ValueNotifier(ViewState.initial);

  Currency? _originCurrency;
  Currency? _desireCurrency;
  double _amount = 0;

  @override
  Future<void> convertValue() async {
    if (_originCurrency == null || _desireCurrency == null) return;

    _setState(ViewState.loading);

    final originCurrency = _originCurrency?.code;
    final desireCurrency = _desireCurrency?.code;

    final params = ConvertCurrencyParams(
        from: originCurrency!, to: desireCurrency!, amount: _amount);

    final foldable = await _convertCurrencyUseCase(params);

    foldable.fold(
      (l) => _setState(ViewState.error),
      (r) {
        ratesResult.value = r;
        _setState(ViewState.success);
      },
    );
  }

  @override
  void onChangeDesireCurrency(Currency? currency) => _desireCurrency = currency;

  @override
  void onChangeOriginCurrency(Currency? currency) => _originCurrency = currency;

  @override
  void setAmount(String value) => _amount = double.tryParse(value) ?? 0;

  void _setState(ViewState state) => uiState.value = state;
}

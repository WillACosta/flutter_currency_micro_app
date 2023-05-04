import 'package:core_commons/core_commons.dart';
import 'package:core_domain/core_domain.dart';
import 'package:flutter/foundation.dart';

abstract class ConversionStore {
  abstract ValueNotifier<CurrencyRates?> ratesResult;
  abstract ValueNotifier<ViewState> uiState;

  Future<void> convertValue();

  void onChangeOriginCurrency(Currency? currency);
  void onChangeDesireCurrency(Currency? currency);
  void setAmount(String value);
}

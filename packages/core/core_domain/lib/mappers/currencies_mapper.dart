import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_domain/models/models.dart';
import 'package:core_network/core_network.dart';

extension CurrencyExtensions on NetworkCurrenciesResponse {
  List<Currency> toListOfCurrency() {
    return currencies.entries.map((object) {
      final key = object.key;
      final value = object.value;

      return Currency(
        code: key,
        fullName: value,
        displayCurrencyText: '$key - $value',
      );
    }).toList();
  }
}

extension CurrencyRatesExtension on NetworkCurrencyConversionResponse {
  CurrencyRates toCurrencyRates() {
    return CurrencyRates(
      fromCurrencyCode: baseCurrencyCode,
      fromCurrencyName: baseCurrencyName,
      amount: double.parse(amount),
      rates: rates.mapValue(
        (value) => Rate(
          currencyName: value.currencyName,
          rate: double.parse(value.rate),
          rateForAmount: double.parse(value.rateForAmount),
        ),
      ),
    );
  }
}

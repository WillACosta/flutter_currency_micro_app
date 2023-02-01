import 'package:core_domain/core_domain.dart';

abstract class MockCurrencies {
  static const _currencyRate = {
    'BRL': 'Brazilian Real',
    'USD': 'United States Dolar',
    'EUR': 'Euro',
    'CLP': 'Chilian Peso',
  };

  static const currenciesList = Currencies(_currencyRate);

  static final currencyRates = CurrencyRates(
    fromCurrencyCode: 'USD',
    fromCurrencyName: 'Euro',
    amount: 1200.00,
    rates: Map.from({
      'BRL': Rate(
        currencyName: 'Brazilian Real',
        rate: 200.00,
        rateForAmount: 1200.00,
      ),
    }),
  );
}

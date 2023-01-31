import 'package:core_domain/core_domain.dart';

abstract class MockCurrencies {
  static const currenciesList = Currencies(
    {
      'BRL': 'Brazilian Real',
      'USD': 'United States Dolar',
      'EUR': 'Euro',
      'CLP': 'Chilian Peso',
    },
  );
}

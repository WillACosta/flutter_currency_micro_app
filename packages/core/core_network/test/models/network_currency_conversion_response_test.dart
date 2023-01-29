import 'dart:collection';

import 'package:core_network/models/network_currency_conversion_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NetworkCurrenciesResponse', () {
    test('should supports values comparisons', () {
      expect(
        NetworkCurrencyConversionResponse(
          baseCurrencyCode: 'EUR',
          baseCurrencyName: 'Euro',
          amount: '400',
          updatedDate: DateTime.parse('2012-02-27'),
          rates: HashMap.from(
            {
              'BRL': Rates(
                currencyName: 'Brazilian Real',
                rate: 'BRL',
                rateForAmount: '900',
              ),
            },
          ),
          status: 'success',
        ),
        NetworkCurrencyConversionResponse(
          baseCurrencyCode: 'EUR',
          baseCurrencyName: 'Euro',
          amount: '400',
          updatedDate: DateTime.parse('2012-02-27'),
          rates: HashMap.from(
            {
              'BRL': Rates(
                currencyName: 'Brazilian Real',
                rate: 'BRL',
                rateForAmount: '900',
              ),
            },
          ),
          status: 'success',
        ),
      );
    });
  });
}

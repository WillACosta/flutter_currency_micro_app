import 'dart:collection';

import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_network/core_network.dart';
import 'package:core_test/core_test.dart';
import 'package:core_data/repositories/c_remote_currency_repository.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late CurrencyApiService service;
  late CRemoteCurrencyRepository repository;

  setUpAll(() {
    registerFallbackValue('EUR');
    registerFallbackValue('BRL');
    registerFallbackValue('1200');
  });

  setUp(() {
    service = MockCurrencyApiService();
    repository = CRemoteCurrencyRepository(service);
  });

  group('CRemoteCurrencyRepository', () {
    test(
      'should call service method and return an Right with Currencies instance',
      () async {
        setUpServiceResponseOf(
          () => service.listAllCurrencies(),
          body: NetworkCurrenciesResponse(
            currencies: const {},
            status: 'success',
          ),
          statusCode: 200,
        );

        final actual = await repository.listCurrencies();

        expect(actual, isA<Right<Failure, Currencies>>());
        verify(() => service.listAllCurrencies());
      },
    );

    test(
      'should call service method and return an Right with CurrencyRates',
      () async {
        setUpServiceResponseOf(
          () => service.convertCurrency(any(), any(), any()),
          body: NetworkCurrencyConversionResponse(
            amount: '12',
            baseCurrencyCode: 'EUR',
            baseCurrencyName: 'Euro',
            status: 'success',
            updatedDate: DateTime.parse('2012-02-27'),
            rates: HashMap.from(
              {
                'BRL': Rates(
                  currencyName: 'Brazilian Real',
                  rate: '20',
                  rateForAmount: '20',
                ),
              },
            ),
          ),
          statusCode: 200,
        );

        final actual = await repository.convertCurrency(
          from: '',
          to: '',
          amount: '',
        );

        expect(actual, isA<Right<Failure, CurrencyRates>>());
        verify(() => service.convertCurrency(any(), any(), any()));
      },
    );
  });
}

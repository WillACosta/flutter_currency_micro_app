import 'package:flutter_test/flutter_test.dart';

import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_domain/models/currencies.dart';
import 'package:core_network/core_network.dart';
import 'package:core_test/core_test.dart';
import 'package:core_data/repositories/c_remote_currency_repository.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late CurrencyApiService service;
  late CRemoteCurrencyRepository repository;

  setUp(() {
    service = MockCurrencyApiService();
    repository = CRemoteCurrencyRepository(service);
  });

  group('RemoteCurrencyRepository', () {
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
  });
}

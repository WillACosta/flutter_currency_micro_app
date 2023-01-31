import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:core_data/repositories/currency_repository.dart';
import 'package:core_domain/usecases/list_all_currencies_usecase.dart';
import 'package:core_test/core_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late ListAllCurrenciesUseCase useCase;
  late CurrencyRepository repository;

  setUp(() {
    repository = MockCurrencyRepository();
    useCase = ListAllCurrenciesUseCase(repository);
  });

  group('ListAllCurrenciesUseCase', () {
    test('should call method and returns correctly', () async {
      when(() => repository.listCurrencies()).thenAnswer(
        (_) async => const Right(MockCurrencies.currenciesList),
      );

      final actual = await useCase(unit);

      expect(actual, isA<Right>());
      verify(() => repository.listCurrencies());
    });
  });
}

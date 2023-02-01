import 'package:core_commons/core_commons.dart';
import 'package:core_data/core_data.dart';
import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_domain/core_domain.dart';
import 'package:core_test/core_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late ConvertCurrencyUseCase useCase;
  late CurrencyRepository repository;

  setUpAll(() {
    registerFallbackValue('USD');
    registerFallbackValue('BRL');
    registerFallbackValue('1200.00');
  });

  setUp(() {
    repository = MockCurrencyRepository();
    useCase = ConvertCurrencyUseCase(repository);
  });

  void setUpRepositoryResponse() {
    when(
      () => repository.convertCurrency(
        from: any(named: 'from'),
        to: any(named: 'to'),
        amount: any(named: 'amount'),
      ),
    ).thenAnswer(
      (_) async => Right(MockCurrencies.currencyRates),
    );
  }

  group('ConvertCurrencyUseCase', () {
    test('should call method and returns correctly', () async {
      const params = ConvertCurrencyParams(
        from: 'USD',
        to: 'BRL',
        amount: 1500.00,
      );

      setUpRepositoryResponse();

      expect(await useCase(params), isA<Right<Failure, CurrencyRates>>());

      verify(
        () => repository.convertCurrency(
          from: any(named: 'from'),
          to: any(named: 'to'),
          amount: any(named: 'amount'),
        ),
      );
    });
  });
}

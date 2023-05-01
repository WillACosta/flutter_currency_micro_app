import 'package:core_commons/core_commons.dart';
import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';
import 'package:core_dependencies/rxdart_dependencies.dart';
import 'package:core_domain/core_domain.dart';

@injectable
class CurrencyListViewModel {
  final ListAllCurrenciesUseCase _listCurrenciesUseCase;
  final ConvertCurrencyUseCase _convertCurrencyUseCase;

  final _currenciesList = BehaviorSubject<List<Currency>>();
  final _currencyRates = BehaviorSubject<CurrencyRates>();
  final _amountValue = BehaviorSubject<double>();

  final _fromCurrency = BehaviorSubject<String>();
  final _toCurrency = BehaviorSubject<String>();

  final _error = BehaviorSubject<String?>();

  Stream<List<Currency>> get currenciesStream => _currenciesList.stream;
  Stream<CurrencyRates> get currencyRatesStream => _currencyRates.stream;
  Stream<String?> get errorStream => _error.stream;

  CurrencyListViewModel(
    this._listCurrenciesUseCase,
    this._convertCurrencyUseCase,
  ) {
    _init();
  }

  onChangeFromCurrency(Currency? currency) {
    if (currency != null) {
      _fromCurrency.sink.add(currency.code);
    }
  }

  onChangeToCurrency(Currency? currency) {
    if (currency != null) {
      _toCurrency.sink.add(currency.code);
    }
  }

  onChangeAmountValue(String value) {
    _amountValue.sink.add(double.parse(value));
  }

  Future onConvert() async {
    final result = await _convertCurrencyUseCase(
      ConvertCurrencyParams(
        from: _fromCurrency.value,
        to: _toCurrency.value,
        amount: _amountValue.value,
      ),
    );

    result.fold(_onError, _updateCurrencyRates);
  }

  _init() async {
    final foldable = await _listCurrenciesUseCase(unit);

    foldable.fold(
      (l) => _updateCurrencies([]),
      (r) => _updateCurrencies(r),
    );
  }

  _updateCurrencies(List<Currency> currencies) {
    _currenciesList.sink.add(currencies);
  }

  _updateCurrencyRates(CurrencyRates value) {
    _currencyRates.sink.add(value);
  }

  _onError(Failure failure) {
    _error.sink.add(failure.message);
  }

  dispose() {
    final subjects = [
      _currenciesList,
      _currencyRates,
      _amountValue,
      _fromCurrency,
      _toCurrency,
    ];

    for (final subject in subjects) {
      subject.close();
    }
  }
}

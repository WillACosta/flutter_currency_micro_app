import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';
import 'package:core_dependencies/rxdart_dependencies.dart';
import 'package:core_domain/core_domain.dart';

@injectable
class CurrencyListViewModel {
  final ListAllCurrenciesUseCase _useCase;

  Stream get stream => _currenciesList.stream;
  final _currenciesList = BehaviorSubject<List<Currency>>();

  CurrencyListViewModel(this._useCase) {
    _init();
  }

  _init() async {
    final resultOrError = await _useCase(unit);

    resultOrError.fold(
      (l) => _updateCurrencies([]),
      (r) => _updateCurrencies(r),
    );
  }

  _updateCurrencies(List<Currency> currencies) {
    _currenciesList.sink.add(currencies);
  }
}

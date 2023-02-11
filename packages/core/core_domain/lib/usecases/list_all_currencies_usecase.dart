import 'package:core_commons/core_commons.dart';
import 'package:core_data/repositories/currency_repository.dart';
import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';

import '../models/currencies.dart';

@injectable
class ListAllCurrenciesUseCase
    implements AsyncEitherUseCase<List<Currency>, Unit> {
  final CurrencyRepository _repository;

  ListAllCurrenciesUseCase(this._repository);

  @override
  AsyncEither<List<Currency>> call(Unit params) async {
    return await _repository.listCurrencies();
  }
}

import 'package:core_commons/core_commons.dart';
import 'package:core_data/repositories/currency_repository.dart';
import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';

import '../models/currencies.dart';

@Injectable()
class ListAllCurrenciesUseCase implements AsyncEitherUseCase<Currencies, Unit> {
  final CurrencyRepository _repository;

  ListAllCurrenciesUseCase(this._repository);

  @override
  AsyncEither<Currencies> call(Unit params) async {
    return await _repository.listCurrencies();
  }
}

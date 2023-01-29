import 'package:core_commons/core_commons.dart';
import 'package:core_domain/core_domain.dart';

abstract class CurrencyRepository {
  AsyncEither<Currencies> listCurrencies();
}

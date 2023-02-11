import 'package:core_commons/core_commons.dart';
import 'package:core_domain/core_domain.dart';

abstract class CurrencyRepository {
  AsyncEither<List<Currency>> listCurrencies();

  AsyncEither<CurrencyRates> convertCurrency({
    required String from,
    required String to,
    required String amount,
  });
}

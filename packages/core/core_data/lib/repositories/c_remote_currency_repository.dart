import 'package:core_commons/core_commons.dart';
import 'package:core_domain/models/currencies.dart';
import 'package:core_network/core_network.dart';

import 'currency_repository.dart';

class CRemoteCurrencyRepository implements CurrencyRepository {
  final CurrencyApiService _service;

  CRemoteCurrencyRepository(this._service);

  @override
  AsyncEither<Currencies> listCurrencies() async {
    final foldable = await safeApiCall(() => _service.listAllCurrencies());
    return foldable.map((r) => Currencies(r.currencies));
  }
}

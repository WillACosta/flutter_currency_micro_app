import 'package:core_commons/core_commons.dart';
import 'package:core_domain/core_domain.dart';
import 'package:core_domain/mappers/currencies_mapper.dart';
import 'package:core_network/core_network.dart';

import 'currency_repository.dart';

class CRemoteCurrencyRepository implements CurrencyRepository {
  final CurrencyApiService _service;

  CRemoteCurrencyRepository(this._service);

  @override
  AsyncEither<Currencies> listCurrencies() async {
    final foldable = await safeApiCall(() => _service.listAllCurrencies());
    return foldable.map((r) => r.toCurrencies());
  }

  @override
  AsyncEither<CurrencyRates> convertCurrency({
    required String from,
    required String to,
    required String amount,
  }) async {
    final foldable = await safeApiCall(
      () => _service.convertCurrency(from, to, amount),
    );

    return foldable.map((value) => value.toCurrencyRates());
  }
}

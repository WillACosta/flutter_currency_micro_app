import 'package:core_commons/core_commons.dart';
import 'package:core_data/core_data.dart';
import 'package:core_dependencies/main.dart';

import '../models/models.dart';

typedef UseCaseType = AsyncEitherUseCase<CurrencyRates, ConvertCurrencyParams>;

class ConvertCurrencyUseCase implements UseCaseType {
  final CurrencyRepository _repository;
  ConvertCurrencyUseCase(this._repository);

  @override
  AsyncEither<CurrencyRates> call(ConvertCurrencyParams params) async {
    return await _repository.convertCurrency(
      from: params.from,
      to: params.to,
      amount: params.toString(),
    );
  }
}

class ConvertCurrencyParams extends Equatable {
  final String from;
  final String to;
  final double amount;

  const ConvertCurrencyParams({
    required this.from,
    required this.to,
    required this.amount,
  });

  @override
  List<Object?> get props => [
        from,
        to,
        amount,
      ];
}

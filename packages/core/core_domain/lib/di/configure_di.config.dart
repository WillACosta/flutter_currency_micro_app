// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i4;
import 'package:core_data/repositories/currency_repository.dart' as _i6;
import 'package:core_domain/usecases/convert_currency_usecase.dart' as _i3;
import 'package:core_domain/usecases/list_all_currencies_usecase.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt $initModuleGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ConvertCurrencyUseCase>(
        () => _i3.ConvertCurrencyUseCase(gh<_i4.CurrencyRepository>()));
    gh.factory<_i5.ListAllCurrenciesUseCase>(
        () => _i5.ListAllCurrenciesUseCase(gh<_i6.CurrencyRepository>()));
    return this;
  }
}

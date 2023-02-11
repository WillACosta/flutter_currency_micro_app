import 'package:core_dependencies/get_it_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';
import 'package:feature_currencies_list/di/configure_di.config.dart';

@InjectableInit(initializerName: r'$initModuleGetIt')
void configureCurrenciesListModuleDI(GetIt getItInstance) {
  getItInstance.$initModuleGetIt();
}

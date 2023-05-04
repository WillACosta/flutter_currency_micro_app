import 'package:core_data/di/configure_di.dart';
import 'package:core_dependencies/get_it_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';
import 'package:core_dependency_injection/configure_dependencies.config.dart';
import 'package:core_domain/di/configure_di.dart';
import 'package:core_network/di/configure_di.dart';
import 'package:feature_conversion/di/configure_di.dart';
import 'package:feature_currencies_list/di/configure_di.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
void configureDependencies() {
  configureNetworkModuleDI(serviceLocator);
  configureDataModuleDI(serviceLocator);
  configureDomainModuleDI(serviceLocator);
  configureCurrenciesListModuleDI(serviceLocator);
  configureCurrencyConversionModuleDI(serviceLocator);

  serviceLocator.$initGetIt();
}

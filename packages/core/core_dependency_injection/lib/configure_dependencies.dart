import 'package:core_dependencies/get_it_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';
import 'package:core_dependency_injection/configure_dependencies.config.dart';
import 'package:core_network/di/configure_network_module_di.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
void configureDependencies() {
  configureNetworkModuleDI(serviceLocator);
  serviceLocator.$initGetIt();
}

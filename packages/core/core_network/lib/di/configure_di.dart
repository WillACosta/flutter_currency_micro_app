import 'package:core_dependencies/get_it_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';
import 'package:core_network/di/configure_di.config.dart';

@InjectableInit(initializerName: r'$initModuleGetIt')
void configureNetworkModuleDI(GetIt getItInstance) {
  getItInstance.$initModuleGetIt();
}

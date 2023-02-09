import 'package:core_data/di/configure_di.config.dart';
import 'package:core_dependencies/get_it_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';

@InjectableInit(initializerName: r'$initModuleGetIt')
void configureDataModuleDI(GetIt getItInstance) {
  getItInstance.$initModuleGetIt();
}

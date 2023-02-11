import 'package:core_dependencies/chopper_dependencies.dart';
import 'package:core_dependencies/injectable_dependencies.dart';

import '../converters/json_serializable_converter.dart';
import '../interceptors/api_interceptor.dart';

@lazySingleton
class ApiClient extends ChopperClient {
  ApiClient()
      : super(
          baseUrl: Uri.parse('https://api.getgeoapi.com/v2'),
          converter: JsonSerializableConverter(),
          interceptors: [HttpLoggingInterceptor(), ApiInterceptor()],
        );
}

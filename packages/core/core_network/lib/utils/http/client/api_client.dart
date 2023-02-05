import 'package:core_dependencies/chopper_dependencies.dart';

import '../converters/json_serializable_converter.dart';

class ApiClient extends ChopperClient {
  ApiClient()
      : super(
          baseUrl: Uri.parse('https://packers.azurewebsites.net/api'),
          converter: JsonSerializableConverter(),
          interceptors: [HttpLoggingInterceptor()],
        );
}

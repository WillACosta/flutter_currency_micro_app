import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:core_dependencies/flutter_dotenv_dependencies.dart' show dotenv;

class ApiInterceptor implements RequestInterceptor {
  final _apiKey = dotenv.env['API_KEY'];

  @override
  FutureOr<Request> onRequest(Request request) {
    final currentParameters = request.parameters;
    currentParameters.addAll({'api_key': _apiKey});

    return request.copyWith(parameters: currentParameters);
  }
}

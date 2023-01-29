import 'dart:async';

import 'package:core_dependencies/main.dart';
import 'json_type_parser.dart';

class JsonSerializableConverter extends JsonConverter {
  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
    Response response,
  ) async {
    final jsonRes = await super.convertResponse(response);
    return response.copyWith<ResultType>(
      body: JsonTypeParser.decode<Item>(jsonRes.body),
    );
  }

  @override
  Request convertRequest(Request request) => super.convertRequest(request);

  @override
  FutureOr<Response> convertError<ResultType, Item>(
    Response response,
  ) async {
    final jsonRes = await super.convertError(response);

    // TODO: swith Item to ResponseErrorCustomModel
    return response.copyWith<ResultType>(
      bodyError: JsonTypeParser.decode<Item>(jsonRes.body),
    );
  }
}

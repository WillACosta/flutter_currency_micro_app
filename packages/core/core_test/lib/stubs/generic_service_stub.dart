import 'package:core_dependencies/chopper_dependencies.dart';
import 'package:core_dependencies/http_dependencies.dart' as http;
import 'package:mocktail/mocktail.dart';

void setUpServiceResponseOf<T>(
  Future<Response<T>> Function() stubFn, {
  required T body,
  required int statusCode,
}) {
  when(stubFn).thenAnswer(
    (_) async {
      return Response(
        http.Response(body.toString(), statusCode),
        body,
      );
    },
  );
}

void setUpServiceExceptionResponse<T>(Future<Response<T>> Function() stubFn) {
  when(stubFn).thenThrow((_) => Exception('Could not complete your request.'));
}

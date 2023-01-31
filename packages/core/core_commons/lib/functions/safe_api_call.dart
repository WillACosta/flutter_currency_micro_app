import 'package:core_dependencies/fpdart_dependencies.dart';
import 'package:core_dependencies/main.dart';

import '../errors/failure/failure.dart';
import '../types/either_types.dart';

AsyncEither<T> safeApiCall<T>(
  Future<Response<T>> Function() callback,
) async {
  try {
    final response = await callback.call();
    return option(
      response,
      (_) => response.isSuccessful,
    ).match(
      () => const Left(Failure.unexpected()),
      (data) => Right(data.body as T),
    );
  } catch (e) {
    return Left(Failure.unexpected(e.toString()));
  }
}

import '../types/types.dart';

abstract class SyncEitherUseCase<Source, Params> {
  SyncEither<Source> call(Params params);
}

abstract class AsyncEitherUseCase<Source, Params> {
  AsyncEither<Source> call(Params params);
}

abstract class AsyncCompletableUseCase<Source, Params> {
  Future<Source> call(Params params);
}

import 'package:core_dependencies/fpdart_dependencies.dart';

import '../errors/errors.dart';

typedef AsyncEither<T> = Future<Either<Failure, T>>;
typedef SyncEither<T> = Either<Failure, T>;

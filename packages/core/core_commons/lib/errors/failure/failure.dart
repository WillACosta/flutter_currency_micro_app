import 'package:core_dependencies/freezed_annotation_dependencies.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unexpected([String? message]) = _Unexpected;
  const factory Failure.apiError([String? message]) = _ApiError;
}

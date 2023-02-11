import 'package:core_dependencies/equatable_dependencies.dart';

class Currency extends Equatable {
  final String code;
  final String fullName;
  final String displayCurrencyText;

  const Currency({
    required this.code,
    required this.fullName,
    required this.displayCurrencyText,
  });

  @override
  List<Object?> get props => [code, fullName];
}

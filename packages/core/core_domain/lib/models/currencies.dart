import 'package:core_dependencies/main.dart';

class Currencies extends Equatable {
  final Map<String, String> currencies;

  const Currencies(this.currencies);

  @override
  List<Object?> get props => [currencies];
}

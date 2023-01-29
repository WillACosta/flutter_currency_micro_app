import 'package:core_dependencies/main.dart';

class NetworkCurrenciesResponse extends Equatable {
  final Map<String, String> currencies;
  final String status;

  NetworkCurrenciesResponse(
    this.currencies,
    this.status,
  );

  @override
  List<Object?> get props => [currencies, status];

  factory NetworkCurrenciesResponse.fromMap(Map<String, dynamic> map) {
    return NetworkCurrenciesResponse(
      Map<String, String>.from(map['currencies']),
      map['status'] ?? '',
    );
  }
}

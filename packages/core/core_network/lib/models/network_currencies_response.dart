import 'package:core_dependencies/equatable_dependencies.dart';

class NetworkCurrenciesResponse extends Equatable {
  final Map<String, String> currencies;
  final String status;

  NetworkCurrenciesResponse({
    required this.currencies,
    required this.status,
  });

  @override
  List<Object?> get props => [currencies, status];

  factory NetworkCurrenciesResponse.fromMap(Map<String, dynamic> map) {
    return NetworkCurrenciesResponse(
      currencies: Map<String, String>.from(map['currencies']),
      status: map['status'] ?? '',
    );
  }
}

import 'dart:collection';

import 'package:core_dependencies/main.dart';

class NetworkCurrencyConversionResponse extends Equatable {
  final String baseCurrencyCode;
  final String baseCurrencyName;
  final String amount;
  final DateTime updatedDate;
  final HashMap<String, Rates> rates;
  final String status;

  NetworkCurrencyConversionResponse(
    this.baseCurrencyCode,
    this.baseCurrencyName,
    this.amount,
    this.updatedDate,
    this.rates,
    this.status,
  );

  @override
  List<Object?> get props => [
        baseCurrencyCode,
        baseCurrencyName,
        amount,
        updatedDate,
        rates,
        status,
      ];

  factory NetworkCurrencyConversionResponse.fromMap(Map<String, dynamic> map) {
    return NetworkCurrencyConversionResponse(
      map['baseCurrencyCode'] ?? '',
      map['baseCurrencyName'] ?? '',
      map['amount'] ?? '',
      DateTime.fromMillisecondsSinceEpoch(map['updatedDate']),
      HashMap<String, Rates>.from(map['rates']),
      map['status'] ?? '',
    );
  }
}

class Rates extends Equatable {
  final String currencyName;
  final String rate;
  final String rateForAmount;

  Rates({
    required this.currencyName,
    required this.rate,
    required this.rateForAmount,
  });

  @override
  List<Object?> get props => [currencyName, rate, rateForAmount];

  factory Rates.fromMap(Map<String, dynamic> map) {
    return Rates(
      currencyName: map['currencyName'] ?? '',
      rate: map['rate'] ?? '',
      rateForAmount: map['rateForAmount'] ?? '',
    );
  }
}

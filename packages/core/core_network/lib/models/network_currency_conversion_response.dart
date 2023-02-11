import 'dart:collection';

import 'package:core_dependencies/equatable_dependencies.dart';

class NetworkCurrencyConversionResponse extends Equatable {
  final String baseCurrencyCode;
  final String baseCurrencyName;
  final String amount;
  final DateTime updatedDate;
  final HashMap<String, Rates> rates;
  final String status;

  NetworkCurrencyConversionResponse({
    required this.baseCurrencyCode,
    required this.baseCurrencyName,
    required this.amount,
    required this.updatedDate,
    required this.rates,
    required this.status,
  });

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
      baseCurrencyCode: map['base_currency_code'] ?? '',
      baseCurrencyName: map['base_currency_ame'] ?? '',
      amount: map['amount'] ?? '',
      updatedDate: DateTime.parse(map['updated_date']),
      rates: _parseRates(map['rates']),
      status: map['status'] ?? '',
    );
  }

  static HashMap<String, Rates> _parseRates(
    Map<String, dynamic> rates,
  ) {
    HashMap<String, Rates> hashMap = HashMap();

    rates.entries.forEach((e) {
      hashMap.addAll({e.key: Rates.fromMap(e.value)});
    });

    return hashMap;
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
      currencyName: map['currency_name'] ?? '',
      rate: map['rate'] ?? '',
      rateForAmount: map['rate_for_amount'] ?? '',
    );
  }
}

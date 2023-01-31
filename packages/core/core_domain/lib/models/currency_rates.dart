class CurrencyRates {
  final String fromCurrencyCode;
  final String fromCurrencyName;
  final double amount;
  final Map<String, Rate> rates;

  CurrencyRates({
    required this.fromCurrencyCode,
    required this.fromCurrencyName,
    required this.amount,
    required this.rates,
  });
}

class Rate {
  final String currencyName;
  final double rate;
  final double rateForAmount;

  Rate({
    required this.currencyName,
    required this.rate,
    required this.rateForAmount,
  });
}

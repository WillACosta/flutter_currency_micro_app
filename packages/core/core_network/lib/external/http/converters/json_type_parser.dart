import 'package:core_network/models/models.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

abstract class JsonTypeParser {
  static const Map<Type, JsonFactory> factoryConverters = {
    NetworkCurrenciesResponse: NetworkCurrenciesResponse.fromMap,
    NetworkCurrencyConversionResponse:
        NetworkCurrencyConversionResponse.fromMap,
  };

  static dynamic decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity);
    if (entity is Map<String, dynamic>) return _decodeMap<T>(entity);
    return entity;
  }

  static T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factoryConverters[T];

    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      // throw JsonDecodeException(
      //   'Factory Converter not found for given type: $InnerType',
      // );
      throw Exception();
    }

    return jsonFactory(values);
  }

  static List<T> _decodeList<T>(Iterable values) {
    return values
        .where((element) => element != null)
        .map<T>((e) => decode<T>(e))
        .toList();
  }
}

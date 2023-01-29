// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_converter_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CurrencyApiService extends CurrencyApiService {
  _$CurrencyApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CurrencyApiService;

  @override
  Future<Response<NetworkCurrenciesResponse>> listAllCurrencies() {
    final Uri $url = Uri.parse('/currency/list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<NetworkCurrenciesResponse, NetworkCurrenciesResponse>($request);
  }

  @override
  Future<Response<NetworkCurrencyConversionResponse>> convertCurrency(
    String from,
    String to,
    String amount,
  ) {
    final Uri $url = Uri.parse('/currency/convert');
    final Map<String, dynamic> $params = <String, dynamic>{
      'from': from,
      'from': to,
      'from': amount,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<NetworkCurrencyConversionResponse,
        NetworkCurrencyConversionResponse>($request);
  }
}

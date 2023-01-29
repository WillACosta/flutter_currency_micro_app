class JsonDecodeException implements Exception {
  final String? message;

  JsonDecodeException([this.message]);
}

class ServerException implements Exception {
  final String? message;

  ServerException([this.message]);
}

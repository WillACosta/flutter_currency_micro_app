import 'package:core_network/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NetworkCurrenciesResponse', () {
    test('should supports values comparisons', () {
      expect(
        NetworkCurrenciesResponse(currencies: {}, status: 'success'),
        NetworkCurrenciesResponse(currencies: {}, status: 'success'),
      );
    });
  });
}

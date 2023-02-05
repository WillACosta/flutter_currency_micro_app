import 'package:flutter/widgets.dart';

/// Create a proportional side by side spacing with [EdgeInsets]
abstract class CSpacingSquish {
  static const EdgeInsets quark = EdgeInsets.fromLTRB(4, 4, 4, 4);
  static const EdgeInsets nano = EdgeInsets.fromLTRB(16, 8, 16, 8);
  static const EdgeInsets xs = EdgeInsets.fromLTRB(24, 16, 24, 16);
  static const EdgeInsets sm = EdgeInsets.fromLTRB(32, 16, 32, 16);
}

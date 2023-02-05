import 'package:flutter/widgets.dart';

/// Create an internal padding space with [EdgeInsets].
abstract class CSpacingInsets {
  static const EdgeInsets quark = EdgeInsets.fromLTRB(4, 4, 4, 4);
  static const EdgeInsets nano = EdgeInsets.fromLTRB(8, 8, 8, 8);
  static const EdgeInsets xs = EdgeInsets.fromLTRB(16, 16, 16, 16);
  static const EdgeInsets sm = EdgeInsets.fromLTRB(24, 24, 24, 24);
  static const EdgeInsets md = EdgeInsets.fromLTRB(32, 32, 32, 32);
  static const EdgeInsets lg = EdgeInsets.fromLTRB(40, 40, 40, 40);
}

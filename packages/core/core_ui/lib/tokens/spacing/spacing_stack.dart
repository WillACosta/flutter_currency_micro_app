import 'package:flutter/widgets.dart';

/// Create a vertical space with [SizedBox]
abstract class CSpacingStack {
  static const SizedBox quark = SizedBox(height: 4);
  static const SizedBox nano = SizedBox(height: 8);
  static const SizedBox xxxs = SizedBox(height: 16);
  static const SizedBox xxs = SizedBox(height: 24);
  static const SizedBox xs = SizedBox(height: 32);
  static const SizedBox sm = SizedBox(height: 40);
  static const SizedBox md = SizedBox(height: 48);
  static const SizedBox lg = SizedBox(height: 56);
  static const SizedBox xl = SizedBox(height: 64);
  static const SizedBox xxl = SizedBox(height: 80);
  static const SizedBox xxxl = SizedBox(height: 120);
  static const SizedBox huge = SizedBox(height: 160);
  static const SizedBox giant = SizedBox(height: 200);
}

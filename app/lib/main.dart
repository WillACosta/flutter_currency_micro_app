import 'package:core_dependency_injection/core_dependency_injection.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  configureDependencies();
  runApp(const CurrencyApp());
}

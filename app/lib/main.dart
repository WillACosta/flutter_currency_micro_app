import 'package:core_dependency_injection/core_dependency_injection.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'external/environment/setup_dotenv.dart';

Future<void> main() async {
  await setUpDotEnv();
  configureDependencies();

  runApp(const CurrencyApp());
}

import 'package:flutter/material.dart';

import 'package:feature_currencies_list/feature_currencies_list.dart';
import 'package:feature_welcome/feature_welcome.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CurrenciesListScreen(),
    );
  }
}

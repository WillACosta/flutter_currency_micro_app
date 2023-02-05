import 'package:flutter/material.dart';

import 'package:core_dependencies/lottie_dependencies.dart';
import 'package:core_ui/core_ui.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.background,
      body: SafeArea(
        child: Container(
          padding: CSpacingSquish.xs,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Lottie.asset(
                  CAnimations.currencies,
                  package: 'core_ui',
                ),
                CSpacingStack.md,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CText.bodyHead('Convert a currency was never too easy'),
                    CSpacingStack.xxxs,
                    CText.bodySmall(
                      'The best way is here, waiting for you',
                      color: CColors.text,
                    )
                  ],
                ),
                const Spacer(),
                const CButton.floating(
                  child: Icon(
                    CIcons.chevronRight,
                    size: 30,
                    color: CColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

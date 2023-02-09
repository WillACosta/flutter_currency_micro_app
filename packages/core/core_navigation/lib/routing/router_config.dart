import 'package:core_dependencies/go_router_dependencies.dart';
import 'package:feature_currencies_list/feature_currencies_list.dart';
import 'package:feature_welcome/feature_welcome.dart';

import 'app_routes.dart';

final appRouterConfig = GoRouter(
  initialLocation: AppRoutes.initial.path,
  routes: [
    GoRoute(
      path: AppRoutes.initial.path,
      name: AppRoutes.initial.name,
      builder: (_, __) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (_, __) => const CurrenciesListScreen(),
    )
  ],
);

import 'package:auto_route/auto_route.dart';
import 'package:awesome_app_iims/core/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: HotNewsRoute.page),
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: RegistrationRoute.page),

  ];
}

import 'package:auto_route/auto_route.dart';
import 'package:awesome_app_iims/core/router.gr.dart';
import 'package:awesome_app_iims/features/login/presentation/login_page.dart';
import 'package:awesome_app_iims/features/registration/presentation/registeration_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: HotNewsRoute.page),
    AutoRoute(page: RegistrationRoute.page,initial: true),

  ];
}

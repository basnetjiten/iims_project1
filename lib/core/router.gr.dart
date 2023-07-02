// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:awesome_app_iims/features/home/presentation/home_page.dart'
    as _i1;
import 'package:awesome_app_iims/features/hot_news/hot_news_page.dart' as _i2;
import 'package:awesome_app_iims/features/login/presentation/login_page.dart'
    as _i3;
import 'package:awesome_app_iims/features/profile/profile_page.dart' as _i4;
import 'package:awesome_app_iims/main.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    HotNewsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HotNewsPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ProfilePage(
          key: args.key,
          userName: args.userName,
        ),
      );
    },
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HotNewsPage]
class HotNewsRoute extends _i6.PageRouteInfo<void> {
  const HotNewsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HotNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HotNewsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i7.Key? key,
    required String userName,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            userName: userName,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i6.PageInfo<ProfileRouteArgs> page =
      _i6.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.userName,
  });

  final _i7.Key? key;

  final String userName;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [_i5.MyHomePage]
class MyHomeRoute extends _i6.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({
    _i7.Key? key,
    required String title,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          MyHomeRoute.name,
          args: MyHomeRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i6.PageInfo<MyHomeRouteArgs> page =
      _i6.PageInfo<MyHomeRouteArgs>(name);
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({
    this.key,
    required this.title,
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key, title: $title}';
  }
}

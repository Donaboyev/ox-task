// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../presentation/pages/auth/auth_page.dart' as _i5;
import '../../presentation/pages/launcher_page.dart' as _i4;
import '../../presentation/pages/main/home_page.dart' as _i6;
import 'guards/auth_guard.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LauncherRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.LauncherPage();
        }),
    AuthRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.AuthPage();
        }),
    HomeRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.HomePage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LauncherRoute.name, path: '/'),
        _i1.RouteConfig(AuthRoute.name, path: '/auth-page'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-page', guards: [authGuard])
      ];
}

class LauncherRoute extends _i1.PageRouteInfo {
  const LauncherRoute() : super(name, path: '/');

  static const String name = 'LauncherRoute';
}

class AuthRoute extends _i1.PageRouteInfo {
  const AuthRoute() : super(name, path: '/auth-page');

  static const String name = 'AuthRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

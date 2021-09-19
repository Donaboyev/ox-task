// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../data/models/home/products_model.dart' as _i8;
import '../../presentation/pages/auth/auth_page.dart' as _i5;
import '../../presentation/pages/detail/product_detail_page.dart' as _i6;
import '../../presentation/pages/launcher_page.dart' as _i4;
import '../../presentation/pages/main/home_page.dart' as _i7;
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
    ProductDetailRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ProductDetailRouteArgs>();
          return _i6.ProductDetailPage(key: args.key, product: args.product);
        }),
    HomeRoute.name: (routeData) => _i1.CupertinoPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.HomePage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LauncherRoute.name, path: '/'),
        _i1.RouteConfig(AuthRoute.name, path: '/auth-page'),
        _i1.RouteConfig(ProductDetailRoute.name,
            path: '/product-detail-page', guards: [authGuard]),
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

class ProductDetailRoute extends _i1.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({_i2.Key? key, required _i8.Variations product})
      : super(name,
            path: '/product-detail-page',
            args: ProductDetailRouteArgs(key: key, product: product));

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({this.key, required this.product});

  final _i2.Key? key;

  final _i8.Variations product;
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

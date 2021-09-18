import 'package:auto_route/auto_route.dart';
import 'package:ox_system_task/src/core/utils/local_source.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    LocalSource _localSource = LocalSource.instance;
    final isAuthenticated = _localSource.getToken().isNotEmpty;
    resolver.next(isAuthenticated);
  }
}

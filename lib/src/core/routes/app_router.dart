import 'package:auto_route/annotations.dart';
import 'package:ox_system_task/src/core/routes/guards/auth_guard.dart';
import 'package:ox_system_task/src/presentation/pages/auth/auth_page.dart';
import 'package:ox_system_task/src/presentation/pages/detail/product_detail_page.dart';
import 'package:ox_system_task/src/presentation/pages/launcher_page.dart';
import 'package:ox_system_task/src/presentation/pages/main/home_page.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CupertinoRoute(page: LauncherPage, initial: true),
    CupertinoRoute(page: AuthPage),
    CupertinoRoute(page: ProductDetailPage, guards: [AuthGuard]),
    CupertinoRoute(page: HomePage, guards: [AuthGuard]),
  ],
)
class $AppRouter {}

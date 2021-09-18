import 'package:auto_route/annotations.dart';
import 'package:ox_system_task/src/core/routes/guards/auth_guard.dart';
import 'package:ox_system_task/src/presentation/pages/auth/auth_page.dart';
import 'package:ox_system_task/src/presentation/pages/launcher_page.dart';
import 'package:ox_system_task/src/presentation/pages/main/main_page.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CupertinoRoute(page: LauncherPage, initial: true),
    CupertinoRoute(page: AuthPage),
    // CupertinoRoute(page: SettingsPage, guards: [AuthGuard]),
    CupertinoRoute(page: MainPage, guards: [AuthGuard]),
    // CupertinoRoute(page: TransactionPage, guards: [AuthGuard]),
    // CupertinoRoute(page: PostponePage, guards: [AuthGuard]),
    // CupertinoRoute(page: PaymentPage, guards: [AuthGuard]),
    // CupertinoRoute(page: PrintPage, guards: [AuthGuard]),
    // CupertinoRoute(page: ReturnExchangePage, guards: [AuthGuard]),
  ],
)
class $AppRouter {}

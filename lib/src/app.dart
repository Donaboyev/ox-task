import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ox_system_task/src/core/di/http_service.dart';
import 'package:ox_system_task/src/core/routes/app_router.gr.dart';
import 'package:ox_system_task/src/core/routes/guards/auth_guard.dart';
import 'package:ox_system_task/src/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:ox_system_task/src/presentation/pages/main/cubit/home_cubit.dart';

final _appRouter = AppRouter(authGuard: AuthGuard());

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
        BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
      ],
      child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: HttpService.alice.getNavigatorKey(),
        home: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}

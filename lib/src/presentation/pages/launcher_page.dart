import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ox_system_task/src/core/routes/app_router.gr.dart';
import 'package:ox_system_task/src/core/utils/local_source.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    LocalSource.getSharedPreferences().then((prefs) async {
      String token = prefs.getString(accessToken) ?? '';
      if (token.isNotEmpty) {
        await AutoRouter.of(context).replace(HomeRoute());
        return;
      }
      AutoRouter.of(context).replace(AuthRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ox_system_task/src/core/di/injection_extension.dart';
import 'package:ox_system_task/src/core/utils/local_source.dart';
import 'package:ox_system_task/src/core/routes/app_router.gr.dart';

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
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
         Brightness.dark ,
      ),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            // CustomPaint(
            //   size: size,
            //   painter: AppBackgroundPainter(
            //     mainColor:
            //     isDarkMode ? AppColors.shimmerBaseDark : AppColors.greyF9,
            //     backColor:
            //     isDarkMode ? AppColors.cardBackgroundDark : AppColors.white,
            //   ),
            // ),
            // const Center(child: BillzLogo(width: 200))
          ],
        ),
      ),
    );
  }
}

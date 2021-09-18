import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/components/buttons/app_icon_button.dart';
import 'package:ox_system_task/src/presentation/icons/app_icons.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

void _showFLash(
    context, {
      required String message,
      String? title,
      Duration? duration,
      Widget? icon,
      void Function(FlashController controller)? onClose,
      bool showCloseBtn = false,
    }) {
  showFlash(
    context: context,
    duration: duration ?? const Duration(milliseconds: 2000),
    builder: (BuildContext context, FlashController controller) {
      return Flash(
        controller: controller,
        backgroundColor: Theme.of(context).cardColor,
        position: FlashPosition.top,
        borderRadius: AppStyles.borderRadiusMain,
        behavior: FlashBehavior.floating,
        margin: const EdgeInsets.all(10),
        child: FlashBar(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          icon: icon,
          primaryAction: showCloseBtn || onClose != null
              ? AppIconButton(
            icon: Icon(AppIcons.times, size: 20),
            color: AppColors.red,
            borderRadius: AppStyles.borderRadiusSemi,
            onPressed: onClose == null
                ? () => controller.dismiss()
                : () => onClose,
          )
              : null,
          title: title != null
              ? Text(
            title,
            style: TextStyle(
              color:  AppColors.white
            ),
          )
              : null,
          content: Text(
            message,
            style: TextStyle(color: AppColors.greyBD, fontSize: 16),
          ),
        ),
      );
    },
  );
}

class AppFlashController {
  static void showProductAdded(
      BuildContext context, {
        required String message,
        required String title,
      }) {
    _showFLash(
      context,
      message: message,
      title: title,
      showCloseBtn: true,
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff95BEE7),
              Color(0xff877ADA),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            "+1",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  // static void showInfo(
  //     BuildContext context, {
  //       required String message,
  //       String? title,
  //       Function(FlashController controller)? onClose,
  //       AppInfoType type = AppInfoType.info,
  //       bool showCloseBtn = false,
  //     }) {
  //   late Color color;
  //   late Widget? body;
  //   switch (type) {
  //     case AppInfoType.success:
  //       color = AppColors.green;
  //       body = Icon(AppIcons.check, color: AppColors.white, size: 20);
  //       break;
  //     case AppInfoType.warning:
  //       color = AppColors.white;
  //       body = null;
  //       break;
  //     case AppInfoType.info:
  //       color = AppColors.blue;
  //       body =
  //           Text("i", style: TextStyle(color: AppColors.white, fontSize: 26));
  //       break;
  //     case AppInfoType.danger:
  //       color = AppColors.red;
  //       body = Icon(AppIcons.times, color: AppColors.white, size: 20);
  //       break;
  //   }
  //
  //   _showFLash(
  //     context,
  //     message: message,
  //     title: title,
  //     onClose: onClose,
  //     showCloseBtn: showCloseBtn,
  //     icon: body != null
  //         ? Container(
  //       width: 40,
  //       height: 40,
  //       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  //       child: Center(child: body),
  //     )
  //         : null,
  //   );
  // }

  static showCheckFlash(BuildContext context, String text) {
    return showFlash(
      context: context,
      duration: const Duration(milliseconds: 1500),
      builder: (BuildContext context, FlashController controller) {
        return Flash(
          controller: controller,
          backgroundColor: Theme.of(context).cardColor,
          position: FlashPosition.top,
          borderRadius: AppStyles.borderRadiusMain,
          behavior: FlashBehavior.floating,
          margin: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                text,
                style: TextStyle(
                  color:  AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}

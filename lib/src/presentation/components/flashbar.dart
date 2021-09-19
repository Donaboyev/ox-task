import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class AppFlashController {
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

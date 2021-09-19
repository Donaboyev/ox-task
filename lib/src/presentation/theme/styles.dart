import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';

class AppStyles {
  static const radiusCircularMain = Radius.circular(15);
  static const radiusCircularSlidableMain = Radius.circular(14.5);
  static const radiusCircularBottom = Radius.circular(30);
  static const borderRadiusMain =
      BorderRadius.all(AppStyles.radiusCircularMain);

  static styAuthTitle() => TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        fontFamily: "Gilroy",
        fontSize: 22,
      );

  static styHomeTitle() => TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.grey,
        fontSize: 24,
      );
}

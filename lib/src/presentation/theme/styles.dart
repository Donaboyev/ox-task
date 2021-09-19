import 'package:flutter/material.dart';
import 'package:ox_system_task/src/core/di/injection_extension.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';

class AppStyles {
  static const radiusCircularMain = Radius.circular(15);
  static const radiusCircularSlidableMain = Radius.circular(14.5);
  static const radiusCircularSemi = Radius.circular(10);
  static const radiusCircularBottom = Radius.circular(30);
  static const borderRadiusMain =
  BorderRadius.all(AppStyles.radiusCircularMain);
  static const borderRadiusSlidableMain =
  BorderRadius.all(AppStyles.radiusCircularSlidableMain);
  static const borderRadiusSemi =
  BorderRadius.all(AppStyles.radiusCircularMain);

  static const basicBodyPadding = 20;
  static const topSafeAreaMargin = 20;

  static final sectionTextStyle = ({
    double fontSize = 32,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontWeight: fontWeight??FontWeight.bold,
        color:
         AppColors.white ,
        fontFamily: "Gilroy",
        fontSize: fontSize,
      );

  static styAuthTitle() => TextStyle(
    fontWeight: FontWeight.bold,
    color:  AppColors.black,
    fontFamily: "Gilroy",
    fontSize: 22,
  );

  static styHomeTitle() => TextStyle(
    fontWeight: FontWeight.bold,
    color:  AppColors.grey,
    fontSize: 24,
  );

  static styStyle(bool isDarkMode) => TextStyle(
    color: isDarkMode ? AppColors.white : AppColors.black,
  );

  static InputDecoration inputDecoration(
      BuildContext context, {
        Color? fillColor,
        Widget? prefixIcon,
        Widget? suffixIcon,
        String? suffixText,
        String? hintText,
        Color? borderColor,
        Color? focusBorderColor,
        TextStyle? hintStyle,
        TextStyle? suffixStyle,
      }) {
    if (fillColor == null) {
      fillColor =  AppColors.backgroundDark;
    }

    return InputDecoration(
      disabledBorder: OutlineInputBorder(
        borderRadius: AppStyles.borderRadiusMain,
        borderSide: BorderSide(color: Colors.transparent),
      ),
      fillColor: fillColor,
      filled: true,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffixText: suffixText,
      hintText: hintText,
      hintStyle: hintStyle ?? TextStyle(color: AppColors.greyBD, fontSize: 17),
      suffixStyle:
      suffixStyle ?? TextStyle(color: AppColors.greyBD, fontSize: 17),
      contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderRadius: AppStyles.borderRadiusMain,
        borderSide: BorderSide(),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppStyles.borderRadiusMain,
        borderSide: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppStyles.borderRadiusMain,
        borderSide: BorderSide(
          color: focusBorderColor ?? Colors.transparent,
          width: 2,
        ),
      ),
    );
  }
}

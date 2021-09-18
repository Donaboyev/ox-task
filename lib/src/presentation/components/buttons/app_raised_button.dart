import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class AppRaisedButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final Color color;
  final Color textColor;
  final Color disableColor;
  final Color disabledTextColor;
  final EdgeInsets? padding;
  final bool roundedCorners;

  const AppRaisedButton({
    required this.child,
    this.onPressed,
    this.color = AppColors.blue,
    this.textColor = AppColors.white,
    this.roundedCorners = true,
    this.padding,
    this.disableColor = AppColors.greyBD,
    this.disabledTextColor = AppColors.greyBD,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      elevation: 0,
      textColor: textColor,
      color: color,
      shape: this.roundedCorners
          ? RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusMain)
          : null,
      padding: padding ?? EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      child: this.child,
      highlightElevation: 0,
      onPressed: this.onPressed,
      disabledTextColor: disabledTextColor,
      disabledElevation: 0,
      disabledColor: disableColor,
    );
  }
}

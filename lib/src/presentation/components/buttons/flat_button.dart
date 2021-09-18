import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class AppFlatButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final bool roundedCorners;
  final Color color;
  final EdgeInsets? padding;
  final bool withShimmer;

  const AppFlatButton({
    required this.child,
    this.onPressed,
    this.padding,
    this.roundedCorners = true,
    this.withShimmer = false,
    this.color = AppColors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final _color = Colors.black.withOpacity(.05);
    return RaisedButton(
      color: _color,
      disabledColor: withShimmer ? _color : Theme.of(context).backgroundColor,
      elevation: 0,
      textColor: color,
      disabledTextColor: AppColors.blue,
      shape: roundedCorners
          ? RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusMain)
          : null,
      padding: padding ?? EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      child: this.child,
      highlightElevation: 0,
      onPressed: this.onPressed,
    );
  }
}

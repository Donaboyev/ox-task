import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final double size;
  final Function()? onPressed;
  final Color? color;
  final BorderRadius? borderRadius;

  const AppIconButton({
    required this.icon,
    this.onPressed,
    this.size = 40,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FlatButton(
        padding: const EdgeInsets.all(0),
        color: color ?? Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? AppStyles.borderRadiusMain,
        ),
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}

class AppCombinedIcon extends StatelessWidget {
  final IconData mainIcon;
  final IconData subIcon;
  final double mainSize;
  final Color color;
  final bool enabled;

  const AppCombinedIcon({
    required this.mainIcon,
    required this.subIcon,
    this.mainSize = 28,
    this.color = AppColors.white,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final disabledColor = AppColors.shimmerHighlightDark;

    return SizedBox(
      width: mainSize + 10,
      height: mainSize + 10,
      child: Center(
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 2.5,
              child: Icon(mainIcon,
                  size: mainSize, color: enabled ? color : disabledColor),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(
                  subIcon,
                  size: mainSize * 0.5,
                  color: enabled ? AppColors.white : disabledColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class AppCard extends StatelessWidget {
  final Widget? head;
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color? color;
  final double? width;
  final Function()? onTap;

  const AppCard({
    required this.child,
    this.head,
    this.margin = EdgeInsets.zero,
    this.color,
    this.width,
    this.onTap,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppStyles.borderRadiusMain,
          onTap: onTap,
          child: Ink(
            padding: padding,
            width: width,
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).cardColor,
              borderRadius: AppStyles.borderRadiusMain,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

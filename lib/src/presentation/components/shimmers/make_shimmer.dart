import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class MakeShimmer extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const MakeShimmer({
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {

    return isLoading
        ? Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseDark,
      highlightColor: AppColors.greyF9,
      child:  child,
    )
        : child;
  }
}

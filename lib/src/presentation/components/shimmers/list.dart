import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatelessWidget {
  final double height;
  final int amount;

  const ListShimmer({this.height = 10, this.amount = 5});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyCF,
      highlightColor: AppColors.greyF9,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (_, index) => Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.black,
            borderRadius: AppStyles.borderRadiusMain,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: amount,
      ),
    );
  }
}

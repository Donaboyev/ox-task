import 'package:flutter/material.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'store_has_no_products_yet',
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'go_to_web_version_to_add_product',
            style: TextStyle(
              color: AppColors.greyBD,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

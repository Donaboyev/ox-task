import 'package:flutter/material.dart';
import 'package:ox_system_task/src/data/models/home/products_model.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';

class ProductItemWidget extends StatelessWidget {
  final Variations product;
  final Function()? onTap;

  const ProductItemWidget({
    Key? key,
    required this.product,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${product.variation?.name}',
                style: TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

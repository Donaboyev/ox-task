import 'package:flutter/material.dart';
import 'package:ox_system_task/src/core/utils/helpers.dart';
import 'package:ox_system_task/src/data/models/home/products_model.dart';
import 'package:ox_system_task/src/presentation/components/app_card.dart';
import 'package:ox_system_task/src/presentation/components/custom_cached_network_image.dart';
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
    Color color = AppColors.greyBD;
    return Stack(
      children: [
        AppCard(
          child: Row(
            children: [
              Container(
                height: 120,
                width: 80,
                child: Hero(
                  tag: product.variation?.id ?? 0,
                  child: CustomCachedImageNetwork(
                    height: 40,
                    width: 40,
                    url: product.variation?.images?[0].urls?.original ?? '',
                    imageColor: color,
                    padding: EdgeInsets.all(1),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.variation?.name ?? '',
                      style: TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Штрих-код: ${product.variation?.barcode}',
                      style: TextStyle(
                        color: AppColors.indigo,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Размер: ${product.variation?.properties?[0].value}',
                      style: TextStyle(
                          color: AppColors.indigo,
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${AppHelpers.formatNumber(product.newPrice ?? 0)} UZS',
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: color,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.keyboard_arrow_right,
                color: color,
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: AppColors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}

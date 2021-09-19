import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ox_system_task/src/core/utils/helpers.dart';
import 'package:ox_system_task/src/data/models/home/products_model.dart';
import 'package:ox_system_task/src/presentation/components/custom_cached_network_image.dart';

class ProductDetailPage extends StatelessWidget {
  final Variations product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('${product.variation?.name}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 24),
          Hero(
            tag: product.variation?.id ?? 0,
            child: CustomCachedImageNetwork(
              height: 200,
              width: width,
              url: product.variation?.images?[0].urls?.original ?? '',
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(height: 12),
          Column(
            children: [
              Text('Основная информация'),
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Название продукта'),
                      SizedBox(height: 12),
                      Text('Артикул'),
                      SizedBox(height: 12),
                      Text('Поставщик'),
                      SizedBox(height: 12),
                      Text('Штрих-код'),
                      SizedBox(height: 12),
                      Text('ЦЕНА ПРОДАЖИ'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${(product.variation?.name ?? '').length > 25 ? (product.variation?.name ?? '').substring(0, 15) : (product.variation?.name ?? '')}',
                        maxLines: 1,
                      ),
                      SizedBox(height: 12),
                      Text('${product.variation?.sku}'),
                      SizedBox(height: 12),
                      Text('${product.variation?.supplier}'),
                      SizedBox(height: 12),
                      Text('${product.variation?.barcode}'),
                      SizedBox(height: 12),
                      Text(
                          '${AppHelpers.formatNumber(product.newPrice ?? 0)} UZS'),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

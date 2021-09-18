// import 'package:flutter/material.dart';
// import 'package:ox_system_task/src/data/models/home/product_model.dart';
// import 'package:ox_system_task/src/data/models/home/product_response.dart';
// import 'package:ox_system_task/src/presentation/components/buttons/flat_button.dart';
// import 'package:ox_system_task/src/presentation/components/shimmers/list.dart';
// import 'package:ox_system_task/src/presentation/components/shimmers/make_shimmer.dart';
// import 'package:ox_system_task/src/presentation/pages/main/widgets/empty_widget.dart';
// import 'package:ox_system_task/src/presentation/pages/main/widgets/product_item_widget.dart';
//
// class ProductsWidget extends StatelessWidget {
//   final ProductModel model;
//   final bool isLoading;
//   final bool isFetchPaginationLoading;
//   final Function(int size)? onFetchTap;
//   final Function(int index)? onTap;
//   final int page;
//
//   const ProductsWidget({
//     Key? key,
//     required this.model,
//     required this.isLoading,
//     this.onFetchTap,
//     this.onTap,
//     this.isFetchPaginationLoading = true,
//     this.page = 1,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: const ListShimmer(height: 24),
//       );
//     } else if (list.isEmpty)
//       return Center(
//         child: EmptyWidget(),
//       );
//     return ListView.separated(
//       shrinkWrap: true,
//       padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
//       physics: BouncingScrollPhysics(),
//       itemBuilder: (context, index) {
//         if (list.length >= 5) {
//           if (index == list.length) {
//             if (!isLoading && page * 5 <= list.length) {
//               return MakeShimmer(
//                 child: AppFlatButton(
//                   withShimmer: true,
//                   child: Text('Ko\'proq'),
//                   onPressed: isFetchPaginationLoading
//                       ? null
//                       : () => onFetchTap!(list.length),
//                 ),
//                 isLoading: isFetchPaginationLoading,
//               );
//             }
//             return const SizedBox();
//           }
//         }
//         return ProductItemWidget(
//           onTap: () => onTap!(index),
//           product: list[index],
//         );
//       },
//       separatorBuilder: (context, index) => const SizedBox(height: 5),
//       itemCount: page * 5 <= list.length
//           ? list.length >= 5
//           ? list.length + 1
//           : list.length
//           : list.length,
//     );
//   }
// }

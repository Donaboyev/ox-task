import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ox_system_task/src/core/di/injection_extension.dart';
import 'package:ox_system_task/src/presentation/components/home_header_bar.dart';
import 'package:ox_system_task/src/presentation/pages/main/widgets/products_widget.dart';

import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('====================> home page opened');
    final cubit = getCubit<HomeCubit>(context);
    return BlocProvider(
      create: (context) => cubit..cubitInit(context),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          // List<Variations> list = state.products;
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HomeHeaderBar(
                      iconData: Icons.logout,
                      onTap: state.isLoading
                          ? null
                          : () {},
                      ),
                    const SizedBox(height: 16),
                    Center(child: Text('${state.totalCount} total count'),)
                    // Expanded(
                    //   child: ProductsWidget(
                    //     list: list,
                    //     page: state.page,
                    //     isLoading: state.isLoading,
                    //     isFetchPaginationLoading:
                    //     state.isFetchPaginationLoading,
                    //     onFetchTap: (size) {
                    //       if (size % 5 >= 0)
                    //         cubit.fetchProducts();
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

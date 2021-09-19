import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ox_system_task/src/core/di/injection_extension.dart';
import 'package:ox_system_task/src/data/models/home/products_model.dart';
import 'package:ox_system_task/src/presentation/components/bottom_sheets/extensions.dart';
import 'package:ox_system_task/src/presentation/components/bottom_sheets/shared/log_out_bottom_sheet.dart';
import 'package:ox_system_task/src/presentation/components/home_header_bar.dart';
import 'package:ox_system_task/src/presentation/pages/main/widgets/products_widget.dart';
import 'package:ox_system_task/src/core/routes/app_router.gr.dart';

import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = getCubit<HomeCubit>(context);
    return BlocProvider(
      create: (context) => cubit..cubitInit(context),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          List<Variations> list = state.products;
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
                          : () async {
                              final result = await showSheet(
                                context,
                                child: LogOut(
                                  onTap: () {
                                    cubit.logOut(context);
                                    AutoRouter.of(context).replace(AuthRoute());
                                  },
                                ),
                              );
                            },
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ProductsWidget(
                        list: list,
                        page: state.page,
                        isLoading: state.isLoading,
                        isFetchPaginationLoading:
                            state.isFetchPaginationLoading,
                        onFetchTap: (size) {
                          if (size % 5 >= 0) cubit.fetchProducts();
                        },
                      ),
                    ),
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

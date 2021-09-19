import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ox_system_task/src/core/di/network_exceptions.dart';
import 'package:ox_system_task/src/core/utils/connectivity_app.dart';
import 'package:ox_system_task/src/core/utils/local_source.dart';
import 'package:ox_system_task/src/data/models/home/products_model.dart';
import 'package:ox_system_task/src/domain/repositories/home_repository.dart';
import 'package:ox_system_task/src/presentation/components/flashbar.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  LocalSource _localSource = LocalSource.instance;

  HomeCubit()
      : super(HomeState(
          isLoading: false,
          totalCount: 0,
          page: 1,
        ));

  Future<void> cubitInit(BuildContext context) async {
    final connect = await ConnectivityApp.connectivity();
    if (connect) {
      emit(state.copyWith(isLoading: true));
      final response = await HomeRepository.fetchProducts(
        subdomain: _localSource.getSubdomain(),
      );
      response.when(
        success: (result) {
          emit(
            state.copyWith(
              isLoading: false,
              page: 1,
              totalCount: result.totalCount ?? 0,
              products: result.variations ?? <Variations>[],
            ),
          );
        },
        failure: (failure) {
          emit(state.copyWith(
            isLoading: false,
            totalCount: 0,
            page: 1,
          ));
        },
      );
    } else {
      return AppFlashController.showCheckFlash(
        context,
        'Проверьте ваше интернет-соединение!',
      );
    }
  }

  Future<void> fetchProducts() async {
    LocalSource _localSource = LocalSource.instance;
    emit(state.copyWith(
      isFetchPaginationLoading: true,
    ));
    final response = await HomeRepository.fetchProducts(
      subdomain: _localSource.getSubdomain(),
      page: state.page + 1,
    );
    response.when(
      success: (result) {
        emit(state.copyWith(
          isFetchPaginationLoading: false,
          products: state.products + (result.variations ?? <Variations>[]),
          page: state.page + 1,
        ));
      },
      failure: (error) {
        if (error == NetworkExceptions.unableToProcess())
          emit(state.copyWith(
            isLoading: false,
            isFetchPaginationLoading: false,
            page: state.page + 1,
          ));
        else
          emit(state.copyWith(
            isLoading: false,
            isFetchPaginationLoading: false,
            page: state.page,
          ));
      },
    );
  }

  Future<void> logOut(BuildContext context) async {
    await _localSource.clear();
  }
}

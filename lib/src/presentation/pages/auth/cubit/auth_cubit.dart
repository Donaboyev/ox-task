import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:ox_system_task/src/core/routes/app_router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ox_system_task/src/core/utils/connectivity_app.dart';
import 'package:ox_system_task/src/core/utils/local_source.dart';
import 'package:ox_system_task/src/domain/repositories/auth_repository.dart';
import 'package:ox_system_task/src/presentation/components/flashbar.dart';

part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  void setUsername(String value) {
    emit(
      state.copyWith(
        username: value,
        errorUsername: false,
        errorPassword: false,
      ),
    );
  }

  void setPassword(String value) {
    emit(state.copyWith(
      password: value,
      errorUsername: false,
      errorPassword: false,
    ));
  }

  void setShowPassword(bool value) {
    emit(state.copyWith(showPassword: value));
  }

  void setLoading(bool value, {String? message, bool error = false}) {
    emit(state.copyWith(
      isLoading: value,
      errorMessage: message ?? '',
      errorUsername: error,
      errorPassword: error,
    ));
  }

  void setError({
    required String message,
    required bool errorPassword,
  }) {
    emit(state.copyWith(
      errorMessage: message,
      errorPassword: errorPassword,
    ));
  }

  Future<void> logIn(
    BuildContext context, {
    required String name,
    required String password,
    required String subdomain,
  }) async {
    final connect = await ConnectivityApp.connectivity();
    if (connect) {
      final authResult = await AuthRepository.authUser(
        name,
        password,
        subdomain,
      );
      await authResult.when(
        success: (data) async {
          await LocalSource.instance.setUser(
            lastName: data.token,
            firstName: data.token,
            companyName: data.token,
            subDomain: data.token,
            token: data.token,
            refreshToken: data.token,
            companyId: data.expiresAt,
            userId: data.token,
            currentShopId: data.token,
            currentShopName: data.token,
            imageUrl: data.token
          );
          emit(AuthState(
            isLoading: false,
            username: '',
            password: '',
            showPassword: false,
          ));
          await AutoRouter.of(context).replace(MainRoute());
        },
        failure: (d) {
          setLoading(
            false,
            message: 'Неверные данные авторизации',
            error: true,
          );
        },
      );
    } else {
      setLoading(false);
      return AppFlashController.showCheckFlash(
        context,
       'internet_is_not_available',
      );
    }
  }
}

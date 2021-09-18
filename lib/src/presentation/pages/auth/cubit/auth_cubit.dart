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

  void setSubdomain(String value) {
    emit(
      state.copyWith(
        subdomain: value,
        errorUsername: false,
        errorPassword: false,
        errorSubdomain: false,
      ),
    );
  }

  void setUsername(String value) {
    emit(
      state.copyWith(
        username: value,
        errorUsername: false,
        errorPassword: false,
        errorSubdomain: false,
      ),
    );
  }

  void setPassword(String value) {
    emit(state.copyWith(
      password: value,
      errorUsername: false,
      errorPassword: false,
      errorSubdomain: false,
    ));
  }

  void setShowPassword(bool value) {
    emit(state.copyWith(showPassword: value));
  }

  void setLoading(bool value, {String? message, bool error = false}) {
    emit(state.copyWith(
      isLoading: value,
      errorMsgSubdomain: message ?? '',
      errorMsgUsername: message ?? '',
      errorMsgPassword: message ?? '',
      errorUsername: error,
      errorPassword: error,
      errorSubdomain: error,
    ));
  }

  void setError({
    required String subdomainErrorText,
    required String usernameErrorText,
    required String passwordErrorText,
    required bool errorSubdomain,
    required bool errorUsername,
    required bool errorPassword,
  }) {
    emit(state.copyWith(
      errorMsgSubdomain: subdomainErrorText,
      errorMsgUsername: usernameErrorText,
      errorMsgPassword: passwordErrorText,
      errorPassword: errorPassword,
      errorSubdomain: errorSubdomain,
      errorUsername: errorUsername,
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
            subdomain: subdomain,
            token: data.token,
          );
          emit(AuthState(
            isLoading: false,
            username: '',
            password: '',
            showPassword: false,
          ));
          await AutoRouter.of(context).replace(HomeRoute());
        },
        failure: (d) {
          setLoading(
            false,
            message: 'To\'g\'ri ma\'lumotlar kiritishingiz lozim!',
            error: true,
          );
        },
      );
    } else {
      setLoading(false);
      return AppFlashController.showCheckFlash(
        context,
        'Internet bilan bog\'liqlikni tekshiring!',
      );
    }
  }
}

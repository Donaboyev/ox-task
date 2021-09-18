part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool errorSubdomain,
    @Default(false) bool errorUsername,
    @Default(false) bool errorPassword,
    @Default(false) bool showPassword,
    @Default('') String errorMessage,
    @Default('') String subdomain,
    @Default('') String username,
    @Default('') String password,
  }) = _AuthState;
}

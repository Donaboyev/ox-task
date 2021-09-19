import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ox_system_task/src/core/di/injection_extension.dart';
import 'package:ox_system_task/src/presentation/components/buttons/app_raised_button.dart';
import 'package:ox_system_task/src/presentation/components/shimmers/make_shimmer.dart';
import 'package:ox_system_task/src/presentation/components/text_fields/custom_text_field.dart';
import 'package:ox_system_task/src/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class AuthPage extends StatelessWidget {
  final subdomainFocus = FocusNode();
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final cubit = getCubit<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: KeyboardDismisser(
            child: Scaffold(
              backgroundColor: AppColors.greyEA,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(height: 120),
                      Text(
                        'Войти в систему',
                        style: AppStyles.styAuthTitle(),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        context: context,
                        currentFocus: subdomainFocus,
                        nextFocus: usernameFocus,
                        inputAction: TextInputAction.next,
                        enabled: !state.isLoading,
                        labelText: 'Субдомен',
                        hintText: 'example',
                        suffixText: '.ox-sys.com',
                        onChanged: (value) => cubit.setSubdomain(value),
                        errorText: state.errorMsgSubdomain,
                        showError: state.errorSubdomain,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        inputAction: TextInputAction.next,
                        enabled: !state.isLoading,
                        labelText: 'Имя пользователя',
                        hintText: 'example',
                        currentFocus: usernameFocus,
                        context: context,
                        nextFocus: passwordFocus,
                        onTap: () {
                          if (state.username.isEmpty)
                            cubit.setShowPassword(true);
                        },
                        onEditingComplete: () {
                          if (state.username.isEmpty)
                            cubit.setShowPassword(false);
                        },
                        onChanged: (value) => cubit.setUsername(value),
                        errorText: state.errorMsgUsername,
                        showError: state.errorUsername,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        inputAction: TextInputAction.done,
                        labelText: 'Пароль',
                        currentFocus: passwordFocus,
                        obscureText: !state.showPassword,
                        enabled: !state.isLoading,
                        context: context,
                        hintText: '*****',
                        onTap: () {
                          if (state.password.isEmpty)
                            cubit.setShowPassword(false);
                        },
                        onChanged: (value) => cubit.setPassword(value),
                        suffixIcon: IconButton(
                          highlightColor: AppColors.transparent,
                          splashColor: AppColors.transparent,
                          icon: Icon(
                            state.showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.greyBD,
                          ),
                          onPressed: () =>
                              cubit.setShowPassword(!state.showPassword),
                        ),
                        errorText: state.errorMsgPassword,
                        showError: state.errorPassword,
                      ),
                      const SizedBox(height: 20),
                      AppRaisedButton(
                        disableColor: AppColors.greyF9,
                        child: MakeShimmer(
                          child: Text(
                            'Войти',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          isLoading: state.isLoading,
                        ),
                        onPressed: state.isLoading ||
                                state.username.isEmpty ||
                                state.password.isEmpty
                            ? null
                            : () async {
                                final bool isSubdomainClear =
                                    state.subdomain.isEmpty;
                                final bool isUsernameClear =
                                    state.username.length < 3;
                                final bool isPasswordClear =
                                    state.password.length < 5;
                                if (isSubdomainClear ||
                                    isUsernameClear ||
                                    isPasswordClear) {
                                  cubit.setError(
                                    subdomainErrorText:
                                        'subdomain kiritilishi shart',
                                    usernameErrorText:
                                        'username kamida 3ta belgidan iborat bo\'lsin',
                                    passwordErrorText:
                                        'parol kamida 5ta belgidan iborat bo\'lsin',
                                    errorSubdomain: isSubdomainClear,
                                    errorUsername: isUsernameClear,
                                    errorPassword: isPasswordClear,
                                  );
                                } else {
                                  cubit.setLoading(true);
                                  await cubit.logIn(
                                    context,
                                    password: state.password,
                                    name: state.username,
                                    subdomain: 'toko',
                                  );
                                }
                              },
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ox_system_task/src/core/di/injection_extension.dart';
import 'package:ox_system_task/src/presentation/components/buttons/app_raised_button.dart';
import 'package:ox_system_task/src/presentation/components/shimmers/make_shimmer.dart';
import 'package:ox_system_task/src/presentation/components/text_fields/custom_text_field.dart';
import 'package:ox_system_task/src/presentation/icons/app_icons.dart';
import 'package:ox_system_task/src/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class AuthPage extends StatelessWidget {
  final companyFocus = FocusNode();
  final numberFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = getCubit<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
             Brightness.dark ,
          ),
          child: KeyboardDismisser(
            child: Scaffold(
              body: Stack(
                alignment: Alignment.center,
                children: [
                  // CustomPaint(
                  //   size: size,
                  //   painter: AppBackgroundPainter(
                  //     mainColor: isDarkMode
                  //         ? AppColors.shimmerBaseDark
                  //         : AppColors.greyF0,
                  //     backColor: isDarkMode
                  //         ? AppColors.cardBackgroundDark
                  //         : AppColors.white,
                  //   ),
                  // ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        // child: BillzLogo(width: 150),
                      ),
                      const SizedBox(height: 120),
                      Text(
                        'Sahifamga kirish',
                        style: AppStyles.styAuthTitle(),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        context: context,
                        // currentFocus: companyFocus,
                        // nextFocus: numberFocus,
                        autoFocus: true,
                        inputAction: TextInputAction.next,
                        enabled: !state.isLoading,
                        labelText: 'Subdomain',
                        hintText: 'subdomain kiriting',
                        suffixText: '.ox-sys.com',
                        onTap: () {
                          if (state.username.isEmpty) cubit.setShowPassword(false);
                        },
                        onEditingComplete: () {
                          if (state.username.isEmpty) cubit.setShowPassword(true);
                        },
                        onChanged: (value) => cubit.setUsername(value),
                        errorText: state.errorMessage,
                        showError: state.errorUsername,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        inputAction: TextInputAction.next,
                        enabled: !state.isLoading,
                        labelText: 'Username',
                        hintText: 'username kiriting',
                        currentFocus: numberFocus,
                        context: context,
                        nextFocus: passwordFocus,
                        onTap: () {
                          if (state.username.isEmpty) cubit.setShowPassword(true);
                        },
                        onEditingComplete: () {
                          if (state.username.isEmpty) cubit.setShowPassword(false);
                        },
                        onChanged: (value) => cubit.setUsername(value),
                        errorText: state.errorMessage,
                        showError: state.errorUsername,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        inputAction: TextInputAction.done,
                        labelText: 'Parol',
                        currentFocus: passwordFocus,
                        obscureText: !state.showPassword,
                        enabled: !state.isLoading,
                        context: context,
                        hintText: 'Parolingizni kiriting',
                        onTap: () {
                          if (state.password.isEmpty) cubit.setShowPassword(false);
                        },
                        onChanged: (value) => cubit.setPassword(value),
                        suffixIcon: IconButton(
                          icon: Icon(
                            state.showPassword
                                ? AppIcons.eye_slash
                                : AppIcons.eye,
                            size: 16,
                            color: AppColors.greyBD,
                          ),
                          onPressed: () =>
                              cubit.setShowPassword(!state.showPassword),
                        ),
                        errorText: state.errorMessage,
                        showError: state.errorPassword,
                      ),
                      const SizedBox(height: 20),
                      AppRaisedButton(
                        disableColor:  AppColors.greyF9,
                        child: MakeShimmer(
                          child: Text(
                            "Войти",
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          isLoading: state.isLoading,
                        ),
                        onPressed: state.isLoading ||
                            state.username.isEmpty ||
                            state.password.isEmpty
                            ? null
                            : () async {
                          if (state.password.length < 8) {
                            cubit.setError(
                              message: 'Обязательное поле',
                              errorPassword: state.password.length < 8,
                            );
                          } else {
                            cubit.setLoading(true);
                            await cubit.logIn(
                              context,
                              password: state.password,
                              name: state.username,
                              subdomain: 'toko'
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

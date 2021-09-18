import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ox_system_task/src/presentation/theme/app_colors.dart';
import 'package:ox_system_task/src/presentation/theme/styles.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final bool? showError;
  final TextEditingController? controller;
  final bool autoFocus;
  final Function(String value)? onChanged;
  final Function()? onEditingComplete;
  final FormFieldValidator<String?>? validator;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? errorText;
  final TextInputAction? inputAction;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? hintText;
  final BuildContext? context;
  final Function()? onTap;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextStyle? hintStyle;
  final TextStyle? suffixStyle;
  final bool? obscureText;
  final bool? enabled;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.showError,
    this.controller,
    this.autoFocus = false,
    this.onChanged,
    this.keyboardType,
    this.prefixText,
    this.errorText,
    this.inputAction,
    this.currentFocus,
    this.nextFocus,
    this.hintText,
    this.context,
    this.onTap,
    this.prefixIcon,
    this.borderColor,
    this.focusBorderColor,
    this.suffixIcon,
    this.suffixText,
    this.hintStyle,
    this.suffixStyle,
    this.validator,
    this.obscureText,
    this.enabled,
    this.textCapitalization = TextCapitalization.none,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color fillColor = AppColors.greyF9;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: (labelText ?? '').isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              labelText ?? '',
              style:
              TextStyle(color:  Colors.black),
            ),
          ),
        ),
        TextFormField(
          enabled: enabled!,
          obscureText: obscureText ?? false,
          validator: validator,
          controller: controller,
          focusNode: currentFocus,
          onEditingComplete: onEditingComplete,
          style: TextStyle(
            color:  AppColors.grey6F,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          onTap: onTap,
          autofocus: autoFocus,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          onFieldSubmitted: (term) => fieldFocusChange(
            context,
            currentFocus,
            nextFocus,
          ),
          textInputAction: inputAction,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixText: suffixText,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.greyBD,
              fontSize: 17,
            ),
            suffixStyle: TextStyle(
              color:  AppColors.grey6F,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: const OutlineInputBorder(
              borderRadius: AppStyles.borderRadiusMain,
              borderSide: BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppStyles.borderRadiusMain,
              borderSide: BorderSide(
                color: borderColor ?? Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppStyles.borderRadiusMain,
              borderSide: BorderSide(
                color: focusBorderColor ?? AppColors.blue,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: AppStyles.borderRadiusMain,
              borderSide: BorderSide(color: Colors.transparent),
            ),
            errorText: showError ?? false ? errorText : null,
          ),
          keyboardType: keyboardType,
        ),
      ],
    );
  }

  fieldFocusChange(
      BuildContext context,
      FocusNode? currentFocus,
      FocusNode? nextFocus,
      ) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}

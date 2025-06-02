import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/shared/default_field.dart';
import '../../../../core/utils/constants/app_constants.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    this.suffixIconData,
    this.hintText,
    required this.label,
    this.suffix,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.controller,
    this.autofillHints,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.isPhoneNumber = false,
    this.onPhoneInputChanged,
    this.textCapitalization = TextCapitalization.none,
    this.labelStyle,
    this.countries,
    this.fieldKey,
    this.initialValue,
  });
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final IconData? suffixIconData;
  final String? hintText;
  final String label;
  final String? initialValue;
  final TextStyle? labelStyle;
  final Widget? suffix;
  final bool obscureText;
  final bool readOnly;
  final bool isPhoneNumber;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;
  final List<String>? countries;
  final GlobalKey<FormFieldState>? fieldKey;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(PhoneNumber)? onPhoneInputChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: labelStyle ??
              context.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppConst.paddingSmall),
        MyDefaultField(
          fieldKey: fieldKey,
          countries: countries,
          readOnly: readOnly,
          controller: controller,
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          hintText: hintText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          textCapitalization: textCapitalization,
          prefix: suffixIconData == null
              ? null
              : Icon(
                  suffixIconData,
                  color: context.theme.primaryColor.withValues(alpha: 0.8),
                ),
          suffix: suffix,
          obscureText: obscureText,
          initialValue: initialValue,
          onChanged: onChanged,
          isPhoneNumber: isPhoneNumber,
          autofillHints: autofillHints,
          onPhoneInputChanged: onPhoneInputChanged,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/functions/app_validate.dart';
import 'auth_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.hintText,
    required this.label,
    this.otherPass,
    this.controller,
    this.onChanged,
    this.autofillHints,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.done,
    this.isNewPass = false,
  });
  final String? otherPass;
  final TextEditingController? controller;
  final String? hintText;
  final String label;
  final bool readOnly;
  final bool isNewPass;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return AuthField(
      isRequired: true,
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.otherPass != null
          ? (val) => AppValidator.samePassword(val, widget.otherPass!)
          : (val) => AppValidator.auth(
              val, (widget.isNewPass ? 8 : 0), 100, FieldType.password),
      obscureText: obscureText,
      suffixIconData: Icons.lock_rounded,
      label: widget.label,
      hintText: widget.hintText,
      autofillHints: [AutofillHints.password, ...widget.autofillHints ?? []],
      onFieldSubmitted: widget.onFieldSubmitted,
      suffix: IconButton(
        onPressed: () => setState(() => obscureText = !obscureText),
        color: Colors.grey,
        tooltip: obscureText
            ? localeLang(context).showPassword
            : localeLang(context).hidePassword,
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );
  }
}

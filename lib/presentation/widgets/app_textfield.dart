import 'package:fate_date_demo/core/core.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.prefixIcon,
    this.validator,
  });

  final String? hintText;
  final Widget? suffixIcon, prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: context.textTheme.bodyMedium
            ?.copyWith(color: context.theme.highlightColor.withOpacity(0.7)),
        disabledBorder: AppSpacings.borderDesign,
        border: AppSpacings.borderDesign,
        enabledBorder: AppSpacings.borderDesign,
        focusedBorder: AppSpacings.borderDesign,
        errorBorder: AppSpacings.errorBorderDesign,
        focusedErrorBorder: AppSpacings.errorBorderDesign,
      ),
    );
  }
}

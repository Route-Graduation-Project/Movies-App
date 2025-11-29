import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.prefix,
    this.suffix,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.controller,
    this.prefixText,
    this.enabled,
  });
  final String hintText;
  final bool isPassword;
  final IconData? prefix;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget? suffix;
  final String? prefixText;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      onChanged: onChanged,
      obscureText: isPassword,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        prefixText: prefixText,
        filled: true,
        fillColor: AppColors.gray,
        prefixIcon: Icon(prefix),
        hintText: hintText,
        suffixIcon: suffix,
      ),
    );
  }
}

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
  });
  final String hintText;
  final bool isPassword;
  final IconData? prefix, suffix;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.gray,
        prefixIcon: Icon(prefix),
        hintText: hintText,
        suffixIcon: isPassword ? Icon(suffix) : null,
      ),
    );
  }
}

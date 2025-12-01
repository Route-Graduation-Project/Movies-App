import 'package:flutter/material.dart';
import 'package:movies_app/core/utilis/theme_extension.dart';

class NavigateToRegisterRow extends StatelessWidget {
  const NavigateToRegisterRow({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't Have Account? ",
            style: context.textStyle.bodySmall!.copyWith(
              color: context.colors.onSurface,
            ),
          ),
          Text(
            "Create One",
            style: context.textStyle.bodySmall!.copyWith(
              color: context.colors.primary, // Using primary color for emphasis
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
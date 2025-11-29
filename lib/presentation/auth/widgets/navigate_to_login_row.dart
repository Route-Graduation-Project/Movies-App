import 'package:flutter/material.dart';
import 'package:movies_app/core/utilis/theme_extension.dart';

class NavigateToLoginRow extends StatelessWidget {
  const NavigateToLoginRow({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already Have Account ? ",
            style: context.textStyle.bodySmall!.copyWith(
              color: context.colors.onSurface,
            ),
          ),
          Text("Login", style: context.textStyle.bodySmall),
        ],
      ),
    );
  }
}

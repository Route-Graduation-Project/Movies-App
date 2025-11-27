import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utilis/context_extension.dart';

class LanguageToggleSwitch extends StatelessWidget {
  const LanguageToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heightSize * .05,
      width: context.widthSize * .25,
      child: AnimatedToggleSwitch.rolling(
        current: 'en',
        values: const ['en', 'ar'],
        style: ToggleStyle(
          borderColor: Theme.of(context).colorScheme.primary,
          indicatorColor: Theme.of(context).colorScheme.primary,
        ),
        indicatorSize: const Size.fromWidth(40),
        padding: EdgeInsets.zero,
        borderWidth: 3,
        iconList: [
          Image.asset('assets/images/EG.png'),
          Image.asset('assets/images/LR.png'),
        ],
      ),
    );
  }
}

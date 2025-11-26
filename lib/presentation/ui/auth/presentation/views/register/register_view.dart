// import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utilis/theme_extension.dart';
import 'package:movies_app/core/utilis/white_space_extension.dart';
import 'package:movies_app/presentation/ui/auth/presentation/views/register/widgets/custom_text_form_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: context.textStyle.bodyLarge),
      ),
      body: ListView(
        children: [
          // CarouselSlider(
          //   items: [
          //     AspectRatio(
          //       aspectRatio: 158 / 161,
          //       child: Container(
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //             fit: BoxFit.cover,
          //             image: AssetImage('assets/images/gamer (1)-7.png'),
          //           ),
          //         ),
          //       ),
          //     ),
          //     AspectRatio(
          //       aspectRatio: 158 / 161,
          //       child: Container(
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //             fit: BoxFit.cover,

          //             image: AssetImage('assets/images/gamer (1)-7.png'),
          //           ),
          //         ),
          //       ),
          //     ),
          //     AspectRatio(
          //       aspectRatio: 158 / 161,
          //       child: Container(
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //             fit: BoxFit.cover,
          //             image: AssetImage('assets/images/gamer (1)-7.png'),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          //   options: CarouselOptions(
          //     enableInfiniteScroll: true,
          //     enlargeCenterPage: true,
          //     viewportFraction: 0.6,
          //   ),
          // ),
          const Text('Avatar'),
          const CustomTextFormField(
            hintText: 'Name',
            prefix: 'assets/images/🦆 icon _Identification_.png',
          ),
          24.widthSpace,
          const CustomTextFormField(
            hintText: 'Email',
            prefix: 'assets/images/Vector-1.png',
          ),
          24.widthSpace,

          const CustomTextFormField(
            hintText: 'Password',
            prefix: 'assets/images/Vector-2.png',
            isPassword: true,
            suffix: 'assets/images/🦆 icon _eye off_.png',
          ),
          24.widthSpace,

          const CustomTextFormField(
            hintText: 'Confirm Password',
            prefix: 'assets/images/Vector-2.png',
            isPassword: true,
            suffix: 'assets/images/🦆 icon _eye off_.png',
          ),
          24.widthSpace,

          const CustomTextFormField(
            hintText: 'Phone',
            prefix: 'assets/images/Vector.png',
          ),
          24.widthSpace,

          FilledButton(onPressed: () {}, child: const Text('Create Account')),
          24.widthSpace,
          Row(
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
          24.widthSpace,
          // SizedBox(
          //           height: 40,
          //           width: 100,
          //           child: AnimatedToggleSwitch.rolling(
          //             current: 'en',
          //             values: const ['en', 'ar'],
          //             style: ToggleStyle(
          //               borderColor: Theme.of(context).colorScheme.primary,
          //               indicatorColor: Theme.of(context).colorScheme.primary,
          //             ),
          //             indicatorSize: const Size.fromWidth(40),
          //             padding: EdgeInsets.zero,
          //             borderWidth: 3,
          //             iconList: [
          //               Image.asset('assets/images/LR.png'),
          //               Image.asset('assets/images/EG.png'),
          //             ],
          //           ),
          //         ),
        ],
      ),
    );
  }
}

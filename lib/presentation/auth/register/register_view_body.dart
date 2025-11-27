import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies_app/core/utilis/white_space_extension.dart';
import 'package:movies_app/presentation/auth/widgets/carousel_slider_item_builder.dart';
import 'package:movies_app/presentation/auth/widgets/custom_text_form_field.dart';
import 'package:movies_app/presentation/auth/widgets/language_toggle_switch.dart';
import 'package:movies_app/presentation/auth/widgets/navigate_to_login_row.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          child: Column(
            spacing: 24,
            children: [
              const CarouselSliderItemBuilder(),
              const Text('Avatar', textAlign: TextAlign.center),
              const CustomTextFormField(
                hintText: 'Name',
                prefix: FontAwesome.address_card,
              ),
              const CustomTextFormField(
                hintText: 'Email',
                prefix: FontAwesome.envelope_solid,
              ),
              const CustomTextFormField(
                hintText: 'Password',
                prefix: EvaIcons.lock,
                isPassword: true,
                suffix: EvaIcons.eye_off,
              ),
              const CustomTextFormField(
                hintText: 'Confirm Password',
                prefix: EvaIcons.lock,
                isPassword: true,
                suffix: EvaIcons.eye_off,
              ),
              const CustomTextFormField(
                hintText: 'Phone',
                prefix: EvaIcons.phone,
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    //TODO implement logic and validation to navigate to login view
                  },
                  child: const Text('Create Account'),
                ),
              ),
              const NavigateToLoginRow(),
              const LanguageToggleSwitch(),
              24.heightSpace,
            ],
          ),
        ),
      ),
    );
  }
}

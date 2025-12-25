import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies_app/core/routing/routes.dart';
import 'package:movies_app/core/utils/theme_extension.dart';
import 'package:movies_app/core/utils/validators.dart';
import 'package:movies_app/core/utils/white_space_extension.dart';
import 'package:movies_app/data/models/register_request.dart';
import 'package:movies_app/presentation/auth/register/register_cubit/register_cubit.dart';
import 'package:movies_app/presentation/auth/register/register_cubit/register_state.dart';
import 'package:movies_app/presentation/auth/widgets/carousel_slider_item_builder.dart';
import 'package:movies_app/presentation/auth/widgets/custom_text_form_field.dart';
import 'package:movies_app/presentation/auth/widgets/language_toggle_switch.dart';
import 'package:movies_app/presentation/auth/widgets/navigate_to_login_row.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late final StreamSubscription nav;
  late final RegisterCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<RegisterCubit>(context);
    nav = cubit.navigation.listen((navigationEvent) {
      if (!mounted) return;
      if (navigationEvent case RegisterNavigationToLogin()) {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
    });
    super.initState();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      final fullPhone = "+20${phone.text.trim()}";

      cubit.doAction(
        RegisterUser(
          RegisterRequest(
            avatarId: cubit.currentIndex,
            name: name.text,
            email: email.text,
            password: password.text,
            confirmPassword: confirmPassword.text,
            phone: fullPhone,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    nav.cancel();
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    phone.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              spacing: 24,
              children: [
                CarouselSliderItemBuilder(
                  onPageChanged: (index, reason) {
                    cubit.doAction(SaveAvatarId(index));
                  },
                ),
                const Text('Avatar', textAlign: TextAlign.center),

                CustomTextFormField(
                  enabled: state is! RegisterLoading,
                  controller: name,
                  hintText: 'Name',
                  onChanged: (value) {
                    value = name.text;
                  },
                  validator: (value) => Validation.validateName(value),
                  keyboardType: TextInputType.name,
                  prefix: FontAwesome.address_card,
                ),

                CustomTextFormField(
                  enabled: state is! RegisterLoading,

                  controller: email,
                  hintText: 'Email',
                  onChanged: (value) {
                    value = email.text;
                  },

                  validator: (value) => Validation.validateEmail(value),
                  keyboardType: TextInputType.emailAddress,

                  prefix: FontAwesome.envelope_solid,
                ),

                CustomTextFormField(
                  enabled: state is! RegisterLoading,

                  controller: password,
                  hintText: 'Password',
                  onChanged: (value) {
                    value = password.text;
                  },
                  validator: (value) => Validation.validatePassword(value),
                  keyboardType: TextInputType.visiblePassword,
                  prefix: EvaIcons.lock,
                  isPassword: cubit.isPassword,
                  suffix: IconButton(
                    onPressed: () {
                      cubit.doAction(PasswordVisibility());
                    },
                    icon: Icon(
                      cubit.isPassword ? EvaIcons.eye_off : EvaIcons.eye,
                    ),
                  ),
                ),

                CustomTextFormField(
                  enabled: state is! RegisterLoading,

                  controller: confirmPassword,
                  hintText: 'Confirm Password',
                  onChanged: (value) {
                    value = confirmPassword.text;
                  },
                  validator:
                      (value) => Validation.validatePasswordConfirmation(
                        value,
                        confirmationValue: confirmPassword.text,
                        originalPasswordValue: password.text,
                      ),
                  keyboardType: TextInputType.visiblePassword,
                  prefix: EvaIcons.lock,
                  isPassword: cubit.isRePassword,
                  suffix: IconButton(
                    onPressed: () {
                      cubit.doAction(RePasswordVisibility());
                    },
                    icon: Icon(
                      cubit.isRePassword ? EvaIcons.eye_off : EvaIcons.eye,
                    ),
                  ),
                ),
                CustomTextFormField(
                  enabled: state is! RegisterLoading,

                  prefixText: "+20 ",
                  controller: phone,
                  hintText: 'Phone',
                  onChanged: (value) {
                    value = phone.text;
                  },
                  validator:
                      (value) => Validation.validateEgyptianPhoneNumber(value),
                  keyboardType: TextInputType.number,
                  prefix: EvaIcons.phone,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      _register();
                    },
                    child:
                        state is RegisterLoading
                            ? CircularProgressIndicator(
                              color: context.colors.surface,
                            )
                            : const Text('Create Account'),
                  ),
                ),
                NavigateToLoginRow(
                  onTap: () => cubit.doAction(NavigateToLoginAction()),
                ),

                const LanguageToggleSwitch(),
                24.heightSpace,
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: TextStyle(color: context.colors.onError),
                ),
                backgroundColor: context.colors.error,
              ),
            );
          }

          if (state is RegisterResponseState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.response.message ?? "User Created Successfully",
                ),
                backgroundColor: Colors.green,
              ),
            );
            cubit.doAction(NavigateToLoginAction());
          }
        },
      ),
    );
  }
}

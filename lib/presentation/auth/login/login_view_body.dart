import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/utilis/context_extension.dart';
import 'package:movies_app/core/utilis/theme_extension.dart';
import 'package:movies_app/presentation/auth/login/login_cubit/login_cubit.dart';
import 'package:movies_app/presentation/auth/login/login_cubit/login_state.dart';
import 'package:movies_app/presentation/auth/widgets/custom_text_form_field.dart';
import 'package:movies_app/presentation/auth/widgets/language_toggle_switch.dart';
import '../widgets/navigate_to_register_row.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().doAction(
        LoginUserAction(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Successful: ${state.response.message}')),
          );
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => current is! LoginNavigationAction,
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          final isPasswordVisible = cubit.isPasswordVisible;
          final isLoading = state is LoginLoading;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.08),
                 Image.asset("assets/images/img.png"),
                  SizedBox(height: size.height * 0.04),


                  CustomTextFormField(
                    hintText: 'Email Address',
                    prefix: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    enabled: !isLoading,
                  ),
                  SizedBox(height: size.height * 0.02),

                  CustomTextFormField(
                    hintText: 'Password',
                    prefix: Icons.lock_outline,
                    isPassword: isPasswordVisible,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    enabled: !isLoading,
                    suffix: IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                        color: context.colors.onSurface,
                      ),
                      onPressed: isLoading ? null : () => cubit.doAction(PasswordVisibilityAction()),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: isLoading
                          ? null
                          : () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Forgot password feature coming soon!'),
                        ),
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: context.textStyle.bodySmall!.copyWith(
                          color: context.colors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                          : Text(
                        'LOGIN',
                        style: context.textStyle.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.surface,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Navigate to Register
                  NavigateToRegisterRow(
                    onTap: () => cubit.doAction(NavigateToRegisterAction()),
                  ),
                  SizedBox(height: size.height * 0.03),

                  // OR Divider
                  Row(
                    children: const [
                      Expanded(child: Divider(color: AppColors.yellow)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("OR", style: TextStyle(color: AppColors.yellow)),
                      ),
                      Expanded(child: Divider(color: AppColors.yellow)),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),

                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.g_mobiledata, color: AppColors.black, size: 34),
                          SizedBox(width: 10),
                          Text(
                            "Login With Google",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  const LanguageToggleSwitch(),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/utils/context_extension.dart';
import 'package:movies_app/core/utils/white_space_extension.dart';
import 'package:movies_app/update_data/message_response.dart';
import '../../core/utils/validators.dart';
import '../../update_data/api_manager.dart';
import '../../update_data/profile_response.dart';
import '../auth/widgets/avatar_images_paths.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late Future<ProfileResponse> profileFuture;
  ProfileResponse? profileInfo;
  int? selectedAvatarId;
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    profileFuture = ApiManager().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick Avatar",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            profileInfo = snapshot.data;
            selectedAvatarId ??= profileInfo?.data?.avaterId?.toInt();
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        Image.asset(
                          height: context.heightSize * 0.15,
                          avatars[selectedAvatarId!],
                        ),
                        20.heightSpace,
                        TextFormField(
                          controller: oldPassword,
                          validator: (value) => Validation.validatePassword(value),
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.gray,
                            prefixIcon: const Icon(EvaIcons.lock),
                            hintText: "Old Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        20.heightSpace,
                        TextFormField(
                          controller: newPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) return "Please confirm password";
                            if (value != newPassword.text) return "Passwords do not match";
                            return null;
                          },
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.gray,
                            prefixIcon: const Icon(EvaIcons.lock),
                            hintText: "New Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: FilledButton(
                        onPressed: () async {
                          //MessageResponse? resetPasswordResponse = await ApiManager().changePassword(oldPassword.text, newPassword.text);
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          foregroundColor: AppColors.black,
                        ),
                        child: const Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  16.heightSpace,
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

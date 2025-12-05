import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/utilis/context_extension.dart';
import 'package:movies_app/core/utilis/white_space_extension.dart';
import 'package:movies_app/presentation/auth/widgets/avatar_images_paths.dart';
import 'package:movies_app/update_data/api_manager.dart';
import 'package:movies_app/update_data/profile_response.dart';

import '../../core/routing/routes.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late Future<ProfileResponse> profileFuture;
  ProfileResponse? profileInfo;
  int? selectedAvatarId;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

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
                        GestureDetector(
                          onTap: () async {
                            final selectedAvatar =
                                await Navigator.pushNamed(
                                      context,
                                      Routes.selectPictureRoute,
                                      arguments: selectedAvatarId,
                                    )
                                    as int;
                            setState(() {
                              selectedAvatarId = selectedAvatar;
                            });
                          },
                          child: Image.asset(
                            height: context.heightSize * 0.15,
                            avatars[selectedAvatarId!],
                          ),
                        ),
                        20.heightSpace,
                        TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.gray,
                            prefixIcon: const Icon(Icons.person),
                            hintText:
                                profileInfo?.data?.name?.toString() ??
                                "User Name",
                          ),
                        ),
                        20.heightSpace,
                        TextFormField(
                          controller: phone,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.gray,
                            prefixIcon: const Icon(Icons.phone),
                            hintText:
                                profileInfo?.data?.phone?.toString() ??
                                "Phone Number",
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(Routes.resethRoute);
                            },
                            child: const Text("Reset Password"),
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
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: AppColors.white,
                        ),
                        child: const Text(
                          "Delete Account",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  16.heightSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: FilledButton(
                        onPressed: () {
                          final newName =
                              name.text.isNotEmpty
                                  ? name.text
                                  : profileInfo?.data?.name;
                          final newPhone =
                              phone.text.isNotEmpty
                                  ? phone.text
                                  : profileInfo?.data?.phone;
                          final newAvatarId =
                              selectedAvatarId ??
                              profileInfo?.data?.avaterId?.toInt();

                          ApiManager().updateProfile(
                            name: newName,
                            phone: newPhone,
                            avatarId: newAvatarId,
                          );
                        },
                        child: const Text(
                          "Update Data",
                          style: TextStyle(fontSize: 16),
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

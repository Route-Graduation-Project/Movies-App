import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/utilis/context_extension.dart';
import 'package:movies_app/core/utilis/white_space_extension.dart';
import 'package:movies_app/presentation/auth/widgets/avatar_images_paths.dart';

import '../../core/routing/routes.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  int selectedAvatarId = 0;

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  GestureDetector(
                    onTap: () async {
                      final selectedAvatar = await Navigator.pushNamed(context, Routes.selectPictureRoute, arguments: selectedAvatarId) as int;
                      setState(() {
                        selectedAvatarId = selectedAvatar;
                      });
                    },
                    child: Image.asset(
                      height: context.heightSize * 0.15,
                      avatars[selectedAvatarId],
                    ),
                  ),
                  20.heightSpace,
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: AppColors.gray,
                      prefixIcon: Icon(Icons.person),
                      hintText: "User Name",
                    ),
                  ),
                  20.heightSpace,
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: AppColors.gray,
                      prefixIcon: Icon(Icons.person),
                      hintText: "Phone Number",
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  onPressed: () {},
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/utilis/context_extension.dart';
import 'package:movies_app/core/utilis/white_space_extension.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Image.asset(
            height: context.heightSize * 0.15,
            "assets/images/avatar1.png",
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
          SizedBox(
            height: context.heightSize*0.29,
          ),
          SizedBox(
            width: double.infinity,
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
          20.heightSpace,
          SizedBox(
            width: double.infinity,
            child: FilledButton(
                      onPressed: () {},
                      child: const Text(
            "Update Data",
            style: TextStyle(fontSize: 16),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}

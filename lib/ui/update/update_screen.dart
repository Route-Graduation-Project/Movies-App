import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick Avatar",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16,
                  children: [
                    Image.asset(
                      "assets/images/avatar1.png",
                      width: size.width * (151 / 430),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.gray,
                        prefixIcon: Icon(Icons.person),
                        hintText: "User Name",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: AppColors.gray,
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Phone Number",
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: TextButton(onPressed: (){}, child: Text("Recet Password"))),
                    const Spacer(),
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
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {},
                        child: const Text(
                          "Update Data",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

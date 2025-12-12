import 'package:flutter/material.dart';
import '../../core/routing/routes.dart';

class ProfileScreen extends StatelessWidget {
   const ProfileScreen({super.key});
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         body: Align(
             alignment: Alignment.center,
             child: FilledButton(
                 onPressed: () {
                   Navigator.pushNamed(context, Routes.updateRoute);
                   }, child: Text('update profile'),
             ),
         ),
         );
   }


// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(
//       child: Center(
//         child: Text(
//           "Profile Screen",
//           style: TextStyle(color: AppColors.white, fontSize: 20),
//         ),
//       ),
//     );
//   }
}

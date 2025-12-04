import 'package:flutter/material.dart';
import 'package:movies_app/core/routing/routes.dart';
import 'package:movies_app/domain/entity/register_response_entity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});
  final RegisterResponseEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: FilledButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.updateRoute);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(user.name ?? 'No Name'),
              Text(user.email ?? 'No email'),
              user.phone == ''
                  ? const Text(
                    'No phone',
                    style: TextStyle(color: Colors.black),
                  )
                  : Text(user.phone!),
              user.avatarId == null
                  ? const Text('Default avatat id 1')
                  : Text(user.avatarId.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

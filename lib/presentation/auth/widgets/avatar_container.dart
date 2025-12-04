import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/presentation/auth/widgets/avatar_images_paths.dart';

class AvatarContainer extends StatelessWidget {
  final int avatarId;
  final int selectedAvatarId;
  final Function select;
  const AvatarContainer({super.key, required this.avatarId, required this.selectedAvatarId, required this.select});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        select(avatarId);
      },
      child: Container(
        decoration: BoxDecoration(
          color: avatarId == selectedAvatarId? AppColors.yellow.withAlpha(56) : Colors.transparent,
          border: Border.all(
            color: AppColors.yellow,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(avatars[avatarId]),
      ),
    );
  }
}

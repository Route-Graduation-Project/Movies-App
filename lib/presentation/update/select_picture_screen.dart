import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../auth/widgets/avatar_container.dart';

class SelectPictureScreen extends StatefulWidget {
  const SelectPictureScreen({super.key});

  @override
  State<SelectPictureScreen> createState() => _SelectPictureScreenState();
}

class _SelectPictureScreenState extends State<SelectPictureScreen> {
  late var selectedAvatarId = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedAvatarId = (ModalRoute.of(context)!.settings.arguments as int?) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context, selectedAvatarId);
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.black.withAlpha(70),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                width: width * 0.95,
                height: width * 0.95,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(22),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 16,
                        children: [
                          AvatarContainer(
                            avatarId: 0,
                            selectedAvatarId: selectedAvatarId,
                            select: select,
                          ),
                          AvatarContainer(
                            avatarId: 3,
                            selectedAvatarId: selectedAvatarId,
                            select: select,
                          ),
                          AvatarContainer(
                            avatarId: 6,
                            selectedAvatarId: selectedAvatarId,
                            select: select,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 16,
                        children: [
                          AvatarContainer(
                            avatarId: 1,
                            selectedAvatarId: selectedAvatarId,
                            select: select,
                          ),
                          AvatarContainer(
                            avatarId: 4,
                            selectedAvatarId: selectedAvatarId,
                            select: select,
                          ),
                          AvatarContainer(
                            avatarId: 7,
                            selectedAvatarId: selectedAvatarId,
                            select: select,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 16,
                        children: [
                          AvatarContainer(
                            avatarId: 2,
                            selectedAvatarId: selectedAvatarId,
                            select: select,
                          ),
                          AvatarContainer(
                            avatarId: 5,
                            selectedAvatarId: selectedAvatarId,
                            select: select,
                          ),
                          AvatarContainer(
                            avatarId: 8,
                            selectedAvatarId: selectedAvatarId,
                            select: select,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void select(id) {
    selectedAvatarId = id;
    setState(() {});
  }
}

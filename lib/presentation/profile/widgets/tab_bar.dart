import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Container(

      color: AppColors.gray, // important for pinning
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_) => false;
}
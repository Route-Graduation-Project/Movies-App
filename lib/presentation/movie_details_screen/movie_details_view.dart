import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/core/utilis/context_extension.dart';
import 'package:movies_app/core/utilis/padding_extension.dart';
import 'package:movies_app/core/utilis/theme_extension.dart';
import 'package:movies_app/core/utilis/white_space_extension.dart';

class MovieDetailsView extends StatelessWidget {
  MovieDetailsView({super.key});

  final List<String> fakeList = [
    "https://yts.lt/assets/images/movies/13_2010/medium-screenshot1.jpg",
    "https://yts.lt/assets/images/movies/13_2010/medium-screenshot2.jpg",
    "https://yts.lt/assets/images/movies/13_2010/medium-screenshot3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            // todo navigation back
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // todo Favourite Movie Action
            },
            icon: const Icon(Icons.bookmark, color: AppColors.white),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // image of movie
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  height: context.heightSize * 0.75,
                  child: Image.network(
                    "https://yts.lt/assets/images/movies/13_2010/large-cover.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                // CachedNetworkImage(
                //   imageUrl: "https://yts.lt/assets/images/movies/13_2010/large-cover.jpg",
                //   placeholder: (context, url) => Center(child: CircularProgressIndicator(
                //     color: AppColors.gray,
                //   )),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                //   imageBuilder: (context, imageProvider) =>
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(16),
                //         child: Image(image: imageProvider,
                //           width: double.infinity,
                //           fit: BoxFit.cover,),
                //       ),
                // ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF121312).withAlpha(50),
                          const Color(0xFF121312).withAlpha(30),
                          const Color(0xFF121312),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/play_icon.png"),
                  ),
                ),
              ],
            ),
          ),
          // title of movie
          Text(
            "Doctor Strange in the Multiverse of Madness",
            style: context.textStyle.titleLarge!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          5.heightSpace,
          // the year of movie
          Text(
            "2022",
            style: context.textStyle.titleLarge!.copyWith(
              color: AppColors.white.withAlpha(100),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          // watch button
          FilledButton(
            onPressed: () {
              // todo watch movie
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.red),
            child: Text(
              "Watch",
              style: context.textStyle.titleMedium!.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).allPadding(16),
          // rates and like info
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.gray,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: AppColors.yellow,
                        size: 28,
                      ),
                      Text(
                        "15",
                        style: context.textStyle.titleMedium!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.widthSpace,
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.gray,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.watch_later,
                        color: AppColors.yellow,
                        size: 28,
                      ),
                      Text(
                        "15",
                        style: context.textStyle.titleMedium!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.widthSpace,
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.gray,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.star, color: AppColors.yellow, size: 28),
                      Text(
                        "15",
                        style: context.textStyle.titleMedium!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).allPadding(16),

          Text(
            "Screen Shots",
            style: context.textStyle.titleLarge!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ).horizontalPadding(16),
          for (int i = 0; i < fakeList.length; i++)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(fakeList[i], fit: BoxFit.cover),
            ).allPadding(16),

          Text(
            "Similar",
            style: context.textStyle.titleLarge!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ).horizontalPadding(16),
        ],
      ),
    );
  }
}

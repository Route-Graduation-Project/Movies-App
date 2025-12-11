import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'bottom_nav.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final posters = [
    "assets/images/im1.jpg",
    "assets/images/im2.jpg",
    "assets/images/im3.png",
    "assets/images/im4.jpg",
    "assets/images/im5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.85),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.7,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.35,
                              child: Image.asset(
                                "assets/images/im3.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.02,
                            child: Image.asset(
                              "assets/images/Available Now.png",
                              width: width * 0.6,
                            ),
                          ),
                          Positioned(
                            top: height * 0.17,
                            bottom: height * 0.14,
                            child: SizedBox(
                              width: width,
                              child: _scrollingPosters(width),
                            ),
                          ),
                          Positioned(
                            bottom: height * 0.01,
                            child: Image.asset(
                              "assets/images/Watch Now.png",
                              width: width * 0.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Action",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: width * 0.05,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "See More ",
                                  style: TextStyle(
                                    color: AppColors.yellow,
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.yellow,
                                    size: width * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: height * 0.26,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: width * 0.04),
                        children:
                        posters.map((e) => movieCard(e, width)).toList(),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),

          BottomNav(currentIndex: 0),
        ],
      ),
    );
  }

  Widget _scrollingPosters(double width) {
    final PageController controller =
    PageController(viewportFraction: 0.54, initialPage: 1);

    return PageView.builder(
      controller: controller,
      itemCount: posters.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            double scale = 0.7;

            if (controller.position.haveDimensions) {
              double value = (controller.page! - index).abs();
              scale = (1 - value * 0.3).clamp(0.0, 1.0);
            }

            return Center(
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: width * 0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: AssetImage(posters[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget movieCard(String img, double width) {
    return Container(
      width: width * 0.36,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OnBoardingSpecialItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String buttonText;
  final VoidCallback onNext;

  const OnBoardingSpecialItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),

        Positioned.fill(
          child: Opacity(
            opacity: 0.85,
            child: Image.asset('assets/images/image_11.png', fit: BoxFit.cover),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 260,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF121212),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title.contains("Favorite")
                      ? title.replaceFirst("Favorite ", "Favorite\n")
                      : title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 25),

                GestureDetector(
                  onTap: onNext,
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade700,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/presentation/on_boarding/on_boarding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              'assets/images/splash_1.png',
              width: 300,
              height: 300,
            ),
          ),
          const Spacer(),
          Image.asset('assets/images/splash_2.png', width: 150, height: 100),
          //SizedBox(height: 6),
          const Text(
            "Supervised by Mohamed Nabil",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

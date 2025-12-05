import 'package:flutter/material.dart';

class OnBoardingButtons extends StatelessWidget {
  final bool isLastPage;
  final String buttonText;
  final VoidCallback onNext;

  const OnBoardingButtons({
    super.key,
    required this.isLastPage,
    required this.buttonText,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onNext,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0x0ff6bd00),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// View для каждого слайда
class OnboardingView extends StatelessWidget {
  final String imageUrl;
  final String text;

  const OnboardingView({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(imageUrl),
        const SizedBox(height: 16),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
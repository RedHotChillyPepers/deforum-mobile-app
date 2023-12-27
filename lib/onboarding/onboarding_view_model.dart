import 'package:flutter/material.dart';

class OnboardingViewModel {
  final List<Slide> slides = [
    Slide(
      imagePath: 'https://plus.unsplash.com/premium_photo-1683535508528-9228dcc8fa4c?q=80&w=3871&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      text: 'Slide 1',
    ),
    Slide(
      imagePath: 'https://images.unsplash.com/photo-1534644107580-3a4dbd494a95?q=80&w=3870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      text: 'Slide 2',
    ),
    Slide(
      imagePath: 'https://plus.unsplash.com/premium_photo-1665520347038-775b30288650?q=80&w=3773&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      text: 'Slide 3',
    ),
  ];

  final PageController pageController = PageController();

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void onPageChanged(int index) {
    _currentPage = index;
  }

  void dispose() {
    pageController.dispose();
  }
}

class Slide {
  final String imagePath;
  final String text;

  Slide({required this.imagePath, required this.text});
}
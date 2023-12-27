import 'package:flutter/material.dart';

import 'onboarding_view_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _SlideViewState createState() => _SlideViewState();
}

class _SlideViewState extends State<OnboardingScreen> {
  final OnboardingViewModel _viewModel = OnboardingViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _viewModel.pageController,
              itemCount: _viewModel.slides.length,
              onPageChanged: (index) {
                setState(() {
                  // Обновляем состояние виджета на изменение страницы
                  _viewModel.onPageChanged(index);
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return SlideItem(slide: _viewModel.slides[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _viewModel.slides.length; i++)
                  if (i == _viewModel.currentPage)
                    const SlideIndicator(isActive: true)
                  else
                    const SlideIndicator(isActive: false)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  final currentPage =
                      _viewModel.pageController.page?.toInt() ?? 0;
                  if (currentPage > 0) {
                    _viewModel.pageController.animateToPage(
                      currentPage - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  final currentPage =
                      _viewModel.pageController.page?.toInt() ?? 0;
                  if (currentPage < _viewModel.slides.length - 1) {
                    _viewModel.pageController.animateToPage(
                      currentPage + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class SlideItem extends StatelessWidget {
  final Slide slide;

  const SlideItem({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          slide.imagePath,
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 16),
        Text(
          slide.text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SlideIndicator extends StatelessWidget {
  final bool isActive;

  const SlideIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }
}

import 'package:enspd_link/viewmodels/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OnboardingViewmodel>();
    return IntroductionScreen(
      pages:
          viewModel.pages
              .map(
                (page) => PageViewModel(
                  title: page.title,
                  body: page.body,
                  image: Image.asset(page.imageAsset, height: 250),
                ),
              )
              .toList(),
      onDone: () async {
        await viewModel.completeOnboarding();
        Navigator.pushReplacementNamed(context, '/signin');
      },
      showSkipButton: true,
      skip: const Text('Passer'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Terminer'),
      dotsDecorator: DotsDecorator(
        size: Size(8, 8),
        color: Colors.grey,
        activeSize: Size(16,8),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)))
      ),
    );
  }
}

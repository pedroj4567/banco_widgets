import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static const name = 'onboarding_screen';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Onboarding"),
      ),
    );
  }
}

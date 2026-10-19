import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/onboarding_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final imageHeight = math.min(390.0, math.max(230.0, size.height * 0.43));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 26),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/onboarding/robot_welcome.png',
                        height: imageHeight,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 24),
                      Text.rich(
                        const TextSpan(children: [
                          TextSpan(text: 'Humanoid\nSelf-Calibration\n'),
                          TextSpan(
                            text: 'Robot',
                            style: TextStyle(color: AppColors.limeDark),
                          ),
                        ]),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.width < 370 ? 30 : 35,
                          color: AppColors.navy,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1,
                          height: 1.15,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Intelligent movement control and\n'
                        'self-calibration monitoring',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              OnboardingButton(
                label: 'Get Started',
                onPressed: () => Navigator.pushNamed(context, '/intro'),
              ),
              const SizedBox(height: 12),
              OnboardingButton(
                label: 'Sign In',
                primary: false,
                showArrow: false,
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign In will be added later.')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

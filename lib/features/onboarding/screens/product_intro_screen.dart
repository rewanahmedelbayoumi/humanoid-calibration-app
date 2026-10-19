import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/onboarding_scaffold.dart';

class ProductIntroScreen extends StatelessWidget {
  const ProductIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'A Smarter\nHumanoid Robot',
      subtitle: 'A robot that executes movement commands, '
          'measures its performance, and helps improve precision.',
      step: 2,
      buttonText: 'Next',
      onContinue: () => Navigator.pushNamed(context, '/permissions'),
      child: Column(
        children: [
          const _FeatureCard(
            icon: Icons.open_with_rounded,
            title: 'Precise Movement Control',
            subtitle: 'Send and review movement commands.',
          ),
          const SizedBox(height: 14),
          const _FeatureCard(
            icon: Icons.monitor_heart_outlined,
            title: 'Real-Time Monitoring',
            subtitle: 'View available robot status and readings.',
          ),
          const SizedBox(height: 14),
          const _FeatureCard(
            icon: Icons.tune_rounded,
            title: 'Self-Calibration',
            subtitle: 'Measure movement error and correct it.',
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/images/onboarding/robot_welcome.png',
            height: 205,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.softGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppColors.limeDark),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 5),
                Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

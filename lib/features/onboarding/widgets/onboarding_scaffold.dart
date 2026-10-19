import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'onboarding_button.dart';
import 'onboarding_page_indicator.dart';

class OnboardingScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final int step;
  final Widget child;
  final String buttonText;
  final VoidCallback? onContinue;

  const OnboardingScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.step,
    required this.child,
    required this.buttonText,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton.filledTonal(
                  tooltip: 'Back',
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 19),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.surface,
                    foregroundColor: AppColors.navy,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(title, style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 12),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 22),
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: child,
                ),
              ),
              const SizedBox(height: 12),
              OnboardingButton(label: buttonText, onPressed: onContinue),
              const SizedBox(height: 20),
              OnboardingPageIndicator(currentPage: step),
            ],
          ),
        ),
      ),
    );
  }
}

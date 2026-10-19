import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int currentPage; // 1-based index
  final int pageCount;

  const OnboardingPageIndicator({
    super.key,
    required this.currentPage,
    this.pageCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final active = index == currentPage - 1;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: active ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: active ? AppColors.limeDark : AppColors.border,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }
}

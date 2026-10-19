import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class OnboardingButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool primary;
  final bool showArrow;

  const OnboardingButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.primary = true,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primary ? AppColors.lime : AppColors.surface,
          foregroundColor: AppColors.navy,
          disabledBackgroundColor: AppColors.border,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
            side: primary
                ? BorderSide.none
                : const BorderSide(color: AppColors.border),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (showArrow)
              const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios_rounded, size: 17),
              ),
          ],
        ),
      ),
    );
  }
}

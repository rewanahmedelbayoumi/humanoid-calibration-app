
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:humanoid_robot_calibration_app/main.dart';

void main() {
  testWidgets(
    'Welcome Screen Test',
        (WidgetTester tester) async {

      // Start the application
      await tester.pumpWidget(
        const HumanoidRobotApp(),
      );

      // Check Welcome Screen buttons
      expect(
        find.text('Get Started'),
        findsOneWidget,
      );

      expect(
        find.text('Sign In'),
        findsOneWidget,
      );

      // Tap Get Started button
      await tester.tap(
        find.text('Get Started'),
      );

      await tester.pumpAndSettle();

      // Check Product Introduction Screen
      expect(
        find.text(
          'A Smarter\nHumanoid Robot',
        ),
        findsOneWidget,
      );
    },
  );
}

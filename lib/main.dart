import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/onboarding/screens/welcome_screen.dart';
import 'features/onboarding/screens/product_intro_screen.dart';
import 'features/onboarding/screens/permissions_screen.dart';
import 'features/onboarding/screens/find_robot_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HumanoidRobotApp());
}

class HumanoidRobotApp extends StatelessWidget {
  const HumanoidRobotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Humanoid Self-Calibration Robot',
      theme: buildAppTheme(),
      initialRoute: '/',
      routes: {
        '/': (_) => const WelcomeScreen(),
        '/intro': (_) => const ProductIntroScreen(),
        '/permissions': (_) => const PermissionsScreen(),
        '/find-robot': (_) => const FindRobotScreen(),
      },
    );
  }
}

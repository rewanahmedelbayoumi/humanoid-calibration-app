import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/onboarding_scaffold.dart';
import 'initial_setup_screen.dart';

class FindRobotScreen extends StatefulWidget {
  const FindRobotScreen({super.key});

  @override
  State<FindRobotScreen> createState() => _FindRobotScreenState();
}

class _FindRobotScreenState extends State<FindRobotScreen> {
  String? selectedId;

  static const examples = <(String, String)>[
    ('HSR-001', 'Lab Unit'),
    ('HSR-002', 'Demo Unit'),
    ('HSR-003', 'Testing Robot'),
    ('HSR-004', 'Prototype'),
  ];

  void _continue() {
    if (selectedId == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InitialSetupScreen(robotId: selectedId!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Find Your Robot',
      subtitle: 'Select a robot to preview the setup flow.',
      step: 4,
      buttonText: 'Continue',
      onContinue: selectedId == null ? null : _continue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.softGreen,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: AppColors.limeDark),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Demo mode: sample devices only. No live scan or '
                    'Bluetooth connection is performed.',
                    style: TextStyle(color: AppColors.navy, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Example Robots',
                  style: Theme.of(context).textTheme.titleMedium),
              TextButton.icon(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Live scanning needs a robot connection service.'),
                  ),
                ),
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Scan'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (final robot in examples) ...[
            _RobotTile(
              id: robot.$1,
              description: robot.$2,
              selected: selectedId == robot.$1,
              onTap: () => setState(() => selectedId = robot.$1),
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _RobotTile extends StatelessWidget {
  final String id;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  const _RobotTile({
    required this.id,
    required this.description,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.softGreen : Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? AppColors.limeDark : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/onboarding/robot_welcome.png',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(id, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(description,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 3),
                    const Text('Signal: unavailable (demo)',
                        style: TextStyle(fontSize: 11, color: AppColors.muted)),
                  ],
                ),
              ),
              Icon(
                selected ? Icons.check_circle_rounded : Icons.circle_outlined,
                color: selected ? AppColors.limeDark : AppColors.muted,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

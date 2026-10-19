import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/onboarding_scaffold.dart';

class InitialSetupScreen extends StatefulWidget {
  final String robotId;

  const InitialSetupScreen({super.key, required this.robotId});

  @override
  State<InitialSetupScreen> createState() => _InitialSetupScreenState();
}

class _InitialSetupScreenState extends State<InitialSetupScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController nicknameController;
  String mode = 'General Purpose';
  String environment = 'Indoor';

  @override
  void initState() {
    super.initState();
    nicknameController = TextEditingController(text: widget.robotId);
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  void _completeSetup() {
    if (!formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_rounded,
                  color: AppColors.limeDark, size: 62),
              const SizedBox(height: 12),
              const Text(
                'Setup Preview Complete',
                style: TextStyle(
                  color: AppColors.navy,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${nicknameController.text.trim()} · $mode · $environment',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'These settings are not sent to a robot or saved permanently. '
                'Hardware integration will be added later.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.muted),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(sheetContext);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.lime,
                    foregroundColor: AppColors.navy,
                    minimumSize: const Size.fromHeight(54),
                  ),
                  child: const Text('Back to Welcome'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Initial Robot Setup',
      subtitle: 'Choose a nickname and initial operating preferences.',
      step: 5,
      buttonText: 'Complete Setup',
      onContinue: _completeSetup,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Image.asset(
              'assets/images/onboarding/robot_welcome.png',
              width: double.infinity,
              height: 210,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: nicknameController,
              maxLength: 32,
              decoration: const InputDecoration(
                labelText: 'Robot Nickname',
                prefixIcon: Icon(Icons.smart_toy_outlined),
              ),
              validator: (value) {
                final name = value?.trim() ?? '';
                if (name.isEmpty) return 'Enter a robot nickname';
                if (name.length < 2) return 'Use at least 2 characters';
                return null;
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: mode,
              decoration: const InputDecoration(
                labelText: 'Operating Mode',
                prefixIcon: Icon(Icons.tune_rounded),
              ),
              items: const [
                DropdownMenuItem(
                    value: 'General Purpose', child: Text('General Purpose')),
                DropdownMenuItem(
                    value: 'Precision Testing', child: Text('Precision Testing')),
                DropdownMenuItem(
                    value: 'Demo Mode', child: Text('Demo Mode')),
              ],
              onChanged: (value) => setState(() => mode = value ?? mode),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: environment,
              decoration: const InputDecoration(
                labelText: 'Environment',
                prefixIcon: Icon(Icons.home_outlined),
              ),
              items: const [
                DropdownMenuItem(value: 'Indoor', child: Text('Indoor')),
                DropdownMenuItem(value: 'Lab', child: Text('Lab')),
                DropdownMenuItem(value: 'Other', child: Text('Other')),
              ],
              onChanged: (value) => setState(
                  () => environment = value ?? environment),
            ),
            const SizedBox(height: 18),
            const Text(
              'Operating preferences are for UI preview. Availability '
              'depends on the real robot and its software.',
              style: TextStyle(fontSize: 12, color: AppColors.muted),
            ),
          ],
        ),
      ),
    );
  }
}

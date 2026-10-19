import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/onboarding_scaffold.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool bluetooth = false;
  bool wifi = false;
  bool location = false;
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Permissions &\nConnectivity',
      subtitle: 'Choose the connection preferences for your robot. '
          'Actual system permissions will be requested when integration is added.',
      step: 3,
      buttonText: 'Continue',
      onContinue: () => Navigator.pushNamed(context, '/find-robot'),
      child: Column(
        children: [
          _PermissionTile(
            icon: Icons.bluetooth_rounded,
            title: 'Bluetooth',
            subtitle: 'Use Bluetooth if your robot supports it.',
            value: bluetooth,
            onChanged: (v) => setState(() => bluetooth = v),
          ),
          const SizedBox(height: 14),
          _PermissionTile(
            icon: Icons.wifi_rounded,
            title: 'Wi-Fi',
            subtitle: 'Optional, depending on robot hardware.',
            value: wifi,
            onChanged: (v) => setState(() => wifi = v),
          ),
          const SizedBox(height: 14),
          _PermissionTile(
            icon: Icons.location_on_outlined,
            title: 'Location',
            subtitle: 'Only if your connection method requires it.',
            value: location,
            onChanged: (v) => setState(() => location = v),
          ),
          const SizedBox(height: 14),
          _PermissionTile(
            icon: Icons.notifications_none_rounded,
            title: 'Notifications',
            subtitle: 'For future robot alerts and updates.',
            value: notifications,
            onChanged: (v) => setState(() => notifications = v),
          ),
          const SizedBox(height: 20),
          const Text(
            'UI preview: these switches do not grant phone permissions '
            'or establish a robot connection.',
            style: TextStyle(color: AppColors.muted, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _PermissionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.softGreen,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.limeDark),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 3),
                Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            activeTrackColor: AppColors.lime,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

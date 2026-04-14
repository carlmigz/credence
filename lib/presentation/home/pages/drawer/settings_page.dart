import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data structure to keep the UI code clean
    final sections = [
      ('DISPLAY', [(Ionicons.person_outline, 'Show my name', null)]),
      (
        'ACCOUNT',
        [
          (Ionicons.mail_outline, 'Email Address', null),
          (Ionicons.phone_portrait_outline, 'Change mobile number', null),
          (Ionicons.notifications_outline, 'Notification Settings', null),
          (Ionicons.lock_closed_outline, 'Deactivate Account', null),
        ],
      ),
      (
        'PRIVACY & SECURITY',
        [
          (Ionicons.finger_print_outline, 'Biometric Authentication', 'switch'),
          (Ionicons.key_outline, 'Change passcode', null),
        ],
      ),
      (
        'ABOUT CREDENCE',
        [
          (Ionicons.document_text_outline, 'Privacy Policy', null),
          (Ionicons.document_outline, 'Terms & Conditions', null),
          (Ionicons.shield_checkmark_outline, 'Credence Licenses', null),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(text: 'Settings'),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: sections
              .map(
                (section) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: WidgetText(text: section.$1),
                    ),
                    ...section.$2.map(
                      (item) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(item.$1),
                        title: WidgetText(text: item.$2),
                        trailing: item.$3 == 'switch'
                            ? Switch.adaptive(value: true, onChanged: (_) {})
                            : const Icon(Ionicons.chevron_forward_outline),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

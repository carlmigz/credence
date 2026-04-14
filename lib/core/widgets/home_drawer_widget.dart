import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/routes/app_routes.dart';
import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_button.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeDrawerWidget extends HookWidget {
  const HomeDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Future<String> getAppVersion() async {
      final info = await PackageInfo.fromPlatform();
      return info.version;
    }

    final profileMenu = [
      // --- High Priority / Growth ---
      (
        Ionicons.people_outline,
        'Refer & Earn',
        () {
          AppRoutes.referEarnPage();
        },
      ),
      (Ionicons.ticket_outline, 'Vouchers', () {}),
      (Ionicons.flag_outline, 'Missions', () {}),

      // --- Account & Security ---
      (Ionicons.speedometer_outline, 'Account Limits', () {}),
      (Ionicons.shield_checkmark_outline, 'Security Center', () {}),
      (
        Ionicons.settings_outline,
        'Settings',
        () {
          AppRoutes.settingsPage();
        },
      ),

      // --- Support & Feedback ---
      (Ionicons.help_circle_outline, 'Get help', () {}),
      (Ionicons.book_outline, 'Quick Guide', () {}),
      (Ionicons.star_outline, 'Rate this app', () {}),
    ];
    return Drawer(
      width: MediaQuery.sizeOf(context).width / 1.2,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: AppSpacing.shortSpacing,
            children: [
              CircleAvatar(radius: 30.r),
              WidgetText(text: 'Carlos Miguel Ramos', fWeight: FontWeight.bold),
              WidgetText(text: '+63 909 123 4567'),
              Container(
                margin: EdgeInsets.all(12.r),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.gray.withValues(alpha: 0.5),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: WidgetText(text: 'Menu'),
                    ),
                    ...profileMenu.map(
                      (e) => ListTile(
                        onTap: () {
                          // Navigator.pop(context);
                          e.$3();
                        },
                        leading: Icon(e.$1),
                        title: WidgetText(text: e.$2),
                        trailing: const Icon(Ionicons.chevron_forward_outline),
                      ),
                    ),
                    Gap(8.h),
                    WidgetButton(
                      onTap: () {
                        Navigator.pop(context);
                        AppRoutes.loginPage();
                      },
                      text: 'Sign out',
                      bgColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.secondary,
                    ),
                    Gap(8.h),
                  ],
                ),
              ),
              WidgetText(
                text: 'v ${useFuture(getAppVersion()).data ?? 'Loading...'}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

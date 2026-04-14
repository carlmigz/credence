import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/helpers/currency_format.dart';
import 'package:credence_banking_app/core/routes/app_routes.dart';
import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_button.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends HookWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: WidgetText(
          fSize: 11.sp,
          textAlign: TextAlign.center,
          text:
              'Regulated by the Bangko Sentral ng Pilipinas. Deposits are insured by PDIC up to ${CurrencyUtils.formatCurrency(1000000)} per depositor',
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(8.r),
        child: Column(
          spacing: AppSpacing.columnSpacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/credence_icon.png', height: 200.h),

            WidgetButton(
              onTap: () {},
              text: 'Start new account',
              bgColor: AppColors.red,
              textColor: AppColors.white,
            ),
            WidgetButton(
              onTap: () {
                AppRoutes.loginPage();
              },
              text: 'Log in',
              bgColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}

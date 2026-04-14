import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/helpers/currency_format.dart';
import 'package:credence_banking_app/core/widgets/widget_button.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class ReferEarnPage extends HookWidget {
  const ReferEarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: WidgetText(text: 'Refer & Earn')),
      body: SingleChildScrollView(
        padding: AppSpacing.bodyPadding,
        child: Column(
          spacing: AppSpacing.columnSpacing,
          children: [
            Image.asset(
              'assets/images/credence_icon.png',
              height: 90.h,
              width: 90.w,
            ),
            WidgetText(
              text: 'Refern and Earn with Credence',
              fSize: 18.sp,
              fWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            WidgetText(
              textAlign: TextAlign.center,
              text:
                  'Get ${CurrencyUtils.formatCurrency(100)} for you and your friend! Just get them to sign up with your referral code, and spend at least ${CurrencyUtils.formatCurrency(500)} within 30 days.',
            ),
            WidgetButton(
              onTap: () {},
              text: 'Share my code',
              rightIcon: Ionicons.share_outline,
              textColor: Theme.of(context).colorScheme.tertiary,
            ),
            Container(
              padding: AppSpacing.bodyPadding,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        WidgetText(text: '1', fSize: 24.sp),
                        WidgetText(
                          text: 'Total Users Referred',
                          fWeight: FontWeight.bold,
                          fSize: 10.sp,
                        ),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      children: [
                        WidgetText(
                          text: CurrencyUtils.formatCurrency(100),
                          fSize: 24.sp,
                        ),
                        WidgetText(
                          text: 'Total Cashback Earned',
                          fWeight: FontWeight.bold,
                          fSize: 10.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

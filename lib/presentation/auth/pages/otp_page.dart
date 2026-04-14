import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_button.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends HookWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetButton(onTap: () {}, text: 'Verify'),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: WidgetText(
                  text: 'Resend Code',
                  textColor: AppColors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.columnSpacing,
          children: [
            WidgetText(text: 'One-Time PIN', fSize: 32.sp),
            WidgetText(
              text:
                  'Please enter the one-time PIN (OTP) that we sent to +63 900 123 1234',
            ),
            Center(child: Pinput(length: 6)),
          ],
        ),
      ),
    );
  }
}

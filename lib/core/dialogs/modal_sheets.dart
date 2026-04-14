import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pinput/pinput.dart';

class ModalSheets {
  void showVerificationSheet(BuildContext context, {required Function(String) onCompleted}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: false,
      showDragHandle: true,
      builder: (context) {
        final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

        return Padding(
          padding: EdgeInsets.only(bottom: bottomInset, right: 12, left: 12),
          child: Column(
            spacing: AppSpacing.columnSpacing,
            mainAxisSize: MainAxisSize.min,
            children: [
              WidgetText(
                text: 'Enter your Passcode',
                fSize: 16.sp,
                fWeight: FontWeight.bold,
              ),
              WidgetText(
                text:
                    'To better protect your information, please enter your 6-digit secure passcode.',
                fSize: 11.sp,
              ),
              Pinput(
                length: 6,
                obscureText: true,
                obscuringCharacter: '•',
                onCompleted: onCompleted,
              ),
              GestureDetector(
                onTap: () {},
                child: WidgetText(
                  text: 'Forgot Passcode?',
                  fSize: 11.sp,
                  fWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    WidgetText(
                      text: 'Other verification method',
                      textColor: AppColors.red,
                      fSize: 11.sp,
                    ),
                    Icon(
                      Ionicons.chevron_forward_outline,
                      color: AppColors.red,
                      size: 11.sp,
                    ),
                  ],
                ),
              ),
              Gap(12.h),
            ],
          ),
        );
      },
    );
  }
}

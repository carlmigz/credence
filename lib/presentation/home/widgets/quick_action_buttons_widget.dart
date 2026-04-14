import 'package:credence_banking_app/core/routes/app_routes.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class QuickActionButtonsWidget extends HookWidget {
  const QuickActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _quickActionButtons(
          context,
          AppRoutes.cashInPage,
          Icons.arrow_downward_outlined,
          'Cash In',
        ),
        _quickActionButtons(
          context,
          AppRoutes.sendTransferPage,
          Ionicons.arrow_up_outline,
          'Send',
        ),
        // _quickActionButtons(() {}, Ionicons.scan_outline, 'Scan QR'),
      ],
    );
  }

  _quickActionButtons(
    BuildContext context,
    VoidCallback? onTap,
    IconData? icon,
    String? title,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.r),
              margin: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                spacing: 8.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Theme.of(context).colorScheme.secondary),
                  WidgetText(
                    text: title!,
                    fSize: 12.sp,
                    textColor: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

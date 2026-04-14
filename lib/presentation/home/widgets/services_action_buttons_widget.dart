import 'package:credence_banking_app/core/routes/app_routes.dart';
import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class ServicesActionButtonsWidget extends HookWidget {
  final VoidCallback? onMoreTapped;

  ServicesActionButtonsWidget({super.key, this.onMoreTapped});

  final serviceActions = [
    (Ionicons.business_outline, 'Bank Transfer', AppRoutes.bankTransferPage),
    (Ionicons.pulse_outline, 'Crypto', () {}),
    (Ionicons.phone_portrait_outline, 'Load', AppRoutes.buyLoadPage),
    (Ionicons.receipt_outline, 'Bills', () {}),
    (Ionicons.cart_outline, 'Shop', () {}),
    (Ionicons.shield_outline, 'Insurance', () {}),
    (Ionicons.trending_up_outline, 'Invest', () {}),
    (Ionicons.ellipsis_horizontal_outline, 'More', null),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 12.h,
      spacing: 12.w,
      children: serviceActions.map((action) {
        final icon = action.$1;
        final title = action.$2;
        var onTap = action.$3 ?? onMoreTapped ?? () {};
        return _quickActionButton(context, icon, title, onTap);
      }).toList(),
    );
  }

  Widget _quickActionButton(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 90.w,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              margin: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: AppColors.charcoalBlack),
            ),
            WidgetText(text: title, fSize: 12.sp, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

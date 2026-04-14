import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_button.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VirtualCard extends HookWidget {
  const VirtualCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/credence_icon.png',
                  height: 60.h,
                  width: 60.w,
                ),
                WidgetText(
                  text: 'Create a Virtual Card\nFor free!',
                  textColor: AppColors.charcoalBlack,
                ),
                WidgetButton(
                  width: 120.w,
                  onTap: () {},
                  text: 'Learn more',
                  bgColor: AppColors.red,
                  textColor: AppColors.white,
                ),
              ],
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 0, 0.001)
                ..rotateZ(-0.25)
                ..rotateX(0.05),
              child: Image.asset(
                'assets/images/credence_virtual_card.png',
                height: 120.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

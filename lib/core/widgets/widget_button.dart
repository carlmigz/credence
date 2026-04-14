import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetButton extends HookWidget {
  final VoidCallback onTap;
  final String? text;
  final Color? bgColor;
  final Color? textColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? borderRadius;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Color? iconColor;
  final double? iconSize;
  final double? width;

  const WidgetButton({
    super.key,
    required this.onTap,
    this.text,
    this.width,
    this.bgColor,
    this.textColor,
    this.margin,
    this.padding,
    this.borderRadius,
    this.leftIcon,
    this.rightIcon,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.symmetric(horizontal: 8.h),
        padding: padding ?? EdgeInsets.all(12.r),
        width: width ?? MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.red,
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leftIcon != null) ...[
              Icon(
                leftIcon,
                color: iconColor ?? textColor,
                size: iconSize ?? 18.sp,
              ),
              SizedBox(width: 8.w),
            ],
            WidgetText(text: text, textColor: textColor),
            if (rightIcon != null) ...[
              SizedBox(width: 8.w),
              Icon(
                rightIcon,
                color: iconColor ?? textColor,
                size: iconSize ?? 18.sp,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

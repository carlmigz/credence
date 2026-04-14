// import 'package:credence_banking_app/core/theme/app_theme_data.dart';
// import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class HomeAppbarWidget extends HookWidget implements PreferredSizeWidget {
  final VoidCallback onOpenDrawer;

  const HomeAppbarWidget({super.key, required this.onOpenDrawer});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      actionsPadding: EdgeInsets.all(12.r),
      // leading: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: GestureDetector(
      //     onTap: onOpenDrawer,
      //     child: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         WidgetText(text: '@itscarlmigz', fWeight: FontWeight.bold),
      //         Icon(
      //           Ionicons.chevron_forward_outline,
      //           size: 14.sp,
      //           color: AppThemeData.red,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // leadingWidth: 150.w,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Badge(child: Icon(Ionicons.notifications_outline)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

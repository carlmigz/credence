import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:toastification/toastification.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';

class ToastificationSnackbar {
  static void show({required BuildContext context, required String message}) {
    toastification.show(
      context: context,
      dismissDirection: DismissDirection.up,
      alignment: Alignment.topCenter,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      borderSide: BorderSide.none,
      autoCloseDuration: Duration(seconds: 3),
      closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
      description: WidgetText(text: message, fSize: 12.sp),
    );
  }
}

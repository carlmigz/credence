import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/helpers/toastification_snackbar.dart';
import 'package:credence_banking_app/core/routes/app_routes.dart';
import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:credence_banking_app/presentation/auth/pages/otp_page.dart';
import 'package:credence_banking_app/presentation/auth/widgets/pinput_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final hasError = useState(false);
    final unlocked = useState(false);

    final shakeController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    void onKeyTap(String value) {
      if (controller.text.length < 6) {
        controller.text += value;
        hasError.value = false;

        if (controller.text.length == 6) {
          if (controller.text == '123456') {
            unlocked.value = true;
            Future.delayed(
              const Duration(milliseconds: 300),
              AppRoutes.homePage,
            );
          } else {
            hasError.value = true;
            shakeController.forward(from: 0);
            controller.clear();
          }
        }
      }
    }

    void onDelete() {
      if (controller.text.isNotEmpty) {
        controller.text = controller.text.substring(
          0,
          controller.text.length - 1,
        );
      }
    }

    Widget key(String label, {IconData? icon, VoidCallback? onTap}) {
      final w = MediaQuery.of(context).size.width / 3;
      return InkWell(
        radius: 25.r,
        borderRadius: BorderRadius.circular(25),
        onTap: onTap ?? () => onKeyTap(label),
        child: SizedBox(
          width: w,
          height: 72.h,
          child: Center(
            child: icon != null
                ? Icon(icon, size: 28.sp)
                : WidgetText(
                    text: label,
                    fSize: 24.sp,
                    fWeight: FontWeight.bold,
                  ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: WidgetText(
          text: 'Credence',
          fWeight: FontWeight.bold,
          fSize: 24.sp,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: AppSpacing.bodyPadding,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            WidgetText(text: 'Forgot Passcode? '),
            WidgetText(text: 'Reset now', textColor: AppColors.red),
          ],
        ),
      ),
      body: Column(
        spacing: AppSpacing.columnSpacing,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              unlocked.value
                  ? Ionicons.lock_open_outline
                  : Ionicons.lock_closed_outline,
              key: ValueKey(unlocked.value),
              size: 50,
            ),
          ),
          Gap(20.h),
          AnimatedBuilder(
            animation: shakeController,
            builder: (context, child) {
              // Note: used logic from your original code
              final offset =
                  8.0 *
                  (1 - shakeController.value) *
                  (hasError.value
                      ? (shakeController.value % 2 == 0 ? 1 : -1)
                      : 0);
              return Transform.translate(
                offset: Offset(offset, 0),
                child: child,
              );
            },
            child: PinputCodeWidget(controller: controller),
          ),
          if (hasError.value)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: WidgetText(
                text: 'Incorrect passcode. Please try again.',
                textColor: AppColors.red,
              ),
            ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              key('1'),
              key('2'),
              key('3'),
              key('4'),
              key('5'),
              key('6'),
              key('7'),
              key('8'),
              key('9'),
              key(
                '',
                icon: Ionicons.finger_print,
                onTap: () {
                  ToastificationSnackbar.show(
                    context: context,
                    message: 'Welcome back!',
                  );
                  Future.delayed(
                    const Duration(milliseconds: 300),
                    AppRoutes.homePage,
                  );
                },
              ),
              key('0'),
              key('', icon: Ionicons.backspace_outline, onTap: onDelete),
            ],
          ),
          GestureDetector(
            onTap: AppRoutes.landingPage,
            child: Padding(
              padding: AppSpacing.bodyPadding,
              child: Wrap(
                spacing: AppSpacing.rowSpacing,
                alignment: WrapAlignment.center,
                children: [
                  WidgetText(text: 'Switch account', textColor: AppColors.red),
                  Icon(Ionicons.swap_horizontal, color: AppColors.red),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(() => OtpPage()),
            child: WidgetText(text: 'OTP', textColor: AppColors.red),
          ),
        ],
      ),
    );
  }
}

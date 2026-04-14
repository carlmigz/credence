import 'package:credence_banking_app/core/dialogs/modal_sheets.dart';
import 'package:credence_banking_app/core/helpers/toastification_snackbar.dart';
import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class PhysicalCard extends HookWidget {
  const PhysicalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final hidden = useState(true);

    final cardNumber = '437 289 055';
    final expiry = '01/30';
    final cvv = '428';

    final last4 = cardNumber.replaceAll(' ', '').padLeft(4, '0');
    final maskedNumber =
        'CARD NUMBER •••••${last4.substring(last4.length - 4)}';

    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.all(8.r),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/credence_card_bg.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'assets/images/credence_icon.png',
                height: 40.h,

                color: AppColors.white.withValues(alpha: 0.8),
              ),
              Positioned(
                left: 35,
                child: Transform.rotate(
                  angle: 60,
                  child: Image.asset(
                    'assets/images/credence_icon.png',
                    height: 40.h,
                    color: AppColors.charcoalBlack,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WidgetText(
                    text: hidden.value ? maskedNumber : cardNumber,
                    fWeight: FontWeight.bold,
                    textColor: AppColors.charcoalBlack,
                  ),
                ),
              ),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: AppColors.white),
                onPressed: () => _onHiddenToggle(context, hidden),
                icon: Icon(
                  hidden.value
                      ? Ionicons.eye_off_outline
                      : Ionicons.eye_outline,
                  size: 20.h,
                  color: AppColors.charcoalBlack,
                ),
              ),
              if (!hidden.value)
                IconButton.filled(
                  style: IconButton.styleFrom(backgroundColor: AppColors.white),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: cardNumber));
                    ToastificationSnackbar.show(
                      context: context,
                      message: 'Card number copied to clipboard',
                    );
                  },
                  icon: Icon(
                    Ionicons.copy_outline,
                    size: 20.h,
                    color: AppColors.charcoalBlack,
                  ),
                ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _info('EXP', hidden.value ? '••••' : expiry),
                  SizedBox(width: 20.w),
                  _info('CVV', hidden.value ? '•••' : cvv),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _info(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(
          text: label,
          fSize: 10.sp,
          textColor: AppColors.charcoalBlack,
        ),
        SizedBox(height: 2.h),
        WidgetText(
          text: value,
          fSize: 12.sp,
          textColor: AppColors.charcoalBlack,
        ),
      ],
    );
  }
}

void _onHiddenToggle(BuildContext context, ValueNotifier<bool> hidden) {
  if (hidden.value) {
    _showBottomSheet(
      context,
      onReveal: () {
        hidden.value = false;
      },
    );
  } else {
    hidden.value = true;
  }
}

void _showBottomSheet(BuildContext context, {required VoidCallback onReveal}) {
  ModalSheets().showVerificationSheet(
    context,
    onCompleted: (pin) {
      Navigator.of(context).pop();
      onReveal();
    },
  );
}

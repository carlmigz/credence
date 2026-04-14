import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/helpers/currency_format.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class TransactionsListWidget extends HookWidget {
  const TransactionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.columnSpacing,
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetText(text: 'Transactions', fWeight: FontWeight.bold),
              Icon(Ionicons.chevron_forward_outline),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _transactionsListView();
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: 4,
          ),
        ),
      ],
    );
  }

  _transactionsListView() {
    return Padding(
      padding: AppSpacing.defaultSpacing,
      child: Row(
        spacing: AppSpacing.rowSpacing,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetText(text: 'Sent Money'),
              WidgetText(text: 'To: Carlos Miguel A. Ramos', fSize: 12.sp),
            ],
          ),

          Flexible(
            child: WidgetText(
              text: CurrencyUtils.formatCurrency(100000),
              fWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

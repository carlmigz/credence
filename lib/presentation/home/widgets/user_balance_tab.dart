import 'package:credence_banking_app/core/helpers/currency_format.dart';
import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:credence_banking_app/presentation/home/widgets/quick_action_buttons_widget.dart';
import 'package:credence_banking_app/presentation/home/widgets/credence_card_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class UserBalanceTab extends HookWidget {
  const UserBalanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isBalanceHidden = useState(false);
    final tabController = useTabController(initialLength: 2);

    return Column(
      children: [
        TabBar(
          dividerHeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: AppColors.gray,
          controller: tabController,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Wallet'),
            Tab(text: 'Cards'),
          ],
        ),
        SizedBox(
          height: 185.h,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              _walletTab(isBalanceHidden),
              const Center(child: CredenceCardTab()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _walletTab(ValueNotifier<bool> isBalanceHidden) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            WidgetText(
              text: isBalanceHidden.value
                  ? '₱ •••••'
                  : CurrencyUtils.formatCurrency(1000000),

              fSize: 30.sp,
              fWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => isBalanceHidden.value = !isBalanceHidden.value,
              child: Icon(
                isBalanceHidden.value
                    ? Ionicons.eye_outline
                    : Ionicons.eye_off_outline,
              ),
            ),
          ],
        ),
        const QuickActionButtonsWidget(),
      ],
    );
  }
}

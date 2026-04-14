import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/widgets/bottom_nav_widget.dart';
import 'package:credence_banking_app/presentation/home/widgets/services_action_buttons_widget.dart';
import 'package:credence_banking_app/presentation/home/widgets/transactions_list_widget.dart';
import 'package:credence_banking_app/presentation/home/widgets/user_balance_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarWidget();
  }
}

class HomeContent extends HookWidget {
  final VoidCallback? onMoreTapped;
  final ScrollController scrollController;

  const HomeContent({
    super.key,
    this.onMoreTapped,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: AppSpacing.bodyPadding, child: UserBalanceTab()),
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            padding: AppSpacing.bodyPadding,
            child: Column(
              spacing: AppSpacing.columnSpacing,
              children: [
                ServicesActionButtonsWidget(onMoreTapped: onMoreTapped),
                Divider(),
                TransactionsListWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

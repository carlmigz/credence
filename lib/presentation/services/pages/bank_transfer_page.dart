import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/helpers/keypad_unfocus.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:credence_banking_app/core/widgets/widget_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class BankTransferPage extends HookWidget {
  const BankTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        KeypadUnfocus(context).dismissKeyboard();
      },
      child: Scaffold(
        appBar: AppBar(
          title: WidgetText(text: 'Bank transfer'),
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: AppSpacing.bodyPadding,
          child: Column(
            spacing: AppSpacing.columnSpacing,
            children: [
              WidgetTextField(
                controller: null,
                hintText: 'Search available banks...',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _bankLists();
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _bankLists() {
    return ListTile(
      title: WidgetText(text: 'GoTyme Bank'),
      trailing: Icon(Ionicons.chevron_forward_outline),
    );
  }
}

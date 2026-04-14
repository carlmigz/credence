import 'package:credence_banking_app/core/helpers/app_spacing.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SendTransferPage extends HookWidget {
  const SendTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetText(text: 'Send money'),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.bodyPadding,
        child: Column(children: [
            
          ],
        ),
      ),
    );
  }
}

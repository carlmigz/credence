import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BuyLoadPage extends HookWidget {
  const BuyLoadPage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: WidgetText(text: 'Buy Load')),
    );
  }
}
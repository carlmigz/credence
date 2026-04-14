import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pinput/pinput.dart';

class PinputCodeWidget extends HookWidget {
  final TextEditingController controller;
  const PinputCodeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      controller: controller,
      readOnly: true,
      obscureText: true,
      obscuringWidget: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      defaultPinTheme: PinTheme(
        width: 18,
        height: 18,
        textStyle: const TextStyle(color: Colors.transparent),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 18,
        height: 18,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 18,
        height: 18,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
      errorPinTheme: PinTheme(
        width: 18,
        height: 18,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      ),
    );
  }
}

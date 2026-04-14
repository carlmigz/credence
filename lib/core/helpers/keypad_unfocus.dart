import 'package:flutter/material.dart';

class KeypadUnfocus {

  KeypadUnfocus(this.context);
  final BuildContext context;

  void dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }
}

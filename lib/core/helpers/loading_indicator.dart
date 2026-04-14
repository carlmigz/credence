import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension PageLoadingIndicator on Widget {
  Widget loadingIndicator() {
    Future.delayed(const Duration(milliseconds: 200), () {
      Get.dialog(
        Center(child: const CircularProgressIndicator.adaptive()),
        barrierDismissible: false,
        barrierColor: Colors.transparent,
      );

      Future.delayed(const Duration(milliseconds: 250), () {
        if (Get.isDialogOpen == true) {
          Get.back();
        }
      });
    });

    return this;
  }
}

import 'package:credence_banking_app/core/theme/dark_theme.dart';
import 'package:credence_banking_app/core/theme/light_theme.dart';
import 'package:credence_banking_app/presentation/auth/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

void main() {
  ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: ToastificationConfig(
        maxToastLimit: 1,
        maxDescriptionLines: 1,
        maxTitleLines: 1,
      ),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: ScreenUtil.defaultSize,
        child: SafeArea(
          top: false,
          bottom: true,
          child: GetMaterialApp(
            title: 'Credence',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            defaultTransition: Transition.cupertino,
            home: WelcomePage(),
          ),
        ),
      ),
    );
  }
}

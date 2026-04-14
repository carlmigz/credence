import 'package:credence_banking_app/core/helpers/loading_indicator.dart';
import 'package:credence_banking_app/presentation/auth/pages/landing_page.dart';
import 'package:credence_banking_app/presentation/auth/pages/login_page.dart';
import 'package:credence_banking_app/presentation/home/pages/cash_in_page.dart';
import 'package:credence_banking_app/presentation/home/pages/drawer/refer_earn_page.dart';
import 'package:credence_banking_app/presentation/home/pages/drawer/settings_page.dart';
import 'package:credence_banking_app/presentation/home/pages/home_page.dart';
import 'package:credence_banking_app/presentation/services/pages/scan_qr_page.dart';
import 'package:credence_banking_app/presentation/services/pages/send_transfer_page.dart';
import 'package:credence_banking_app/presentation/services/pages/bank_transfer_page.dart';
import 'package:credence_banking_app/presentation/services/pages/buy_load_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static void landingPage() {
    Get.offAll(() => const LandingPage());
  }

  static void loginPage() {
    Get.offAll(() => const LoginPage());
  }

  static void homePage() {
    Get.offAll(() => const HomePage());
  }

  // Quick Actions (Home Page)
  static void cashInPage() {
    Get.to(() => CashInPage().loadingIndicator());
  }

  static void scanQrPage() {
    Get.to(() => ScanQrPage());
  }

  static void sendTransferPage() {
    Get.to(() => SendTransferPage());
  }

  // Drawer
  static void settingsPage() {
    Get.to(() => SettingsPage());
  }

  static void missionsPage() {
    // Get.to(() => MissionsPage());
  }

  static void vouchersPage() {
    // Get.to(() => VouchersPage());
  }

  static void rateAppPage() {
    // Get.to(() => RateAppPage());
  }

  static void accountLimitsPage() {
    // Get.to(() => AccountLimitsPage());
  }

  static void quickGuidePage() {
    // Get.to(() => QuickGuidePage());
  }

  static void getHelpPage() {
    // Get.to(() => GetHelpPage());
  }

  static void referEarnPage() {
    Get.to(() => ReferEarnPage());
  }


  // All Services
  static void bankTransferPage() {
    Get.to(() => BankTransferPage());
  }

  static void buyLoadPage() {
    Get.to(() => BuyLoadPage());
  }
}

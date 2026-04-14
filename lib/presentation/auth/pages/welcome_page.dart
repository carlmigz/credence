import 'package:credence_banking_app/core/routes/app_routes.dart';
import 'package:credence_banking_app/core/widgets/widget_button.dart';
import 'package:credence_banking_app/core/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends HookWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.microtask(() => _showPrivacyNotice(context));
      return null;
    }, []);

    return const Scaffold();
  }

  void _showPrivacyNotice(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: WidgetText(
          text: 'Welcome to Credence',
          fSize: 22,
          fWeight: FontWeight.bold,
        ),
        content: const _PrivacyContent(),
        actions: [
          TextButton(
            onPressed: () {},
            child: WidgetText(text: 'Agree & Continue'),
          ),
        ],
      ),
    );
  }
}

class _PrivacyContent extends StatelessWidget {
  const _PrivacyContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.h,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            WidgetText(
              text: 'Collect & Protect',
              fWeight: FontWeight.bold,
              fSize: 14,
            ),
            WidgetText(
              text:
                  'At Credence, your privacy is our priority. We collect only the essential data needed to provide our services securely.',
              fSize: 13,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4.h,
          children: [
            WidgetText(
              text: 'Data Privacy Policy',
              fWeight: FontWeight.bold,
              fSize: 14,
            ),
            WidgetText(
              text:
                  'We adhere to global data protection standards to ensure your identity remains yours.',
              fSize: 13,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:credence_banking_app/core/routes/app_routes.dart';
import 'package:credence_banking_app/core/theme/app_colors.dart';
import 'package:credence_banking_app/presentation/home/pages/all_services_page.dart';
import 'package:credence_banking_app/presentation/home/pages/home_page.dart';
import 'package:credence_banking_app/presentation/home/widgets/home_appbar_widget.dart';
import 'package:credence_banking_app/core/widgets/home_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class BottomNavigationBarWidget extends HookWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Initialize Controllers using Hooks
    // Instead of useGlobalKey, use useMemoized
    final scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>());
    final homeScrollController = useScrollController();
    final pageController = usePageController(initialPage: 0);

    // 2. State Hooks
    final currentIndex = useState(0);
    final showFab = useState(false);

    // 3. Scroll Listener Effect
    useEffect(() {
      void scrollListener() {
        if (!homeScrollController.hasClients) return;
        final atEnd =
            homeScrollController.offset >=
            homeScrollController.position.maxScrollExtent - 20;
        if (atEnd != showFab.value) {
          showFab.value = atEnd;
        }
      }

      homeScrollController.addListener(scrollListener);
      return () => homeScrollController.removeListener(scrollListener);
    }, [homeScrollController]);

    // 4. Navigation Logic
    void switchPage(int index) {
      currentIndex.value = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    }

    void onTap(int index) {
      if (index == 1) {
        AppRoutes.scanQrPage();
        return;
      }
      switchPage(index);
    }

    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      drawer: currentIndex.value == 0 ? const HomeDrawerWidget() : null,
      appBar: currentIndex.value == 0
          ? HomeAppbarWidget(
              onOpenDrawer: () => scaffoldKey.currentState?.openDrawer(),
            )
          : null,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeContent(
            scrollController: homeScrollController,
            onMoreTapped: () => switchPage(2),
          ),
          const SizedBox(),
          const AllServicesPage(),
        ],
      ),
      bottomNavigationBar: _bottomBar(context, currentIndex.value, onTap),
    );
  }

  Widget _bottomBar(
    BuildContext context,
    int currentIndex,
    ValueChanged<int> onTap,
  ) {
    return Container(
      padding: EdgeInsets.all(12.r),
      height: 60.h,
      margin: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavIcon(
            icon: Icons.home_outlined,
            index: 0,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
          _NavIcon(
            icon: Ionicons.scan_outline,
            index: 1,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
          _NavIcon(
            icon: Ionicons.grid_outline,
            index: 2,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends HookWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _NavIcon({
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          icon,
          color: isActive
              ? AppColors.red
              : Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}

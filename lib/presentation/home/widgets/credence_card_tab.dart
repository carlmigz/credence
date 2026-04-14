import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'cards/virtual_card.dart';
import 'cards/physical_card.dart';

class CredenceCardTab extends HookWidget {
  const CredenceCardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final dy = useState(0.0);
    final showVirtualOnTop = useState(true);

    final animation = useRef<Animation<double>?>(null);

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 220),
    );

    useEffect(() {
      void listener() {
        final value = animation.value?.value ?? 0.0;
        dy.value = value;
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    void animateBack() {
      animation.value = Tween<double>(
        begin: dy.value,
        end: 0.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

      controller.forward(from: 0);
    }

    Widget topCard() {
      return showVirtualOnTop.value
          ? const VirtualCard()
          : const PhysicalCard();
    }

    Widget bottomCard() {
      return showVirtualOnTop.value
          ? const PhysicalCard()
          : const VirtualCard();
    }

    Widget frontCard() {
      return Transform.translate(offset: Offset(0, dy.value), child: topCard());
    }

    Widget backCard({required double offset, required double scale}) {
      return Transform.translate(
        offset: Offset(0, offset),
        child: Transform.scale(
          scale: scale,
          child: Opacity(opacity: 0.5, child: bottomCard()),
        ),
      );
    }

    return SizedBox(
      height: 260,
      child: GestureDetector(
        onVerticalDragUpdate: (d) {
          dy.value += d.delta.dy;
        },
        onVerticalDragEnd: (_) {
          if (dy.value.abs() > 70) {
            showVirtualOnTop.value = !showVirtualOnTop.value;
          }
          animateBack();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [backCard(offset: 18, scale: 0.90), frontCard()],
        ),
      ),
    );
  }
}

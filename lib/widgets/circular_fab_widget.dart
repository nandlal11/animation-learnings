import 'dart:math';
import 'package:flutter/material.dart';

const double fabButtonSize = 60.0;

class CircularFabWidget extends StatefulWidget {
  const CircularFabWidget({super.key});

  @override
  State<CircularFabWidget> createState() => _CircularFabWidgetState();
}

class _CircularFabWidgetState extends State<CircularFabWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controller: controller),
      children: [
        Icons.mail,
        Icons.call,
        Icons.notifications,
        Icons.sms,
        Icons.menu
      ].map<Widget>(buildFAB).toList(),
    );
  }

  Widget buildFAB(IconData icon) {
    return GestureDetector(
      onTap: () {
        if (controller.status == AnimationStatus.completed) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
      child: Container(
        width: fabButtonSize,
        height: fabButtonSize,
        decoration:
            const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 34),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  const FlowMenuDelegate({required this.controller})
      : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - fabButtonSize;
    final yStart = size.height - fabButtonSize;
    final n = context.childCount;
    for (int i = 0; i < n; i++) {
      final isLastItem = i == n - 1;
      setValue(value) => isLastItem ? 0.0 : value;

      final radius = 160 * controller.value;

      final theta = i * pi * 0.5 / (n - 2);
      final x = xStart - setValue(radius * cos(theta));
      final y = yStart - setValue(radius * sin(theta));
      debugPrint("$i x = $x and y = $y");

      context.paintChild(i,
          transform: Matrix4.identity()
            ..translate(x, y, 0)
            ..translate(fabButtonSize / 2, fabButtonSize / 2)
            ..rotateZ(180 * (1 - controller.value) * pi / 180)
            ..translate(-fabButtonSize / 2, -fabButtonSize / 2));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}

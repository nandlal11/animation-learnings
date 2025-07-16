import 'dart:math';
import 'package:flutter/material.dart';

class RotateImageAnim extends StatefulWidget {
  const RotateImageAnim({super.key});

  @override
  State<RotateImageAnim> createState() => _RotateImageAnimState();
}

class _RotateImageAnimState extends State<RotateImageAnim>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(milliseconds: 500));
        controller.reset();
      }
    });
    setRotation(90);
  }

  void setRotation(int degrees) {
    final angle = degrees * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: animation.value,
                    child: child,
                  );
                },
                child: Image.asset("assets/images/nature1.jpg",
                    width: 200, height: 200, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 30.0),
            OutlinedButton(
                onPressed: () {
                  controller.forward(from: 0);
                },
                child: Text("Rotate".toUpperCase()))
          ],
        ),
      ),
    );
  }
}

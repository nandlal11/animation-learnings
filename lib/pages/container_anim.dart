import 'dart:math';
import 'package:flutter/material.dart';

class ContainerAnim extends StatefulWidget {
  const ContainerAnim({super.key});

  @override
  State<ContainerAnim> createState() => _ContainerAnimState();
}

class _ContainerAnimState extends State<ContainerAnim> {
  Random random = Random();
  double width = 400;
  double height = 400;
  Color boxColor = Colors.blue;
  BorderRadius boxRadius = BorderRadius.circular(20);
  List<IconData> bottomNavItems = [
    Icons.palette,
    Icons.interests,
    Icons.aspect_ratio
  ];

  void changeBoxSize() {
    width = random.nextInt(400).toDouble();
    height = random.nextInt(400).toDouble();
  }

  void changeBoxColor() {
    boxColor = Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
  }

  void changeBoxRadius() {
    boxRadius = BorderRadius.circular(random.nextInt(80).toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          width: width,
          height: height,
          decoration: BoxDecoration(color: boxColor, borderRadius: boxRadius),
        ),
      ),
      bottomNavigationBar: Row(
        children: List.generate(
            3,
            (index) => IconButton(
                onPressed: index == 0
                    ? changeBoxSize
                    : index == 1
                        ? changeBoxColor
                        : changeBoxRadius,
                icon: Icon(bottomNavItems[index]))),
      ),
    );
  }
}

import 'dart:math';
import 'package:animation_demo/provider/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TinderCardWidget extends StatefulWidget {
  final String imageUrl;
  final bool isFront;

  const TinderCardWidget({
    required this.imageUrl,
    required this.isFront,
    super.key,
  });

  @override
  State<TinderCardWidget> createState() => _TinderCardWidgetState();
}

class _TinderCardWidgetState extends State<TinderCardWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(screenSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isFront ? buildFrontCard() : buildCard();
  }

  Widget buildFrontCard() {
    return GestureDetector(
      onPanStart: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.startPosition(details);
      },
      onPanUpdate: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.updatePosition(details);
      },
      onPanEnd: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.endPosition();
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final provider = Provider.of<CardProvider>(context);
          final position = provider.position;
          final milliseconds = provider.isDragging ? 0 : 400;
          final center = constraints.smallest.center(Offset.zero);
          final angle = provider.angle * pi / 180;
          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dy);

          return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: milliseconds),
              transform: rotatedMatrix..translate(position.dx, position.dy),
              child: buildCard());
        },
      ),
    );
  }

  Widget buildCard() {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          widget.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

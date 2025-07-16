import 'package:animation_demo/provider/card_provider.dart';
import 'package:animation_demo/widgets/tinder_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwipeCards extends StatefulWidget {
  const SwipeCards({super.key});

  @override
  State<SwipeCards> createState() => _SwipeCardsState();
}

class _SwipeCardsState extends State<SwipeCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: buildImages()),
      ),
    );
  }

  Widget buildImages() {
    final provider = Provider.of<CardProvider>(context);
    final images = provider.assetImages;
    //debugPrint("front image : ${images.last}"); //image1 will be on top of stack
    return images.isEmpty
        ? Center(
            child: ElevatedButton(
                onPressed: () {
                  final provider =
                      Provider.of<CardProvider>(context, listen: false);
                  provider.resetImages();
                },
                child: const Text(
                  "Restart",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                )),
          )
        : Stack(
            children: images
                .map((imageUrl) => TinderCardWidget(
                      imageUrl: imageUrl,
                      isFront: images.last == imageUrl,
                    ))
                .toList());
  }
}

import 'package:animation_demo/provider/hero_anim_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeroAnim extends StatefulWidget {
  const HeroAnim({super.key});

  @override
  State<HeroAnim> createState() => _HeroAnimState();
}

class _HeroAnimState extends State<HeroAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late HeroAnimProvider _provider;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);
    _sizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(_controller);
    _controller.addListener(() {
      debugPrint(_colorAnimation.value.toString());
      debugPrint(_sizeAnimation.value.toString());
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _provider = Provider.of<HeroAnimProvider>(context, listen: false);
      _controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _provider.setIsFav = true;
        }
        if (status == AnimationStatus.dismissed) {
          _provider.setIsFav = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
      ),
      body: Column(
        children: [
          Hero(
              tag: "shiv",
              transitionOnUserGestures: true,
              child: Image.asset("assets/images/shiv.jpeg")),
          ListTile(
            title: Text("Kedarnath"),
            subtitle: Text("Shiva Temple"),
            trailing: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) => IconButton(
                      icon: Icon(Icons.favorite,
                          size: _sizeAnimation.value,
                          color: _colorAnimation.value),
                      onPressed: () {
                        _provider.isFav
                            ? _controller.reverse()
                            : _controller.forward();
                      },
                    )),
          )
        ],
      ),
    );
  }
}

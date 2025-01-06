import 'package:animation_demo/provider/tween_anim_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TweenAnimPage extends StatelessWidget {
  const TweenAnimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation"),
      ),
      body: Consumer<TweenAnimProvider>(
        builder: (context, provider, child) => Column(children: [
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Alex"),
          )
        ]),
      ),
    );
  }
}

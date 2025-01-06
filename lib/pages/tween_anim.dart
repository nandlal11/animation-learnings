import 'package:animation_demo/models/user_model.dart';
import 'package:animation_demo/provider/tween_anim_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TweenAnimPage extends StatelessWidget {
  final String isOpacity;
  final String userName;
  final UserModel userModel;

  const TweenAnimPage(
      {super.key,
      required this.isOpacity,
      required this.userName,
      required this.userModel});

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

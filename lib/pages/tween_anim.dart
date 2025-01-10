import 'package:animation_demo/models/user_model.dart';
import 'package:animation_demo/provider/tween_anim_provider.dart';
import 'package:animation_demo/routes/routes_config.dart';
import 'package:animation_demo/routes/routes_contants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        title: TweenAnimationBuilder(
          child: Text(
            "Tween Animation",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
          ),
          duration: Duration(seconds: 1),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, value, child) {
            return Opacity(opacity: value, child: child);
          },
        ),
        centerTitle: true,
      ),
      body: Consumer<TweenAnimProvider>(
        builder: (context, provider, child) => Column(children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Hero(
                tag: "shiv",
                transitionOnUserGestures: true,
                child: Image.asset(
                  "assets/images/shiv.jpeg",
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text("Alex"),
            onTap: () {
              GoRouter.of(context).pushNamed(AppRoutesConstants.heroAnimRoute);
            },
          )
        ]),
      ),
    );
  }
}

import 'package:animation_demo/models/user_model.dart';
import 'package:animation_demo/routes/routes_contants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/applinks_deeplink.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AppLinksDeepLink.instance.initDeepLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoutesConstants.tweenAnimRoute,
                  pathParameters: {
                    "is_opacity": "1",
                    "username": "Alex"
                  },
                  extra: {
                    "user_model": UserModel(
                        name: "Jonas", address: "New York", profile: "demo_pic")
                  });
            },
            child: Text("Tween Animation"))
      ]),
    );
  }
}

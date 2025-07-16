import 'dart:math';
import 'package:animation_demo/models/user_model.dart';
import 'package:animation_demo/routes/routes_contants.dart';
import 'package:animation_demo/utils/common_data.dart';
import 'package:animation_demo/widgets/circular_fab_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../utils/applinks_deeplink.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late Size screenSize;
  List<String> screenNames = [
    "Tween Animation",
    "Container Animation",
    "Tinder Cards",
    "Rotate Image"
  ];

  @override
  void initState() {
    super.initState();
    AppLinksDeepLink.instance.initDeepLinks();
  }

  @override
  Widget build(BuildContext context) {
    //screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                String shareText =
                    "Checkout this post ${CommonData.createDeeplink(screen: "tween-anim")}";
                debugPrint("*************** $shareText");
                Share.share(shareText, subject: "App link");
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  CommonData().readLargeFile();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.blue, width: 2.0)),
                  child: Text(
                    "Read File",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                  itemCount: screenNames.length,
                  itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              if (i == 0) {
                                GoRouter.of(context).pushNamed(
                                    AppRoutesConstants.tweenAnimRoute,
                                    pathParameters: {
                                      "is_opacity": "1",
                                      "username": "Alex"
                                    },
                                    extra: {
                                      "user_model": UserModel(
                                          name: "Jonas",
                                          address: "New York",
                                          profile: "demo_pic")
                                    });
                              } else if (i == 1) {
                                GoRouter.of(context).pushNamed(
                                    AppRoutesConstants.containerAnimRoute);
                              } else if (i == 2) {
                                GoRouter.of(context).pushNamed(
                                    AppRoutesConstants.tinderCardRoute);
                              } else if (i == 3) {
                                GoRouter.of(context).pushNamed(
                                    AppRoutesConstants.rotateImageRoute);
                              }
                            },
                            child: Text(screenNames[i])),
                      )),
            ),
          ]),
      floatingActionButton: const CircularFabWidget(),
    );
  }
}

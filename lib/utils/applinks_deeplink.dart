import 'dart:async';
import 'package:animation_demo/routes/routes_contants.dart';
import 'package:animation_demo/utils/global_data.dart';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:go_router/go_router.dart';

import '../models/user_model.dart';

class AppLinksDeepLink {
  AppLinksDeepLink._privateConstructor();

  static final AppLinksDeepLink _instance =
      AppLinksDeepLink._privateConstructor();

  static AppLinksDeepLink get instance => _instance;
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  Future<void> initDeepLinks() async {
    // Check initial link if app was in cold state (terminated)
    final linkUri = await _appLinks.getInitialLink();
    bool isFlag = false;
    if (linkUri != null) {
      isFlag = true;
      print('${linkUri.queryParameters["screen"]}');
      //var uri = Uri.parse(appLink.toString());
      if (linkUri.queryParameters["screen"] == "tween-anim") {
        GoRouter.of(GlobalData.navigatorKey.currentContext!)
            .pushNamed(AppRoutesConstants.tweenAnimRoute, pathParameters: {
          "is_opacity": "1",
          "username": "Alex"
        }, extra: {
          "user_model":
              UserModel(name: "Jonas", address: "New York", profile: "demo_pic")
        });
      }
      print(
          'Terminated, here you can redirect from url as per your need : $linkUri ');
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uriValue) {
        print('${uriValue.queryParameters["screen"]}');
        if (uriValue.queryParameters["screen"] == "tween-anim" && !isFlag) {
          GoRouter.of(GlobalData.navigatorKey.currentContext!)
              .pushNamed(AppRoutesConstants.tweenAnimRoute, pathParameters: {
            "is_opacity": "1",
            "username": "Alex"
          }, extra: {
            "user_model": UserModel(
                name: "Jonas", address: "New York", profile: "demo_pic")
          });
        }
        print(' you will listen any url updates ');
        print(
            'Background, here you can redirect from url as per your need : $uriValue');
      },
      onError: (err) {
        debugPrint('====>>> error : $err');
      },
      onDone: () {
        _linkSubscription?.cancel();
      },
    );
  }
}
